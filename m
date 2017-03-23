Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4DFE71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:05:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2N35A0P031259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 22 Mar 2017 20:05:11 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 22 Mar 2017 20:05:10 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Thu, 23 Mar 2017 11:04:55 +0800
Message-ID: <20170323030455.3272-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libdnet: update SRC_URI
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
X-List-Received-Date: Thu, 23 Mar 2017 03:05:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The official homepage libdnet.googlecode.com has been redirected to
github. So update SRC_URI to use git repo on github.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index 28b6c82..f48b655 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
-SRC_URI = "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
+SRC_URI = "git://github.com/dugsong/libdnet.git;nobranch=1"
+SRCREV = "12fca29a6d4e99d1b923d6820887fe7b24226904"
 
-SRC_URI[md5sum] = "9253ef6de1b5e28e9c9a62b882e44cc9"
-SRC_URI[sha256sum] = "83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
2.10.1


