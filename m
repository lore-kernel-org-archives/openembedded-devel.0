Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90FAE606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 07:03:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8473fCa012053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Sep 2017 00:03:41 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Sep 2017 00:03:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 15:02:51 +0800
Message-ID: <20170904070251.23140-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] protobuf-c: set downloadfilename
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
X-List-Received-Date: Mon, 04 Sep 2017 07:03:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Set downloadfilename to avoid the file name without
package name like v{PV}.tar.gz.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
index 40fb96cf4..696e84ed5 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "protobuf-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
-SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 
 SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
 SRC_URI[sha256sum] = "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
-- 
2.11.0


