Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60EA877BC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 06:33:13 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 83so5099228pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ErcEISSO9F6skO7Iuqx2Ajfbs71/abSal9fCJWQw910=;
	b=mGSc3M4Pj2tBpw5HZOIoiWvFgnE9mtnyhHQmtl2F7Is3OmFSWl7k5RquT5zyRLDRnq
	UKm9OUTOgvOwHN4p9wLEpfXUKp8RIMdmMvCXMi5ucDvpJ74SOy7JOnu5oqCnUUHAflqD
	54bMhPbnyzOhdYFssXhwyxpekODaTHhEXhTExC62y7fIXuiY79qJO2rXTUBmN+TTi1Gk
	VLi+6+Lt7hPSuLKeJJbj8ZfYJOn+0wL9gT0PZOqPqdSUasZ8Ddgn1SL8i3TL28JJZajY
	YmHNnTD+VTTxjRoIKRUdlSv6875u8amI+0PjLUv9A7yH9chgzgpWOVgDMA+yqnIKXWCd
	n6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ErcEISSO9F6skO7Iuqx2Ajfbs71/abSal9fCJWQw910=;
	b=WskRVDGs66f3KODcTpbrWfXd0T9z9KyWikhd3uMsdqncNT3iqAasTajVRCfOFWq5dC
	U94IoVdGxj7Vg6Sa8+ggJaq61HcMxYUeHTM89iM4Dqy2mjtwCxCOPXZ4+SCu7PjdtzND
	zZuprmKXcAl6FWTA9u71KauvIop916TwCbkkPuYl2aZXRKdGKR/o2wsPjYa+RSTVNxzG
	4RetTncB7mj2hiOG8VyEyVbZExrK4yYT9E/nNT/+OuKrZ0Fm75T3l3AamRrH7L7lWJ3W
	41s85lKH4kKu/wmc3La/Yg8n84G9yhBrLmw6h6vHHKhjU3qONxiD4b5WXmwibdv2eMlE
	fhxQ==
X-Gm-Message-State: AHYfb5jMotE+7PWv5UfPb7/NGaD4esx6QeVSB4tMf0gfMYZBaVKCBVb1
	vhcacQLmdxaXRoFu
X-Received: by 10.84.167.2 with SMTP id c2mr7525007plb.367.1502260394701;
	Tue, 08 Aug 2017 23:33:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	x25sm6259547pfk.80.2017.08.08.23.33.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 23:33:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:32:59 -0700
Message-Id: <20170809063259.373-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170809063259.373-1-raj.khem@gmail.com>
References: <20170809063259.373-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qt3d: Fix build with clang
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
X-List-Received-Date: Wed, 09 Aug 2017 06:33:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...2-Fix-BlenderDNA-for-clang-cross-compiler.patch | 46 ++++++++++++++++++++++
 recipes-qt/qt5/qt3d_git.bb                         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch

diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
new file mode 100644
index 0000000..8b36a0a
--- /dev/null
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -0,0 +1,46 @@
+From b28ad8e101d4e2ffae00e43d53b22ace35f8c308 Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kim.kulling@googlemail.com>
+Date: Mon, 7 Nov 2016 17:19:49 +0100
+Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
+
+---
+ src/3rdparty/assimp/code/BlenderDNA.cpp | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/3rdparty/assimp/code/BlenderDNA.cpp b/src/3rdparty/assimp/code/BlenderDNA.cpp
+index b380fbe8d..437e44349 100644
+--- a/src/3rdparty/assimp/code/BlenderDNA.cpp
++++ b/src/3rdparty/assimp/code/BlenderDNA.cpp
+@@ -56,10 +56,10 @@ using namespace Assimp::Formatter;
+ #define for_each BOOST_FOREACH
+ bool match4(StreamReaderAny& stream, const char* string) {
+ 	char tmp[] = { 
+-		(stream).GetI1(), 
+-		(stream).GetI1(),  
+-		(stream).GetI1(), 
+-		(stream).GetI1()
++		(const char)(stream).GetI1(), 
++		(const char)(stream).GetI1(),  
++		(const char)(stream).GetI1(), 
++		(const char)(stream).GetI1()
+ 	};
+ 	return (tmp[0]==string[0] && tmp[1]==string[1] && tmp[2]==string[2] && tmp[3]==string[3]);
+ }
+@@ -344,10 +344,10 @@ void SectionParser :: Next()
+ 	stream.SetCurrentPos(current.start + current.size);
+ 
+ 	const char tmp[] = {
+-		stream.GetI1(),
+-		stream.GetI1(),
+-		stream.GetI1(),
+-		stream.GetI1()
++		(const char)stream.GetI1(),
++		(const char)stream.GetI1(),
++		(const char)stream.GetI1(),
++		(const char)stream.GetI1()
+ 	};
+ 	current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
+ 
+-- 
+2.13.3
+
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index f39208a..2891470 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -13,6 +13,7 @@ DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
+    file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
 "
 
 PACKAGECONFIG ??= ""
-- 
2.14.0


