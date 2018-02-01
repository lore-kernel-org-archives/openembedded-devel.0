Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C922078743
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 16:36:19 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id a43so12104749wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 08:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sRFMXEAhEccg79xNKByWRV9F5lTOmy1J48hllcrZ5ME=;
	b=G8C0n3tHiFGzTbb1/sMb4xz7+/1Wk3hJa1k6+rAG/FT5kFn7wHtpdU8MzBzO3sQJ8P
	lSfsgfXn3w/zsMKHw2HpqvUO4ytvbEukSMvjMF27AfPPRCqLYM1h3mVwxt5P98n+Gp3T
	bB1k4ZPmoIo5GBL7WvIEMoEk4ZIo0T0akeusv7ArBhk8D4DWPH4Vbnm7bdIaWYx1OiSj
	tco5fNEnxvKE5QVYP/ZYNV9ehy0fhtsrM1Z85IhB3a7/t3aPqtc2lxkq/hjK34W7k3PY
	BtT794GYRRj95fhMriBvteyKMVNL0JamjRdntHk+g7ndCU/UVZvRK8RGFVZ76v81rq2k
	0MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sRFMXEAhEccg79xNKByWRV9F5lTOmy1J48hllcrZ5ME=;
	b=WCAIYpJh6u2DUWI+/6+Pceq9Re6CSq1ljokXOGjKMaMkhKTHu003ZNjAB+S9lwQz45
	vbLocmNL3PtXxd+ecK2E5cwMgJ2ncRGw5iUG3xydVVMXZSLCdNGYHX8sZqhNX7tj5NBR
	jk1jDHnNV667q4fS04evSwRo0qk6HHaDb2vhm+eF/4WcWXuBtMCNHMAx05LfcP9HKTnf
	6xljB8KzINPEq/UKhpVs0P1d5la9ZN7KIDR4U2IwrZ+cFDyc4fVpL0Zy21lKBRKcUcDO
	380rfzV3Kf59PpySjeg4tqKlvkjTQvkwGKnWrdSGStbyB7iJqAkn/lK3331Up+k5+vzx
	LMlw==
X-Gm-Message-State: AKwxytcpqA/nShVBhIIl7pOFyAokmY79HSjJQcsXYb5sBF0r2UIqJA9e
	+s5BlGvXhjtWZNs8fV0DPU5z96J3pGU7/ehB5Ls=
X-Google-Smtp-Source: AH8x227S9iRLLKs0+m9d2radwYoJTxiEmsIDPbpCN10GEma+/bjQk//dkw+ygKkCFWMXQO0okmq5G4gsSXHNHFJVn3Q=
X-Received: by 10.223.195.78 with SMTP id e14mr29607329wrg.68.1517502980485;
	Thu, 01 Feb 2018 08:36:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Feb 2018 08:36:19 -0800 (PST)
In-Reply-To: <20180201163029.260617-1-joe.slater@windriver.com>
References: <20180201163029.260617-1-joe.slater@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Feb 2018 17:36:19 +0100
Message-ID: <CA+chaQe2nzYBBugMufV+TGOyu15d0DUvMMabVsVMoe5ZNGD9kA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] meta-openembedded: eliminate base_conditional use
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
X-List-Received-Date: Thu, 01 Feb 2018 16:36:20 -0000
Content-Type: text/plain; charset="UTF-8"

this is 3rd review for the same on the ML, I've already merged the 1st one
about an hour ago.

On Thu, Feb 1, 2018 at 5:30 PM, Joe Slater <joe.slater@windriver.com> wrote:

> Use the underlying oe.utils.conditional.  base_conditional
> has gone away.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.7.0.bb    | 2 +-
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
>  meta-oe/recipes-devtools/php/php.inc                         | 2 +-
>  meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 4 ++--
>  meta-oe/recipes-support/mongodb/mongodb_git.bb               | 2 +-
>  meta-oe/recipes-support/opencv/opencv_3.3.bb                 | 4 ++--
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc              | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> index f33c138..686998e 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> @@ -119,7 +119,7 @@ EXTRA_OECONF += "--enable-fhs \
>                   --disable-rpath-install \
>                   --with-shared-modules=${SAMBA4_MODULES} \
>                   --bundled-libraries=${SAMBA4_LIBS} \
> -                 ${@base_conditional('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
> +                 ${@oe.utils.conditional('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
>                   --with-cluster-support \
>                   --with-profiling-data \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 3c05874..29cd6b3 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
>                  --with-defaults \
>                  --with-install-prefix=${D} \
>                  --with-persistent-directory=${localstatedir}/lib/net-snmp
> \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
>  "
>
>  # net-snmp needs to have mib-modules=smux enabled to enable quagga to
> support snmp
> diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> index e466cda..8394c4f 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
> \
> -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '',
> 'ac_cv_lib_pam_pam_start=no', d)} \
>                  ${COMMON_EXTRA_OECONF} \
>  "
> diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> index cbf0473..0f798d2 100644
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
> +                 ${@oe.utils.conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> +                 ${@oe.utils.conditional("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
>                  "
>
>  LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd ', '', d)}"
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index 0ff7d0b..8acbf07 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -58,7 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
>                   --use-system-zlib \
>                   --js-engine=none \
>                   --nostrip \
> -                 --endian=${@base_conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
> +                 --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
>                   ${PACKAGECONFIG_CONFARGS} \
>                   mongod mongos"
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> index 3663d30..ca62de7 100644
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
> +    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64",
> "", d)} \
> +    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32",
> "", d)} \
>  "
>  EXTRA_OECMAKE_append_x86 = " -DX86=ON"
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index f1bf9b0..771cdb1 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -41,7 +41,7 @@ EXTRA_OECONF = " \
>  "
>
>  CONFIG_TLS = "--enable-thread-tls"
> -CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", "
> --disable-thread-tls", " --enable-thread-tls", d )}"
> +CONFIG_TLS_arm = "${@oe.utils.conditional( "DEBUG_BUILD", "1", "
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
> +RDEPENDS_${PN} += " ${@oe.utils.conditional("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
>
>  RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

