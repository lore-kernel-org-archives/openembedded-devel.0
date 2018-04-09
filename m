Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6795C74B60
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 03:34:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w393Y42q024528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Apr 2018 20:34:05 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 8 Apr 2018 20:34:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Apr 2018 11:30:50 +0800
Message-ID: <20180409033050.27114-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: update to 1.2.4
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
X-List-Received-Date: Mon, 09 Apr 2018 03:34:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Update to 1.2.4 to fix significant BGP security issues:

* https://www.quagga.net/security/Quagga-2018-0543.txt(CVE-2018-5378)
* https://www.quagga.net/security/Quagga-2018-1114.txt(CVE-2018-5379)
* https://www.quagga.net/security/Quagga-2018-1550.txt(CVE-2018-5380)
* https://www.quagga.net/security/Quagga-2018-1975.txt(CVE-2018-5381)

Detail release notes:
http://savannah.nongnu.org/forum/forum.php?forum_id=9099
http://savannah.nongnu.org/forum/forum.php?forum_id=9095

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-protocols/quagga/{quagga_1.2.2.bb => quagga_1.2.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/quagga/{quagga_1.2.2.bb => quagga_1.2.4.bb} (12%)

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
similarity index 12%
rename from meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
rename to meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
index 653f46b36..a7697a1ae 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
@@ -1,4 +1,4 @@
 require quagga.inc
 
-SRC_URI[md5sum] = "e84be2938c26c0c872792090f1a6a866"
-SRC_URI[sha256sum] = "522e22f2beee64e3f0c2cde3d0155f3b8103f4f6fc8abef92cb40bc3a4cc2931"
+SRC_URI[md5sum] = "eced21b054d71c9e1b7c6ac43286a166"
+SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3"
-- 
2.11.0


