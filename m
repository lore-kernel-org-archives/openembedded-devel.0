Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N360v-0001ua-Ks
	for openembedded-devel@openembedded.org; Wed, 28 Oct 2009 11:44:29 +0100
Received: (qmail 31066 invoked by uid 813007); 28 Oct 2009 10:43:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Oct 2009 10:43:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:45:54 +0100
Message-Id: <1256726758-22996-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH 2/6] coreutils-native: remove autotools and quilt dependencies
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
X-List-Received-Date: Wed, 28 Oct 2009 10:44:29 -0000

From: Roman I Khimov <khimov@altell.ru>

Allows to build coreutils-native at very early stage in build process.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/coreutils/coreutils-native.inc    |    8 ++++++++
 recipes/coreutils/coreutils-native_6.0.bb |    2 +-
 recipes/coreutils/coreutils-native_7.1.bb |    2 +-
 recipes/coreutils/coreutils-native_7.2.bb |    2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 recipes/coreutils/coreutils-native.inc

diff --git a/recipes/coreutils/coreutils-native.inc b/recipes/coreutils/coreutils-native.inc
new file mode 100644
index 0000000..c4dda17
--- /dev/null
+++ b/recipes/coreutils/coreutils-native.inc
@@ -0,0 +1,8 @@
+inherit native
+
+INHIBIT_AUTOTOOLS_DEPS = "1"
+PATCHTOOL = "patch"
+
+do_configure() {
+	oe_runconf
+}
diff --git a/recipes/coreutils/coreutils-native_6.0.bb b/recipes/coreutils/coreutils-native_6.0.bb
index 057dfa6..a3754df 100644
--- a/recipes/coreutils/coreutils-native_6.0.bb
+++ b/recipes/coreutils/coreutils-native_6.0.bb
@@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
 S = "${WORKDIR}/coreutils-${PV}"
 
 require coreutils_${PV}.bb
-inherit native
+require coreutils-native.inc
diff --git a/recipes/coreutils/coreutils-native_7.1.bb b/recipes/coreutils/coreutils-native_7.1.bb
index 057dfa6..a3754df 100644
--- a/recipes/coreutils/coreutils-native_7.1.bb
+++ b/recipes/coreutils/coreutils-native_7.1.bb
@@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
 S = "${WORKDIR}/coreutils-${PV}"
 
 require coreutils_${PV}.bb
-inherit native
+require coreutils-native.inc
diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutils/coreutils-native_7.2.bb
index 057dfa6..a3754df 100644
--- a/recipes/coreutils/coreutils-native_7.2.bb
+++ b/recipes/coreutils/coreutils-native_7.2.bb
@@ -2,4 +2,4 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
 S = "${WORKDIR}/coreutils-${PV}"
 
 require coreutils_${PV}.bb
-inherit native
+require coreutils-native.inc
-- 
1.6.5





