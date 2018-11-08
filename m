Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC92079EB4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:17:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA86Hp0n021515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:17:51 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:17:50 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:17:49 +0800
Message-ID: <1541657869-31790-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tk: extend to nativesdk
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
X-List-Received-Date: Thu, 08 Nov 2018 06:17:51 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After enable tk via PACKAGECONFIG for python3,
there comes below error:
Missing or unbuildable dependency chain was: ['buildtools-tarball', 'nativesdk-python3', 'nativesdk-tk']

Extend tk to nativesdk to fix this issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
index 13dc4d7..10281b2 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb
@@ -73,7 +73,7 @@ FILES_${PN} += "${libdir}/tk*"
 RDEPENDS_${PN} += "tk-lib"
 RDEPENDS_${PN}_class-native = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*Config.sh"
-- 
2.7.4


