Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23FFC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:34:37 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.12264.1647966877112991952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RkV4yW2u;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id g19so18590676pfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vx/AEPyWN1R6OMbU5xTMZL1RWjmsEk4mKoEJlUnw9NU=;
        b=RkV4yW2uRYYU3DWf+LbjIGtsk5x8xm4pQR9eWClFpZJ4Z6zib0iAz0ifplGCuITLDH
         h2FGI2IYUSPlBLYJH+wSBoUXRugNU+ZWZ8//5P+mfU1rMxsrl2Dt1Or54p/+Rrgkn8XP
         sAqtS1gwjF9tIVAYgt2VJrbSSgg28wFFaJvQbDKOT+9NPcI3MwBMNfWdlHtGbA0xexVC
         YW/LOQduFMTncmPztNLjXWPkeOyqzyzJ/yi8tfy9jBS6bPTsC5QOIDiL6RwZDQIGZ4c3
         Wby87cRMcdypJSJLANa/6iQMRIxUMxl/Q09VdxlgqNYp+eMK9RqhtnWQQDDQiPpKX3+h
         pFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vx/AEPyWN1R6OMbU5xTMZL1RWjmsEk4mKoEJlUnw9NU=;
        b=3+p4m4c2Ba4bnMq2fyv99v1BKu7SOozhoc+WQXXu/vDENaq3fXDteMqJgL9rVgvL/1
         EDMupVTSt4xULa5c8gLoflMwWLv6Wqa1BIi0YejlAkXCwoFZc04fY0Tm3vwq4EdQ1F3L
         C0Yf5/vS+pQpdEfoL3q+0d4H1fSGU6MnZZeTbVPVXIt4wIjQFmM3Tyfhmc73iJnHx9v4
         R91qXIDxOZ8r0EII276EL8rRg7zTVgjYadzdKEmbdRjS/0polqVsojGeT/ZKB89UaZk5
         J8pIQoGzd2spRe5lrU5vKlK2cAcABIZS7obMxIwNiuCfgbJwbWeijBCOyU4JjSt1L8b1
         K6Vw==
X-Gm-Message-State: AOAM530MMOxIsuLf3gsF+8RXJjveJ+VDN6xyL1g0WEo/ZvYV4ExrFL5x
	NNeKq7iyHbrESiibx2YPi1jrLKRX1XI0ow==
X-Google-Smtp-Source: 
 ABdhPJx5lYIa9z8LchSa5V7aA177AvmtL7gJo+TUZTrd6z+0BMkmSprLXMgNSsSXTQvAedGnvfrQSA==
X-Received: by 2002:a05:6a00:1381:b0:4fa:81ed:89a0 with SMTP id
 t1-20020a056a00138100b004fa81ed89a0mr17165030pfg.85.1647966876239;
        Tue, 22 Mar 2022 09:34:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm17739827pgr.37.2022.03.22.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 09:34:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libsquish: Fix build when libdir != 'lib'
Date: Tue, 22 Mar 2022 09:34:33 -0700
Message-Id: <20220322163433.2434414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 16:34:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96146

Fixes build when libdir is something like lib64 or lib32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Add-support-for-variable-libdir.patch | 70 +++++++++++++++++++
 .../libsquish/libsquish_git.bb                |  6 +-
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-Add-support-for-variable-libdir.patch

diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-Add-support-for-variable-libdir.patch b/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-Add-support-for-variable-libdir.patch
new file mode 100644
index 0000000000..a6a58688bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish/0001-Add-support-for-variable-libdir.patch
@@ -0,0 +1,70 @@
+From 20d14f323c877eca631f0a75efcf19727fb18dd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2022 09:17:06 -0700
+Subject: [PATCH] Add support for variable libdir
+
+sometimes libdir is not 'lib' in such cases set LIBDIR_SUFFIX to 32 or
+64 to append to it.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile     | 9 +++++----
+ config.in    | 2 ++
+ squish.pc.in | 3 ++-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1c01f89..768a4a7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,13 +10,13 @@ LIB = libsquish.a
+ all : $(LIB) squish.pc
+ 
+ install : $(LIB) squish.pc
+-	install squish.h $(INSTALL_DIR)/include 
+-	install libsquish.a $(INSTALL_DIR)/lib
+-	install squish.pc $(INSTALL_DIR)/lib/pkgconfig
++	install squish.h $(INSTALL_DIR)/include
++	install libsquish.a $(INSTALL_DIR)/lib$(LIBDIR_SUFFIX)
++	install squish.pc $(INSTALL_DIR)/lib$(LIBDIR_SUFFIX)/pkgconfig
+ 
+ uninstall:
+ 	$(RM) $(INSTALL_DIR)/include/squish.h
+-	$(RM) $(INSTALL_DIR)/lib/libsquish.a
++	$(RM) $(INSTALL_DIR)/lib$(LIBDIR_SUFFIX)/libsquish.a
+ 
+ $(LIB) : $(OBJ)
+ 	$(AR) cr $@ $?
+@@ -30,4 +30,5 @@ clean :
+ 
+ squish.pc:
+ 	sed 's|@PREFIX@|$(PREFIX)|' $@.in > $@
++	sed 's|@LIBDIR_SUFFIX@|$(LIBDIR_SUFFIX)|' $@.in > $@
+ 
+diff --git a/config.in b/config.in
+index fdca022..a6cf833 100644
+--- a/config.in
++++ b/config.in
+@@ -19,3 +19,5 @@ endif
+ 
+ # where should we install to
+ INSTALL_DIR ?= @PREFIX@
++# libdir is architecture specific
++LIBDIR_SUFFIX ?= @LIBDIR_SUFFIX@
+diff --git a/squish.pc.in b/squish.pc.in
+index ca04334..73c21bb 100644
+--- a/squish.pc.in
++++ b/squish.pc.in
+@@ -1,6 +1,7 @@
+ prefix=@PREFIX@
++suffix=@LIBDIR_SUFFIX@
+ exec_prefix=${prefix}
+-libdir=${prefix}/lib
++libdir=${prefix}/lib${suffix}
+ sharedlibdir=${libdir}
+ includedir=${prefix}/include
+ 
+-- 
+2.35.1
+
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
index b69d30d259..fb74881c03 100644
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://alpha.cpp;beginline=3;endline=22;md5=6665e479f71feb92
 PV = "1.10+git${SRCPV}"
 
 SRCREV = "52e7d93c5947f72380521116c05d97c528863ba8"
-SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master \
+           file://0001-Add-support-for-variable-libdir.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix} LIBDIR=${base_libdir} \
+EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix} LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
                 ${@bb.utils.contains('TUNE_FEATURES', 'altivec', 'USE_ALTIVEC=1', '', d)}"
 
 do_install() {
-- 
2.35.1


