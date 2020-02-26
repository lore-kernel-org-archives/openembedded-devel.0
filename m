Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4D29461033
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 20:34:25 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z1so603890iom.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=7H9vXoIEdf7/uETeScmbuXBiGzR0abRZgy+xaNeNwg4=;
	b=IPgtPVVdeMajsWnrzTZsqetLxvyXM/hGFiULNekDPdmxKKeY0EUzJdICZ0Ksiq/tnp
	Em8vHjHUIrb/xIghahVAKFjDJPYWZdqmWF2SoIuNvQ4YQC1daO0xjju6yJYhhT8CJKFW
	Tg5BL29fud3qnbi0+wgDQzeXCCQqe0EqEpLmHk4sAnukHZjUZIHGBlXnKc/mkM3iQh0t
	xHU7GDbo9jnzMLj2M9aOuJbJSRP0XCt8na9BPGFGrL3Z8I/m9u9fF/vsrVr9q2wNFZDH
	xLmaGtQgV6YCkIoVZ9EUdgW0CaB3IZSkfFbWah7bvhV35ymbznUynpKCvIXQkMvB8uQu
	Xwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7H9vXoIEdf7/uETeScmbuXBiGzR0abRZgy+xaNeNwg4=;
	b=LeAzacOuXCAJqhx8dh1b+eqmLhG8u9AjNWhKzu4Equff+QTWRv42YV4jJ3lHt1s30p
	yNcGD5TLXrQw/EhHUWDBAlAByck/XboCw3igeDrd/ADGP/+LkjqtiLqwBiyQKPUsPHDi
	LTCwIiAOK24nBSdtx4Ciipx0O1oBqK5MGCG74zObsBYR3V7TgB6ppou5xauyiyHo1VNR
	RuzkOl9zWbuEPcpRNCGvBJRZKi+BNNDeWuljMnDYZKk1d0Hl3U3PEA1Ag2L3JDcHc6KG
	vlo1R2I5gmHjxkHUNknX8UpFOEylVGVqhEerhnnQiPBlpyZVvIVfLlO0zlOAiv3fc7xy
	ENfw==
X-Gm-Message-State: APjAAAXBYirtBPlrPTPRf7zFwPGixwULU/3uMtjwaHXLbOPNGQh2Ket0
	DjEXVhxfM/khrL2MxIOckCECRqEofMo=
X-Google-Smtp-Source: APXvYqzpcL5UnT57rE4Os8YaOej5wxJY/NWLOGJAUd+cceEAqFL9MHPT16Qb7NjRpXMwICE+Og2lPw==
X-Received: by 2002:a6b:1450:: with SMTP id 77mr395148iou.79.1582749265448;
	Wed, 26 Feb 2020 12:34:25 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id
	z63sm1047602ilk.44.2020.02.26.12.34.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 12:34:24 -0800 (PST)
To: Jonathan Richardson <jonathan.richardson@broadcom.com>,
	openembedded-devel@lists.openembedded.org
References: <20200226202909.18208-1-jonathan.richardson@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d9064877-aec4-47c8-f2d4-093d3b02174f@gmail.com>
Date: Wed, 26 Feb 2020 12:34:23 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202909.18208-1-jonathan.richardson@broadcom.com>
Subject: Re: [meta-oe][PATCH v2 1/1] open-lldp: Add initial version 1.0.1
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
X-List-Received-Date: Wed, 26 Feb 2020 20:34:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks Jonathan, I have few more comments.

On 2/26/20 12:29 PM, Jonathan Richardson via Openembedded-devel wrote:
> Open-LLDP provides a Link Layer Discovery Protocol agent that supports
> DCB (Data Center Bridging). The tc utility from iproute is needed to
> manipulate  traffic control settings in the kernel.
> 
> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>   .../0001-Fix-musl-libc-build-issue.patch      | 25 ++++++++
>   ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
>   .../openlldp/openlldp_1.0.1.bb                | 39 +++++++++++++
>   3 files changed, 121 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
>   create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
>   create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> 
> diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
> new file mode 100644
> index 000000000..d8d5df218
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
> @@ -0,0 +1,25 @@
> +From b20d64f814c15efbd6a19aacfbfecf15083a83dc Mon Sep 17 00:00:00 2001
> +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
> +Date: Wed, 26 Feb 2020 12:16:38 -0800
> +Subject: [PATCH] Fix musl libc build issue
> +
> +clif.h should include sys/types.h for the definition of pid_t. It fails
> +to compile when using musl libc.
> +
> +Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> +---
> + include/clif.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/clif.h b/include/clif.h
> +index 648eedf..92f4fd8 100644
> +--- a/include/clif.h
> ++++ b/include/clif.h
> +@@ -32,6 +32,7 @@
> + #ifndef CLIF_H
> + #define CLIF_H
> +
> ++#include <sys/types.h>
> + #include <sys/un.h>
> + #include "clif_sock.h"
> +
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
> index 000000000..ef8d780c6
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> @@ -0,0 +1,39 @@
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
> +SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
> +           file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
> +           file://0001-Fix-musl-libc-build-issue.patch \
> +           "
> +
> +# Even though .ac allows disabling -Werror, Makefile.am adds it to AM_CFLAGS
> +# causing it to always be enabled. There are warnings so disable it.
> +TARGET_CFLAGS += "-Wno-error"

is there configure option --disable-werror, we should use that if available.

> +
> +# configure.ac generates version.h from include/version.h.in but autotools puts
> +# build artefacts in $B, not $S and the header can't be found. To avoid
> +# inheriting autotools-brokensep and messing up the source dir just tell Makefile
> +# where it is.
> +TARGET_CFLAGS += "-I ${B}/include"

Can we avoid using B here.

> +
> +# Enable install of systemd conf files.
> +EXTRA_OECONF += "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"

we should be checking for systemd in DISTRO_FEATURES here.

> +
> +SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
> +
> +# To enable service at boot set to enable in local.conf.
> +SYSTEMD_AUTO_ENABLE ?= "disable"
> +
> +RRECOMMENDS_${PN} = "iproute2-tc"
> 

