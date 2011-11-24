Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RTaiR-0002Tu-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 15:55:56 +0100
Received: by localhost (Postfix, from userid 1000)
	id B42B944A613; Thu, 24 Nov 2011 15:47:30 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 15:47:05 +0100
Message-Id: <1322146025-21514-2-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
References: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
Subject: [PATCH 2/2] gypsy: update to latest upstream version 0.8
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
X-List-Received-Date: Thu, 24 Nov 2011 14:55:56 -0000

Bug fixes, enhanced logging, a new debugging system, enhanced device
discovery.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/gypsy/gypsy.inc    |    2 ++
 recipes/gypsy/gypsy_0.7.bb |    2 +-
 recipes/gypsy/gypsy_0.8.bb |    6 ++++++
 3 files changed, 9 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gypsy/gypsy_0.8.bb

diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
index 964e336..6c7c942 100644
--- a/recipes/gypsy/gypsy.inc
+++ b/recipes/gypsy/gypsy.inc
@@ -5,6 +5,8 @@ DEPENDS = "glib-2.0 dbus-glib bluez4 libxslt-native"
 
 INC_PR = "r1"
 
+SRC_URI = "http://gypsy.freedesktop.org/releases/${PN}-${PV}.tar.gz;name=gypsy"
+
 inherit autotools pkgconfig
 
 do_configure_prepend () {
diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
index a10cd6e..c95f380 100644
--- a/recipes/gypsy/gypsy_0.7.bb
+++ b/recipes/gypsy/gypsy_0.7.bb
@@ -2,7 +2,7 @@ require gypsy.inc
 
 PR = "${INC_PR}.1"
 
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-0.7.tar.gz;name=gypsy \
+SRC_URI += " \
            file://docs-reference-am.patch \
            file://remove-werror.patch \
 "
diff --git a/recipes/gypsy/gypsy_0.8.bb b/recipes/gypsy/gypsy_0.8.bb
new file mode 100644
index 0000000..7c84ef9
--- /dev/null
+++ b/recipes/gypsy/gypsy_0.8.bb
@@ -0,0 +1,6 @@
+require gypsy.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[gypsy.md5sum] = "32b8db24db86d2dac87b391dd255f4bf"
+SRC_URI[gypsy.sha256sum] = "1986a58189614a950725c3bc7d05faa3b84695f35cb696326f340ef87fc3acaa"
-- 
1.7.7



