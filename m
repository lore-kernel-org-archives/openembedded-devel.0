Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F82D731A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:52:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6F5quWi027270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 22:52:56 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 22:52:55 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jul 2016 13:50:43 +0800
Message-ID: <1468561844-10190-4-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
References: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] grubby: add ptest support
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
X-List-Received-Date: Fri, 15 Jul 2016 05:52:56 -0000
Content-Type: text/plain

* Add ptest support

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/grubby/grubby/run-ptest | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-oe/recipes-support/grubby/grubby/run-ptest

diff --git a/meta-oe/recipes-support/grubby/grubby/run-ptest b/meta-oe/recipes-support/grubby/grubby/run-ptest
new file mode 100644
index 0000000..b06ac59
--- /dev/null
+++ b/meta-oe/recipes-support/grubby/grubby/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+./test.sh -v
-- 
2.8.1


