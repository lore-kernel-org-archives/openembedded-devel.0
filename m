Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13C7F7D7AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 05:55:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3S5tafX021897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 22:55:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sat, 27 Apr 2019 22:55:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Apr 2019 13:55:34 +0800
Message-ID: <1556430934-190585-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: fix compile error
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
X-List-Received-Date: Sun, 28 Apr 2019 05:55:36 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

configuration:
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
DEBUG_BUILD = "1"
EXTRA_IMAGE_FEATURES += "dbg-pkgs"

with above configuration and option -Og, postgresql compile failed with:
| make[4]: Nothing to be done for 'all'.
| make[4]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/fe_utils'
| {standard input}: Assembler messages:
| {standard input}:58887: Error: branch out of range
| <builtin>: recipe for target 'tab-complete.o' failed
| make[3]: *** [tab-complete.o] Error 1
| make[3]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/bin/psql'
| Makefile:41: recipe for target 'all-psql-recurse' failed
| make[2]: *** [all-psql-recurse] Error 2

replace -Og with -O to fix this error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 85f1917..1d985a4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -72,6 +72,11 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
 EXTRA_OECONF_sh4 += "--disable-spinlocks"
 EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
 PACKAGES_DYNAMIC += "^${PN}-plperl \
     ^${PN}-pltcl \
     ^${PN}-plpython \
-- 
2.7.4


