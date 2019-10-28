Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD617FA83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4728FT4xCkz4Q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572300989;
	bh=WBPB/Wib+547tYeRXqXZ2WAVSvjl3iZIQnzBcOc5FqI=;
	h=From:To:Subject:Date:From;
	b=L/InZWyPvhO9IuIsAGMD9Zl5HKCXYPuJV7BmxB8JWBNk11ijIgryLcrHRNbbxkMiW
	R18E/xNNW7BwifQXeD0JPv/ZqqdeNyntnbXRC+C933cIabzaRp8KhbwwL/X8oEwyg3
	6YSG5Y2tcq6FUwhvEOhOm2i5pJwTfs7qv7cDGfPUOcFWmJ6bMnspQG1DHDZT2mu6nY
	UMVBl6rpnJyGOCRT88hU+nYvhvE0Cm4ht+nAVxWbxlKcisM+DqX3krobAqhJhYBEK4
	WbOZZvjs1GuCYj+weD/3EapFA0f2vDNNanqpbZa/Or0L6zIiPn0oYRfL2n/yecbCzU
	5qZHvHtSfMTCYmaA0VDEOg5wNV36YqZEKZTIIL0j0lecRGfk6CBXmZGzI15vzb2FFL
	cIfYUV16VBz6blJF9KGRiRVNmhcXK4q4KH+7Gphg+5UBvCZMA8TJMB1MjXb12Xna1h
	MMwgQISZhcXgwfxagtIF/DUK07/s/NhPuL82f/GqpVgG3pyPe+yBuZV+h34mYwCDL1
	aIFpmCqwE2ufJStYGrDY4gIvXQlm9gRhwORcyzSnpUz7/xZG0zMe9t0/gIOuJCS9Xv
	S8WOa2/oyAXBJFVCe1ulKERgH1GV8RC9yzSDQLrrce3xq4XZec6o7ylkxqdqhF+mDr
	+bW/VgkCSQMrMOsTHtDkJato=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 00:16:29 +0200
Message-Id: <20191028221629.24134-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-xfce][PATCH] xfce-polkit: Upgrade 0.2 -> 0.3
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
X-List-Received-Date: Mon, 28 Oct 2019 22:16:29 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../files/0001-fix-Name-Comment-fields.patch  | 34 -------------------
 ...{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
 rename meta-xfce/recipes-apps/xfce-polkit/{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} (77%)

diff --git a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch b/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
deleted file mode 100644
index e872249d5..000000000
--- a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fb1f83c04dd5262897b09e60fa8b39090d0d4619 Mon Sep 17 00:00:00 2001
-From: Rex Dieter <rdieter@math.unl.edu>
-Date: Thu, 12 Nov 2015 13:53:03 -0600
-Subject: [PATCH] fix Name/Comment fields
-
-Validate as a valid .desktop file per
-http://standards.freedesktop.org/desktop-entry-spec/latest/
-
-See also issue #2
-
-Upstream-Status: Applied [1]
-
-[1] https://github.com/ncopa/xfce-polkit/commit/fb1f83c04dd5262897b09e60fa8b39090d0d4619
----
- xfce-polkit.desktop.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xfce-polkit.desktop.in b/xfce-polkit.desktop.in
-index 8575896..dd9f09c 100644
---- a/xfce-polkit.desktop.in
-+++ b/xfce-polkit.desktop.in
-@@ -1,7 +1,7 @@
- [Desktop Entry]
- Type=Application
--_Name=XFCE PolKit
--_Comment=Policykit Authentication Agent
-+Name=XFCE PolKit
-+Comment=Policykit Authentication Agent
- Exec=@xfce_polkit_libexecdir@/xfce-polkit
- Icon=gtk-dialog-authentication
- NotShowIn=GNOME;KDE;
--- 
-2.14.3
-
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
similarity index 77%
rename from meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
rename to meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
index 62d8d6de9..3a396c0f7 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
@@ -9,7 +9,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = " \
     git://github.com/ncopa/${BPN}.git \
-    file://0001-fix-Name-Comment-fields.patch \
 "
-SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
+SRCREV = "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
 S = "${WORKDIR}/git"
-- 
2.17.1


