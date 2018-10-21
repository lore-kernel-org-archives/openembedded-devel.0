Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7742D79C7E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 14:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 42dMc23xD0z5t
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Oct 2018 16:34:26 +0200 (CEST)
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Oct 2018 17:34:25 +0300
Message-Id: <20181021143426.25760-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] libqmi: Add upstream fix for a 1.20.2 regression
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
X-List-Received-Date: Sun, 21 Oct 2018 14:34:26 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-Don-t-create-invalid-wds-start-network-w.patch | 41 ++++++++++++++++++++++
 .../recipes-connectivity/libqmi/libqmi_1.20.2.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
new file mode 100644
index 000000000..d230d6803
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
@@ -0,0 +1,41 @@
+From 8269f4d86927fbe19e78776a12736680fe9169b6 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Mon, 1 Oct 2018 16:53:31 +0300
+Subject: [PATCH] qmi-network: Don't create invalid --wds-start-network when
+ APN is not set
+
+In 1.20.2 the warning for this was turned into an error.
+
+(cherry picked from commit 289d8ad6419895e2e1fba3d78a54a0db65da521d)
+---
+Upstream-Status: Backport
+
+ utils/qmi-network.in | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/utils/qmi-network.in b/utils/qmi-network.in
+index bf7bed9..a9e5299 100755
+--- a/utils/qmi-network.in
++++ b/utils/qmi-network.in
+@@ -334,11 +334,13 @@ start_network ()
+ 
+     setup_data_format
+ 
+-    START_NETWORK_ARGS="apn='$APN'"
+-    if [ -n "$APN_USER" ]; then
+-        START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
+-        if [ -n "$APN_PASS" ]; then
+-            START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
++    if [ -n "$APN" ]; then
++        START_NETWORK_ARGS="apn='$APN'"
++        if [ -n "$APN_USER" ]; then
++            START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
++            if [ -n "$APN_PASS" ]; then
++                START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
++            fi
+         fi
+     fi
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
index 3e08c4f9e..6811ce020 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "glib-2.0 libgudev libmbim glib-2.0-native"
 inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch \
            file://0001-Detect-clang.patch \
            "
 SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
-- 
2.11.0


