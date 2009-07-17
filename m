Received: from [209.85.216.171] (helo=mail-px0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MRsiV-0007J1-5j
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 21:03:35 +0200
Received: by pxi1 with SMTP id 1so469381pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2009 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=M+K47NQFL+aGeZJ8hjnnFEaExA7vt5EmsLan43wuq1M=;
	b=iXRRKhw3Hl2GEVubq0YX1iKOQqlVPKjf2JJucBFQeuWTmswhtgCHm5tGZeCDbpP0eo
	b1M8sAj5wIbFeITJWkXuXXTp8Go+6IsbDsz7jaWRMMtnRmL4iPHR1XxQqYh5kU/ASWY0
	GQfySpy7j2uMkVKfzR0nxUajoiATMEaJjVlac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=NW1vQN/FadRnpEodWV5rmrg+Ky0QaPj6aHm+Zj9AW1WP5pA8R8Y6+4Es1CzdIT1v3Y
	GpZBC6B0gTObdB2OoQocxfTBAHtZ39Mc0UpDi36je292QxDUFN3kgHkHafARzLW+T2zG
	5H5jYF90l26qUcxE2i9rhlcbRDCdoDxE63NPc=
Received: by 10.114.58.17 with SMTP id g17mr2010725waa.167.1247856594263;
	Fri, 17 Jul 2009 11:49:54 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id f20sm3368722waf.52.2009.07.17.11.49.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Jul 2009 11:49:53 -0700 (PDT)
Date: Fri, 17 Jul 2009 11:49:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090717184948.GA8252@gmail.com>
References: <1247829612-9310-1-git-send-email-khimov@altell.ru>
	<20090717145837.GA567@gmail.com>
	<200907172150.28360.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200907172150.28360.khimov@altell.ru>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] package.bbclass: introduce KEEP_GNU_DEBUGLINK
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2009 19:03:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (17/07/09 21:50), Roman I Khimov wrote:
> On Пятница 17 июля 2009 18:58:37 Khem Raj wrote:
> > On (17/07/09 15:20), Roman I Khimov wrote:
> > > Currently we're keeping .gnu_debuglink section in files after stripping
> > > them. It makes binaries from successive builds a bit different, which is
> > > not good in situations where you want them to be exactly the same
> > > (identical checksums).
> > >
> > > So, introducing KEEP_GNU_DEBUGLINK which can be set to zero to disable
> > > this behavior and get identical result on successive builds for most of
> > > the packages.
> >
> > you lose debugging these binaries if you remove this section. 
> 
> Yep.
> 
> > So may be
> > there should be options like DEBUG_STRIP, STRIP and NO_STRIP and only one
> > of which could be used.
> 
> As of now, we have INHIBIT_PACKAGE_STRIP that switches stripping, but it has 
> strong on/off semantics, so I don't think we can change that. We can replace 
> it with some common PACKAGE_STRIP setting that would work like this:
> 
> # No stripping
> PACKAGE_STRIP=no
> # Strip but leave .gnu_debuglink for debugging
> PACKAGE_STRIP=debug
> # Strip everything
> PACKAGE_STRIP=full
> 
> But that's more intrusive and will force distro and local config updates. I 
> can do it if everyone is OK with such change.

go for it

> 
> And, BTW, we also have DEBUG_BUILD setting, although that just switches 
> compile flags from what I see.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


