Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACB73600EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 06:30:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w736UATY020549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 23:30:11 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 2 Aug 2018 23:30:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 14:40:32 +0800
Message-ID: <1533278432-19581-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: tweak location of tmp dir creation
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
X-List-Received-Date: Fri, 03 Aug 2018 06:30:11 -0000
Content-Type: text/plain

The tmp dir creation is out of build dir which has
the risk to be broken by others.
...
|   File "build/tmp-glibc/work/i586-wrs-linux/mozjs/52.8.1-r0/
mozjs-52.8.1/build/moz.configure/util.configure", line 190,
in try_invoke_compiler
|     os.remove(path)
| OSError: [Errno 2] No such file or directory: '/tmp/conftest.OiV37V.cpp'
...

Set var-TMP for tempfile.mktemp to use current build dir to
replace default `/tmp'.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index da80b63..3d79c39 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -49,6 +49,7 @@ EXTRA_OEMAKE_task-install += "STATIC_LIBRARY_NAME=js_static"
 
 do_configure() {
     export SHELL="/bin/sh"
+    export TMP="${B}"
     ${S}/js/src/configure ${EXTRA_OECONF}
 }
 
-- 
2.7.4


