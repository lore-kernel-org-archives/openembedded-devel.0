Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7897172B1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 04:53:06 +0000 (UTC)
Received: by igui7 with SMTP id i7so53053997igu.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ds7dtBIprahK0vbBkf2r7l+sBTz2fgNOL8L4Niv9zEs=;
	b=Cwk57Othj1o+SCf52FCZVRXEvGreXx3dozmJnjY6TO8bWG8Ne+v1L+1bPO1nWfr0j+
	mF/NEG/zzzP1U6qC/6iOeSsFBrufQU2g+SRE0Uyjs/D0FnH0KiTjU5jhy9NXeSGl+6Rh
	8BUHAKQcOCuJCMd5KpxY1gHv+y1sQ7mIqa92ZY4iS+XdPme9eQd2AUn2wjH9tT+Iwhsg
	SfiB65bQFFSMu1D/ypCcEycfN60p1jqC/dVAdYqRDlH0BPwVx/3pR5CenYd2qMSWHywu
	Q2qk8mhyVn1sV4JQ0rmUIlOjIFGD2NdELrpagDzxknBtF1mMjX9UZPM1ShmdAWqpsqh3
	YbEg==
X-Received: by 10.50.43.169 with SMTP id x9mr7605825igl.12.1440391987109;
	Sun, 23 Aug 2015 21:53:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id a1sm8172496iga.4.2015.08.23.21.53.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Aug 2015 21:53:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 21:52:58 -0700
Message-Id: <1440391979-3469-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
References: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/3] qt3d: Fix assimp build with clang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 04:53:07 -0000

These issues wont happen with qt3d master since assimp seems to have dropped
the offending code, but for the release we use in meta-qt5 as of now we
will need it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-narrowing-errors-found-with-clang.patch | 72 ++++++++++++++++++++++
 recipes-qt/qt5/qt3d_git.bb                         |  2 +
 2 files changed, 74 insertions(+)
 create mode 100644 recipes-qt/qt5/qt3d/0001-Fix-narrowing-errors-found-with-clang.patch

diff --git a/recipes-qt/qt5/qt3d/0001-Fix-narrowing-errors-found-with-clang.patch b/recipes-qt/qt5/qt3d/0001-Fix-narrowing-errors-found-with-clang.patch
new file mode 100644
index 0000000..afe7d32
--- /dev/null
+++ b/recipes-qt/qt5/qt3d/0001-Fix-narrowing-errors-found-with-clang.patch
@@ -0,0 +1,72 @@
+From 538f94f658b181c95c4e98be1429f798be1b437f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Aug 2015 15:50:38 -0700
+Subject: [PATCH] Fix narrowing errors found with clang
+
+clang errors out with
+
+non-constant-expression cannot be narrowed from type 'int8_t' (aka
+'signed char') to 'char' in initializer list
+
+adjust the types to fix the error
+
+string contructor expects char* and not unsigned char* so adjust the
+call
+
+Another issue is seen in constructor using bool instead of a pointer
+
+error: cannot initialize a
+      member subobject of type 'Assimp::DXFImporter::LayerInfo *' with
+      an rvalue of type 'bool'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ 3rdparty/assimp/code/BlenderDNA.cpp | 6 +++---
+ 3rdparty/assimp/code/DXFLoader.cpp  | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/3rdparty/assimp/code/BlenderDNA.cpp b/3rdparty/assimp/code/BlenderDNA.cpp
+index 75ef61f..fb6d1de 100644
+--- a/3rdparty/assimp/code/BlenderDNA.cpp
++++ b/3rdparty/assimp/code/BlenderDNA.cpp
+@@ -55,7 +55,7 @@ using namespace Assimp::Formatter;
+ 
+ #define for_each BOOST_FOREACH
+ bool match4(StreamReaderAny& stream, const char* string) {
+-    char tmp[] = {
++    int8_t tmp[] = {
+         (stream).GetI1(),
+         (stream).GetI1(),
+         (stream).GetI1(),
+@@ -343,13 +343,13 @@ void SectionParser :: Next()
+ {
+     stream.SetCurrentPos(current.start + current.size);
+ 
+-    const char tmp[] = {
++    const int8_t tmp[] = {
+         stream.GetI1(),
+         stream.GetI1(),
+         stream.GetI1(),
+         stream.GetI1()
+     };
+-    current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
++    current.id = std::string((char*)tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
+ 
+     current.size = stream.GetI4();
+     current.address.val = ptr64 ? stream.GetU8() : stream.GetU4();
+diff --git a/3rdparty/assimp/code/DXFLoader.cpp b/3rdparty/assimp/code/DXFLoader.cpp
+index e372d60..159e1a9 100644
+--- a/3rdparty/assimp/code/DXFLoader.cpp
++++ b/3rdparty/assimp/code/DXFLoader.cpp
+@@ -84,7 +84,7 @@ aiColor4D g_clrInvalid = aiColor4D(get_qnan(),0.f,0.f,1.f);
+ 
+ // ------------------------------------------------------------------------------------------------
+ // Constructor to be privately used by Importer
+-DXFImporter::DXFImporter() : buffer(0), groupCode(0), bRepeat(false), mDefaultLayer(false)
++DXFImporter::DXFImporter() : buffer(0), groupCode(0), bRepeat(false), mDefaultLayer(NULL)
+ {
+     memset(cursor,0,sizeof(cursor));
+ }
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 62f17e1..752d896 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -21,3 +21,5 @@ QT_MODULE_BRANCH = "dev"
 
 # last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 already
 SRCREV = "8a9723d7420829a2ba0141a9f7d8dc8cd11d8331"
+
+SRC_URI += "file://0001-Fix-narrowing-errors-found-with-clang.patch"
-- 
2.1.4


