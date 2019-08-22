Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 314447F07B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:23:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M9NYlx000896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:23:34 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 22 Aug 2019 02:23:33 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Aug 2019 17:23:19 +0800
Message-ID: <1566465799-45676-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-cgl][PATCH] kernel: fix the recipe that changes signatures
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
X-List-Received-Date: Thu, 22 Aug 2019 09:23:33 -0000
Content-Type: text/plain

When test using "yocto-check-layer-wrapper .../meta-cgl
--dependency xxx", error occurs:
FAIL: test_signatures (common.CommonCheckLayer)
   linux-yocto:do_fetch: 84ac07191eb371845b8773179913d4f1 -> c36d7d453aca36c5e8dd30644a2e9963
...
      basehash changed from 3a89fab4c77b51a9ef3ece5eb1270759 to 1e9697c5c2a85520ea36ec5845125f8e
      Variable SRC_URI value changed:...

test_signatures are tests to be sure that BSP and DISTRO layers do not
come with recipes that change signatures, so here remove the NULL
SRC_URI operation.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-cgl-common/recipes-kernel/linux/linux-yocto_4.%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-cgl-common/recipes-kernel/linux/linux-yocto_4.%.bbappend b/meta-cgl-common/recipes-kernel/linux/linux-yocto_4.%.bbappend
index 9d1735f..2b9c157 100644
--- a/meta-cgl-common/recipes-kernel/linux/linux-yocto_4.%.bbappend
+++ b/meta-cgl-common/recipes-kernel/linux/linux-yocto_4.%.bbappend
@@ -1,3 +1 @@
 require cgl-common.inc
-
-SRC_URI += ""
-- 
1.9.1


