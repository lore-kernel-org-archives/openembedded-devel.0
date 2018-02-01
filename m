Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 23BE878685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:51:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 141so5795985wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LzcOQc65t/o2bESr0oJgbfmPvEz0DQrhIIkSHbW8r78=;
	b=MrzmebNVTBcbwKoTpEcrDGW0jFVXuzQxvxq9H13Fincq26S0zXWjDKVcRLHkwnmfVl
	ld0r9aD/32yiMcvSuzXSbsVYJ/F6gGlx2wkbH8N17AG3WsSbnKUjbIbnZhQ90zhPtsH+
	CzEUdJgTztR+JKUjEbVlq+u/sXOJ8SYn/N8tW5FKtq4RnKiolKVusLcHW+tbCVxJejo+
	IfnNAZmCuDv5fqhEEEBCNYCnfiMxIoeuqbdZ5rhPZ+yxsxkGKKMLf8nkC+32YE+Ljgvd
	2GrUGjEkofCi59IQlB9V69slDchFAD9OWcU6DMyfEaFwofwRE6021AD/dqr6rPqcg4uF
	N/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LzcOQc65t/o2bESr0oJgbfmPvEz0DQrhIIkSHbW8r78=;
	b=SRDsfe7MlAyG/ZGw+70Z3NBLT8xlv9QNQlFhUxmsanab30w7s+/FlCyBJXG1tT3Inc
	rGyfOjnokO7yQrBeLNH3TqxtYFk+BQQFwJxvNgcFa6xwpGhjlBzarkA6J2OPPeaxLs43
	Or+fWAYYi2Ti426bqs/d77pjR5JKDBpjbkWZ5QFUkld4xUr0eXoj+Etv+7f9igOl6jl+
	T2Nu3y6Ri0Y0wiYN7j3y8RFxuGDs5H7HafMC3Clh//d4SxyN3+Kz2BFo13BhrVwpPW7z
	Im4OpLJmJxq/NtMmuSk6jI7x6IWTZTMZzdhcKwtE7+cBlk2TuyUP8roEfnuw7mDGqsVX
	w/sg==
X-Gm-Message-State: AKwxytc14vvEAsa02U9Il238ElypTYLZNyui/q5WVVorAduZiSHsNB77
	leIN5pB+04lEh+MowtffHTemhr9Wv9g3MbghXpg=
X-Google-Smtp-Source: AH8x225dvtkD526EPdCFkX9z+8VasAfTJfj3NN9oBiIzLVanjfVwB3+2JKH/mEKwPHPWyEiKBLg/qLHd0Aa4RBLFvxE=
X-Received: by 10.28.191.131 with SMTP id o3mr21976054wmi.81.1517493063503;
	Thu, 01 Feb 2018 05:51:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Feb 2018 05:51:02 -0800 (PST)
In-Reply-To: <ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
References: <20180130121432.508-1-Martin.Jansa@gmail.com>
	<ec48cca7-f05b-826c-e3a5-a23ccdc9d7dd@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Feb 2018 14:51:02 +0100
Message-ID: <CA+chaQcCkNLS49AeBALYKyiW+_Q_kAgtjqfKE+Orz-mWGMyE+w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 01 Feb 2018 13:51:03 -0000
Content-Type: text/plain; charset="UTF-8"

I've merged it now to unblock people doing the builds as discussed on
meta-oe github and also meta-raspberrypi github.

Khem, I'm not sure which instance of this you were referring to, maybe the
TARGET_ARCH one in samba? Feel free to send follow up change for that one.

On Tue, Jan 30, 2018 at 9:48 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Martin
>
> I wonder if we can use overrides logic to achieve the same effect here.
>
> On 1/30/18 4:14 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-initramfs/recipes-devtools/klibc/klibc-utils.inc        | 2 +-
> >  meta-networking/recipes-connectivity/samba/samba_4.7.0.bb    | 2 +-
> >  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
> >  meta-oe/recipes-devtools/php/php.inc                         | 2 +-
> >  meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb    | 4 ++--
> >  meta-oe/recipes-kernel/linux/linux.inc                       | 2 +-
> >  meta-oe/recipes-support/mongodb/mongodb_git.bb               | 2 +-
> >  meta-oe/recipes-support/opencv/opencv_3.3.bb                 | 4 ++--
> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc              | 4 ++--
> >  meta-webserver/recipes-httpd/nginx/nginx.inc                 | 2 +-
> >  10 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> > index 9014f5267f..7df33d64e4 100644
> > --- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> > +++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> > @@ -48,7 +48,7 @@ do_install() {
> >      ln -s gzip ${D}${base_bindir}/zcat
> >  }
> >
> > -EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT',
> 'shared', '${THIS_LIBKLIBC}', '', d)}"
> > +EXTRA_KLIBC_DEPS = "${@oe.utils.conditional('KLIBC_UTILS_VARIANT',
> 'shared', '${THIS_LIBKLIBC}', '', d)}"
> >
> >  PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> > index f33c1384bf..686998e5ef 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
> > @@ -119,7 +119,7 @@ EXTRA_OECONF += "--enable-fhs \
> >                   --disable-rpath-install \
> >                   --with-shared-modules=${SAMBA4_MODULES} \
> >                   --bundled-libraries=${SAMBA4_LIBS} \
> > -                 ${@base_conditional('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
> > +                 ${@oe.utils.conditional('TARGET_ARCH', 'x86_64', '',
> '--disable-glusterfs', d)} \
> >                   --with-cluster-support \
> >                   --with-profiling-data \
> >                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
> > diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.
> 7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > index 3c05874690..29cd6b3bf4 100644
> > --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> > @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-shared \
> >                  --with-defaults \
> >                  --with-install-prefix=${D} \
> >                  --with-persistent-directory=${localstatedir}/lib/net-snmp
> \
> > -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
> > +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)} \
> >  "
> >
> >  # net-snmp needs to have mib-modules=smux enabled to enable quagga to
> support snmp
> > diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> > index e466cdaf61..8394c4f647 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -60,7 +60,7 @@ EXTRA_OECONF = "--enable-mbstring \
> >                  --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
> >                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
> >                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
> \
> > -                ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> > +                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',
> 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> >                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '',
> 'ac_cv_lib_pam_pam_start=no', d)} \
> >                  ${COMMON_EXTRA_OECONF} \
> >  "
> > diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> > index cbf04734e1..0f798d2334 100644
> > --- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> > +++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
> > @@ -20,8 +20,8 @@ S = "${WORKDIR}/git"
> >  inherit cmake
> >
> >  EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
> > -                 ${@base_conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> > -                 ${@base_conditional("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
> > +                 ${@oe.utils.conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> > +                 ${@oe.utils.conditional("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
> >                  "
> >
> >  LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> > diff --git a/meta-oe/recipes-kernel/linux/linux.inc
> b/meta-oe/recipes-kernel/linux/linux.inc
> > index e200127718..9f14370cd8 100644
> > --- a/meta-oe/recipes-kernel/linux/linux.inc
> > +++ b/meta-oe/recipes-kernel/linux/linux.inc
> > @@ -16,7 +16,7 @@ CMDLINE_DEBUG ?= "loglevel=3"
> >
> >  # Kernel bootlogo is distro-specific (default is OE logo).
> >  # Logo resolution (qvga, vga, ...) is machine-specific.
> > -LOGO_SIZE ?= '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen",
> "vga", "qvga", d)}'
> > +LOGO_SIZE ?= '${@oe.utils.conditional("MACHINE_GUI_CLASS",
> "bigscreen", "vga", "qvga", d)}'
> >  # To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or
> similar
> >  # to your kernel recipe, and then structure your logos for each
> resolution
> >  # accordingly.
> > diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > index 0ff7d0b59f..8acbf071b4 100644
> > --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > @@ -58,7 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
> >                   --use-system-zlib \
> >                   --js-engine=none \
> >                   --nostrip \
> > -                 --endian=${@base_conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
> > +                 --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
> >                   ${PACKAGECONFIG_CONFARGS} \
> >                   mongod mongos"
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > index 3663d30e92..ca62de7c8f 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> > @@ -82,8 +82,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules
> \
> >      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
> >      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)}
> \
> >      ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1
> -DENABLE_SSE42=1", "", d)} \
> > -    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "",
> d)} \
> > -    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "",
> d)} \
> > +    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64",
> "", d)} \
> > +    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32",
> "", d)} \
> >  "
> >  EXTRA_OECMAKE_append_x86 = " -DX86=ON"
> >
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > index f1bf9b06f6..771cdb1969 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -41,7 +41,7 @@ EXTRA_OECONF = " \
> >  "
> >
> >  CONFIG_TLS = "--enable-thread-tls"
> > -CONFIG_TLS_arm = "${@base_conditional( "DEBUG_BUILD", "1", "
> --disable-thread-tls", " --enable-thread-tls", d )}"
> > +CONFIG_TLS_arm = "${@oe.utils.conditional( "DEBUG_BUILD", "1", "
> --disable-thread-tls", " --enable-thread-tls", d )}"
> >
> >  PACKAGECONFIG ??= " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
> > @@ -101,7 +101,7 @@ CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf
> ${sysconfdir}/scl.conf"
> >
> >  # syslog initscript is handled explicitly because order of
> >  # update-rc.d and update-alternatives is important
> > -RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
> > +RDEPENDS_${PN} += " ${@oe.utils.conditional("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
> >
> >  RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > index 51523b606f..e6ae52a09f 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -51,7 +51,7 @@ do_configure () {
> >
> >      ./configure \
> >      --crossbuild=Linux:${TUNE_ARCH} \
> > -    --with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'little', 'big', d)} \
> > +    --with-endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',
> 'little', 'big', d)} \
> >      --with-int=4 \
> >      --with-long=${PTRSIZE} \
> >      --with-long-long=8 \
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

