Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 663B06EA12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 16:46:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jan 2014 08:41:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,750,1384329600"; d="scan'208";a="447154182"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2014 08:46:00 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0UGZNq8007762; Thu, 30 Jan 2014 16:35:23 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id s0UGZNgg009996;
	Thu, 30 Jan 2014 16:35:23 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id s0UGZMkJ009992;
	Thu, 30 Jan 2014 16:35:22 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jan 2014 16:35:13 +0000
Message-Id: <1391099714-9945-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Cc: Dale Schaafsma <dales773@hotmail.com>, eric@eukrea.com
Subject: [dylan][PATCH 1/2] cloud9: update repository for sass.js
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 16:46:03 -0000

From: Jason Kridner <jdk@ti.com>

Updated repository location due to old repository being removed.

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg32587.html

Signed-off-by: Jason Kridner <jdk@ti.com>
Cc: Dale Schaafsma <dales773@hotmail.com>
Acked-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 3300fd2..a755470 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r4"
+PR = "r5"
 
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
            git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
            git://github.com/cloudhead/less.js.git;destsuffix=git/support/connect/support/less;name=less \
-           git://github.com/visionmedia/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
+           git://github.com/matehat/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
            git://github.com/ajaxorg/jsDAV.git;destsuffix=git/support/jsdav;name=jsdav \
            git://github.com/fjakobs/async.js.git;destsuffix=git/support/jsdav/support/async.js;name=async-js \
            git://github.com/felixge/node-formidable.git;destsuffix=git/support/jsdav/support/formidable;name=formidable \
-- 
1.7.12.2


