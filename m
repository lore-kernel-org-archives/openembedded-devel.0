Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6C67E646
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 05:50:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5K5oMRZ021988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2019 22:50:33 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 19 Jun 2019 22:50:11 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Jun 2019 22:50:11 -0700
Message-ID: <20190620055011.71854-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-lxml: replace -Og with -O for mips64-32
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
X-List-Received-Date: Thu, 20 Jun 2019 05:50:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

With below logic in local.conf:
MACHINE ??= "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf
DEBUG_BUILD = "1"
$ bitbake lib32-python-lxml
[snip]
| {standard input}: Assembler messages:
| {standard input}:1488805: Error: branch out of range
| Compile failed: command 'mips-pokymllib32-linux-gcc' failed with exit status 1
| creating tmp
| cc -I/yocto/builds//tmp/work/mips-pokymllib32-linux/lib32-python-lxml/4.3.4-r0/lib32-recipe-sysroot/usr/include/libxml2 -I/usr/include/libxml2 -c /tmp/xmlXPathInitPZiWuM.c -o tmp/xmlXPathInitPZiWuM.o
| unable to execute 'cc': No such file or directory
[snip]

When DEBUG_BUILD enabled, -Og pass to compiler,
replace -Og with -O to fix the above compile error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index d67c17883..dd73a412b 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -33,6 +33,18 @@ DISTUTILS_INSTALL_ARGS += " \
 
 inherit pypi
 
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
+DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
+DEBUG_OPTIMIZATION_append_mipsel = " -O"
+BUILD_OPTIMIZATION_remove_mipsel = " -Og"
+BUILD_OPTIMIZATION_append_mipsel = " -O"
+
 do_configure_prepend() {
     sed -i -e 's/--version/--modversion/' ${B}/setupinfo.py
 }
-- 
2.21.0


