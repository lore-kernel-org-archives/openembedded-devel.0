Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A24097FA19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:34:46 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q70so6500300qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Mf7ITu7fkHVjQQ6JfzsFPObWEquDDTsJsmaDi/hA01g=;
	b=MB55BwS/FotMQROQtOhVAZCmT1AwXFKEhl2zU//vDYulVUiNpidC7JUtgoF9EcZ+M+
	dykJthRETC+iApKajICJOaATb9RNExkxjLZn6RJuUpnExhJUFY3T195LzxmE46RX9XUH
	XpBcINSrOkvd2N/+kJ6lHDr7uOcttYvn9qbua1mRWR2ySNh6qQa0/gDUDYLL0sh0mDmH
	i447Eou9CIVJBvzbIYVMRckPwakzQUc6Kp93XQI1yzU34sPteeOHKwtVOdUHb29ksEi7
	UbEshNL5ZjZ51mSfe8TIDpr6/fRRC/9voGPKLynBe3npsQB9GG1qpstcrZkVn55BY+Nn
	QoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mf7ITu7fkHVjQQ6JfzsFPObWEquDDTsJsmaDi/hA01g=;
	b=mjgeY8cEh6aPi2ElpOEC7bnxoLYNUvfOdXQDd/Lsl8gpsHIn1rx42khBoPcvZC7BeA
	xuG4a+4NfCvA7vsMSXtZI3P3cKKFNVwmr3e0M96VA4bMc8oRpEIsO5d4ie5ppiWmSAaE
	Fo3JsYBtFfxgD/Z4si3eZoBtOOiVC1jz8qJbe4SrFy5zJiB8SLmk3nu8qrzTj30HZagD
	L2rW+kdlP68KH0Xk5FCBRYd582smnw+ZH7bCFs+fSKf7dEGUqmnOexL04p/bNAShjji/
	50akIZDeZ9yw3HFa5a++aErSutJFbdjKeSH7DR6d5uuAe+LI6SzMcSvLJPdLZZBySCN+
	inxA==
X-Gm-Message-State: APjAAAWu0slZ02beRVRdXqTV9r4VAR8hxd8wpydGgeppIC2mq79oA3J0
	XKYhtbCHFm1FIOQy/fiJxa5QqgnGqgZrvToIk3U=
X-Google-Smtp-Source: APXvYqzeHpG7ruVl+PpR8PDiO8SkAN73N9qxzVwOyPncRuCwtH3ZGrJR3Ui2Suu91w1wiZVP6jXEP3Az253j41TCudg=
X-Received: by 2002:a37:8805:: with SMTP id k5mr3264076qkd.212.1573770887105; 
	Thu, 14 Nov 2019 14:34:47 -0800 (PST)
MIME-Version: 1.0
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:34:20 -0800
Message-ID: <CAMKF1spn6Oc24S3iJxTqYiZfhHeQarCh9s=e=JB=hyQrfVTaLA@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2019 22:34:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 10:04 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
>  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>
> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> new file mode 100644
> index 0000000..a3e33ea
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> @@ -0,0 +1,36 @@
> +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Thu, 14 Nov 2019 14:28:39 +0000
> +Subject: [PATCH] config.mk: Fix compiler and linker
> +
> +Do not set explicitly compiler and linker.
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + config.mk | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index df6e812..bf07406 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
> + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
> +
> + # includes and libs
> +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
> +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
> ++INCS = ${GTKINC}
> ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
> +
> + # flags
> + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
> +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
> + #LDFLAGS = ${LIBS}
> +
> + # compiler and linker
> +-CC = cc
> ++#CC = cc
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> new file mode 100644
> index 0000000..98d3b23
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Simple web browser"
> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
> +HOMEPAGE = "https://surf.suckless.org/"
> +SECTION = "x11/graphics"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
> +
> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
> +

seems to have sstate issues in do_install see
http://jenkins.nas-admin.org/job/oe_world_workspace-compare-signatures/846/console

perhaps due to ./meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
being in depends and
this recipe is pinned per MACHINE via PACKAGE_ARCH = "${MACHINE_ARCH}"


> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
> +"
> +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0644 ${S}/surf ${D}${bindir}
> +       chmod +x ${D}${bindir}/surf
> +}
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

