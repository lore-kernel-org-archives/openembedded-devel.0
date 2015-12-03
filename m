Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7272D6FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:30:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB38USis009870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 00:30:28 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 00:30:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 16:18:46 +0800
Message-ID: <1449130728-4066-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 2/4] libproc-waitstat-perl: add recipe
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
X-List-Received-Date: Thu, 03 Dec 2015 08:30:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libproc-waitstat-perl is required by mime-construct.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libproc/libproc-waitstat-perl_1.00.bb            | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
new file mode 100644
index 0000000..1599e61
--- /dev/null
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Interpret and act on wait() status values"
+DESCRIPTION = "This module contains functions for interpreting and acting \
+on wait status values."
+
+HOMEPAGE = "http://search.cpan.org/~rosch/Proc-WaitStat/"
+SECTION = "libraries"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=21;endline=23;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
+
+RDEPENDS_${PN} += "perl libipc-signal-perl"
+
+S = "${WORKDIR}/Proc-WaitStat-${PV}"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b911bd579b6b142391b21de1efa30c95"
+SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
+
+inherit cpan
-- 
2.6.1


