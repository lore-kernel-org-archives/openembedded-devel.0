Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6942607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:39:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M8d4JS008475
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 01:39:04 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jul 2016 01:39:03 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jul 2016 11:45:10 +0300
Message-ID: <1469177110-20361-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python-pygpgme: update ptest output format
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
X-List-Received-Date: Fri, 22 Jul 2016 08:39:04 -0000
Content-Type: text/plain

The output format was updated to match yocto ptest rules:
<result>: <testname>
where the result can be PASS, FAIL, or SKIP, and the testname
can be any identifying string.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-python/recipes-devtools/python/python-pygpgme/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pygpgme/run-ptest b/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
index ac867e2..ce2abb6 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
+++ b/meta-python/recipes-devtools/python/python-pygpgme/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-GPG_AGENT_INFO= python test_all.py -v
+GPG_AGENT_INFO= python test_all.py -v 2>&1 | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
-- 
2.7.4


