Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAD47827F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:40:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v596ed9c009197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:40:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:40:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:40:32 +0800
Message-ID: <81051bc0f9cc4463b655fe177256ab9cdd84b438.1496990155.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496990155.git.jackie.huang@windriver.com>
References: <cover.1496990155.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] logwarn: add new recipe
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
X-List-Received-Date: Fri, 09 Jun 2017 06:40:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

logwarn is a utility for finding interesting messages
in log files.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb

diff --git a/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb b/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
new file mode 100644
index 000000000..00e5d497b
--- /dev/null
+++ b/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
@@ -0,0 +1,46 @@
+SUMMARY = "A utility for finding interesting messages in log files"
+DESCRIPTION = "Logwarn searches for interesting messages in log files, \
+  where 'interesting' is defined by a user-supplied list of positive and \
+  negative extended regular expressions. \
+"
+HOMEPAGE = "https://github.com/archiecobbs/logwarn/wiki"
+SECTION = "console/utils"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "https://s3.amazonaws.com/archie-public/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "e544a6230673ea54f7430bf817bb39d8"
+SRC_URI[sha256sum] = "8dbfcf9b28c782ab3bddd6a620d4fb95d1b0ffcbe93276996cdc4800aa9aebd1"
+
+inherit autotools-brokensep
+
+# This directory is NOT volatile.
+#
+lcl_default_state_dir = "${localstatedir}/lib/logwarn"
+
+CFLAGS += '-DDEFAULT_STATE_DIR=\""${lcl_default_state_dir}\""'
+
+
+# Make sure some files exist for autoreconf.
+#
+do_configure_prepend () {
+    touch ${S}/NEWS
+    touch ${S}/ChangeLog
+    touch ${S}/README
+}
+
+# Create a directory for logfile state info, usually under /var/lib.
+#
+do_install_append () {
+    install -d ${D}${lcl_default_state_dir}
+}
+
+# Make a package for the nagios plug-in (script).
+#
+PACKAGES += "${PN}-nagios"
+
+FILES_${PN}-nagios = "${nonarch_libdir}/nagios"
+
+RDEPENDS_${PN}-nagios += "bash"
-- 
2.11.0


