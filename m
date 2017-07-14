Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB37777629
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 08:37:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6E8bDdk010722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 01:37:14 -0700 (PDT)
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.163.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Fri, 14 Jul 2017 01:37:13 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jul 2017 16:37:08 +0800
Message-ID: <1500021428-7337-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.131]
Cc: yue.tao@windriver.com
Subject: [meta-yocto][PATCH] yocto-bsp: insert the path of argparse_oe.py into libpath
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
X-List-Received-Date: Fri, 14 Jul 2017 08:37:14 -0000
Content-Type: text/plain

Issue: LIN9-4616

Finding the path of argparse_oe.py in env PATH. Usually, it
can be found in project/scripts/lib, or oe-core/scripts/lib.
Find the first one and insert it into libpath.

(LOCAL REV: NOT UPSTREAM) -- pending

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 scripts/yocto-bsp |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index 6fb1f41..fdd3ed2 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -35,6 +35,13 @@ import sys
 import argparse
 import logging
 
+path_from_env = os.getenv('PATH').split(':')
+for script_path in path_from_env:
+    if script_path.endswith('scripts'):
+        if os.path.exists(os.path.join(script_path, 'lib/argparse_oe.py')):
+            sys.path.insert(0, script_path + '/lib')
+            break
+
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, scripts_path + '/lib')
 import argparse_oe
-- 
1.7.9.5


