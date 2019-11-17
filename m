Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7918B7F1BA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 18:54:58 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id j5so16167768qtn.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 10:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ri2tRjH1Xvq9ESCS1owO0Rp3BEXVsmWbVrdUfEP2+wU=;
	b=Tr9Nt9ZtfO/9FuQ7rwaojNRHxKpOyDzT17oXJhTr+oKqsUbJl4g5M2Cx68Mf2QKTaC
	laQ2PCMMpHJH+U5WzrCTN/11+iPvgE3LCGeVBAip2943Rxn0wzV2do2iNZCrp7J/J3dD
	ktw08YviR0Casj+BLzofTzWm0531ejh36kMfdswRVFpXWFAyIIsqj4bI5YSYg91hKuqR
	+mTwTmWbagne2ZHKOX0umA4Vz0GyaU4aZJdWfh0DnYdfeb3ZN0vaWo3Ca5D91Rs8J4zC
	4kpdekeypyB1xRClR4Qu7OiNOnx6q60qoVP1gjJgiGDD1ryK+4SiEcA78YNbY/yZnsmY
	e8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ri2tRjH1Xvq9ESCS1owO0Rp3BEXVsmWbVrdUfEP2+wU=;
	b=aQA4STxlR+xwTPaUD8aPpKbRfpnu3JpMERmHRvOlUvGVajDiHKT5/dKX9wDbFZrrgX
	PAezXw3m0M0OrWsVjqjoXtkVV9Fn8TzK8bov7BU+2MpQsTDntgr0/hoTLbstEFURd9GG
	8hqJwMmSTudvlnQuzhx3VsN8js3N7sgf5cByRiZmmu5DzP1TwDX8Zt6uh2hP5HvRtCH9
	7otyC3PgvZo3OBN1beY0vrOQxrskZHuNbKBNF2thx1W2ZAO/OYC6byNEpNbotuGe0k4A
	1MqASqnlTikdTmHX3uWKW5JjRc1YpeWGOAD2WeBWpIyQ2sLQw+j9j3ZoVvoWvuB3MksN
	wZLg==
X-Gm-Message-State: APjAAAVNMDVN5emoVDa1unK8h+x7cvlHOHTJ4u/gKeRSnELF9LqyOKsR
	f0DATBqOB8HSK0++bv3hD/QIcEeqM3mqhLrsoEA=
X-Google-Smtp-Source: APXvYqwgHjnvIITUJK4/5Nvk9CLjDRQtCSI/gxUO3g7oVCnVdJE3TTvqAMUUX6Ck2ufPvni4zM9gS+mdG5LKuuLdnXM=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr23294198qtj.80.1574016899041; 
	Sun, 17 Nov 2019 10:54:59 -0800 (PST)
MIME-Version: 1.0
References: <1574015291-12573-1-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1574015291-12573-1-git-send-email-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Nov 2019 10:54:32 -0800
Message-ID: <CAMKF1spa+oa376cdaPddWZdqxAXgEhoDF0rdAJNx71UZ5ez9hA@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv4] surf: Add a simple web browser
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
X-List-Received-Date: Sun, 17 Nov 2019 18:54:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 17, 2019 at 10:28 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-config.mk-Fix-compiler-and-linker.patch   | 41 ++++++++++++++++++++++
>  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 26 ++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>
> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> new file mode 100644
> index 0000000..fb90432
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
> @@ -0,0 +1,41 @@
> +From e97bb73851f5bbd94260da553a222526485cdfb1 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Fri, 15 Nov 2019 18:24:42 +0000
> +Subject: [PATCH] config.mk: Fix compiler and linker
> +
> +Do not set explicitly compiler and linker.
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + config.mk | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index df6e812..5deb991 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -15,17 +15,17 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
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
> + CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
> +-LDFLAGS = -s ${LIBS}
> ++LDFLAGS = ${LIBS}
> +
> + # Solaris
> + #CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
> + #LDFLAGS = ${LIBS}
> +
> + # compiler and linker
> +-CC = cc
> ++CC ?= cc
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> new file mode 100644
> index 0000000..39c0f5e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Simple web browser"
> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
> +HOMEPAGE = "https://surf.suckless.org/"
> +SECTION = "x11/graphics"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
> +
> +DEPENDS = "webkitgtk gtk+3 glib-2.0"
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
> +"
> +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig distro_features_check
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${S}/surf ${D}${bindir}

you could do it with one liner

do_install () {
    install -D -m 0755 ${S}/surf ${D}${bindir}/surf
}
> +}



> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

