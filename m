Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8043A7844A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 02:42:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5G2geND007616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 19:42:40 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Jun 2017 19:42:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jun 2017 10:42:38 +0800
Message-ID: <20170616024238.13262-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libfile-slurp-perl: add new recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 02:42:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This module provides subroutines to read or write
entire files with a simple call.  It also has a
subroutine for reading the list of filenames
in a directory.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libfile/libfile-slurp-perl_9999.19.bb             | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
new file mode 100644
index 000000000..945b4c1c8
--- /dev/null
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Slurp entire files into variables."
+DESCRIPTION = "This module provides subroutines to read or write \
+  entire files with a simple call.  It also has a subroutine for \
+  reading the list of filenames in a directory. \
+"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
+
+S = "${WORKDIR}/File-Slurp-${PV}"
+
+inherit cpan
+
+SRC_URI[md5sum] = "7d584cd15c4f8b9547765eff8c4ef078"
+SRC_URI[sha256sum] = "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
+
+BBCLASSEXTEND="native"
-- 
2.11.0


