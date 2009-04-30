Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LzRaZ-0007h5-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 10:25:51 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id B837D6842A;
	Thu, 30 Apr 2009 12:20:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Apr 2009 12:20:07 +0400
Message-Id: <1241079609-5912-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
In-Reply-To: <1241079609-5912-1-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 2/4] coreutils-native: remove autotools and quilt dependencies
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
X-List-Received-Date: Thu, 30 Apr 2009 08:25:51 -0000

Allows to build coreutils-native at very early stage in build process.
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
1.6.2.4


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



