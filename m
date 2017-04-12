Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07C7D77C72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 01:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C1hmZ6006149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 18:43:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 18:43:48 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 12 Apr 2017 09:42:01 +0800
Message-ID: <20170412014201.23476-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170412014201.23476-1-kai.kang@windriver.com>
References: <20170412014201.23476-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] opencv: correct subpackage name for multilib
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
X-List-Received-Date: Wed, 12 Apr 2017 01:43:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Subpackage python3-${PN} is not right for multilib and it will be
extended to such as lib32-python3-lib32-opencv.

Replace PN with BPN to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index b5b4968..2cff212 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -97,8 +97,8 @@ TARGET_CC_ARCH += "-I${S}/include "
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${PN}', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${PN}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '', d)} \
     ${PN}-apps"
 
 python populate_packages_prepend () {
-- 
2.10.1


