Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9588DECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 20:08:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.17393.1662062938831528323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOC4d8MF;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 i7-20020a17090adc0700b001fd7ccbec3cso6427666pjv.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Yld4KHrvj0m+9isSqo2fdJsid4m0oX4yOWE8AUR5EVs=;
        b=dOC4d8MFkImGxWNMu080bQc296bN7horkagucRqwwjSPxLN40gEaZjr6sUp5iNvW72
         WSX/Y7FDPyzeAg+jQnCpdZwM2OqwkAvvdJz2/D7OqT5Hmt0f+jz6IYzk2dLJPbohlrju
         uG7PSL0ztulU4cpVig6FWld1Ko56xBF3W9ZYm6ZcSiLzPlrRNvUkKeOmfCWzejoAqV1h
         Qvwg8ZmvdYa/zY+pI1WpNwe6vcMTmnLdB8oPyJ0PmuSAO2ojjDVqb8FvOD4CLXQm7x66
         wofqYrkHNuLRuuKJIu1PHECBdQjzT4sFk39U1eoZI8ZVSwEkryeW7yPkBOWMecMD3Jv3
         xjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Yld4KHrvj0m+9isSqo2fdJsid4m0oX4yOWE8AUR5EVs=;
        b=ze/H4UXNjQQKUv3wo6kwBwTmf//q3Ni5RUEIfFgq3hXRxXPWHJLBejbCxsjvcULR9w
         NB7Zu1EPoLdl9uXnroW1IRVwlSnl5/XxQ97WWfrvdf2d93MIb8d+vcz7FHp04rBcX3Wl
         lmawKYBgY/UWovQf1sxgFchsjICkMkVwa3hzg/F9SAKMaiqqWQZ/JMPRQHh2FDfT4MjP
         1X+tuCf9omttWgfWov4eJh2/iFSHAHGhMvnN7EPAT8+xcCRdOcjA10Iru6k7Em6i6mYG
         s+ozoB8XHnjreSqr8IjZkuKJbHmbYP+qrjhyyxJSg3aVHZDRTZqBL1LPhOzRH0sDwl8I
         IdYg==
X-Gm-Message-State: ACgBeo37HZu0N771gdP88XPrONk5/L4b3iavy/7+vVNuMPyqSttTGWKe
	kPyqQ8fFGTwq6YyXtnyC3XaabKFAWG21iQ==
X-Google-Smtp-Source: 
 AA6agR5p5ubU1xkqaNZk2p853cLUgHU0/5Z2ro0gPhDmiubhRWvxM7jQJnUy2qkBfEqKX6qJQZlO9Q==
X-Received: by 2002:a17:902:ee42:b0:174:88f1:20d7 with SMTP id
 2-20020a170902ee4200b0017488f120d7mr24755430plo.32.1662062937735;
        Thu, 01 Sep 2022 13:08:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 w6-20020a654106000000b0042b80a27ac2sm5664045pgp.75.2022.09.01.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 13:08:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] quagga: Fix AC_CHECK_LIB for libreadline
Date: Thu,  1 Sep 2022 13:08:54 -0700
Message-Id: <20220901200855.251686-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 20:08:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98587

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-readline-instead-of-main-in-libr.patch | 32 +++++++++++++++++++
 .../recipes-protocols/quagga/quagga_1.2.4.bb  |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch b/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch
new file mode 100644
index 0000000000..776c0958fa
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-configure-Check-for-readline-instead-of-main-in-libr.patch
@@ -0,0 +1,32 @@
+From 675b35b7ed416c837267e493b157167319e8f5fa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 11:01:53 -0700
+Subject: [PATCH] configure: Check for readline() instead of main() in
+ libreadline
+
+while checking for presense of libreadline, poke for a function which is
+provided by libreadline, main is not provided by it, so modern compiler
+toolchains may complain about it.
+
+Upstream-Status: Submitted [https://github.com/Quagga/quagga/pull/9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ed279f48..d444ab4a 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -754,7 +754,7 @@ dnl	 [TODO] on Linux, and in [TODO] on Solaris.
+ 	      )]
+ 	    )]
+ 	  )
+-         AC_CHECK_LIB(readline, main, LIBREADLINE="-lreadline $LIBREADLINE",,
++         AC_CHECK_LIB(readline, readline, LIBREADLINE="-lreadline $LIBREADLINE",,
+                       "$LIBREADLINE")
+          if test $ac_cv_lib_readline_main = no; then
+            AC_MSG_ERROR([vtysh needs libreadline but was not found and usable on your system.])
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
index 984264a30f..37cfc131c2 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
@@ -1,5 +1,7 @@
 require quagga.inc
 
+SRC_URI += "file://0001-configure-Check-for-readline-instead-of-main-in-libr.patch"
+
 SRC_URI[md5sum] = "eced21b054d71c9e1b7c6ac43286a166"
 SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3"
 
-- 
2.37.3


