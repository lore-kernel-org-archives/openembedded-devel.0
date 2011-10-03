Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigR-0005A2-BL
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B0UL38KQcZIOM0EDkPoHw9YDkbOsP2y9Qhx/BE4EWTk=;
	b=vue8hhi06i94y0X1ALoRvNh6zbuBVjMnLvAsJoPG/q1EwHEjYquJfESk4OB4a0WlqD
	/9jVzzHUNFphA4W6xV+PlNvOsDY74ZQzzZMzEWA9rGHNvIkcFL3YxhPCE2sOf+bIHXiE
	PF32wY+g4SrTyVdj4SqFhrfC1WGo6z9f5+Py0=
Received: by 10.204.13.148 with SMTP id c20mr453463bka.268.1317648621316;
	Mon, 03 Oct 2011 06:30:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13243220bka.0.2011.10.03.06.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:21 +0200
Message-Id: <0972c89683e4f95a5dd569b71eac8c6b20c9cdd1.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 23/25] elementary, ethumb, libeflvala: bump PR to rebuild against newer poppler
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
X-List-Received-Date: Mon, 03 Oct 2011 13:37:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb     |    1 +
 meta-efl/recipes-efl/efl/libeflvala_svn.bb |    1 +
 3 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 0cfa821..1034e0f 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cdc6c12b238ccd62635a7517dfe89438"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.7.0+svnr${SRCPV}"
-PR = "r11"
+PR = "r12"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl gettext
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index 2908ee1..e9087ce 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 3ac2384..f70f953 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "2011.01.13.1+svnr${SRCPV}"
+PR = "r1"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
-- 
1.7.7



