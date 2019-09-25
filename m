Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11C7C7E543
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P9ZqTl019805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:35:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:35 +0800
Message-ID: <1c900ec3f7272b972d3713985fc977b52b0a774d.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] python-incremental: Drop broken nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:17 -0000
Content-Type: text/plain

The nativesdk-python3-incremental doesn't work since lacks of dependencies, and
hard to satisfy that, I tried to extend the following ones' nativesdk, but it
still didn't work:
python-automat
python-constantly
python-hyperlink
python-twisted
python-zopeinterface

So just drop the broken nativesdk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/python-incremental.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
index b63fac9..ef5e903 100644
--- a/meta-python/recipes-devtools/python/python-incremental.inc
+++ b/meta-python/recipes-devtools/python/python-incremental.inc
@@ -17,4 +17,4 @@ RDEPENDS_${PN} += " \
 # prevent a circular dependency. The build apparently does not use the part of
 # python-incremental which uses python-twisted, so this hack is OK.
 RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
-- 
2.7.4


