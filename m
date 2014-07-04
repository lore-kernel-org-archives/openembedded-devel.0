Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9290665CCE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 06:35:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s646ZlJ6024006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jul 2014 23:35:47 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Jul 2014 23:35:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Jul 2014 02:35:45 -0400
Message-ID: <1404455745-2856-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] memstat: add new recipe
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
X-List-Received-Date: Fri, 04 Jul 2014 06:35:52 -0000
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
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb

diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
new file mode 100644
index 0000000..33a93f4
--- /dev/null
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -0,0 +1,26 @@
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
+}
-- 
2.0.0


