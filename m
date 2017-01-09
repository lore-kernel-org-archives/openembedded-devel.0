Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 0082F60123
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:33:06 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v099X68S013768
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Jan 2017 10:33:06 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.145])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v099X5qF007200;
	Mon, 9 Jan 2017 10:33:05 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2017 10:33:02 +0100
Message-Id: <1483954382-4119-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-pytz: provide native and nativesdk version for pytz
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
X-List-Received-Date: Mon, 09 Jan 2017 09:33:07 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

This allows it to be used during build in the setup.py of a package.
Like for example done in the astral PyPi package.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pytz.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 19be2c7..73106da 100755
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -8,8 +8,10 @@ inherit pypi
 SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
 SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
 
-RDEPENDS_${PN} += "\
+RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-threading \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


