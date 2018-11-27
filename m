Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DCFB76D1B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8Gdvh020292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:16:39 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:40 +0800
Message-ID: <36da9f6b42ded54e40a3730abf8b250cbb38e132.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 06/12] volume-key: 0.3.11 -> 0.3.12
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:39 -0000
Content-Type: text/plain

Add PACKAGECONFIG to build with python3 rather than python2.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../volume_key/{volume-key_0.3.11.bb => volume-key_0.3.12.bb}     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/volume_key/{volume-key_0.3.11.bb => volume-key_0.3.12.bb} (71%)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
similarity index 71%
rename from meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb
rename to meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index c41b20c..398ca5c 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.11.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "30df56c7743eb7c965293b3d61194232"
-SRC_URI[sha256sum] = "e6b279c25ae477b555f938db2e41818f90c8cde942b0eec92f70b6c772095f6d"
+SRC_URI[md5sum] = "200591290173c3ea71528411838f9080"
+SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd77309b"
 
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
@@ -27,6 +27,10 @@ DEPENDS += " \
     swig-native \
 "
 
+PACKAGECONFIG ??= "python3"
+PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
+PACKAGECONFIG[python3] = "--with-python3,--without-python3,python3,python3"
+
 RDEPENDS_python3-${PN} += "${PN}"
 
 PACKAGES += "python3-${PN}"
-- 
2.7.4


