Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03226C83F15
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:49 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5601.1752004666055669690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKPFoXbI;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b5931037eso38665401fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004664; x=1752609464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKA9rkI+XoTU6l/1b1ulY6K75r9diUNOB9caVaU/pM8=;
        b=nKPFoXbIg8vV4xjsbS213wSe3lOQfwOk3SKB/q3UAqP5VXDrX03mzcgB1II1C388v7
         KsmIxUq0zXI8SDnGAOpCYmrpQ+l/sUIZBaNCK0hjoYiKEr0qVfqUgKNN6POQkXoz9kO/
         62p20xoAtTZTyA011UVCAx16kBo4wRR3gJsq6S9r/9HvofwbVnbE/fN7hxrdUne2ZqLi
         iGx05lQ7F/N+x/BBwXfwtz5jCsoy611kr62wd1zbMbCXQ4vTXDmvrwpZbLIhWCdqthjT
         EvBuTkA3mrP5Af+XnBQzrbm54jHLYTXVaipaPqU9WruO5ZxrksCxMqsNs6GFqI9bNRjQ
         YLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004664; x=1752609464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKA9rkI+XoTU6l/1b1ulY6K75r9diUNOB9caVaU/pM8=;
        b=YduLp4jh+pvp3XXpL9pJFwjUM9pqEymbCYKYDRyiEgkhDAnj6xmbnm+lPRhYwhiFOH
         3YeKwqLO4h+qJ8NYVMvAtvJnvtv0ODr3xoBozmGZn3CQKsOLzqlz2TSuQ2q4yfHmZWI5
         gYkkTqbJRYwlhNG2Y6WB6lNIfgn1PWSu7hrnrQYILdDpfV+NcBTEvWTY71piy8xuAos/
         Yl0lbs4xVlyCXF+gof9DnNDGEXP3yOuCkVU532Y/1Oh0BQIgTPecbLm/TqZWipWvwHK8
         z6nbcHA5Eb4EgrTCXbRJD7hq+G31AdxY/q+sDPjlQK8sNUULcBf3RwqldoEJUXOfl5xa
         LucQ==
X-Gm-Message-State: AOJu0Yzy/B9Ovl8v+qWstLgDdMJZLcPySmgZA7rFzI67jcmhlN8PhFBq
	VYDo6CnDSsTQTtoDS7Jbv5l2R7UwNDmrg+5AEqmNh0Wnhm8zEd4q71gvitItcg==
X-Gm-Gg: ASbGnctkxamFEk1XZ1ya08XjE4wrEw0WFbmS8Cq/fRPOaHUE6bV8YoNjNnWBZeY/5Jo
	qrlTm90zOR8b/8Evi292/nlGYOFULqtRr85zOnHSQ+aehNaLym10UG7VY4/XS4feubruikCi9cS
	A8AAbwYNup0rciaA8X9yrbBL/gwAJm30CWVPQ2W8FBEgBTeW1l2wzuTqaT9ven1232uI38aro+0
	O8efMrn8y3sGaxge9Twc7xh7v5rRqM/Z1AfvJpKEp+GDY48wCr18C4zOUcucz4YdiE5X0KbEOTf
	Rk2yOK2wj8LjK18Rv4Y5MczklfGGptuXHL7yRpzjUZniAF0liKoHJcUKTmhEIg+ZIkdZpeNcwBo
	tQTg=
X-Google-Smtp-Source: AGHT+IF9p3RhGwH2czJzl2TcsnpiK+iMEjpnCM4hP3ECUMULaHJJ2DVFZxAosOFjhOoEWeapC7BHCg==
X-Received: by 2002:a05:651c:19a8:b0:30b:c6fe:4529 with SMTP id 38308e7fff4ca-32f39a9612fmr16027571fa.8.1752004663626;
        Tue, 08 Jul 2025 12:57:43 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:42 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 13/20] uchardet: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:29 +0300
Message-ID: <20250708195636.1678606-13-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118335

Fix:

| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 41 +++++++++++++++++++
 .../uchardet/uchardet_0.0.8.bb                |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..86a3b08277
--- /dev/null
+++ b/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,41 @@
+From b650c4c3385f7afeb70231cdbcad888d23cb0a5a Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 19:59:23 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a570264..5a6281c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ ######## Project settings
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ include(CheckCCompilerFlag)
+ set (PACKAGE_NAME uchardet)
+ project (${PACKAGE_NAME} CXX C)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
index 3e164cc26f..75a04e6f80 100644
--- a/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
+++ b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
@@ -4,5 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
 inherit cmake
 
-SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz \
+        file://0001-allow-build-with-cmake-4.patch"
 SRC_URI[sha256sum] = "e97a60cfc00a1c147a674b097bb1422abd9fa78a2d9ce3f3fdcc2e78a34ac5f0"
-- 
2.43.0


