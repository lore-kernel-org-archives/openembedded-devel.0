Received: from [209.85.216.171] (helo=mail-px0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MRp6k-00024O-U1
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 17:12:23 +0200
Received: by pxi1 with SMTP id 1so378687pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2009 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CbUKfbAi7nnl/6HPq7/86MCEdFKnLgDKTwjD2SqcjEs=;
	b=stZ4sl1V52shgapj+Kjj2BFkpRexOuFUwQWccUl5EhslUkZSHhbsqu7Zjp8E/S73fV
	FuAmx37GHgbAuwJwUCJ2xYUzJE5gSkmZCOyBPc4GvsWMCrbzt7BAyzrl0NugH1NkuFOM
	PCF8mUtAgDYR50htMyMFi4yBcaYTJGJdeZGBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=F2j0izFNElubG9ckX4aiW+xBrh8/4CU/PsI7gp/bInSJcP2R/xmbcSY/FcQ9nm7R8N
	KN60jTVnuac5xIa4Pt0pkD5DzvFkdgfIxowY9/Fc9+yicQyreImpjylESm5U5zRthaZe
	LUCncshZNqazhtlXv5pn70QMljcPLDAqJsm4I=
Received: by 10.114.53.1 with SMTP id b1mr1700582waa.173.1247842723260;
	Fri, 17 Jul 2009 07:58:43 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id k21sm2886746waf.59.2009.07.17.07.58.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Jul 2009 07:58:42 -0700 (PDT)
Date: Fri, 17 Jul 2009 07:58:37 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090717145837.GA567@gmail.com>
References: <1247829612-9310-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1247829612-9310-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
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
X-List-Received-Date: Fri, 17 Jul 2009 15:12:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/07/09 15:20), Roman I Khimov wrote:
> Currently we're keeping .gnu_debuglink section in files after stripping them.
> It makes binaries from successive builds a bit different, which is not good
> in situations where you want them to be exactly the same (identical checksums).
> 
> So, introducing KEEP_GNU_DEBUGLINK which can be set to zero to disable this
> behavior and get identical result on successive builds for most of the
> packages.

you lose debugging these binaries if you remove this section. So may be
there should be options like DEBUG_STRIP, STRIP and NO_STRIP and only one of
which could be used.

Thx

-Khem


