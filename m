Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1e3-00067K-DA
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:44 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xeIS1NxwTDs0K4+5cv+Hh5kkf+Ewqw+PMIgcbCzI/QY=;
	b=hpwWEDkgOhXwUawTuNZ/MnK7wXHOcPOBXGU0MN+avnrVasI8vvBsfUXbLhNh8I8w0M
	hxNRVwv7GH+XfPfjmrFfmqHelShvuZcscXQ/13dPnzKlzBuvCPjZ5uXJXu7ARs3qmFkU
	ETIh4ogV6G4Z/LIwfNXFxFvIW1dy4b4/AbDjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d16Q/PYZr+HgDmDoVfwvxKfsyqrbRNVxirFZyubyTk2rFNYD6VmIlZdTTh5Sblfdxs
	sqH8KTNrHiXbpiFRFMD5sQiVto78F3ceILdLOHaJu3gFooV/9JFrIdqn2Yz8A+saAeii
	igRHMXcnP2L5mbsFQw7gRZKpLn0jf/H4xBCAQ=
Received: by 10.223.104.139 with SMTP id p11mr5270505fao.106.1281972624711;
	Mon, 16 Aug 2010 08:30:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p2sm2499717fak.46.2010.08.16.08.30.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:14 +0200
Message-Id: <1281972620-7317-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/9] xorg-data: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg/xorg-data/xbitmaps_1.0.1.bb  |   10 ++++++++++
 .../xorg/xorg-data/xcursor-themes_1.0.1.bb         |   11 +++++++++++
 recipes/xorg-data/xbitmaps_1.0.1.bb                |   10 ----------
 recipes/xorg-data/xcursor-themes_1.0.1.bb          |   11 -----------
 4 files changed, 21 insertions(+), 21 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-data/xbitmaps_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-data/xcursor-themes_1.0.1.bb
 delete mode 100644 recipes/xorg-data/xbitmaps_1.0.1.bb
 delete mode 100644 recipes/xorg-data/xcursor-themes_1.0.1.bb

diff --git a/recipes/obsolete/xorg/xorg-data/xbitmaps_1.0.1.bb b/recipes/obsolete/xorg/xorg-data/xbitmaps_1.0.1.bb
new file mode 100644
index 0000000..e0333ce
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-data/xbitmaps_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-data-common.inc
+
+DESCRIPTION = "Common X11 Bitmaps"
+LICENSE = "MIT"
+DEPENDS += "libxmu"
+
+
+SRC_URI[archive.md5sum] = "b28a9840cde3c38d7c09716372fea257"
+SRC_URI[archive.sha256sum] = "5aa5be594e77f772b85d39f0c25f61a61c7f6fa02ba940e614c5ee386deeb867"
+PR = "${INC_PR}.0"
diff --git a/recipes/obsolete/xorg/xorg-data/xcursor-themes_1.0.1.bb b/recipes/obsolete/xorg/xorg-data/xcursor-themes_1.0.1.bb
new file mode 100644
index 0000000..9dca0ab
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-data/xcursor-themes_1.0.1.bb
@@ -0,0 +1,11 @@
+require xorg-data-common.inc
+PE = "1"
+
+DEPENDS += " libxcursor xcursorgen-native"
+
+FILES_${PN} += "${datadir}/icons"
+
+
+SRC_URI[archive.md5sum] = "014bad415e64c49994679cdb71a97e37"
+SRC_URI[archive.sha256sum] = "4e7dcd402cd045ce1bd1a3de496270e78d6ead2478a0bcb3404072b33c5c9ea0"
+PR = "${INC_PR}.0"
diff --git a/recipes/xorg-data/xbitmaps_1.0.1.bb b/recipes/xorg-data/xbitmaps_1.0.1.bb
deleted file mode 100644
index e0333ce..0000000
--- a/recipes/xorg-data/xbitmaps_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-data-common.inc
-
-DESCRIPTION = "Common X11 Bitmaps"
-LICENSE = "MIT"
-DEPENDS += "libxmu"
-
-
-SRC_URI[archive.md5sum] = "b28a9840cde3c38d7c09716372fea257"
-SRC_URI[archive.sha256sum] = "5aa5be594e77f772b85d39f0c25f61a61c7f6fa02ba940e614c5ee386deeb867"
-PR = "${INC_PR}.0"
diff --git a/recipes/xorg-data/xcursor-themes_1.0.1.bb b/recipes/xorg-data/xcursor-themes_1.0.1.bb
deleted file mode 100644
index 9dca0ab..0000000
--- a/recipes/xorg-data/xcursor-themes_1.0.1.bb
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
-SRC_URI[archive.md5sum] = "014bad415e64c49994679cdb71a97e37"
-SRC_URI[archive.sha256sum] = "4e7dcd402cd045ce1bd1a3de496270e78d6ead2478a0bcb3404072b33c5c9ea0"
-PR = "${INC_PR}.0"
-- 
1.7.2



