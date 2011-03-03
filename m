Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv00w-0001Qb-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 05:19:46 +0100
Received: by iyb26 with SMTP id 26so643142iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 20:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=QoxHesPTueT2vZyGxjQnHue47MHiDzaHM3wbp6BHUpY=;
	b=U0mvh77Lnyc30IgAZgRV42hh8Gbns3qtyjckFkJFL65UyhboTADgIcyzk9SxFptFlO
	LhiZiyFBFqWc5neMMtj2nnKHtl2IxkD9Jd55LLVY7uWUSKDN9XQkBU5ViAdYeNqKivL9
	/6y25vUz1psBY2WFICYb1ldYINi77GLxF2sqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=IjWBIX7ULvt4pB6r5nNtj9bX/nFuiH0cZPi1q0tZHU9cG7I0SPXDCrOYMGTB8g1RYn
	6wXvfZALiEHWmxBiqQja1+Ul7MZXfIuUCWY8nHvTD8gFc8Dpj3g1tqwhcYA9Scycu9kM
	F7lWqFuMBQsDjKwR56yF0W+68sYD8q+XAS6Ek=
Received: by 10.42.241.68 with SMTP id ld4mr894812icb.447.1299125897389;
	Wed, 02 Mar 2011 20:18:17 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm535255ibb.17.2011.03.02.20.18.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 20:18:15 -0800 (PST)
Date: Wed, 2 Mar 2011 20:18:07 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110303041807.GA2692@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<1298979308.23547.67.camel@phil-desktop>
	<AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
	<1299080486.23547.230.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1299080486.23547.230.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Thu, 03 Mar 2011 04:19:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/03/11 15:41), Phil Blundell wrote:
> On Tue, 2011-03-01 at 11:47 +0000, Otavio Salvador wrote:
> > On Tue, Mar 1, 2011 at 11:35, Phil Blundell <philb@gnu.org> wrote:
> > > On Mon, 2011-02-28 at 19:33 +0000, Otavio Salvador wrote:
> > >> On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
> > > I just tried linking xfreerdp by hand with gold and the resulting binary
> > > seemed to come out fine.  So I think this is indeed a bug in GNU ld.
> > 
> > Personally I think we need to trace it down (we as project) since it
> > can lead to broken and difficult to trace behaviour. It took 3 days
> > until I managed to identify the symbol failure.
> 
> Yeah, that might be true.  Or we could maybe just switch the default
> linker to be gold, at least on targets that it supports. 

Yes I have been doing this slowly for ARM. but probably it will be
better with gcc 4.6 where linker will be selectable with options

> 
> > I am far from an expert on linking and GNU ld. For debugging it I'd
> > need guidance.
> 
> I think the place to start looking would be _bfd_elf_merge_symbol(),
> which is in bfd/elflink.c.  This gets called by
> elf_link_add_object_symbols() to record the syms that it finds and I
> suspect that one or other of those functions is probably doing the wrong
> thing.
> 
> Or, if you don't want to debug it yourself, you could try to create a
> testcase that shows the problem and then file a bug report with binutils
> upstream.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


