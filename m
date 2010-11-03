Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PDfZt-0001SP-IN
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 16:48:46 +0100
Received: by bwz10 with SMTP id 10so752058bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BGVgzc5031fCJWR3BQXYDcSs91p3FCqhh0AGYQQRK5E=;
	b=Ta6Q1wGPySqQ8Wlp4xuRBgsg9uLSZOYc7+0IR+HuXDn9bi6tDiGVmpDvinEz7n5tCB
	tCg9sdH/RGB6yCabt4uFrrncBGKG0qWKtxZF3Zgv3/NWRhAu4p0V/mQ5xZ+sXqEHQseQ
	dBSjK5RXbE/YJriofWnJ2BaUwJFFe4Rsz3gwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XVHR4ptwgyyN4TNBc7fohyu36vdPZYIE3WHfUA+Pz1LjkKAILcbPSHFQzrCDvklBdR
	f3RgMH3sw3RAWB/358DSL5ndV5N5vjzW1jMpga17fEZDyFTHi5L22WFyz7w/DXflWQ5P
	9HXoSCzg24NLCDvFTsxcuXWxBbPmyv7eGbJWs=
Received: by 10.204.11.13 with SMTP id r13mr9118143bkr.96.1288799271346;
	Wed, 03 Nov 2010 08:47:51 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm3212928bkt.6.2010.11.03.08.47.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Nov 2010 08:47:49 -0700 (PDT)
Date: Wed, 3 Nov 2010 16:47:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101103154735.GE3440@jama>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 15:48:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2010 at 08:17:29AM -0700, Khem Raj wrote:
> On Wed, Nov 3, 2010 at 2:42 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2010/11/2 Khem Raj <raj.khem@gmail.com>:
> >> On Mon, Nov 1, 2010 at 11:38 PM, Frans Meulenbroeks
> >
> >>> I have some concerns here.
> >>> For configure it seems best to explicitly set and reset the flags in
> >>> it, otherwise you may just pick up whatever happened to be build
> >>> before.
> >>>
> >>
> >>
> >> this is the case with any package that uses configure tools. But assumption here
> >> is that when you are building you are not building stuff thats not
> >> meant to be in
> >> the given image.
> >
> > True. However we should enforce that. If e.g. gphoto has no depends on
> > exif it autotools will still pick up exif if it happens to be there
> > because some other package build it.
> > Funtionally this is not necessarily bad (as your image has exif
> > anyway), but from a point of reproducability it is undesirable.
> > E.g. if you build the recipe the first time, you might not get exif
> > and if you rebuild you do get exif. (because the build system does not
> > know the dependency is there so it might not have build exif yet).
> >
> > Actually the results might even differ for between builds of the same
> > image (especially if you build machines with different speeds etc
> > and/or use different flags for parallellism.
> > Therefore I feel it is highly desirable to have all optionals that you
> > have in configure either explicitly disabled or explicitly added to
> > depends.
> >
> 
> this is everlasting problem with autoconf and autotools. There is a
> set of options
> which are enabled based on what autoconf guesses on the sysroots. Unfortunately
> it will be very tedious if you want to explicitly enable and disable
> every option as well.
> and there are quite a lot of packages using autotools. However I think
> that the sysroot is minimal
> when we build from scratch so most of options should be disabled which
> are decided by autoconf
> so we may not get unneeded features which is better than having them
> enabled at build time
> and needed support being missing at run time.

well but then you rebuild that package ie after just PR bump and feature
gets enabled, users gets used to it and with next rebuild from scratch
you will be surprised why they are complaining about missing feature
(happened to me with python + tk).

So to keep them disabled even for next rebuild after PR bump we should
put --disable-feature to EXTRA_OECONF to be sure.

But that would make it conflicting for maintainers who are used to have it
"usually enabled" and "usually disabled".

Which can be solved by DISTRO_FEATURES but some shortcuts like gentoo
has would be usefull

DEPENDS += tk? ( >=dev-lang/tk-8.0 )
instead of
DEPENDS += ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}

$(use_with threads)
instead of
${@base_contains('DISTRO_FEATURES', 'threads', '--with-threads', --without-threads)}

$(use_enable ipv6)
instead of
${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', --disable-ipv6)}

or even
DEPEND="dev-libs/ecore[evas]"
instead of
hoping that ecore was built with evas support

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


