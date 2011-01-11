Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgae-0000ZF-Hn
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:56:56 +0100
Received: by ewy28 with SMTP id 28so5818761ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=BKlpN+aHQtoioGBbLaLY9B3n7CTZ0DRmQqKjdONPvcM=;
	b=XHXGKulSyY9CnNNXM9FCCAKTQI2JfVer87yniTQIwU7b7M5MsDggPDX0v8wf7O52eY
	hKexQvI4+ToKBDDz2ry0RC+SXAwfdS2yqbM/uyKqN9vxzYty9DOO0/ZpWmueW4hdu68m
	+1E4lVT5aqLeOhc655QVysJYawdiD20Jc5ZtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DLNZHg9/NsCVifpIppOTxzj1bftAgilSZW8Rr9Fy8miSf4lmtCorYPQDEkB7xQevFK
	RvIuFMNGsjF4ic3ZzwtFauP/5Gk2wZNaJ9EXujz2ruiYjK8XQmyanWxKxKFWYpUMDhMe
	UeNUXtbo5/nDxnQ/SF3NDUONQGlYTNSEtP9Zc=
Received: by 10.223.86.194 with SMTP id t2mr317419fal.40.1294761384750;
	Tue, 11 Jan 2011 07:56:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm7446388fam.4.2011.01.11.07.56.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:18 +0100
Message-Id: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
Subject: [PATCH 01/12] xorg-data: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:56:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb       |   10 ++++++++++
 recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb |   11 +++++++++++
 recipes/xorg-data/xbitmaps_1.1.0.bb                |   10 ----------
 recipes/xorg-data/xcursor-themes_1.0.2.bb          |   11 -----------
 4 files changed, 21 insertions(+), 21 deletions(-)
 create mode 100644 recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
 delete mode 100644 recipes/xorg-data/xbitmaps_1.1.0.bb
 delete mode 100644 recipes/xorg-data/xcursor-themes_1.0.2.bb

diff --git a/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb b/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
new file mode 100644
index 0000000..23cecdb
--- /dev/null
+++ b/recipes/obsolete/xorg-data/xbitmaps_1.1.0.bb
@@ -0,0 +1,10 @@
+require xorg-data-common.inc
+
+DESCRIPTION = "Common X11 Bitmaps"
+LICENSE = "MIT"
+DEPENDS += "libxmu"
+
+
+SRC_URI[archive.md5sum] = "f9ddd4e70a5375508b3acaf17be0d0ab"
+SRC_URI[archive.sha256sum] = "c9a2059c8b0636b7ee1169647bb22f6eb4a0589e36fdb98936002e2569ad8761"
+PR = "${INC_PR}.0"
diff --git a/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb b/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
new file mode 100644
index 0000000..824bbeb
--- /dev/null
+++ b/recipes/obsolete/xorg-data/xcursor-themes_1.0.2.bb
@@ -0,0 +1,11 @@
+require xorg-data-common.inc
+PE = "1"
+
+DEPENDS += " libxcursor xcursorgen-native"
+
+FILES_${PN} += "${datadir}/icons"
+
+
+SRC_URI[archive.md5sum] = "e8929a1bb4d98d1a3991fd340d0b5f09"
+SRC_URI[archive.sha256sum] = "5f798c2f1d2794c09fa0a40700c40359b725107608012866828015dca47514d6"
+PR = "${INC_PR}.0"
diff --git a/recipes/xorg-data/xbitmaps_1.1.0.bb b/recipes/xorg-data/xbitmaps_1.1.0.bb
deleted file mode 100644
index 23cecdb..0000000
--- a/recipes/xorg-data/xbitmaps_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-data-common.inc
-
-DESCRIPTION = "Common X11 Bitmaps"
-LICENSE = "MIT"
-DEPENDS += "libxmu"
-
-
-SRC_URI[archive.md5sum] = "f9ddd4e70a5375508b3acaf17be0d0ab"
-SRC_URI[archive.sha256sum] = "c9a2059c8b0636b7ee1169647bb22f6eb4a0589e36fdb98936002e2569ad8761"
-PR = "${INC_PR}.0"
diff --git a/recipes/xorg-data/xcursor-themes_1.0.2.bb b/recipes/xorg-data/xcursor-themes_1.0.2.bb
deleted file mode 100644
index 824bbeb..0000000
--- a/recipes/xorg-data/xcursor-themes_1.0.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-data-common.inc
-PE = "1"
-
-DEPENDS += " libxcursor xcursorgen-native"
-
-FILES_${PN} += "${datadir}/icons"
-
-
-SRC_URI[archive.md5sum] = "e8929a1bb4d98d1a3991fd340d0b5f09"
-SRC_URI[archive.sha256sum] = "5f798c2f1d2794c09fa0a40700c40359b725107608012866828015dca47514d6"
-PR = "${INC_PR}.0"
-- 
1.7.4.rc1



