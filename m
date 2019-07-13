Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3987E993
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2019 03:52:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6D3qKku028261
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:52:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 12 Jul 2019 20:52:09 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 13 Jul 2019 11:52:08 +0800
Message-ID: <1562989928-131914-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] drbd-utils: Fix netlink failure with nested attributes for kernel v5.2
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
X-List-Received-Date: Sat, 13 Jul 2019 03:52:39 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Bump up SRCREV_drbd-utils to includes two more commits to fix the following
netlink failure with nested attributes.

$ drbdsetup new-resource r0
Invalid argument

92ade5989027 ("netlink: prepare for kernel v5.2")
859151b228d3 ("netlink: Add NLA_F_NESTED flag to nested attribute")

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Add failure met in commit log

 meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
index d1189f1..5aeef7b 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
           "
 # v9.10.0
-SRCREV_drbd-utils = "147860216bf307433e2d0d7cfd6fad3642027b8d"
+SRCREV_drbd-utils = "859151b228d3b3aacefb09d06d515a2589c22e35"
 SRCREV_drbd-headers = "0955b3423f08f8e11ff05092bc1b766609fd804b"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


