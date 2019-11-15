Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A54327FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:29:07 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 29so6312510pgm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=62ibxHaxRHZ2t4GiVYKK9xIcXaT6pVYjQCobnWetWAA=;
	b=rxksPRC9yKlaUHCjmSC5BNVQlPxXc6Dev0dlsopLyIAc749F40fsmC6QAY0QBWnhe1
	/D1reMYoGQHwe7yB5ilYg2XORAM48l5ZaDv2XjirWwNdbPwjZw0xiLBsf7Tis9FZJAKm
	ecmKIzezDz4s6kh0HZnBBNPLWzA6DW2Agy+WB74p6yQOH6z4NsmLKXynHpGCPqvEOpho
	XJjK3ya3oaYE5vfbmaVtEs4C4Ndo0qW+20FdTkioScsPuvss7kcLAgA2mmwqvSjaBCsb
	6rQot0pkno1sF7yKbnu/jzkQc4Hfl/NMxV1qVO2VnQhIuGj52AW168PRPYjADw9Vw/mC
	u8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=62ibxHaxRHZ2t4GiVYKK9xIcXaT6pVYjQCobnWetWAA=;
	b=eApMd7VQ3BNJUaOdnT5QvmnTVvd7JtfI1qnY6ogCq/225IO1/J9mNFeFv3t1a0RotF
	916l7F/gsU/FME/I7/6GoYlU5wxzsJKMCDHwCqpJfVfookGBehLk99DaOgbh1i128N0q
	ILkigmsrVcLiQYyhYWySEX2wDm24Xs5KDZiIGXL5Bg+xi9APdhHX5GhfSFTzvowZaOv+
	+eUoFujYBTNNzy+DZ6LuD+i4BehE8b5jd1FV9xU2AgEtnJqk9n8ew7DPhyroqdDNhTwX
	IxzotsoYyGe4/XhCC4oYNXGWJXbSUnqD4jxxINwtqkTSnYBaokbR5PXS2DgNzmSqLVKw
	wJtQ==
X-Gm-Message-State: APjAAAVgroYlnSTTzj6cWqfe8LeCQPHBIIrAoDKQXZcuwx8oFKivEc36
	S7WfmsRmxvIkqJA9vlKz+BE=
X-Google-Smtp-Source: APXvYqzvoSFmX2oj5VL3fhWUcjczYReAj5ln+UTURk718JiV+M4I6skxp6jiCRD29ly6SVhjkmevKg==
X-Received: by 2002:a63:b24:: with SMTP id 36mr3849967pgl.30.1573838948322;
	Fri, 15 Nov 2019 09:29:08 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	b200sm11597013pfb.86.2019.11.15.09.29.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:29:07 -0800 (PST)
Message-ID: <787b3884aaf2f41c36d01bec70af383e5c3833cb.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>, 
	openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 09:29:02 -0800
In-Reply-To: <1573824432-32134-1-git-send-email-leon.anavi@konsulko.com>
References: <1573824432-32134-1-git-send-email-leon.anavi@konsulko.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCHv2] surf: Add a simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 17:29:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 15:27 +0200, Leon Anavi wrote:
> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-config.mk-Fix-compiler-and-linker.patch   | 36
> ++++++++++++++++++++++
>  meta-oe/recipes-graphics/surf/surf_2.0.bb          | 31
> +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-
> config.mk-Fix-compiler-and-linker.patch
>  create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
> 
> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-
> compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-
> config.mk-Fix-compiler-and-linker.patch
> new file mode 100644
> index 0000000..a3e33ea
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-
> and-linker.patch
> @@ -0,0 +1,36 @@
> +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00
> 2001
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
> +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-
> 4.0`
> + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
> + 
> + # includes and libs
> +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
> +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
> ++INCS = ${GTKINC}
> ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
> + 
> + # flags
> + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\"
> -D_DEFAULT_SOURCE
> +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
> + #LDFLAGS = ${LIBS}
> + 
> + # compiler and linker
> +-CC = cc
> ++#CC = cc

this should be ?= instead of commenting out and you can upstream this
change

> +-- 
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-
> oe/recipes-graphics/surf/surf_2.0.bb
> new file mode 100644
> index 0000000..7639137
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Simple web browser"
> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
> +HOMEPAGE = "https://surf.suckless.org/"
> +SECTION = "x11/graphics"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
> +
> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0"
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

my original question about sstate issue perhaps is still not addressed

> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_install () {
> +	install -d ${D}${bindir}
> +	install -m 0644 ${S}/surf ${D}${bindir}
> +	chmod +x ${D}${bindir}/surf
> +}
> +
> +# Avoid already-stripped QA errors
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

this needs explanation why we need this.

> +INHIBIT_PACKAGE_STRIP = "1"
> -- 
> 2.7.4
> 


