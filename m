Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl72-0005qy-76
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:25:28 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1927955wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Wgev5dbfsMVB9bCffKnXzldnC1/opEVSw7dc4ozkK0g=;
	b=HnPEWAMG8umKEeGvN+yJ9LRL7h93vOk0crA1kRIOD33KzoVHOgAT98iPv68S2KzLMc
	kN2t9Efh4WpZB6b5JMJjlfyq4FViDdCQVibaT7027N4iLD2Ukrj8/IYXuok4Id4n8/LY
	xWPvMYaSTKn0Ou5Yb7t0fkq/zIOj43lxYlnIO69j5xu8ZVs5kIkOTd7ZPFXV3eSMIvAP
	zoe7LcsBx4tfv1GG4sAgqhayBoFiO2arh1vFIpD2lIX7REIInbIQ5uD+YJZxdG2wtwJL
	Sim6YM61veNnZmH8v7M/St3ajrIX6fFJfANXRDhwFE+KJCwAqSWYZseOUZ808Spqme19
	q58A==
Received: by 10.216.255.148 with SMTP id j20mr433496wes.106.1342682048883;
	Thu, 19 Jul 2012 00:14:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm37013241wib.8.2012.07.19.00.14.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:14:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 09:13:48 +0200
Message-Id: <99ec57b17650f7451c8a16052545b358cf2920fc.1342681929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-gnome][PATCH 4/4] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Thu, 19 Jul 2012 07:25:28 -0000

From: Elvis Dowson <elvis.dowson@gmail.com>

This commit fixes the following warnings:
WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found
WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index a67bf8b..c1923f7 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -5,7 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-	   file://config.h \
+           ${CONFIGFILESURI} \
+	  "
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_arm = "file://config.h \
+	   file://numpyconfig.h \
+	  "
+CONFIGFILESURI_mipsel = "file://config.h \
 	   file://numpyconfig.h \
 	  "
 
-- 
1.7.8.6



