Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96EC96B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 00:58:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5E0wX2l001517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Jun 2017 17:58:34 -0700 (PDT)
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Jun 2017 17:58:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Jun 2017 08:58:31 +0800
Message-ID: <20170614005831.14549-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libdevmapper: sync with lvm2 2.02.171
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
X-List-Received-Date: Wed, 14 Jun 2017 00:58:38 -0000
Content-Type: text/plain

Both of libdevmapper and lvm2 should have the same version.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../lvm2/{libdevmapper_2.02.166.bb => libdevmapper_2.02.171.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.166.bb => libdevmapper_2.02.171.bb} (63%)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb
similarity index 63%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb
index 3cf939d..b6ae902 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.171.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "c5a54ee0b86703daaad6e856439e115a"
-SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
+SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
+SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
 
 DEPENDS += "autoconf-archive-native"
 
-- 
2.9.3


