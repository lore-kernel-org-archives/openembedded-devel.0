Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTn-0005Ob-B0
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:23 +0100
Received: (qmail 26610 invoked by uid 813007); 4 Mar 2009 15:53:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:42 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPb-0001DD-Ch; Wed, 04 Mar 2009 16:53:35 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:28 +0100
Message-Id: <1236182004-4523-14-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 13/70] Add python-urlgrabber, python-iniparser, yum-metadata-parser and native varients (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:00:16 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5097 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/python/python-iniparse-native_0.2.3.bb    |    9 +++++++++
 packages/python/python-iniparse_0.2.3.bb           |   11 +++++++++++
 packages/python/python-urlgrabber-native_3.1.0.bb  |    9 +++++++++
 packages/python/python-urlgrabber_3.1.0.bb         |   11 +++++++++++
 .../python/yum-metadata-parser-native_1.1.2.bb     |   11 +++++++++++
 packages/python/yum-metadata-parser_1.1.2.bb       |   13 +++++++++++++
 6 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 packages/python/python-iniparse-native_0.2.3.bb
 create mode 100644 packages/python/python-iniparse_0.2.3.bb
 create mode 100644 packages/python/python-urlgrabber-native_3.1.0.bb
 create mode 100644 packages/python/python-urlgrabber_3.1.0.bb
 create mode 100644 packages/python/yum-metadata-parser-native_1.1.2.bb
 create mode 100644 packages/python/yum-metadata-parser_1.1.2.bb

diff --git a/packages/python/python-iniparse-native_0.2.3.bb b/packages/python/python-iniparse-native_0.2.3.bb
new file mode 100644
index 0000000..ab799db
--- /dev/null
+++ b/packages/python/python-iniparse-native_0.2.3.bb
@@ -0,0 +1,9 @@
+require python-iniparse_${PV}.bb
+inherit native
+DEPENDS = "python-native"
+RDEPENDS = ""
+
+do_stage() {
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
+}
diff --git a/packages/python/python-iniparse_0.2.3.bb b/packages/python/python-iniparse_0.2.3.bb
new file mode 100644
index 0000000..27a38f4
--- /dev/null
+++ b/packages/python/python-iniparse_0.2.3.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "iniparse is a INI parser for Python"
+HOMEPAGE = "http://code.google.com/p/iniparse/"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://iniparse.googlecode.com/files/iniparse-${PV}.tar.gz"
+S = "${WORKDIR}/iniparse-${PV}"
+
+inherit distutils
diff --git a/packages/python/python-urlgrabber-native_3.1.0.bb b/packages/python/python-urlgrabber-native_3.1.0.bb
new file mode 100644
index 0000000..01aebee
--- /dev/null
+++ b/packages/python/python-urlgrabber-native_3.1.0.bb
@@ -0,0 +1,9 @@
+require python-urlgrabber_${PV}.bb
+inherit native
+DEPENDS = "python-native"
+RDEPENDS = ""
+
+do_stage() {
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
+}
diff --git a/packages/python/python-urlgrabber_3.1.0.bb b/packages/python/python-urlgrabber_3.1.0.bb
new file mode 100644
index 0000000..a8ccf8a
--- /dev/null
+++ b/packages/python/python-urlgrabber_3.1.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "urlgrabber is a pure python package that drastically simplifies the fetching of files."
+HOMEPAGE = "http://linux.duke.edu/projects/urlgrabber/"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://linux.duke.edu/projects/urlgrabber/download/urlgrabber-${PV}.tar.gz"
+S = "${WORKDIR}/urlgrabber-${PV}"
+
+inherit distutils
diff --git a/packages/python/yum-metadata-parser-native_1.1.2.bb b/packages/python/yum-metadata-parser-native_1.1.2.bb
new file mode 100644
index 0000000..4e4ab9f
--- /dev/null
+++ b/packages/python/yum-metadata-parser-native_1.1.2.bb
@@ -0,0 +1,11 @@
+require yum-metadata-parser_${PV}.bb
+inherit native
+DEPENDS = "python-native sqlite3-native"
+RDEPENDS = ""
+
+#BUILD_CFLAGS += "-I${STAGING_LIBDIR}/glib-2.0"
+
+do_stage() {
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
+}
diff --git a/packages/python/yum-metadata-parser_1.1.2.bb b/packages/python/yum-metadata-parser_1.1.2.bb
new file mode 100644
index 0000000..0f9ed80
--- /dev/null
+++ b/packages/python/yum-metadata-parser_1.1.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "C-based metadata parser to quickly parse xml metadata into sqlite databases."
+HOMEPAGE = "http://linux.duke.edu/projects/yum/download.ptml"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://linux.duke.edu/projects/yum/download/yum-metadata-parser/yum-metadata-parser-${PV}.tar.gz"
+S = "${WORKDIR}/yum-metadata-parser-${PV}"
+
+TARGET_CFLAGS += "-I${STAGING_LIBDIR}/glib-2.0"
+
+inherit distutils
-- 
1.6.1.3





