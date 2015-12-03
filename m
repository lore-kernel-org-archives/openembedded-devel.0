Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFF236FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:30:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB38URm1023908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 00:30:27 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 00:30:26 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 16:18:45 +0800
Message-ID: <1449130728-4066-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 1/4] libipc-signal-perl: add recipe
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
X-List-Received-Date: Thu, 03 Dec 2015 08:30:29 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libipc-signal-perl is required by mime-construct and
libproc-waitstat-perl.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-perl/libipc/libipc-signal-perl_1.00.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
new file mode 100644
index 0000000..b518164
--- /dev/null
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -0,0 +1,18 @@
+SUMMARY = "IPC::Signal - Utility functions dealing with signals"
+DESCRIPTION = "IPC::Signal - This module contains utility functions for \
+dealing with signals."
+
+HOMEPAGE = "http://search.cpan.org/~rosch/IPC-Signal-1.00/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
+
+S = "${WORKDIR}/IPC-Signal-${PV}"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4cebf17fdf1785eaf8c151bf2e8c360a"
+SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
+
+inherit cpan
-- 
2.6.1


