Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.11360.1628094141094716309
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kS3u8qkb;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id a20so3620154plm.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jTmjR8aVAgHEk+mvRlT1VcTwdFw+loDrDI0YkaSBIlI=;
        b=kS3u8qkbaDjeaE2uxTwB0dNtSoZgD0O/i9TpI3CTCeUakILOFdRXOlrEe1PUZQVt2k
         oablly6a/09a0NC3bIM1Z9a2URg5mwSt/aB8AaMjPT8P74C26MCWXlb5dhkUM0lOKvDO
         yyW1osLt3ZEewNGmIT1hDA6kGd4tvBJteJdDNC4QLqxjECiO3zBr/Oc5am/qDMLZybj8
         Tnwh+6Uok7CuxVzvY9GYIsa2+H1V5PyiELkMhOVfrV71cJLafOK0CgHMAT7WumsY6NVq
         UJAVbCuLR1bD37LjHUH44T1ADt3SSvJ7rArF+xSyTYf/9Ky22lzyTVeA8xUbe3LJoDFn
         9aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jTmjR8aVAgHEk+mvRlT1VcTwdFw+loDrDI0YkaSBIlI=;
        b=QfEhe/RfvoE6meAZ7s5jT6dOo6NdmhpjctO+4vKYy2USmEMep7FWI+kAUhtF2orzt0
         rafjxhyYzGyh8ZvZi+f8cqcWsgZGAqhHc6p/8HPvDgXru/5WUu8NJmrt7E+Ug4iOmceR
         GTI+fVHhh998T1of3Q8d8kksjYoXcorVWmGL9pTZ1GTSKrigXF0ZbhMlu1M1DvuS5TNW
         c5nE527uFcJueQnn1CisNEehiXkyi4oYyGNMA4pTR122HoAPpGiCBbVpizGq1WldO70d
         3bSdqKaWZogXsVqMzYtObmqGSx6UlEzT5BcCXmF/roUFyjKRyErLzL32V2/CIcdxryS9
         P0xQ==
X-Gm-Message-State: AOAM532pm03x9UO3Jj1B7FnxW+yuzr/Em0LOw075wHhTeUfkg/opS1EO
	gkwfSInOmjqNzuGP/+y85fsEBC4NXm5jyQ==
X-Google-Smtp-Source: ABdhPJxawOtWl8g7uWeVMDo1ChrXhD33BdBmpqX47rOl030b8jrf4jBjMPvDziQT0JY+08DNsScY/w==
X-Received: by 2002:a05:6a00:1311:b029:3b2:87fe:a598 with SMTP id j17-20020a056a001311b02903b287fea598mr161303pfu.74.1628094140369;
        Wed, 04 Aug 2021 09:22:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id t6sm6577581pjo.4.2021.08.04.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 09:22:19 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 2/2 V2] audit: fix compile error for 2.8.5
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20210803065608.281061-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b552f4f2-767a-be4a-bcd4-02d0a666a895@gmail.com>
Date: Wed, 4 Aug 2021 09:22:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803065608.281061-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Can rebase it on latest master/master-next and resend please

On 8/2/21 11:56 PM, Yi Zhao wrote:
> * Backport a patch to fix the compile error.
> * Refresh the patches to fix the patch-fuzz warning.
> * Minor tweaks to the recipe with reference to 3.0 bb file.
> 
> Fixes:
> tmp/work/core2-64-poky-linux/audit/2.8.5-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/11.1.1/ld:
> ausearch-checkpt.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: multiple definition of `event_node_list';
> ausearch.o:/usr/src/debug/audit/2.8.5-r0/build/src/../../git/src/ausearch-common.h:53: first defined here
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...ue-functions-for-strndupa-rawmemchr.patch} |  6 +-
>   ...-Fixed-swig-host-contamination-issue.patch | 57 +++++++++++++++++++
>   ...ns-need-to-be-external-when-building.patch | 30 ++++++++++
>   meta-oe/recipes-security/audit/audit_2.8.5.bb | 36 ++++++------
>   4 files changed, 110 insertions(+), 19 deletions(-)
>   rename meta-oe/recipes-security/audit/audit/{Add-substitue-functions-for-strndupa-rawmemchr.patch => 0001-Add-substitue-functions-for-strndupa-rawmemchr.patch} (97%)
>   create mode 100644 meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
>   create mode 100644 meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> 
> diff --git a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> similarity index 97%
> rename from meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
> rename to meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> index bb6c61e80..ed1c0e2b5 100644
> --- a/meta-oe/recipes-security/audit/audit/Add-substitue-functions-for-strndupa-rawmemchr.patch
> +++ b/meta-oe/recipes-security/audit/audit/0001-Add-substitue-functions-for-strndupa-rawmemchr.patch
> @@ -1,4 +1,4 @@
> -From bdcdc3dff4469aac88e718bd15958d5ed4b9392a Mon Sep 17 00:00:00 2001
> +From d5a4b800a696b8b8d2c0f0bad098b1a8ff94333f Mon Sep 17 00:00:00 2001
>   From: Steve Grubb <sgrubb@redhat.com>
>   Date: Tue, 26 Feb 2019 18:33:33 -0500
>   Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
> @@ -68,7 +68,7 @@ index 51c4a5e..67b7b77 100644
>    				break;
>    			*ptr = ' ';
>   diff --git a/configure.ac b/configure.ac
> -index 54bdbf1..aef07fb 100644
> +index 6e345f1..6f3007e 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -1,7 +1,7 @@
> @@ -129,5 +129,5 @@ index 5d17a72..758c33e 100644
>     * This function will look at the line and pick out pieces of it.
>     */
>   --
> -2.7.4
> +2.17.1
>   
> diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
> new file mode 100644
> index 000000000..4a1b97997
> --- /dev/null
> +++ b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
> @@ -0,0 +1,57 @@
> +From 3467abce1f3cfc96f9bdace7c09d95218cbcaeb1 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Sun, 19 Jul 2015 02:42:58 +0900
> +Subject: [PATCH] audit: Fixed swig host contamination issue
> +
> +The audit build uses swig to generate a python wrapper.
> +Unfortunately, the swig info file references host include
> +directories.  Some of these were previously noticed and
> +eliminated, but the one fixed here was not.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + bindings/swig/python3/Makefile.am | 3 ++-
> + bindings/swig/src/auditswig.i     | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
> +index 9938418..fa46aac 100644
> +--- a/bindings/swig/python3/Makefile.am
> ++++ b/bindings/swig/python3/Makefile.am
> +@@ -22,6 +22,7 @@
> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
> + AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
> + AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
> ++STDINC ?= /usr/include
> + LIBS = $(top_builddir)/lib/libaudit.la
> + SWIG_FLAGS = -python -py3 -modern
> + SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
> +@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
> + _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
> + nodist__audit_la_SOURCES  = audit_wrap.c
> + audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i
> +-	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} ${srcdir}/../src/auditswig.i
> ++	swig -o audit_wrap.c ${SWIG_FLAGS} ${SWIG_INCLUDES} -I$(STDINC) ${srcdir}/../src/auditswig.i
> +
> + CLEANFILES = audit.py* audit_wrap.c *~
> +
> +diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
> +index 7ebb373..424fb68 100644
> +--- a/bindings/swig/src/auditswig.i
> ++++ b/bindings/swig/src/auditswig.i
> +@@ -39,7 +39,7 @@ signed
> + #define __attribute(X) /*nothing*/
> + typedef unsigned __u32;
> + typedef unsigned uid_t;
> +-%include "/usr/include/linux/audit.h"
> ++%include "linux/audit.h"
> + #define __extension__ /*nothing*/
> + #include <stdint.h>
> + %include "../lib/libaudit.h"
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> new file mode 100644
> index 000000000..f209e560b
> --- /dev/null
> +++ b/meta-oe/recipes-security/audit/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> @@ -0,0 +1,30 @@
> +From 2938f46d318df4a09565db837b60bafd0300f858 Mon Sep 17 00:00:00 2001
> +From: Steve Grubb <sgrubb@redhat.com>
> +Date: Fri, 10 Jan 2020 21:13:50 -0500
> +Subject: [PATCH] Header definitions need to be external when building with
> + -fno-common (which is default in GCC 10) - Tony Jones
> +
> +Upstream-Status: Backport
> +[https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f]
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/ausearch-common.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/ausearch-common.h b/src/ausearch-common.h
> +index 6669203..3040547 100644
> +--- a/src/ausearch-common.h
> ++++ b/src/ausearch-common.h
> +@@ -50,7 +50,7 @@ extern pid_t event_pid;
> + extern int event_exact_match;
> + extern uid_t event_uid, event_euid, event_loginuid;
> + extern const char *event_tuid, *event_teuid, *event_tauid;
> +-slist *event_node_list;
> ++extern slist *event_node_list;
> + extern const char *event_comm;
> + extern const char *event_filename;
> + extern const char *event_hostname;
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
> index ee3b3b5e0..4fc14a591 100644
> --- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
> +++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
> @@ -8,8 +8,9 @@ LICENSE = "GPLv2+ & LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintenance \
> -           file://Add-substitue-functions-for-strndupa-rawmemchr.patch \
> -           file://Fixed-swig-host-contamination-issue.patch \
> +           file://0001-Add-substitue-functions-for-strndupa-rawmemchr.patch \
> +           file://0002-Fixed-swig-host-contamination-issue.patch \
> +           file://0003-Header-definitions-need-to-be-external-when-building.patch \
>              file://auditd \
>              file://auditd.service \
>              file://audit-volatile.conf \
> @@ -27,9 +28,9 @@ INITSCRIPT_PARAMS = "defaults"
>   SYSTEMD_PACKAGES = "auditd"
>   SYSTEMD_SERVICE_auditd = "auditd.service"
>   
> -DEPENDS += "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
> +DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
>   
> -EXTRA_OECONF += "--without-prelude \
> +EXTRA_OECONF = "--without-prelude \
>           --with-libwrap \
>           --enable-gssapi-krb5=no \
>           --with-libcap-ng=yes \
> @@ -39,11 +40,11 @@ EXTRA_OECONF += "--without-prelude \
>           --without-python \
>           --without-golang \
>           --disable-zos-remote \
> +        --with-arm=yes \
> +        --with-aarch64=yes \
>           "
> -EXTRA_OECONF_append_arm = " --with-arm=yes"
> -EXTRA_OECONF_append_aarch64 = " --with-aarch64=yes"
>   
> -EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' \
> +EXTRA_OEMAKE = "PYLIBVER='python${PYTHON_BASEVERSION}' \
>   	PYINC='${STAGING_INCDIR}/$(PYLIBVER)' \
>   	pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
>   	STDINC='${STAGING_INCDIR}' \
> @@ -60,16 +61,16 @@ PACKAGES =+ "audispd-plugins"
>   PACKAGES += "auditd ${PN}-python"
>   
>   FILES_${PN} = "${sysconfdir}/libaudit.conf ${base_libdir}/libaudit.so.1* ${base_libdir}/libauparse.so.*"
> -FILES_auditd += "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
> -FILES_audispd-plugins += "${sysconfdir}/audisp/audisp-remote.conf \
> +FILES_auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/*"
> +FILES_audispd-plugins = "${sysconfdir}/audisp/audisp-remote.conf \
>   	${sysconfdir}/audisp/plugins.d/au-remote.conf \
> -	${sbindir}/audisp-remote ${localstatedir}/spool/audit \
> +	${base_sbindir}/audisp-remote ${localstatedir}/spool/audit \
>   	"
>   FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
>   FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
>   
> -CONFFILES_auditd += "${sysconfdir}/audit/audit.rules"
> -RDEPENDS_auditd += "bash"
> +CONFFILES_auditd = "${sysconfdir}/audit/audit.rules"
> +RDEPENDS_auditd = "bash"
>   
>   do_install_append() {
>   	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
> @@ -85,14 +86,14 @@ do_install_append() {
>   	rm -rf ${D}/etc/rc.d
>   
>   	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +		# install systemd unit files
> +		install -d ${D}${systemd_unitdir}/system
> +		install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
> +
>   		install -d ${D}${sysconfdir}/tmpfiles.d/
>   		install -m 0644 ${WORKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
>   	fi
>   
> -	# install systemd unit files
> -	install -d ${D}${systemd_unitdir}/system
> -	install -m 0644 ${WORKDIR}/auditd.service ${D}${systemd_unitdir}/system
> -
>   	# audit-2.5 doesn't install any rules by default, so we do that here
>   	mkdir -p ${D}/etc/audit ${D}/etc/audit/rules.d
>   	cp ${S}/rules/10-base-config.rules ${D}/etc/audit/rules.d/audit.rules
> @@ -102,4 +103,7 @@ do_install_append() {
>   
>   	# Based on the audit.spec "Copy default rules into place on new installation"
>   	cp ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
> +
> +	# Create /var/spool/audit directory for audisp-remote
> +	install -m 0700 -d ${D}${localstatedir}/spool/audit
>   }
> 
> 
> 
> 
> 
