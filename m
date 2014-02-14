Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76B036F000
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 14:19:28 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so896498igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 06:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9lyOUbSIqveg1uxlmU/z3OvIwvW1yKZafXlQNoajyy0=;
	b=ePNSGOWDTBRWPYnMAe5VDBSl/UlpAgqlKd8sBA507dce0Hn6M1fdqxFUHrX5zu6XoZ
	Fn1HMWBywVD3CbN9CS1rwmt7dx6KV6WLAIjiKZnrCcBQ6SybIVTvzBNaolgtf6g7kwvr
	816RWkS2O3bLwckM260VwZve1WTHaYsbrEMR+2FVd+IYXlLlJZCRwesN018ErtCDGuqk
	Fs+O15MBFf/0oVKYASA8b7LAPaAhs5l2UpJuE9vj2fTfmjU4zDSSB+GLJ03TmZxW7ZPe
	o8/+Oy71BxMKaqw4U6vAbGh3ZNSsRF8rUv4/c+ImoY5p6PaA84cIr7F0llK6D98fPFJv
	7tWQ==
MIME-Version: 1.0
X-Received: by 10.42.85.140 with SMTP id q12mr1291743icl.51.1392387569036;
	Fri, 14 Feb 2014 06:19:29 -0800 (PST)
Received: by 10.50.8.137 with HTTP; Fri, 14 Feb 2014 06:19:28 -0800 (PST)
In-Reply-To: <ldklmr$ov6$1@ger.gmane.org>
References: <1392363700-22933-1-git-send-email-raj.khem@gmail.com>
	<ldklmr$ov6$1@ger.gmane.org>
Date: Fri, 14 Feb 2014 06:19:28 -0800
Message-ID: <CAMKF1sqYARr5O7x0NxX2wr=DHDaKq5uwHS+PEoM+QPkqrC6Wmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2] libmicrohttpd: upgrade to 0.9.33
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 14:19:29 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, February 14, 2014, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Khem Raj schreef op 14-02-14 08:41:
> > libmicrohttpd is needed by systemd-journald-gatewayd Remove older recipes
> > and move to recipes-support
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com> ---
> > .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   16
> > ---------------- .../libmicrohttpd/libmicrohttpd_0.9.33.bb}         |
> > 20 ++++++++++++-------- 2 files changed, 12 insertions(+), 24
> > deletions(-) delete mode 100644
> > meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb rename
> > meta-oe/{recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb =>
> > recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb} (23%)
> >
> > diff --git
> > a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
> > b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
> > deleted file mode 100644 index ebaa485..0000000 ---
> > a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb +++
> > /dev/null @@ -1,16 +0,0 @@ -DESCRIPTION = "GNU libmicrohttpd is a small C
> > library that is supposed to make it easy to run an HTTP server as part of
> > another application." -LICENSE = "LGPLv2.1" -LIC_FILES_CHKSUM =
> > "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5" - -DEPENDS =
> > "libgcrypt curl" - -# ftp://ftp.nluug.nl/pub/gnu/${PN}/ has only 0.9.*
> > and newer now -SRC_URI =
> > "http://mirrors.usc.edu/pub/gnu/${PN}/${P}.tar.gz" -SRC_URI[md5sum] =
> > "61698da6aa04744ea076c327f66fc05a" -SRC_URI[sha256sum] =
> > "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371" -
> > -inherit autotools lib_package - -do_compile_append() { -    sed -i
> > s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc -} diff --git
> > a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
> > b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
> > similarity index 23% rename from
> > meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bbrename
> > to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb index
> > 802ae40..2c738c9 100644 ---
> > a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb +++
> > b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb @@ -1,16
> > +1,20 @@ -DESCRIPTION = "GNU libmicrohttpd is a small C library that is
> > supposed to make it easy to run an HTTP server as part of another
> > application." -LICENSE = "LGPLv2.1" +DESCRIPTION = "A small C library
> > that is supposed to make it easy to run an HTTP server as part of another
> > application" +HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
> > +LICENSE = "LGPL-2.1+" LIC_FILES_CHKSUM =
> > "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5" +SECTION = "net"
> > +DEPENDS = "gnutls libgcrypt curl"
> >
> > -DEPENDS = "libgcrypt curl" - -SRC_URI =
> > "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
> > -SRC_URI[md5sum] = "a10496b7f1b495aaf6897584da52f51b" -SRC_URI[sha256sum]
> > = "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2e796ab8478f7e9cbI'm
> not 100% sure, but isn't largefile a DISTRO_FEATURE?


That's right, wait for v3


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFS/dpzMkyGM64RGpERAoh1AKCBF+EjcIYqIXLoY27vC48I/BveOACgu38U
> 9w1XcagcP90WF752zdacvmQ=
> =F3eg
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

