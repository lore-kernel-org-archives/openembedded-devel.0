Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32C706E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:52:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F5qvWG024024
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 22:52:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 22:52:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jul 2016 13:50:44 +0800
Message-ID: <1468561844-10190-5-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
References: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] grubby: remove bashisms in test.sh
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
X-List-Received-Date: Fri, 15 Jul 2016 05:52:57 -0000
Content-Type: text/plain

* Update #!/bin/bash to #!/bin/sh in test.sh to remove
  bashisms

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../grubby/grubby-remove-bashisms-in-test.sh.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch

diff --git a/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
new file mode 100644
index 0000000..6734e7f
--- /dev/null
+++ b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
@@ -0,0 +1,29 @@
+From c3a004b8d6dff1a767573dd7baf5d45efddb9f2b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 15 Jul 2016 11:23:17 +0800
+Subject: [PATCH] grubby: remove bashisms in test.sh
+
+* Update #!/bin/bash to #!/bin/sh in test.sh to
+  remove below warning:
+  QA Issue: /usr/lib/grubby/ptest/test.sh contained
+  in package grubby-ptest requires /bin/bash, but no
+  providers found in RDEPENDS_grubby-ptest? [file-rdeps]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test.sh b/test.sh
+index f738388..f3537f3 100755
+--- a/test.sh
++++ b/test.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # test.sh -- grubby regression tests
+ #
+-- 
+2.8.1
+
-- 
2.8.1


