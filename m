Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3911FC7EE2C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.2451.1685081972121730777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SiFHgyu/;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2532c2c419dso404142a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081971; x=1687673971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgswhvnnDUfPBAabvh4gISTM7KI1x8kniiE8I77/598=;
        b=SiFHgyu/mp0FWMl2u86oMdFQ1a9kEEhs3wfwyXquMKDchDMWha2DVamXvibmRa1L9u
         Os3qbVNbbMRmAUzcVUHQ0UPObJO7EfjeBcMuAMdhsRgGdaQSh7ndGN/AQT+97v/sZ/br
         Xg16X0PNYDjuNzulPVsf2jud5wfr2NoWmyIxIdPelD0amxiDmWI2c0zdkn2gghcqK6Mv
         iaRm3OPuz0sd0KjzvX7eza3wADG/G7yO40Hpbmg4vviBam/MCxllG8CELB0HzSwnpOaf
         q4f/i2+YaiTNZ8l0kk51Il8qDnduhSl8fXeqjiO7v3JvnE0KxFq+1qdQA/PXZt2FyovV
         CBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081971; x=1687673971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgswhvnnDUfPBAabvh4gISTM7KI1x8kniiE8I77/598=;
        b=TIZwsvu7kpx1jnZtQXgzv7k0hy0tNAEbqAWYlHSmrU+qcOmlHsvif+gMKktmdcw/cF
         tww6tXWi9rkECUzvwYiJJ9G5LiNgylsbjRFCT3Z++DDfspczMu5m46uWkR1B7c3++xIO
         E7wRcjk08vFBW2zUK9ecopY2/9LRd18sCGxJ4sRD/QndfSIY7gDZEWl5MEh/iEhgqSWn
         CjyQe+cntDpJoIWOsdNdSHYIsCOigNl3Y6IgF/8gV14nfBDX7Ttl8RhthXuOv2d/dfSg
         zhIl9CbeuOuqHoTH4MVJFfYvgoD82FhvSuS0XWgch3mbXZ+z0XaJdZ86U4jRSCqga3AS
         h68w==
X-Gm-Message-State: AC+VfDwbRzrOhNscCz8E4XUbhq27qNeK2tDlCW5Bej+6eDIYFqkfucCJ
	/1lnjE/h39TKQIi8GkDpZENpJl0SKuY=
X-Google-Smtp-Source: ACHHUZ52mLs1KjScKvlVVJsPpL0vMUsM3Qu64O3w961B7bLrI0dgDVLvXHKy7nWCwNoHxj8il2H7Pw==
X-Received: by 2002:a17:90a:7481:b0:255:d42a:5463 with SMTP id p1-20020a17090a748100b00255d42a5463mr1292667pjk.33.1685081970867;
        Thu, 25 May 2023 23:19:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] ipmiutil: Upgrade to 3.1.9
Date: Thu, 25 May 2023 23:19:24 -0700
Message-Id: <20230526061925.420351-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102868

Changes
03/12/2020 ARCress ipmiutil-3.1.6  changes (iver 3.16)
  util/iconfig.c          - fix Fedora bug 1811462 [abrt] ipmiutil config -a
  util/ipmiutil.c         - show version with usage in -h case
  scripts/ipmiutil.env.template - renamed env as template
			    (contributed by mwilliams<at>illuminate.solutions)
  scripts/Makefile.am     - renamed env as template
  scripts/checksel	  - also rm -f $ddir/sel.idx after isel -d
			    (contributed by eguzovsky<at>gmail.com)
  doc/Makefile.am     	  - change gzip -f to gzip -nf for man pages
			    (SR#40 patch from Jeremy Puhlman)

08/31/2020 ARCress ipmiutil-3.1.7  changes (iver 3.17)
  setup/*          - added Win msi setup files
  lib/lanplus/lanplus.c   - revert WIN IPv6 changes, add os_assert routine
  lib/lanplus/lanplus_crypt.c - switch assert to os_assert/return
  lib/lanplus/lanplus_crypt_implc.c - switch assert to os_assert
  util/ipmidir.h	  - AMD_SMB_1_STATUS_* 1< to 1<<  (SF_SR#41)
  util/isel.c             - fix compile warning
  util/ilan.c             - fix compile warning
  configure.ac   - add --enable-doc option to allow not building documentation
  		     contributed by Fabrice Fontaine (ffontaine)
  util/isensor.c  - add SDR conflict 0xC5 handling retries with delay
   		     contributed by albertlav

11/15/2021 ARCress ipmiutil-3.1.8  changes (iver 3.18)
  libeay32.dll - updated for Windows 64 lanplus
  ssleay32.dll - updated for Windows 64 lanplus
  util/oem_supermicro.c - disable DIMM decoding from SMBIOS for SuperMicro (albertlav)
  util/ilan.c  - new -W option to limit lan settings
  util/ipmicmd.h - add VENDOR_MITAC
  util/subs.c    - add VENDOR_MITAC
  util/ipmilanplus.c - print reason if no lan2
  util/ipmilan2.c    - print reason if no lan2
  util/isensor.c  - never skip free_sdr_cache() SR#45
  configure.ac   - fix --disable-lanplus option to avoid random disables,
		   recognize openssl-3.0 for SSL flags

03/03/2023 ARCress ipmiutil-3.1.9  changes (iver 3.19)
  util/isensor.c - fix -i get_idx_range to show last idx in range
  util/igetevent.c - fix printf extra arg
  util/memif.c - SR56: try UEFI address 6d5a7000 if F0000 error
  configure.ac - Clang 16 fixes, resolve -Wimplicit-function-declaration issues
			 (Sam James sam@gentoo.org 11/16/2022)
  lib/lanplus/lanplus.h - resolve implicit os_assert declaration (Sam James)
  util/ireset.c  - SR58: remove is_romley case for ireset -D
  scripts/ipmiutil_wdt - SR43: changed $prog to $progn for Debian
  scripts/uninstall.vbs - SR53: add ; to fix path
  SR53 (Windows): install libeay32.dll, ssleay32.dll into ipmiutil path also
  util/ipmidir.c - ipmi_open_direct(char)
  util/mem_if.c  - UCHAR/int
  doc/ipmiutil.spec - enumerate ipmiutil.env, ipmiutil.env.template
  configure.ac  - add -Wlto-type-mismatch to cfwarn

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...imes-from-changing-resulting-gzip-md.patch | 25 -------------------
 .../ipmiutil/ipmiutil/fix_systemd_path.patch  | 25 ++++++++-----------
 .../{ipmiutil_3.1.5.bb => ipmiutil_3.1.9.bb}  |  4 +--
 3 files changed, 11 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
 rename meta-oe/recipes-kernel/ipmiutil/{ipmiutil_3.1.5.bb => ipmiutil_3.1.9.bb} (89%)

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
deleted file mode 100644
index 78c05ef32c..0000000000
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From da668e5bf1a721797361ab866d09913ee8e157c4 Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Sat, 22 Feb 2020 04:37:04 +0000
-Subject: [PATCH] Prevent access times from changing resulting gzip md5sum
-
-Upstream-Status: Pending
-https://github.com/ipmitool/ipmitool/pull/186
----
- doc/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index b792762..2c52ce6 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -59,5 +59,5 @@ install:
- 	${INSTALL_DATA_SH} iuser.8 	 ${manto}
- 	${INSTALL_DATA_SH} iseltime.8 	 ${manto}
- 	${INSTALL_DATA_SH} bmclanpet.mib ${datato}
--	cd ${manto}; gzip -f *.8
-+	cd ${manto}; gzip -nf *.8
- 	
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
index d47e086c46..2862793b05 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -6,11 +6,9 @@ Upstream-Status: Inappropriate [Embedded]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
-Index: ipmiutil-3.0.5/configure.ac
-===================================================================
---- ipmiutil-3.0.5.orig/configure.ac
-+++ ipmiutil-3.0.5/configure.ac
-@@ -149,7 +149,6 @@ CROSS_LFLAGS=""
+--- a/configure.ac
++++ b/configure.ac
+@@ -151,7 +151,6 @@ CROSS_LFLAGS=""
  CROSS_CFLAGS=""
  LIBSENSORS=""
  SAM2OBJ="isensor2.o ievents2.o"
@@ -18,7 +16,7 @@ Index: ipmiutil-3.0.5/configure.ac
  
  AC_ARG_ENABLE([useflags],
      [  --enable-useflags    include environment CFLAGS and LDFLAGS.],
-@@ -200,29 +199,42 @@ AC_ARG_ENABLE([gpl],
+@@ -211,29 +210,42 @@ AC_ARG_ENABLE([gpl],
  
  dnl Does this Linux have systemd enabled?  Otherwise use sysv init.
  AC_ARG_ENABLE([systemd],
@@ -83,7 +81,7 @@ Index: ipmiutil-3.0.5/configure.ac
  fi
  
  dnl start main logic
-@@ -528,7 +540,7 @@ AC_SUBST(INS_LIB)
+@@ -563,7 +575,7 @@ AC_SUBST(INS_LIB)
  AC_SUBST(SUBDIR_S)
  AC_SUBST(CROSS_CFLAGS)
  AC_SUBST(CROSS_LFLAGS)
@@ -92,10 +90,8 @@ Index: ipmiutil-3.0.5/configure.ac
  AC_SUBST(SHR_LINK)
  AC_SUBST(pkgconfigdir)
  
-Index: ipmiutil-3.0.5/scripts/Makefile.am
-===================================================================
---- ipmiutil-3.0.5.orig/scripts/Makefile.am
-+++ ipmiutil-3.0.5/scripts/Makefile.am
+--- a/scripts/Makefile.am
++++ b/scripts/Makefile.am
 @@ -17,7 +17,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
  sbinto = ${DESTDIR}${sbindir}
  varto  = ${DESTDIR}/var/lib/ipmiutil
@@ -106,7 +102,7 @@ Index: ipmiutil-3.0.5/scripts/Makefile.am
  sysvinit = ${datato}
  sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm iuser
  
-@@ -47,10 +48,14 @@ install:
+@@ -47,10 +48,13 @@ install:
  	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
  	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
  	${INSTALL_SCRIPT_SH} checksel     ${datato}
@@ -114,7 +110,6 @@ Index: ipmiutil-3.0.5/scripts/Makefile.am
 -	${INSTALL_DATA_SH} ipmiutil_asy.service ${sysdto}
 -	${INSTALL_DATA_SH} ipmiutil_evt.service ${sysdto}
 -	${INSTALL_DATA_SH} ipmi_port.service    ${sysdto}
-+	
 +	if [ ! -z "${systemddir}" ]; then \
 +		$(MKDIR) ${sysdto}; \
 +		${INSTALL_DATA_SH} ipmiutil_wdt.service ${sysdto}; \
@@ -122,6 +117,6 @@ Index: ipmiutil-3.0.5/scripts/Makefile.am
 +		${INSTALL_DATA_SH} ipmiutil_evt.service ${sysdto}; \
 +		${INSTALL_DATA_SH} ipmi_port.service    ${sysdto}; \
 +	fi
- 	${INSTALL_SCRIPT_SH} ipmiutil.env     ${datato}
+ 	${INSTALL_SCRIPT_SH} ipmiutil.env.template  ${datato}
+ 	${INSTALL_SCRIPT_SH} ipmiutil.env.template  ${datato}/ipmiutil.env
  	${INSTALL_SCRIPT_SH} ipmiutil.pre     ${datato}
- 	${INSTALL_SCRIPT_SH} ipmiutil.setup   ${datato}
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
similarity index 89%
rename from meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
index 64bcf5f764..daf084f399 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
@@ -21,11 +21,9 @@ PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
-           file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
            file://0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch \
           "
-SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
-SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"
+SRC_URI[sha256sum] = "5ae99bdd1296a8e25cea839784ec39ebca57b0e3701b2d440b8e02e22dc4bc95"
 
 inherit autotools-brokensep pkgconfig systemd
 
-- 
2.40.1


