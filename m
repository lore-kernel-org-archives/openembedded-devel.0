Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2C770191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:50:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6F9o8ae008229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 02:50:08 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Jul 2014 02:50:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Jul 2014 05:50:03 -0400
Message-ID: <1405417803-20316-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] memstat: add new recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 09:50:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

memstat is a small proc-based utility designed to help the
system administrator figure out what's consuming memory.
Like ps, it lists all the processes, and how much private
memory each is using. Unlike ps, it also lists all the shared
objects (shared libraries and executables) that are in memory,
and which processes are using those shared objects.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb

diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
new file mode 100644
index 0000000..8252153
--- /dev/null
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Display virtual memory allocation"
+DESCRIPTION = "Lists all the processes, executables, and shared libraries \
+that are using up virtual memory. It's helpful to see how the shared memory \
+is used and which 'old' libs are loaded. \
+"
+HOMEPAGE = "http://memstattool.sourceforge.net/"
+SECTION = "devtool"
+
+LICENSE = "GPLv2"
+
+S = "${WORKDIR}/memstattool"
+
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb"
+
+SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
+SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
+
+do_install_append(){
+    install -d ${D}${bindir}
+    install -m 0755 memstat ${D}${bindir}
+    install -d ${D}${sysconfdir}
+    install -m 0755 memstat.conf ${D}${sysconfdir}
+    install -d ${D}${mandir}/man1
+    install -m 0644 memstat.1 ${D}${mandir}/man1
+    install -d ${D}${docdir}/${BPN}
+    install -m 0644 memstat-tutorial.txt ${D}${docdir}/${BPN}
+}
-- 
2.0.0


