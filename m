Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id CED5B77051
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:55:20 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u7JCtKEi028194
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:55:20 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.45])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u7JCtK73024614;
	Fri, 19 Aug 2016 14:55:20 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 14:55:13 +0200
Message-Id: <1471611313-1478-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] nodejs, arm: map TUNE_FEATURES to --with-arm-fpu parameters
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
X-List-Received-Date: Fri, 19 Aug 2016 12:55:21 -0000

The same code is used in the nodejs recipe from meta-nodejs

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
index 95a2048..88b0e87 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.7.bb
@@ -30,7 +30,11 @@ def map_nodejs_arch(a, d):
     elif re.match('powerpc$', a): return 'ppc'
     return a
 
-ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
+ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)} \
+                 ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-arm-fpu=neon', \
+                    bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '--with-arm-fpu=vfpv3-d16', \
+                    bb.utils.contains('TUNE_FEATURES', 'vfpv3', '--with-arm-fpu=vfpv3', \
+                    '--with-arm-fpu=vfp', d), d), d)}"
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-- 
2.1.4


