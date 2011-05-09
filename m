Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW0J-0002sy-Od
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:28 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so2077920yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=mAEkXwdi6MVUpYf29ZE/ObTTbYit62JZy+KlqHa8JEE=;
	b=cP5UpsNcaq0O17BTmsYXUWp4EqmeeNHl4dCBL/XeNr0WmYUvLqXFh3XlcpdWQ5dNQz
	5GXskUW8Q/KFnKHox0SnrSuZ/HSk6HVFD0AGFx5EbkiueHz7G9jzNC7eKhBEfzuvYQG9
	qf7uJjIBpLKk3TfMK0SdSR7bmuPWFDMiAcdeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=kmcnqEBWdSUgjqOyC5jzHkOO0ApGjxJF0lSFXyETMWrGdxk0DxsbSj8yvKy4A/sYAL
	KB5HdbNogyNsDz7p+Niwp4qfoObzk0KtQZ4hbf2iewSxIdJ+ew2bL/p4SGbpujkY1zZV
	MVw2V+Sc7oYsOJIm2HfHNfefMttwJ5kBoP4rc=
Received: by 10.151.59.19 with SMTP id m19mr6321884ybk.349.1304968664901;
	Mon, 09 May 2011 12:17:44 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:56 +0000
Message-Id: <1304968617-4949-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 11/12] qt4: fix 4.7.2 checksum
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
X-List-Received-Date: Mon, 09 May 2011 19:20:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qt4/qt-4.7.2.inc                |    4 ++--
 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb   |    4 ++--
 .../recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb    |    4 ++--
 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb      |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
index 70ee596..ed62bd3 100644
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
+++ b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
@@ -14,8 +14,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
 
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



