Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D01B7893C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RdXj000546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:39 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:25 +0800
Message-ID: <1532489252-246963-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] drbd-utils: upgrade 9.4.0 -> 9.5.0
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../drbd/{drbd-utils_9.4.0.bb => drbd-utils_9.5.0.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.4.0.bb => drbd-utils_9.5.0.bb} (93%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
similarity index 93%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
index 98d4a49..0e3f952 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
@@ -12,9 +12,9 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
            file://0001-drbd-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch \
           "
-# v9.4.0
-SRCREV_drbd-utils = "eff6423ee72931aa0f8d0eb51742acee7c7cd3e1"
-SRCREV_drbd-headers = "d9ef0576d0f29992e0539ed7ca14d4f12658cd25"
+# v9.5.0
+SRCREV_drbd-utils = "ee126652638328b55dc6bff47d07d6161ab768db"
+SRCREV_drbd-headers = "b47cc11bcabe1a65c40ad23f71dcaf2da6419630"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


