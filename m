Return-Path: <Jibin.Xu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F24A6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:37:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAO9bl7O010784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 01:37:48 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 24 Nov 2017 01:37:46 -0800
From: Jibin Xu <jibin.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Nov 2017 01:37:44 -0800
Message-ID: <20171124093744.182166-1-jibin.xu@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cdrkit: add a link to genisoimage with the name mkisofs
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
X-List-Received-Date: Fri, 24 Nov 2017 09:37:47 -0000
Content-Type: text/plain

cdrkit only install genisoimage by default,but most tools use
mkisofs to generate an ISO9660/JOLIET/HFS hybrid filesystem,
so add a link to genisoimage with the name mkisofs to support
these tools.

Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index c0f220fa6..3b10e978e 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -18,3 +18,7 @@ inherit cmake
 
 DEPENDS = "libcap file bzip2"
 RDEPENDS_${PN} = "perl"
+
+do_install_append() {
+    ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
+}
-- 
2.13.0


