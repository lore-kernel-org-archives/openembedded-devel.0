Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C41C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:26:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.12852.1641929196645635020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lVGbdL4l;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso698057pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aahuuc9tzNrwDKOJ82nACP1fwYadHLnk/WudDngDk6o=;
        b=lVGbdL4lq2fqkk4/+/31OE4oVao76MNvNm0hHYqGL28U+g3lAp+2hFRzXe/5Qv1Hlv
         LDg5kfFoQHox+oc3A8SD4jxiAxNxHn5VrEPNiOq8E+yrPXBm+LUVmyatf6PJ6P8dbk36
         dyx4gXj0y+BhcQnGrxIxPW5lMBER7WU/dJIGASdpqyL8bpoyz3rXpVqFX9qJYLfT0p1A
         EUQ1BUzTny+aCyBsR63dp870KFSkWahQWBnrSa1lVWt011sh5VURXFBtYa12X9xq0/9S
         DgIa7VcNNnw8qqTseTOfoM9u2yng1maPB0TX0HnTRJGVcUpJK01+wyj/UhMIpy1cs25O
         Pdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aahuuc9tzNrwDKOJ82nACP1fwYadHLnk/WudDngDk6o=;
        b=anKE67Cb3u6jztZOaNyT6Plm2zUQlT04uq2Cg7BI9OAC22eWhqRk0nU3HKeEHqyZIB
         h/2m2tsqRbZRTzbHIimJ4SOWQEuT5nW+AZoGPpgBPlrjr1xpy0wCFOV0qnVMjxj/0QKl
         th7fUF0EXA1wnwJT9NT1mpEKUCtPqTwTO9JAh3/xiNJ79PYzmwyusxpvLsJf2ckkILxs
         OqzAUuXaBSZw6t8bdnMYk0UB4+j4W7ximkY/Lpnc+lt7FeNpgh/AJMREJMyo3OS8RONB
         H06lmUj0Bm2RUJ2HYpnafTk/syVkGpJwrrVOGN5Nc9/v0sEgPo5vLdg4EWDK3txmP3s4
         CbgA==
X-Gm-Message-State: AOAM531kwwDSZxkiUtSVMBIOhXJWmb8oVjZFd5tjTgLstU1q+XD/b+Vl
	FYLOthlw5aZfewT/UPuDLz+XN357pN4Mvg==
X-Google-Smtp-Source: 
 ABdhPJzk8zk2S/xsVEXPQ69265Oab8fgrlcBr0EdZ4UIcHrAIilihBL0mf7ylmSiqbp67REv9kV+Dw==
X-Received: by 2002:a17:90a:9d86:: with SMTP id
 k6mr4857710pjp.98.1641929195844;
        Tue, 11 Jan 2022 11:26:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 h21sm8474710pfo.38.2022.01.11.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:26:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-oe][PATCH] pcp: Fix build to exclude qt5
Date: Tue, 11 Jan 2022 11:26:33 -0800
Message-Id: <20220111192633.1395522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 19:26:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94753

Pass right options to ar

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/pcp/pcp.inc           |  2 ++
 .../pcp/pcp/pass-options-to-AR.patch          | 29 +++++++++++++++++++
 meta-oe/recipes-support/pcp/pcp_5.3.5.bb      |  3 +-
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pcp/pcp/pass-options-to-AR.patch

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index f6f111b0e8..d50e7b0910 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -29,4 +29,6 @@ EXTRA_OECONF:append = " --with-dstat-symlink=yes --with-infiniband=no \
                 --with-docdir=${docdir} \
                 "
 
+PACKAGECONFIG[qt5] = "--with-qt=yes --with-qt3d=yes,--with-qt=no --with-qt3d=no,qtbase qt3d"
 
+PACKAGECONFIG ?= ""
diff --git a/meta-oe/recipes-support/pcp/pcp/pass-options-to-AR.patch b/meta-oe/recipes-support/pcp/pcp/pass-options-to-AR.patch
new file mode 100644
index 0000000000..6fa864cd21
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/pass-options-to-AR.patch
@@ -0,0 +1,29 @@
+Do not pass cr option
+
+These options are already coming from builddefs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/include/builddefs.in
++++ b/src/include/builddefs.in
+@@ -167,7 +167,7 @@ OBJECTS = $(ASFILES:.s=.o) \
+ 
+ #NB: don't override $(MAKE); gnumake sets it well, propagating -j etc.
+ #MAKE	= @make@
+-AR	= @ar@
++AR	= @ar@ cqs
+ CC	= @cc@
+ CXX	= @cxx@
+ LD	= @ld@
+--- a/src/include/buildrules
++++ b/src/include/buildrules
+@@ -93,7 +93,7 @@ $(STATICLIBTARGET) : $(SUBDIRS) $(OBJECT
+ ifeq ($(TARGET_OS), darwin)
+ 	libtool -static -o $(STATICLIBTARGET) $?
+ else
+-	$(AR) cr $(STATICLIBTARGET) $?
++	$(AR) $(STATICLIBTARGET) $?
+ endif
+ endif
+ 
diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
index 2dafab1b57..cdf506577a 100644
--- a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
@@ -11,11 +11,12 @@ DEPENDS += "perl-native bison-native flex-native python3-native python3-setuptoo
 
 
 SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
+            file://pass-options-to-AR.patch \
            "
 
 export PCP_DIR="${RECIPE_SYSROOT_NATIVE}"
 #export PCP_RUN_DIR="${RECIPE_SYSROOT_NATIVE}"
-EXTRA_OEMAKE = "CC="${CC}" LD="${LD}" AR="${AR}""
+EXTRA_OEMAKE = "CC="${CC}" LD="${LD}""
 inherit useradd systemd 
 
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
-- 
2.34.1


