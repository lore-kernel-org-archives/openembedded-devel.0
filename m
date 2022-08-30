Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD916C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.8932.1661843664966213618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bt0MHtqM;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id v4so9876178pgi.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gUcmsT7l7rg2Nnwb9rJEPuNmiojtkcyeBtliB9F0iHI=;
        b=Bt0MHtqM4aHPc0KbLqeBQmMiZ9v/yQlGVI8ViIHVSchwfIClspmzoKVue6PYDtZ+7v
         ms2iVDsA2rE5+jBw6XQRyuvXfopI9Y63s6uGZpeB8Gp9QPjHTneb0qmXGLhgXcy1/fgX
         LnZEMUWuEZPXnFzUIEbHF9IxBb4YEwnbFHy/j4WFOifcJMSNfhTXAjcXUASXFmuk17lS
         4PbG135nYAwfH+KfoNIwaDsCzcQmZcsBf8H5Ie4g0q0+seFrzOO2oWmRBBANAL/pSxtF
         ZLGUFGCC5zrz12s3QdA/4b/ePX5AjEwf4UO9tWPYKWmQfu51G2Olu+jFfknY5tIe4ZJZ
         xRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gUcmsT7l7rg2Nnwb9rJEPuNmiojtkcyeBtliB9F0iHI=;
        b=kBz1n269Qh5k0QC3K2Sz4vQfv/cGM+D4MaZJXCk6wihla8hinY3+CbqmOOOidvuSxA
         3MwVzmwHR++Ocbv/oPWK8hyryYSKQsd5Vj+p0Vxl0f7UNkfjqaKcojRXUnNz8yN7qpee
         1eaXvtbD3sG98cmRyF+odfERtsSE/TWkRu2ot83EHCKQ6/ay+8AI8nJI0EMRTSRDX8fq
         dZ91zU/usqZX83xyQeNS/9ei2miGJEB4SsfBcQZafX3A5YKGw6Npu3M91IukS5iN37M8
         6oXmTkHD0cO8auTjxTu7LQgGEgnlNAAkeyF+ppNZuXiGBdiIpsdRNdtDa0CSSqQl1kgb
         lq9A==
X-Gm-Message-State: ACgBeo1M87n8y79//zKBs7bz2JihFWZ0bSvcu34HueCLC5um9ujohFPa
	8ud59LWfIr1A4lXrzKxpSAziU9tqf7+xnQ==
X-Google-Smtp-Source: 
 AA6agR4//FLCFSBnONUXqUJbeUvI3U5vib7xQGkBr2z68sGmoWwS5KNXYO7z/CcdnT4gsDs9T1GROw==
X-Received: by 2002:a05:6a00:1650:b0:52f:20d6:e858 with SMTP id
 m16-20020a056a00165000b0052f20d6e858mr19976216pfc.36.1661843664083;
        Tue, 30 Aug 2022 00:14:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/21] ypbind-mt: Upgrade to 2.7.2
Date: Tue, 30 Aug 2022 00:14:02 -0700
Message-Id: <20220830071413.3887189-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98547

Disable on musl since its using some non-portable glibc only constructs
Drop gettid patch its applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure-time-check-for-gettid-API.patch | 45 -------------------
 .../{ypbind-mt_2.6.bb => ypbind-mt_2.7.2.bb}  |  8 ++--
 2 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch
 rename meta-networking/recipes-support/nis/{ypbind-mt_2.6.bb => ypbind-mt_2.7.2.bb} (90%)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch b/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch
deleted file mode 100644
index 9484d0b007..0000000000
--- a/meta-networking/recipes-support/nis/ypbind-mt/0001-Add-configure-time-check-for-gettid-API.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 25d5daf30aa2dc451ba528712f668036d8506054 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 07:50:26 -0700
-Subject: [PATCH] Add configure time check for gettid API
-
-glibc 2.30 has added this syscalls wrapper
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac  | 1 +
- src/log_msg.c | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 9e32a4a..6d1067b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,6 +33,7 @@ if test -n "$TIRPC_LIBS"; then
-   AC_DEFINE(HAVE_TIRPC, 1, [Define to 1 if TIRPC is available])
- fi
- 
-+AC_CHECK_FUNCS(gettid)
- dnl The difficult part: could we reconfigure NSS or must we use DNS ?
- AC_CHECK_FUNCS(__nss_configure_lookup)
- if eval "test \"`echo '$ac_cv_func___nss_configure_lookup'`\" != yes"; then
-diff --git a/src/log_msg.c b/src/log_msg.c
-index 49f0905..37da311 100644
---- a/src/log_msg.c
-+++ b/src/log_msg.c
-@@ -26,6 +26,7 @@
- #include "log_msg.h"
- 
- #include <sys/syscall.h>
-+#if !HAVE_GETTID
- #ifdef __NR_gettid
- static pid_t
- gettid (void)
-@@ -39,6 +40,7 @@ gettid (void)
-     return getpid ();
- }
- #endif
-+#endif
- 
- int debug_flag = 0;
- int logfile_flag = 0;
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
similarity index 90%
rename from meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
rename to meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
index 2c5e2bd939..a95062bc8b 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.6.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
@@ -29,13 +29,11 @@ RDEPENDS:${PN} += "yp-tools"
 PROVIDES += "ypbind"
 
 SRC_URI = "https://github.com/thkukuk/ypbind-mt/releases/download/v${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-dns_hosts-Fix-build-with-musl.patch \
            file://ypbind.init \
            file://ypbind.service \
-           file://0001-dns_hosts-Fix-build-with-musl.patch \
-           file://0001-Add-configure-time-check-for-gettid-API.patch \
            "
-SRC_URI[md5sum] = "7cf89641fdc128d0919207e4b7caaf1d"
-SRC_URI[sha256sum] = "0696c0263c4fd48a4ff2ce6c109f05f37aab0f71646d81cb22c7c28591bf80eb"
+SRC_URI[sha256sum] = "064f2f185673c5493df83f6400b799f3a359de56118b6ba37c4327111f2fcd8b"
 
 inherit systemd update-rc.d
 
@@ -57,6 +55,8 @@ do_install:append () {
     install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
 }
 
+# uses glibc internal APIs e.g. _hostalias
+COMPATIBLE_HOST:libc-musl = "null"
 
 RPROVIDES:${PN} += "${PN}-systemd"
 RREPLACES:${PN} += "${PN}-systemd"
-- 
2.37.2


