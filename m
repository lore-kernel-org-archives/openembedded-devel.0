Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8DC97E90C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:45:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S1jRIR014320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:45:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:45:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:45:26 +0800
Message-ID: <1561686326-11590-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd-utils: upgrade 9.8.0 -> 9.10.0
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
X-List-Received-Date: Fri, 28 Jun 2019 01:45:27 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../drbd/{drbd-utils_9.8.0.bb => drbd-utils_9.10.0.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.8.0.bb => drbd-utils_9.10.0.bb} (94%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
similarity index 94%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
index 70e04b9..d1189f1 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.8.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
           "
-# v9.8.0
-SRCREV_drbd-utils = "c30216b49330216bf8a567b7727da6e24f099f08"
-SRCREV_drbd-headers = "2357a11fb49bcbadf6b490e6d4cfe982a3d24813"
+# v9.10.0
+SRCREV_drbd-utils = "147860216bf307433e2d0d7cfd6fad3642027b8d"
+SRCREV_drbd-headers = "0955b3423f08f8e11ff05092bc1b766609fd804b"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


