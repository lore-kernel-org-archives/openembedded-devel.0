Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 461A671AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 07:20:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8R7KSKU018688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2018 00:20:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Sep 2018 00:20:28 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 15:20:26 +0800
Message-ID: <1538032826-389294-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538032620-166793-1-git-send-email-mingli.yu@windriver.com>
References: <1538032620-166793-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] efivar: make CC_FOR_BUILD value complete
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
X-List-Received-Date: Thu, 27 Sep 2018 07:20:28 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update CC_FOR_BUILD=${BUILD_CC} to
CC_FOR_BUILD="${BUILD_CC}" to guarantee
the BUILD_CC value passed to CC_FOR_BUILD
completely to avoid below build failure
when ccache enabled:
| NOTE: make -j 48 -C src makeguids CC_FOR_BUILD=ccache gcc
| make: Entering directory '/mybuild/tmp-glibc/work/x86_64-linux/efivar-native/0.36-r0/git/src'
| ccache -isystem/mybuild/tmp-glibc/work/x86_64-linux/efivar-native/0.36-r0/recipe-sysroot-native/usr/include -O2 -pipe ... -DEFIVAR_BUILD_ENVIRONMENT -o makeguids makeguids.c guid.c -ldl
| ccache: invalid option -- 'i'

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-bsp/efivar/efivar_0.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_0.36.bb b/meta-oe/recipes-bsp/efivar/efivar_0.36.bb
index dfb46c2..20588ee 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_0.36.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_0.36.bb
@@ -29,7 +29,7 @@ do_compile_prepend() {
 }
 
 do_compile_class-native() {
-    oe_runmake -C src makeguids CC_FOR_BUILD=${BUILD_CC}
+    oe_runmake -C src makeguids CC_FOR_BUILD="${BUILD_CC}"
 }
 
 do_install() {
-- 
2.7.4


