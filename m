Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1898EC83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.3025.1752082282474651618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEy0/W+0;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-556fd896c99so52016e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082280; x=1752687080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sigPTdlxjlso66biZlRr35yPENNc9DBP+z2j2ZWXdY=;
        b=BEy0/W+08d19Oao5C1/1r1BuZBX52eZqSvMT7+hoo61O18CieVSrtDDrsU2yGYhOFr
         qcuFIUCOXUi+mgSNNn3BnOnXYE0kUqiAK72vzhbe1m4p+KujOwTUY7ZMZR95Rc6jXXZ0
         Y/VAVa/Yt54JsL+VUK9KDloobkxOmP5HcVry0CpP78F/N7oFft90WIkBgk7/8mQD5BVG
         HmnqOMch5qvfXC60ZLwD3dsEVN6Z8gX35jArUVu77k4qM3xDvuP05yEu92O9lurcudMy
         Xa84xTbjJwy/kpS+OtpMC3kyg7xXjR7YDe8e/ks+l7ylmm4CX44yC+u1Y0nl6/VdikXN
         TcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082280; x=1752687080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sigPTdlxjlso66biZlRr35yPENNc9DBP+z2j2ZWXdY=;
        b=AZn3pXScBPLBOuYxu9LZy76xcwfOC4w3s0otRxWU8HnRSkDqAjTknnCLwXvSiKxQDI
         Led5Ags1KEeVQI7ENbQ47btiYGoPXAcNkn08h5jCOZar5eceXPByGutl5Yc4edK/XAzO
         A6ep1UfNjtpfn/bR0MmfVD6z+zFda+7VBv/tHDwORMTuAg3/YlwyRE3G6zyprppvO+ZU
         Ueiow3OXxIt86j5s2CjRyZCVKoBhgAzEIUM30uOrqphoe6YX/lpz3G74tpnCHC45936B
         UNc51s7pZsvAXJqE3OoHxnch/D0bXcY+Kpmz2DEAtStQknWuDRfJp/Tl2nG8UIDDe540
         ccaA==
X-Gm-Message-State: AOJu0YzWsUIKHpv7HJKUriTmlngn6yZblA5/f9kKmyZ3BMtlGR4Dysv2
	fFeS4yLNV1acP6YwXEfaqp/tBNmj1RMiYgEzM2HTmk45LnECIYwahPeaYObRbA==
X-Gm-Gg: ASbGnct/H1wsjk8GfLjwntSm2ZJHbkId4HJpiKRTpVrot4Zzx3Q7fkOGETJinn2p1qX
	cTTXvxMIqzbhDEX3x6+C0Syjwznggrl0xcgc6olrmnA/a4XpeWzQpRLcNu0pdqOa02wQd1j22OI
	qm5/1vKYLFvq+zBygkC7cccQe+1y+6BFSKbP9ky5qRCUcHo1N8SGPFkMH0NuEFRrwiC3u8xCQBn
	6KFIq9rDW+62+aFes4OE1rbB+liaiTa5qB9zw8swK/oi4MHsWGlLV+ZoBTfWPfTNKtpj3PIYgog
	wfnZcJDxld13OVdq/cqi155iTnBd9HpMrvn/FH6rYu+8kjNd4aDJ2Jj70XK8bHoztYMW5RSmtFC
	fgkM=
X-Google-Smtp-Source: AGHT+IFYqs08i2BVzNOuGsZNjj0k7g5mSXhdtSZ1AI0p9sztaoRs3n9bmr5YmK30JzNWXCu6CVVhqQ==
X-Received: by 2002:a05:6512:234f:b0:553:522f:61b6 with SMTP id 2adb3069b0e04-558fa8f8625mr1519871e87.33.1752082279988;
        Wed, 09 Jul 2025 10:31:19 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:19 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 11/20] nanomsg: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:45 +0300
Message-ID: <20250709173054.605430-11-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118365

Fix:

| CMake Error at CMakeLists.txt:27 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 57 +++++++++++++++++++
 .../nanomsg/nanomsg_1.2.1.bb                  |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch b/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..f61966134d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,57 @@
+From 2e293eb9d3753ef87a5e05bc6ac270add0ad8fa8 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 13:25:54 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:27 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/nanomsg/nanomsg/pull/1123]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt      | 2 +-
+ demo/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a9ae6a24..2e93724d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@
+ #   IN THE SOFTWARE.
+ #
+ 
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ project (nanomsg C)
+ include (CheckFunctionExists)
+diff --git a/demo/CMakeLists.txt b/demo/CMakeLists.txt
+index 4807f160..5ea96c4a 100644
+--- a/demo/CMakeLists.txt
++++ b/demo/CMakeLists.txt
+@@ -6,7 +6,7 @@
+ #
+ # Thanks for the idea goes to @maddouri.
+ #
+-cmake_minimum_required (VERSION 2.8.7)
++cmake_minimum_required (VERSION 3.5)
+ 
+ project(nanomsg-demo)
+ 
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
index 8dce6c5c4a..3aaf056adf 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 
 SECTION = "libs/networking"
 
-SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master \
+        file://0001-allow-build-with-cmake-4.patch"
+
 SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
 
 
-- 
2.43.0


