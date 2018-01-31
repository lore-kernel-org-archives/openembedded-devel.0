Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99931787EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 15:37:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id i56so15449315wra.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PXZhkEKXaFfyClRx/YIbjyqWIH+U6B6Gs5Yt5QC/3Bc=;
	b=RhlVx/8uSyE+CEtI0fjELpajpVvgM038e3mM7celkwikVqgGaSSUe2uw+bxI4QBMJw
	K/GhkJCKo28XAJqt6DAwmXWg19Joa9bD5znUDlrucse2SXSHa+5Uz6m/2Rch1421BJQW
	1j/LlckJLkzIvgHRA4/dccjjUua6K5ukWrlmZHSJQd9P9M/zRS1NKo2Dzna/72F6e9dX
	J5vUOs6e4JndEWA/kF2uJoarKLSHG7gZTtXD28lzn20YnWIKTUr8GKeDLsDrV/vpTXHA
	gkC2xIZOw+v3mHf+HvqkQif3Nps7zSc+/1+LR4T5fhYe9GQAjwjkiyE2LQXPK14iTWlv
	HlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PXZhkEKXaFfyClRx/YIbjyqWIH+U6B6Gs5Yt5QC/3Bc=;
	b=SdTO0SzT6I3RTOZCJYWcM3qPIrcU+XcoMIrNcYxWwUYrHZgtXT8XzkcUVOwGNS2Uno
	vAIn+CBgZeRW1lRIib/DYVROVGL8Ns0N0EEmsFBi8ue85t+bUDzG1d9a8NA8bqRqBx5a
	jCu9gdJzZ0trnI6guDrY9YjDqybuTynhiwzTWUkU+2tWgQMKCHl3qDkKSaQUq/C8lDht
	fCSTGvJGj35n6UzxalysrRwJ5M6D/AT0ouHb4zFLT70SVqx8/ZVmP4n/tkTxpGREcNcg
	UPi1HdRUfa1bF2rtZpZoZAwxq/P/RMkXMEJnbwBcJSapX/82po2FCxyHDeFO/BK+Uhof
	jbxQ==
X-Gm-Message-State: AKwxytetyln17wZm79hvZ+4Mg5upuoa4cE5ZTp07vs/IxqrJYIanErif
	FjA7+AH3Yxw0g142+glySPYOqLkUyW5GKN8nhBQ=
X-Google-Smtp-Source: AH8x225UBPDE69LeTWzeOBYbsPudpL4cltngSjkHBR7UHqZB/u7leNhfzVaobqKIN6noJd0n+Bm1vrLoyh4J0FAjHgk=
X-Received: by 10.223.136.167 with SMTP id f36mr14202285wrf.200.1517413078215; 
	Wed, 31 Jan 2018 07:37:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 31 Jan 2018 07:37:57 -0800 (PST)
In-Reply-To: <20180131152754.25696-1-otavio@ossystems.com.br>
References: <20180131152754.25696-1-otavio@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 16:37:57 +0100
Message-ID: <CA+chaQdGSCfm2aNj+EXFy+unv4c+D7oBNmz3uWdHUFpjFO_DPg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [global meta-oe PATCH] Stop using base_conditional utility method
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
X-List-Received-Date: Wed, 31 Jan 2018 15:37:58 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW: I've sent the same change yesterday.

On Wed, Jan 31, 2018 at 4:27 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> OE-Core finally removed the base_conditional method and the recipes
> must move to bb.utils.contains instead. This patch does the change on
> all recipes from meta-openembedded so they are compatible with current
> OE-Core.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
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
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> index 9014f5267..85639e31c 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> @@ -48,7 +48,7 @@ do_install() {
>      ln -s gzip ${D}${base_bindir}/zcat
>  }
>
> -EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared',
> '${THIS_LIBKLIBC}', '', d)}"
> +EXTRA_KLIBC_DEPS = "${@bb.utils.contains('KLIBC_UTILS_VARIANT',
> 'shared', '${THIS_LIBKLIBC}', '', d)}"
>
>  PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> index f33c1384b..7f8cfcc47 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> @@ -119,7 +119,7 @@ EXTRA_OECONF += "--enable-fhs \
>                   --disable-rpath-install \
>                   --with-shared-modules=${SAMBA4_MODULES} \
>                   --bundled-libraries=${SAMBA4_LIBS} \
> -                 ${@base_conditional('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
> +                 ${@bb.utils.contains('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
>                   --with-cluster-support \
>                   --with-profiling-data \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 3c0587469..9b8452c9b 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
>                  --with-defaults \
>                  --with-install-prefix=${D} \
>                  --with-persistent-directory=${localstatedir}/lib/net-snmp
> \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
> +                ${@bb.utils.contains('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
>  "
>
>  # net-snmp needs to have mib-modules=smux enabled to enable quagga to
> support snmp
> diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> index e466cdaf6..e3b73daa4 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
> \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> +                ${@bb.utils.contains('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '',
> 'ac_cv_lib_pam_pam_start=no', d)} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> index cbf04734e..391d63c82 100644
> --- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> @@ -20,8 +20,8 @@ S = "${WORKDIR}/git"
>  inherit cmake
>
>  EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
> -                 ${@base_conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> -                 ${@base_conditional("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
> +                 ${@bb.utils.contains("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> +                 ${@bb.utils.contains("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
>                  "
>
>  LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd ', '', d)}"
> diff --git a/meta-oe/recipes-kernel/linux/linux.inc
> b/meta-oe/recipes-kernel/linux/linux.inc
> index e20012771..e39cfbbf5 100644
> --- a/meta-oe/recipes-kernel/linux/linux.inc
> +++ b/meta-oe/recipes-kernel/linux/linux.inc
> @@ -16,7 +16,7 @@ CMDLINE_DEBUG ?= "loglevel=3"
>
>  # Kernel bootlogo is distro-specific (default is OE logo).
>  # Logo resolution (qvga, vga, ...) is machine-specific.
> -LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen",
> "vga", "qvga", d)}'
> +LOGO_SIZE ?= '${@bb.utils.contains("MACHINE_GUI_CLASS", "bigscreen",
> "vga", "qvga", d)}'
>  # To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or
> similar
>  # to your kernel recipe, and then structure your logos for each resolution
>  # accordingly.
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index 0ff7d0b59..a9dd23435 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -58,7 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
>                   --use-system-zlib \
>                   --js-engine=none \
>                   --nostrip \
> -                 --endian=${@base_conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
> +                 --endian=${@bb.utils.contains('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
>                   ${PACKAGECONFIG_CONFARGS} \
>                   mongod mongos"
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> index 3663d30e9..08dd0bae0 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> @@ -82,8 +82,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules
> \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)}
> \
>      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1
> -DENABLE_SSE42=1", "", d)} \
> -    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "",
> d)} \
> -    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "",
> d)} \
> +    ${@bb.utils.contains("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "",
> d)} \
> +    ${@bb.utils.contains("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "",
> d)} \
>  "
>  EXTRA_OECMAKE_append_x86 = " -DX86=ON"
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index f1bf9b06f..3f4e2f25d 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -41,7 +41,7 @@ EXTRA_OECONF = " \
>  "
>
>  CONFIG_TLS = "--enable-thread-tls"
> -CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", "
> --disable-thread-tls", " --enable-thread-tls", d )}"
> +CONFIG_TLS_arm = "${@bb.utils.contains( "DEBUG_BUILD", "1", "
> --disable-thread-tls", " --enable-thread-tls", d )}"
>
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
> @@ -101,7 +101,7 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf
> ${sysconfdir}/scl.conf"
>
>  # syslog initscript is handled explicitly because order of
>  # update-rc.d and update-alternatives is important
> -RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
> +RDEPENDS_${PN} += " ${@bb.utils.contains("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
>
>  RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 51523b606..7a48d607a 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -51,7 +51,7 @@ do_configure () {
>
>      ./configure \
>      --crossbuild=Linux:${TUNE_ARCH} \
> -    --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'little', 'big', d)} \
> +    --with-endian=${@bb.utils.contains('SITEINFO_ENDIANNESS', 'le',
> 'little', 'big', d)} \
>      --with-int=4 \
>      --with-long=${PTRSIZE} \
>      --with-long-long=8 \
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

