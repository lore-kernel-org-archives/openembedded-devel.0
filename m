Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 85AEA7856F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:43:11 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z91so6786954wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gfAJS1u3w6d3VAX1TED/R2bS7lyvosPtRqdrBSKCjt4=;
	b=KxBBAPeDyybyFIT9uWK3PY5JelK/0Snrt7XC3QP9h7mcvvbJVQJ+D9KXnAi3LTQF15
	zedyEygPJr1Q+k0x4I6tG4QmlltwEOlyCWOkP4SF2u1ybOUIFQLZuaV/d6bC0TxzFJJP
	pu8PftDpj7GFWJzVzqHTegPay0bHI2CPbhQMA9tHGKlOqs8fAf6mPFy8sCcyTCXTDzpz
	tmS8YSByRDgFNsAlMTOe88MNFgFZaJXQf8bsEx8vDDSTOmxPn/vWE8w/1KcqkcfJY2ze
	i9OncAXxkvYHHa406zimDMW7L8bFDOkxxLpR9n1muieMUUsq4aa1zm9czktPLFQw4SE+
	VjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gfAJS1u3w6d3VAX1TED/R2bS7lyvosPtRqdrBSKCjt4=;
	b=XEFBX7fwAMq0eTczapj7SrFyjUAHqD5fpZyKGu5rx2bhH+7OY9F6bMcqX8FMuWZJs8
	4tCxB8q4Cn+FNf+yKpN7x1BwsdFp4JZ/RbZ66Te1no7DlplAfwKhZMJmWBfNoAiPtP6a
	av88vBZ1+tWrlqepilx2/bl0BUKgagpodwMrjhrNmUdsvUGmlj3e1uh7s9gpFmK9MwZT
	Bji8sjT/rwYQT00eu/e80AP6bCesLT06U8/TFegE7roluC9sHmua2S5kNoWqGh28Ih8B
	xPR4JusUuGQnpSXvj/yzT9fw0kvV8YqsxZ6C/czN2GAYpgcRUyTkX4MKwlkfWzj7UGqw
	gtUw==
X-Gm-Message-State: AHYfb5iiAV7UiDwNVkNtg/zC7jVur5c/an/bq1gLuqvntBqLmKJmdjbL
	zy8I4NBGMCS/2huK
X-Received: by 10.28.56.7 with SMTP id f7mr2011821wma.88.1502995392135;
	Thu, 17 Aug 2017 11:43:12 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a6sm3779678wme.36.2017.08.17.11.43.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 11:43:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Aug 2017 20:44:44 +0200
Message-Id: <20170817184445.10108-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170817184445.10108-1-Martin.Jansa@gmail.com>
References: <20170817184445.10108-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 3/4] qt3d: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 18:43:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch    |  6 +++---
 .../0002-Fix-BlenderDNA-for-clang-cross-compiler.patch     | 14 ++++++--------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index b19f963..ba4e2d0 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 64f46f5399627430f9ce1a888fb9212b33977231 Mon Sep 17 00:00:00 2001
+From 22ccc94b5501509b516fce17195a598d04dcc2f3 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -9,7 +9,7 @@ Subject: [PATCH] Allow a tools-only build
  2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
-index 2cc347a..81cdeef 100644
+index 2cc347a1c..81cdeefb0 100644
 --- a/qt3d.pro
 +++ b/qt3d.pro
 @@ -1,4 +1,4 @@
@@ -28,7 +28,7 @@ index 2cc347a..81cdeef 100644
 +    SUBDIRS = sub_tools
 +}
 diff --git a/src/3rdparty/assimp/assimp_dependency.pri b/src/3rdparty/assimp/assimp_dependency.pri
-index 8ba2d9a..e973d93 100644
+index 8ba2d9a41..e973d93dd 100644
 --- a/src/3rdparty/assimp/assimp_dependency.pri
 +++ b/src/3rdparty/assimp/assimp_dependency.pri
 @@ -1,5 +1,5 @@
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index 8b36a0a..95b5479 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,14 +1,15 @@
-From b28ad8e101d4e2ffae00e43d53b22ace35f8c308 Mon Sep 17 00:00:00 2001
+From bc5ef10fc6f71cb340ad339bc43f6ce48adb1f59 Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  src/3rdparty/assimp/code/BlenderDNA.cpp | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/3rdparty/assimp/code/BlenderDNA.cpp b/src/3rdparty/assimp/code/BlenderDNA.cpp
-index b380fbe8d..437e44349 100644
+index b380fbe8d..3cc27dff1 100644
 --- a/src/3rdparty/assimp/code/BlenderDNA.cpp
 +++ b/src/3rdparty/assimp/code/BlenderDNA.cpp
 @@ -56,10 +56,10 @@ using namespace Assimp::Formatter;
@@ -19,9 +20,9 @@ index b380fbe8d..437e44349 100644
 -		(stream).GetI1(),  
 -		(stream).GetI1(), 
 -		(stream).GetI1()
-+		(const char)(stream).GetI1(), 
-+		(const char)(stream).GetI1(),  
-+		(const char)(stream).GetI1(), 
++		(const char)(stream).GetI1(),
++		(const char)(stream).GetI1(),
++		(const char)(stream).GetI1(),
 +		(const char)(stream).GetI1()
  	};
  	return (tmp[0]==string[0] && tmp[1]==string[1] && tmp[2]==string[2] && tmp[3]==string[3]);
@@ -41,6 +42,3 @@ index b380fbe8d..437e44349 100644
  	};
  	current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
  
--- 
-2.13.3
-
-- 
2.14.0


