Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88F617F9A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 18:53:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l24so4339186pgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 10:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=998X6bOe83giSSJLf2XHs0LPSXBFLW4dGQdzePF8yqo=;
	b=YljwFYqr6Ln3cjUEpaXbLwBqjrInRMLSUYNSQ4leQ3LyIeN8XnP5TX0lWyH5/tzDfF
	ht8KOEctoYUhLL2UHh3JBUBsaBNRz0xNAi5gFiV3EhJnmt8OhJEuBhLP5gFOqGJowebo
	tdzh1y5AHV+KnsnZ/AZBvAsfsfjDnJLSCq2BWOCjYe5GS90z6SG8F+Wc9jFAMtVMo5DQ
	RQ3afZa9g+hhcrEW89+SJkdRd1oydEoXlCrX2mjIZ9eBsToXtjdMP22ONkUDS4cFACMj
	GK0cP36/s65VFWibzzqZH7EnzG/K/2k1Mqumj44jzB6USru1GNKwFhd4mmwcpTW0BHQK
	iIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=998X6bOe83giSSJLf2XHs0LPSXBFLW4dGQdzePF8yqo=;
	b=c8edfJGabOE7TIksPJeOWlej/oniWW8oTKNrQFMM1OBgbpCrsjQrIf0OWGqoYKPqV5
	jsVvowR/f59WFMHGv7eAUR0klmtfrBIdirsqmTuANg5LbDuTt1n9/rML6CBr47Yrqesy
	PE8ymIBNJSZjKTWu6gc53rmTcYlwK98KhHfZu7QFfGKZzShXzPVppHL/tkqbW0s0M5Tz
	3tfrqqRLeOMR0OSAI8uDY419kKkDXWhO3LXfDEarEjTtaxBGydYroqe+gaU1+HO2wPeT
	fU0jKUCSrDcIpuICyQUeg+F1LVezguB1w/91T+lQ3/17YeKeGHhnppNgRMOCjormcvAT
	etTA==
X-Gm-Message-State: APjAAAXt1eGMxnOerPHv0fVROHn3nKT3l1KFJQDyEkViYR38+/Gu3Eva
	1TTcHQq6EO72bMHi5Rt8vTyosKLN
X-Google-Smtp-Source: APXvYqwyKULk3WdXA/BUjfOfuAiQ6w7p0HvOqUA1qhVRDFWTa749VY/1j8OCZ7Pojh1RiEZ4XAvhzg==
X-Received: by 2002:a62:20e:: with SMTP id 14mr12594016pfc.153.1573757581061; 
	Thu, 14 Nov 2019 10:53:01 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:90e5:8f1e:65b9:f435?
	([2601:202:4180:a5c0:90e5:8f1e:65b9:f435])
	by smtp.gmail.com with ESMTPSA id
	r22sm9084280pfg.54.2019.11.14.10.53.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 10:53:00 -0800 (PST)
To: Leon Anavi <leon.anavi@konsulko.com>,
	openembedded-devel@lists.openembedded.org
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
Date: Thu, 14 Nov 2019 10:52:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 18:53:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/14/19 9:20 AM, Leon Anavi wrote:
> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.

shouldn't this go into the meta-webserver layer ?
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
> +	install -d ${D}${bindir}
> +	install -m 0644 ${S}/surf ${D}${bindir}
> +	chmod +x ${D}${bindir}/surf
> +}
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"


