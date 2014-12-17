Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F0DEA72608
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 02:05:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45303433"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 10:02:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH25F56003466
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 10:05:15 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 10:05:45 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 10:04:52 +0800
Message-ID: <1418781894-1975-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] mailcap: add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 02:05:47 -0000
Content-Type: text/plain

The mailcap file is used by the metamail program. Metamail reads the
mailcap file to determine how it should display non-text or multimedia
material.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
new file mode 100644
index 0000000..bcc6496
--- /dev/null
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Helper application and MIME type associations for file types"
+DESCRIPTION = "The mailcap file is used by the metamail program. Metamail reads the \
+mailcap file to determine how it should display non-text or multimedia \
+material. Basically, mailcap associates a particular type of file \
+with a particular program that a mail agent or other program can call \
+in order to handle the file. Mailcap should be installed to allow \
+certain programs to be able to handle non-text files. \
+\
+Also included in this package is the mime.types file which contains a \
+list of MIME types and their filename extension associations, used  \
+by several applications e.g. to determine MIME types for filenames."
+
+SECTION = "System Environment/Base"
+
+SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/r2-1-43.tar.gz"
+SRC_URI[md5sum] = "8fd185ffae710301de3bc297877a404b"
+SRC_URI[sha256sum] = "a630892b5fe59eb9e3bef30c597de1c2b7f35243dea4b0c995fd482aa20c2d6b"
+LICENSE = "PD MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
+S = "${WORKDIR}/r2-1-43"
+do_install() {
+    oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
+}
-- 
1.8.4.2


