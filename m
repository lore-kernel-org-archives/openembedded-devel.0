Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C34C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.11377.1662276884480382755
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GH1eqYW5;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id r22so5601828pgm.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nOwNj+7lLgYjx0pcqXoUdgeRY2ILjdmKvikO5fVwBuA=;
        b=GH1eqYW5qtcML8s7ngXy0c5A2bxHVtw59REOLxqsEqfYm7mwoL+L0awxgdkUYaIi4e
         BJ4a8WUXbS+t/rgYED2WpbjV1scyv0Q1HQWg+h+HZ3MlWzzObjH490rltnJC17TC8Smw
         BnfL3lZ21GjGgNAlpxH9tG7nlFtjPN9VQN8wOW48Fr3uiaA0p7BOyIf8UYfUg+10p1T4
         3eU9JMSCJ+KyEanoHTZIIGsG26KnxaH4jo6urAV1m1bLYQMJdJoPu/eVPBA+G/ex5Vku
         t+7+HW5aQ6rY79WzDZyrZCrR8d8nMgnpmjZuRH6FRCEYRocqzyrsIYkljdWSn6hCJszI
         kELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nOwNj+7lLgYjx0pcqXoUdgeRY2ILjdmKvikO5fVwBuA=;
        b=d4sGPuhldTtOC0b1o3+4RPrkX7atMCRBiMePGkOYCDw313UH+K74vVpQ7CdxbkLCqQ
         /5v2HqlGjZrt8iUVTXwjdba9qIrpLVrsOztapPnXEGcXe0q2TQdKQZJfmePPyn4nPpmE
         Kq4iOln3vsclDqR+nSeNwGeppp21tVSqjwIVhWXLRKsAc9Qd36zaTr9ddggWBnWTDXR/
         PEwGN2zVIcJ8XnEF/IiV19ihPoFHdbVAqCqH8Z6tmzMbPXU9Z+VJ44mokEqg5/fcpnfU
         xXejZBZ4FSywBOsjxVtb7aViMTCCBGdvaQshpvtjhYvALkZxWzfBajZNaiQ0iXs+lwnI
         8NPA==
X-Gm-Message-State: ACgBeo0G5Z3HSCyzwu9Vx/qykqGSTfbyu9u7av8DbWYdGvgj/1dUyoBB
	ZJrbqLPaJ2VRXNdZkV1mAdhR5jQw8chpTQ==
X-Google-Smtp-Source: 
 AA6agR4i7IAXmSzkb2ZTBvt1K3hWou3+ziAD12b9O+LNBpukU12mb05TZoYVCT1xZVCDqJD79jYGzA==
X-Received: by 2002:a63:cc51:0:b0:41f:12f5:675b with SMTP id
 q17-20020a63cc51000000b0041f12f5675bmr36405941pgi.69.1662276883568;
        Sun, 04 Sep 2022 00:34:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 22/63] pam-plugin-ccreds: Fix AC_CHECK_LIB for libdb
Date: Sun,  4 Sep 2022 00:33:36 -0700
Message-Id: <20220904073417.3251865-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98616

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-function-from-libdb-during-confi.patch | 34 +++++++++++++++++++
 .../pam/pam-plugin-ccreds_11.bb               |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-configure-Check-for-function-from-libdb-during-confi.patch

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-configure-Check-for-function-from-libdb-during-confi.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-configure-Check-for-function-from-libdb-during-confi.patch
new file mode 100644
index 0000000000..c5a42359b9
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0001-configure-Check-for-function-from-libdb-during-confi.patch
@@ -0,0 +1,34 @@
+From 1915754179401b6ee00f0e2ffd844596778e43a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 12:05:02 -0700
+Subject: [PATCH] configure: Check for function from libdb during configure
+
+checking for main in AC_CHECK_LIB is not the right check to find out if
+a library exists or not, using a function provided by library is more
+appropriate and will help using newer compilers and autoconf in future
+
+Upstream-Status: Submitted [https://github.com/PADL/pam_ccreds/pull/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 3829d9f..3d52933 100644
+--- a/configure.in
++++ b/configure.in
+@@ -72,9 +72,9 @@ AC_CHECK_HEADERS(pam/pam_appl.h pam/pam_misc.h pam/pam_modules.h)
+ 
+ AC_CHECK_HEADERS(db.h)
+ 
+-AC_CHECK_LIB(db, main,[LIBS="-ldb $LIBS" found_db_lib=yes],,$LIBS)
++AC_CHECK_LIB(db, db_create,[LIBS="-ldb $LIBS" found_db_lib=yes],,$LIBS)
+ if test -z "$found_db_lib"; then
+-	AC_CHECK_LIB(db1, main,[LIBS="-ldb1 $LIBS" found_db_lib=yes],,$LIBS)
++	AC_CHECK_LIB(db1, db_create,[LIBS="-ldb1 $LIBS" found_db_lib=yes],,$LIBS)
+ fi
+ 
+ AC_CHECK_LIB(pam, pam_start)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
index 7dd48b3b42..81d0746f89 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
@@ -11,7 +11,9 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "e2145df09469bf84878e4729b4ecd814efb797d1"
 
-SRC_URI = "git://github.com/PADL/pam_ccreds;branch=master;protocol=https"
+SRC_URI = "git://github.com/PADL/pam_ccreds;branch=master;protocol=https \
+           file://0001-configure-Check-for-function-from-libdb-during-confi.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


