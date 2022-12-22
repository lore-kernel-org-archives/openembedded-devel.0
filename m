Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051EFC001B2
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 09:08:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.41716.1671700110608040837
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 01:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mlwr9sUD;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id b12so921230pgj.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 01:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PMrRoUxtAXJsLkwwVsLovBILQnkzqw5UC/jOrA/ieI=;
        b=Mlwr9sUD8yocu8TX1+tSKj0ayftyNNR/A27SgryaBeViS74jR79W9ZR9CQpi7iN7RC
         VnWnZZNm5u5X3ZE00E6HpA2eVw9/UI/NxjsP5O4wsl2gbmtTAW1VHJ1Y1rYrD6ySL80V
         G6rwu91e1g+ZwQpTXSvaV0vEs9cGfRZvNStbQoDgEMDpKIrUsVwcnrYtcvLyVuT0KDvv
         1CuPrfasQZPAfvL7uDWNL/4WhlOW/yJ366nvbRejn4reheV9kePXd4RoXMRn7b2zMsIP
         c4aNp1RXDzqf6a8bIO1VMcx9yVRPVvN5vt7gn0Xf2Wsf2PiNHiapyZVo82PpIWcMXr6g
         4QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PMrRoUxtAXJsLkwwVsLovBILQnkzqw5UC/jOrA/ieI=;
        b=r2MHTHrMnrl8vYf4SqPNJq79/IWyDP4IMgeEgZ6wwueDjkpTxtKUZSrP3+Rfsx7ysH
         XLSjkmJ1WMjpuvqSnMSxfGPw+cLWhWOzi04bdz2Z2icIYaElgYT5P6cFRkF1zBZ1STeM
         vz+6lI45yp6FQFuwYmOYHqpyc0xDMbxLU7X+BQ97MRw6PLtW0UXN89F+/8AzuM80ChoB
         pVfEab5LgXuvrmujVUkmH9saFOUMM9g7EAc93IOJnUh6+ms8gkgVyPK9saVRexBbi5YZ
         94aLNSUjyU4novaTiEHHPyNfzXOqqAoK1M32a/Lrz/3QC0BxV8FrnVlBTTkPsPG7FFSu
         tIfA==
X-Gm-Message-State: AFqh2ko4pn+7ktj/lTgmXxsTivsz2ESCyq7dn0+ibuK/b/5qy82jduVx
	bFoVs2pDtwSi4pQFFVGrvINd+Y4O9hE=
X-Google-Smtp-Source: AMrXdXuSsR6f63/tl9QsPmvbvuTyOtraWCFGp3Z+lSYla4wrFcKw15YVpEtq9TPUjljj/izYPC9whw==
X-Received: by 2002:a05:6a00:1d97:b0:576:9eed:61de with SMTP id z23-20020a056a001d9700b005769eed61demr6086187pfw.4.1671700109638;
        Thu, 22 Dec 2022 01:08:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id v29-20020aa799dd000000b00575bab45644sm200974pfi.61.2022.12.22.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 01:08:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] libtracefs: Add recipe
Date: Thu, 22 Dec 2022 01:08:24 -0800
Message-Id: <20221222090825.176892-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222090825.176892-1-raj.khem@gmail.com>
References: <20221222090825.176892-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 09:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100189

Needed by trace-cmd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...not-preserve-ownership-in-cp-command.patch | 31 +++++++++++++++++++
 .../libtracefs/libtracefs_1.6.3.bb            | 22 +++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
new file mode 100644
index 0000000000..7ae0856f85
--- /dev/null
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
@@ -0,0 +1,31 @@
+From 6650d0e79eea330b53635574885208a138fef97e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 22:50:56 -0800
+Subject: [PATCH] makefile: Do not preserve ownership in cp command
+
+Fixes
+ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/libtracefs.so is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 27d425c..3aea142 100644
+--- a/Makefile
++++ b/Makefile
+@@ -273,7 +273,7 @@ endif # DESTDIR = ""
+ 
+ install_libs: libs install_pkgconfig
+ 	$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
+-		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
++		cp --no-preserve=ownership --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
+ 	$(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
+ 	$(Q)$(call install_ld_config)
+ 
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb
new file mode 100644
index 0000000000..fbb6b76d10
--- /dev/null
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.3.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Library to parse raw trace event formats	"
+HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
+SECTION = "libs"
+DEPENDS = "libtraceevent bison-native flex-native"
+
+SRCREV = "3395d484eadfd8ab38311032f28e7f79c4f0e33b"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
+           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
+           "
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+do_install() {
+    oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
+}
-- 
2.39.0


