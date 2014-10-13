Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3B50860DD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 01:22:00 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so4705552pdb.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 18:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R5BaQPxhbgGserRJA7zKnqA24WIyfOX397k36xylfIY=;
	b=XyzKoarl3FcZxux1wfjfLPY3AHnGCH8gezKkUe15mp4PLd0k92PxbAq/7n2k0nZt9D
	oy4Vk32YclxiyVC8mK587lMeLZxyYzsTa5b0XiqWvRf+5JlXQE8nxmulZo4zo372+M7a
	DtWFRR21XTmDF8dT+GNaAadJ34r5j6iHPYN0d4ZW7bSSugHKCI378R5mpp9/7HKtcLwA
	25++PweJWZchzXvbPEiyxVt9s97iTOSA/Uenx+0RKDpb9yJMjmpv/xI9OccghMqpWXIa
	7eC+WUwG6Hdqkcc6TNmC9ezAHmWA2F8ds8jcKub8j7nPBkwXSqXAKKzUKZdqkpP2kak/
	+Cag==
X-Received: by 10.66.229.8 with SMTP id sm8mr20950669pac.29.1413163321705;
	Sun, 12 Oct 2014 18:22:01 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nx6sm9638324pab.46.2014.10.12.18.22.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 18:22:01 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 12:35:02 +1100
Message-Id: <1413164102-21727-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-qt5][PATCH v2] packagegroup-qt5-toolchain-target: always include qttools packages
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
X-List-Received-Date: Mon, 13 Oct 2014 01:22:06 -0000

The qttools packages were included only if the ruby layer was enabled
as it required qtwebkit. However, qttools now has a PACKAGECONFIG
option for qtwebkit and does not enable it by default so we can include
the qttools packages even if the ruby layer is not enabled.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 18ecb4d..25a5003 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -13,11 +13,6 @@ USE_RUBY = " \
     qtquick1-mkspecs \
     qtquick1-plugins \
     qtquick1-qmlplugins \
-    qttools-dev \
-    qttools-mkspecs \
-    qttools-plugins \
-    qttools-staticdev \
-    qttools-tools \
     qtwebkit-dev \
     qtwebkit-mkspecs \
     qtwebkit-qmlplugins \
@@ -84,6 +79,11 @@ RDEPENDS_${PN} += " \
     qtsystems-dev \
     qtsystems-mkspecs \
     qtsystems-qmlplugins \
+    qttools-dev \
+    qttools-mkspecs \
+    qttools-plugins \
+    qttools-staticdev \
+    qttools-tools \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
-- 
2.1.2


