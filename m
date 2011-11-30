Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RVg6J-00031D-95
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:05:11 +0100
Received: by localhost (Postfix, from userid 1000)
	id 99A3644A5FF; Wed, 30 Nov 2011 09:58:31 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:57:56 +0100
Message-Id: <ebb70fdb24e3d737542ca86d111de27cb1970d38.1322643070.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <45b8af8c3aba62c922c5e438801b6c8cd9c83913.1322643070.git.sledz@dresearch-fe.de>
References: <45b8af8c3aba62c922c5e438801b6c8cd9c83913.1322643070.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1322643070.git.sledz@dresearch-fe.de>
References: <cover.1322643070.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 4/4] gypsy: update to latest upstream version 0.8, and remove version 0.7
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
X-List-Received-Date: Wed, 30 Nov 2011 09:05:11 -0000

Bug fixes, enhanced logging, a new debugging system, enhanced device
discovery.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gypsy/gypsy_0.7.bb |   12 ------------
 recipes/gypsy/gypsy_0.8.bb |    6 ++++++
 2 files changed, 6 insertions(+), 12 deletions(-)
 delete mode 100644 recipes/gypsy/gypsy_0.7.bb
 create mode 100644 recipes/gypsy/gypsy_0.8.bb

diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
deleted file mode 100644
index 6636961..0000000
--- a/recipes/gypsy/gypsy_0.7.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require gypsy.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-           file://docs-reference-am.patch \
-           file://remove-werror.patch \
-"
-
-SRC_URI[gypsy.md5sum] = "cde52c121693014efa75d9098fd7de22"
-SRC_URI[gypsy.sha256sum] = "60d9f9ada77c832899df4a164718895addc5015fa48f45fd58dc4bc8a983f205"
-
diff --git a/recipes/gypsy/gypsy_0.8.bb b/recipes/gypsy/gypsy_0.8.bb
new file mode 100644
index 0000000..c5813db
--- /dev/null
+++ b/recipes/gypsy/gypsy_0.8.bb
@@ -0,0 +1,6 @@
+require gypsy.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[gypsy.md5sum] = "32b8db24db86d2dac87b391dd255f4bf"
+SRC_URI[gypsy.sha256sum] = "1986a58189614a950725c3bc7d05faa3b84695f35cb696326f340ef87fc3acaa"
-- 
1.7.7



