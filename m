Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F14378260
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 20:48:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y27so8220910pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=t16XNP8dZ+iagUhsxGYDZMw2zcVWpzgv+jhEqBJk7qE=;
	b=WKEpcLTEHhL5GtKmJF7CjDyn17eKryKVaMR+HHv+lxxS0kOYBsygsA8J5SFTllpdWl
	SgPOz8k88NXVvfe+SKL9lq0B5o0BjO9N0weLitiBF/nPRAr2JGX5ytM/3SNDRE1gS1Rq
	MyR8YaLao482VKSOMS9OSd+zDQryIFDGY9y1i//Pd22iUNQWXQZ0KNN1Y86sf9KR5oFQ
	0gDc/B+7wuiq1ybhXMl1sdrjprRS110kd9y28T8/ZUidKeO2q9iE85GHEmXlq3NDTo31
	uYiorQrvK/BSjuT0em5jQ7wnt7V2Tq+aGd2RKS/2NK7gJQDcoCmF+acE4JTb+FvxmNQs
	TBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t16XNP8dZ+iagUhsxGYDZMw2zcVWpzgv+jhEqBJk7qE=;
	b=glgsGWw1QB+P6Ze2A0/kpivgmtKwm84xxzdR3urcWQ94VIJsuBFWO767cHYYOsT/jE
	qJ9CeFkIQDtJTuZxuJYjHXvt73/JbDInGuLnusbv1okrKkhkXDxGO+LuSwqS+8cZrW6O
	sj64lMA24aL3qpIp09MptbX+YbJ7sOdbwz5/VHCIvOIirjwc55FR39pnyEywpW2xLr+f
	FgQVIeUutHbJW5vIgzfETy0J0ksZSR6eyVQ3DbHYohJvSvo3xVAeCxcryhhlOSKKMBLB
	5IBTZrlCyvzdj36A+cViQzbM9w7O4On0R1MOsrncMSm/8r0r7XJ1T6AVbp22WI1CO3nU
	C9hw==
X-Gm-Message-State: AKwxyte1cN5Sjeql8ZyRzQbnrgOhhchFaWbVemCRJ2hlYscLbPTIVaCK
	yeTNyBvR9smM6BcAlv7GSFTctZwY
X-Google-Smtp-Source: AH8x226hoaPTn/bbibPMOO8GQMYX1vTudUiexQX/uly75xvRkxLTGySR1oskL1AABfYNPneYDb4fAw==
X-Received: by 2002:a17:902:6d09:: with SMTP id
	s9-v6mr26697264plk.176.1517345337389; 
	Tue, 30 Jan 2018 12:48:57 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:4c3e:ac59:6e73:b998?
	([2601:646:8880:466c:4c3e:ac59:6e73:b998])
	by smtp.gmail.com with ESMTPSA id d5sm45414912pfk.2.2018.01.30.12.48.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:48:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
Date: Tue, 30 Jan 2018 12:48:56 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180130121432.508-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] recipes: use oe.utils.conditional instead of deprecated base_conditional
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
X-List-Received-Date: Tue, 30 Jan 2018 20:48:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Martin

I wonder if we can use overrides logic to achieve the same effect here.

On 1/30/18 4:14 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc-utils.inc        | 2 +-
>  meta-networking/recipes-connectivity/samba/samba_4.7.0.bb    | 2 +-
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
>  meta-oe/recipes-devtools/php/php.inc                         | 2 +-
>  meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 4 ++--
>  meta-oe/recipes-kernel/linux/linux.inc                       | 2 +-
>  meta-oe/recipes-support/mongodb/mongodb_git.bb               | 2 +-
>  meta-oe/recipes-support/opencv/opencv_3.3.bb                 | 4 ++--
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc              | 4 ++--
>  meta-webserver/recipes-httpd/nginx/nginx.inc                 | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> index 9014f5267f..7df33d64e4 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> @@ -48,7 +48,7 @@ do_install() {
>      ln -s gzip ${D}${base_bindir}/zcat
>  }
>  
> -EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
> +EXTRA_KLIBC_DEPS = "${@oe.utils.conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
>  
>  PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
>  
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> index f33c1384bf..686998e5ef 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> @@ -119,7 +119,7 @@ EXTRA_OECONF += "--enable-fhs \
>                   --disable-rpath-install \
>                   --with-shared-modules=${SAMBA4_MODULES} \
>                   --bundled-libraries=${SAMBA4_LIBS} \
> -                 ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
> +                 ${@oe.utils.conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
>                   --with-cluster-support \
>                   --with-profiling-data \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 3c05874690..29cd6b3bf4 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
>                  --with-defaults \
>                  --with-install-prefix=${D} \
>                  --with-persistent-directory=${localstatedir}/lib/net-snmp \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
>  "
>  
>  # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index e466cdaf61..8394c4f647 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> index cbf04734e1..0f798d2334 100644
> --- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> @@ -20,8 +20,8 @@ S = "${WORKDIR}/git"
>  inherit cmake
>  
>  EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
> -                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
> -                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
> +                 ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
> +                 ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>                  "
>  
>  LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-kernel/linux/linux.inc
> index e200127718..9f14370cd8 100644
> --- a/meta-oe/recipes-kernel/linux/linux.inc
> +++ b/meta-oe/recipes-kernel/linux/linux.inc
> @@ -16,7 +16,7 @@ CMDLINE_DEBUG ?= "loglevel=3"
>  
>  # Kernel bootlogo is distro-specific (default is OE logo).
>  # Logo resolution (qvga, vga, ...) is machine-specific.
> -LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
> +LOGO_SIZE ?= '${@oe.utils.conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
>  # To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
>  # to your kernel recipe, and then structure your logos for each resolution
>  # accordingly.
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index 0ff7d0b59f..8acbf071b4 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -58,7 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
>                   --use-system-zlib \
>                   --js-engine=none \
>                   --nostrip \
> -                 --endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
> +                 --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
>                   ${PACKAGECONFIG_CONFARGS} \
>                   mongod mongos"
>  
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> index 3663d30e92..ca62de7c8f 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> @@ -82,8 +82,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
> -    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
> -    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
> +    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
> +    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>  "
>  EXTRA_OECMAKE_append_x86 = " -DX86=ON"
>  
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index f1bf9b06f6..771cdb1969 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -41,7 +41,7 @@ EXTRA_OECONF = " \
>  "
>  
>  CONFIG_TLS = "--enable-thread-tls"
> -CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
> +CONFIG_TLS_arm = "${@oe.utils.conditional( "DEBUG_BUILD", "1", " --disable-thread-tls", " --enable-thread-tls", d )}"
>  
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
> @@ -101,7 +101,7 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
>  
>  # syslog initscript is handled explicitly because order of
>  # update-rc.d and update-alternatives is important
> -RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
> +RDEPENDS_${PN} += " ${@oe.utils.conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
>  
>  RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
>  
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 51523b606f..e6ae52a09f 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -51,7 +51,7 @@ do_configure () {
>  
>      ./configure \
>      --crossbuild=Linux:${TUNE_ARCH} \
> -    --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
> +    --with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
>      --with-int=4 \
>      --with-long=${PTRSIZE} \
>      --with-long-long=8 \
> 


