Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D60E6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872922"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6m3V7003494
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:48:04 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:21 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:26 +0800
Message-ID: <1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade to 1.4.7
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:22 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31 ++++++++++++++++++++++
 .../corosync/files/config-site.corosync            |  4 +++
 meta-oe/recipes-support/corosync/files/groff.patch | 12 +++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/corosync/corosync_1.4.7.bb
 create mode 100644 meta-oe/recipes-support/corosync/files/config-site.corosync
 create mode 100644 meta-oe/recipes-support/corosync/files/groff.patch

diff --git a/meta-oe/recipes-support/corosync/corosync_1.4.7.bb b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
new file mode 100644
index 0000000..a3b8864
--- /dev/null
+++ b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
@@ -0,0 +1,31 @@
+SUMMARY = "The Corosync Cluster Engine and Application Programming Interfaces"
+DESCRIPTION = "This package contains the Corosync Cluster Engine Executive, several default \
+APIs and libraries, default configuration files, and an init script."
+HOMEPAGE = "http://corosync.github.io/corosync/"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}.tar.gz \
+           file://config-site.corosync \
+           file://groff.patch \
+	   "
+
+SRC_URI[md5sum] = "da9b2cf0b55f08ac4cf7cd82ac2f977a"
+SRC_URI[sha256sum] = "c1d005b2093e9a725abd1dfb2be936114b561c0b3145aca11f58c1a733a05af8"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25656171d1e4054c636a9893067f8c30"
+
+CONFIG_SITE = "${WORKDIR}/config-site.corosync"
+
+DEPENDS = "groff-native nss"
+
+EXTRA_OECONF += " --enable-nss "
+CFLAGS_append += " -fPIC "
+
+do_compile() {
+    DESCPATH="${STAGING_DATADIR_NATIVE}/groff/`groff -v | awk '{if(NR==1)print $4}'`/font"
+    oe_runmake DESCPATH=${DESCPATH}
+}
+
+FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
diff --git a/meta-oe/recipes-support/corosync/files/config-site.corosync b/meta-oe/recipes-support/corosync/files/config-site.corosync
new file mode 100644
index 0000000..3472dec
--- /dev/null
+++ b/meta-oe/recipes-support/corosync/files/config-site.corosync
@@ -0,0 +1,4 @@
+ac_cv_func_fnmatch_works=yes
+ac_cv_func_malloc_0_nonnull=yes
+ac_cv_func_realloc_0_nonnull=yes
+
diff --git a/meta-oe/recipes-support/corosync/files/groff.patch b/meta-oe/recipes-support/corosync/files/groff.patch
new file mode 100644
index 0000000..da1378a
--- /dev/null
+++ b/meta-oe/recipes-support/corosync/files/groff.patch
@@ -0,0 +1,12 @@
+diff -Nurp corosync-1.3.1.org/man/Makefile.am corosync-1.3.1/man/Makefile.am
+--- corosync-1.3.1.org/man/Makefile.am	2011-04-25 10:37:50.000000000 +0800
++++ corosync-1.3.1/man/Makefile.am	2014-11-24 10:33:36.583426707 +0800
+@@ -126,7 +126,7 @@ HTML_DOCS = $(dist_man_MANS:%=%.html)
+ INDEX_HTML = index.html
+ 
+ %.html: %
+-	$(GROFF) -mandoc -Thtml $^ > $@
++	$(GROFF) -F $(DESCPATH) -mandoc -Thtml $^ > $@
+ 
+ install-data-local:
+ 	$(INSTALL) -d $(DESTDIR)/${docdir}/html
-- 
1.9.1


