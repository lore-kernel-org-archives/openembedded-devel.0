Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2058C611DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 03:26:58 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id j17so663005pjz.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=To2w2i6wQZZG8uaRuhrx70z9pN+T5s1MaxPLELy+rKQ=;
	b=m5oAVu33nbfcZeG2QQ1Nd6PADw+sCpQgcoBopY4bY8XiXNEKci+m5k6Po4LbrZ1HV6
	C2D2wz3veMXcYDTgxsFmUdlcd07n4Q5i0Mrl4F+Bk3bf78LbKlXSQ1o64oMGTdILeJml
	3JrcVC4dFBDHuQt5g5rXOkax4DhHAJf7v3FS3JLuB5Bt5xIH4wH+OsBT7OnXAVUQvRSa
	HU/yQixceh9O7obL+0KAX7o3Ahcx+0YiMtdoLB9B7FoMPPMJonhUOSwy0ayZKXcY9k8D
	5267DI9HMiig369Bk1tThO+i2tIbjDKGIEsleARLWf65C8m0VvyQQWSoapVfp6AD63tk
	c5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=To2w2i6wQZZG8uaRuhrx70z9pN+T5s1MaxPLELy+rKQ=;
	b=qHBc7or7dhFAjSoFJyP1L3sNWOe56rUsMSjpVgcgPZrA1B1t/CkbaITyGYbK6Lp7TY
	uBw+k6fQxBDrOqhx9s4UXCSwmmm5kf0pBWKLltmj0PK76BP5kFkTBTa/NM+Msh6vvFn4
	qNURa+sL/aFEfr2cOnupD3KliVwvAR/kaXXmceSUdqGO/dgGNUadePPffApsm6ccxL9J
	RI2faIMFJUWPGofd46L8hjCamOKX6T0memiQ2AyCvDhQJ33QD3y8fs7XH7++rpZ9H8A1
	UkdqBUDiW3t9Dlzfnp/WEDDgHXvz2zHR0m9BkipZ1vJ00LR3MUeYNL4J3D5oYxiveacq
	SG6Q==
X-Gm-Message-State: APjAAAUdQ6Z8LdqTl6UdvRkkjF3QavLT2vgvOYf7m/9+6U3ZwAw6uxLl
	IVmAGqq04/6mf2zEN9w6mrQdNq+YVDM=
X-Google-Smtp-Source: APXvYqx1EBy6H8DHJLBqOs/9N8dvgKzOfFK9s2yqlkfA8nuMoqgzquKqzqLdLtLNOMCnAf0OWXHptw==
X-Received: by 2002:a17:90a:858c:: with SMTP id
	m12mr2450111pjn.127.1582687618404; 
	Tue, 25 Feb 2020 19:26:58 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:923a:5c32:ada4:3e27?
	([2601:646:9200:4e0:923a:5c32:ada4:3e27])
	by smtp.gmail.com with ESMTPSA id
	hg11sm514380pjb.14.2020.02.25.19.26.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 19:26:57 -0800 (PST)
To: Jonathan Richardson <jonathan.richardson@broadcom.com>,
	openembedded-devel@lists.openembedded.org
References: <20200225221904.97152-1-jonathan.richardson@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <84740cf1-89ad-5f5d-c8e7-cbf40e02a160@gmail.com>
Date: Tue, 25 Feb 2020 19:27:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225221904.97152-1-jonathan.richardson@broadcom.com>
Subject: Re: [meta-oe][PATCH 1/1] open-lldp: Add initial version 1.0.1
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
X-List-Received-Date: Wed, 26 Feb 2020 03:26:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jonathan

On 2/25/20 2:19 PM, Jonathan Richardson via Openembedded-devel wrote:
> Open-LLDP provides a Link Layer Discovery Protocol agent that supports
> DCB (Data Center Bridging). The tc utility from iproute is needed to
> manipulate  traffic control settings in the kernel.
> 

build on musl fails and finds a problem

https://errors.yoctoproject.org/Errors/Details/392758/

include/clif.h:186:1: error: unknown type name 'pid_t'

this file should either include <sys/types.h> or
if its already including unistd.h then use -D_XOPEN_SOURCE=700 in cflags
might fix the issue.

> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>  ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
>  .../openlldp/openlldp_1.0.1.bb                | 37 ++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
>  create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> 
> diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
> new file mode 100644
> index 000000000..86c9f4463
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
> @@ -0,0 +1,57 @@
> +From 1c1e01b2414ca5b3cf5a21b6e6389f9ca82fd7e9 Mon Sep 17 00:00:00 2001
> +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
> +Date: Fri, 6 Apr 2018 10:49:04 -0700
> +Subject: [PATCH 1/1] autotools: Add option to disable installation of systemd
> + conf files
> +
> +Add option to configure.ac to enable or disable install of systemd conf
> +files. If --with-systemdsystemunitdir is passed to configure then the
> +files will be installed to the provided directory. If the option isn't
> +provided then the value is determined from the systemd pkgconfig file,
> +if found in PKG_CONFIG_PATH.
> +
> +This change is required because Makefile.am always installed the files
> +to a hard coded path that couldn't be changed.
> +---
> + Makefile.am  | 3 ++-
> + configure.ac | 9 +++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 551d4c7..5491c61 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -133,8 +133,9 @@ install-data-hook:	installdirs-local
> + pkgconfigdir = ${libdir}/pkgconfig
> + pkgconfig_DATA = lldpad.pc liblldp_clif.pc
> + 
> +-systemdsystemunitdir = $(prefix)/lib/systemd/system
> ++if HAVE_SYSTEMD
> + dist_systemdsystemunit_DATA = lldpad.service lldpad.socket
> ++endif
> + 
> + bashcompletiondir = $(sysconfdir)/bash_completion.d
> + dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
> +diff --git a/configure.ac b/configure.ac
> +index 0667446..f75f433 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
> + AC_TYPE_UINT32_T
> + AC_TYPE_UINT8_T
> + 
> ++# Support for systemd unit files.
> ++AC_ARG_WITH([systemdsystemunitdir],
> ++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
> ++        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
> ++if test "x$with_systemdsystemunitdir" != xno; then
> ++        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
> ++fi
> ++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
> ++
> + AC_CONFIG_FILES([Makefile include/version.h lldpad.spec lldpad.pc liblldp_clif.pc])
> + AC_CONFIG_MACRO_DIR([m4])
> + AC_OUTPUT
> +-- 
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> new file mode 100644
> index 000000000..7fa3429cc
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "Open-LLDP"
> +DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
> +HOMEPAGE = "http://open-lldp.org/start"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools
> +inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', '', d)}
> +
> +DEPENDS = "libnl libconfig readline"
> +
> +SRCREV = "36d729de7ce5b56cf061d94d610cf0510154820c"
> +SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master"
> +SRC_URI += "file://0001-autotools-Add-option-to-disable-installation-of-syst.patch"
> +
> +# Even though .ac allows disabling -Werror, Makefile.am adds it to AM_CFLAGS
> +# causing it to always be enabled. There are warnings so disable it.
> +TARGET_CFLAGS += "-Wno-error"
> +
> +# configure.ac generates version.h from include/version.h.in but autotools puts
> +# build artefacts in $B, not $S and the header can't be found. To avoid
> +# inheriting autotools-brokensep and messing up the source dir just tell Makefile
> +# where it is.
> +TARGET_CFLAGS += "-I ${B}/include"
> +
> +# Enable install of systemd conf files.
> +EXTRA_OECONF += "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
> +
> +SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
> +
> +# To enable service at boot set to enable in local.conf.
> +SYSTEMD_AUTO_ENABLE ?= "disable"
> +
> +RRECOMMENDS_${PN} = "iproute2-tc"
> 

