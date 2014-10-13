Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id D67CF6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 00:42:08 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so4957076pad.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 17:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cKAOD2uKK9unMQ0gqAENDmv0jwPUfjkSnMvIXahZPJ8=;
	b=Eno7bH3+Zy+0C8QOUqSdSXj+GeU41EyFRDy7fOS9vprywJg9KPvYVf8LmLIm1F72Bz
	XmuzOqKwT9MhLVJAJq1t4CJEUJp85hYXtm4AFFxdfBgHKCCLBVPCm7y3zUjTuD0suoNJ
	mcuXcLTx3NyAyDq7tQH7Qu18f/gWR7tB8KETSBpQnpUJ+HVzU+qmjsmc/8UsQwWwuIyo
	GWKtJ8R3Ha9v8EpJjZWmG4yMZnnm2VXl5GQOjkNqMvoeCAf09+ynXAhvctqOGTWdBddN
	LRZwAoS3NjCfHin1k1PAnZYkWgAjr9K/S9LS9E6GzW0LQSHpoJwH8BijXePjqYDnUgyV
	r04A==
X-Received: by 10.70.38.228 with SMTP id j4mr21057025pdk.16.1413160929951;
	Sun, 12 Oct 2014 17:42:09 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id y1sm9414227pbw.89.2014.10.12.17.42.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 17:42:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 11:55:09 +1100
Message-Id: <1413161709-18325-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target: always include qttools packages
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
X-List-Received-Date: Mon, 13 Oct 2014 00:42:15 -0000

The qttools packages were included only if the ruby layer was enabled
as it required qtwebkit. However, qttools now has a PACKAGECONFIG
option for qtwebkit and does not enable it by default so we can include
the qttools packages even if the ruby layer is not enabled.
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


