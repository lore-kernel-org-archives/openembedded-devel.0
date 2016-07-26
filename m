Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C064606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 06:19:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q6Jf6m020831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 23:19:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Jul 2016 23:19:40 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jul 2016 14:16:46 +0800
Message-ID: <1469513806-12568-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] efivar: add COMPATIBLE_HOST item
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
X-List-Received-Date: Tue, 26 Jul 2016 06:19:41 -0000
Content-Type: text/plain

* Add COMPATIBLE_HOST item to avoid build error
  on mips and ppc as efivar actually a UEFI tool
  which is specific to x86 and arm.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/efivar/efivar_0.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
index 046cad9..5879031 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 DEPENDS_class-target = "popt efivar-native"
 
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
 SRCREV = "7367d78281fa3ce390e10c7c9f4608c58e7a6d3d"
 SRC_URI = "git://github.com/rhinstaller/efivar.git"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
-- 
2.8.1


