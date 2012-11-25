Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Tcv7E-00049o-5L
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 10:36:36 +0100
Received: by mail-wg0-f46.google.com with SMTP id dt10so4656477wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1ZOLTZmHEfaXQAsmDZH63CWjJbomIKmLG7tHWBDh/io=;
	b=wn1uFwZpIi+vW7kZaawPejlG1XULE80/tqnScFo23uAEJR7iKNedKH5/MHeywfvNLB
	25asCH5a8LLGx40jwkYKAMsXlpwBoKiF00XAHAK0iI/wX38Uv4kiDgr4XHQZWNbnxro4
	KbpSJWCUFqucIXWjLcfgKmwAOxe3T5SGoQJoeZsZbrZ2cJScK1e/rEF+JPTFOF6BZLyB
	Ox0JYnIAjGszIa8Zn52Tw4kPxivttOQnTvjnFP+LW2XdPt2t1SxKu3qtNw5NfqdGLKhs
	bmIaPhS9kLjPXSdJTO6FiyQqYz2m832rJXKr1Zftv8xh+7ushLfLSaUiwPn9lo619+pr
	+5Ow==
MIME-Version: 1.0
Received: by 10.180.7.199 with SMTP id l7mr13327094wia.15.1353853194407; Sun,
	25 Nov 2012 06:19:54 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.24.140 with HTTP; Sun, 25 Nov 2012 06:19:54 -0800 (PST)
Date: Sun, 25 Nov 2012 08:19:54 -0600
X-Google-Sender-Auth: D9SA4puzE_2aCEYloIx0c5TKTWY
Message-ID: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org, 
	=?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Mon, 26 Nov 2012 09:36:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Koen Kooi <koen <at> dominion.thruhere.net> writes:

>
> Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
> ---
>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> index d7f6ac0..27f660b 100644
> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
>
> -PR = "r3"
> +PR = "r4"
>
>  DEPENDS = "libtool jpeg virtual/libusb0 libexif"
>
> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
>  EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev
ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>
>  do_configure_append() {
> -    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in${S}/libgphoto2_port/po/
>      cd ${S}/libgphoto2_port/
>      autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF}
$acpaths
>      cd ${S}

I was about to submit a similar patch reverting the original.  Here's what
I wrote up.

Revert "libgphoto2: fix build"

When using gettext-0.18's Makefile.in.in the elimination of AM_PO_SUBDIRS()
prevented the substitution of @GETTEXT_MACRO_VERSION@.  With the original
patch I get:

| Making all in po
| make[4]: Entering directory
`/prj/oe/yocto-ang/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r3/libgphoto2-2.4.11/libgphoto2_port/po'
| *** error: gettext infrastructure mismatch: using a Makefile.in.in from
gettext version 0.18 but the autoconf macros are from gettext version
@GETTEXT_MACRO_VERSION@

autotools.bbclass does not unconditionally copy po/Makefile.in.in over the
original gettext-0.14 version.  Presumably the original patch could be fixed
by replicating the logic in autotools.bbclass that determines whether this
should be done.  Reverting it is a simpler solution that works in my
environment.

This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.

