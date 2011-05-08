Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu11-0008M6-Kx
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:40 +0200
Received: by gwb11 with SMTP id 11so1670342gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=WaCKIxvWaYCZmMK0MuZr2HW95nloP5qADZhaFyn2/3Q=;
	b=AfTkW2a1UCorGVsOQq3DExpstAuYrrhvyYgpr7pkztZavkbTp+AoXVKG1OZ//BXOu3
	ugtieJMuRRCG4HhMmPkROexOdKrkEspAOnfY2RRVuNHQl6Vvj5foN3LWaDISjFg1aon9
	CxzEG6upZk3rlXIrNfwN3lEUjNL7PcqRwjK9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=IOpxnTesNCgcwB7vJ604ZEtehc5NopsKt1g+JZ/z6tOlhvmTc4mSUcgnicKatsiyHW
	NVHeWoMuL1ZtHn9VyF2A3u9dAPSwDaRx7/IG8BAr0F8QhmMLqXzilYPJyFNXNJRGYniW
	Dy1ze+b1wQsmMmIzV54SI+/fO/KmBDcUfHVDs=
Received: by 10.151.28.15 with SMTP id f15mr4512860ybj.295.1304822635667;
	Sat, 07 May 2011 19:43:55 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:43:06 +0000
Message-Id: <1304822586-14872-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 11/11] qt4: fix 4.7.2 checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 May 2011 02:46:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qt4/qt-4.7.2.inc                |    2 +-
 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb   |    4 ++--
 .../recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb    |    4 ++--
 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb      |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
index 70ee596..259ab2b 100644
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
+++ b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
@@ -14,7 +14,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
 SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
index e9de510..d3c0eda 100644
--- a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
+++ b/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
@@ -9,5 +9,5 @@ EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
index 091a539..a917ac4 100644
--- a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
+++ b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
@@ -2,5 +2,5 @@ require qt4-tools-nativesdk.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
index 1018f74..c86ac2a 100644
--- a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
+++ b/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
@@ -4,5 +4,5 @@ PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
-- 
1.7.2.5



