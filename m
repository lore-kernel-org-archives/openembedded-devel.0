Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 923D76E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 15:15:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2014 07:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,750,1384329600"; d="scan'208";a="473281055"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2014 07:15:00 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0UFF0sl020796; Thu, 30 Jan 2014 15:15:00 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id s0UFExO9010804;
	Thu, 30 Jan 2014 15:14:59 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id s0UFExKp010800;
	Thu, 30 Jan 2014 15:14:59 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jan 2014 15:14:25 +0000
Message-Id: <1391094865-10288-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Subject: [dylan][PATCH] cloud9: merging sources list with master
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
X-List-Received-Date: Thu, 30 Jan 2014 15:15:03 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 3300fd2..44b2142 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r4"
+PR = "r5"
 
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
@@ -16,12 +16,12 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/ace.wiki.git;destsuffix=git/support/ace/doc/wiki;name=acewiki \
            git://github.com/ajaxorg/apf.git;destsuffix=git/support/apf;name=apf \
            git://github.com/ajaxorg/async.js.git;destsuffix=git/support/asyncjs;name=asyncjs \
-           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect \
+           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect;branch=ajaxorg \
            git://github.com/jashkenas/coffee-script.git;destsuffix=git/support/connect/support/coffee-script;name=coffee-script \
            git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
            git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
            git://github.com/cloudhead/less.js.git;destsuffix=git/support/connect/support/less;name=less \
-           git://github.com/visionmedia/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
+           git://github.com/matehat/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
            git://github.com/ajaxorg/jsDAV.git;destsuffix=git/support/jsdav;name=jsdav \
            git://github.com/fjakobs/async.js.git;destsuffix=git/support/jsdav/support/async.js;name=async-js \
            git://github.com/felixge/node-formidable.git;destsuffix=git/support/jsdav/support/formidable;name=formidable \
@@ -29,7 +29,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/Gozala/streamer.git;destsuffix=git/support/jsdav/support/jsftp/support/streamer;name=streamer \
            git://github.com/ajaxorg/node-sftp.git;destsuffix=git/support/jsdav/support/node-sftp;name=sftp \
            git://github.com/ajaxorg/lib-v8debug.git;destsuffix=git/support/lib-v8debug;name=lib-v8debug \
-           git://github.com/ajaxorg/socket.io.git;destsuffix=git/support/socket.io;name=socketio \
+           git://github.com/ajaxorg/socket.io.git;destsuffix=git/support/socket.io;name=socketio;branch=cadorn-upstream \
            git://github.com/LearnBoost/socket.io-client.git;destsuffix=git/support/socket.io-client;name=socketio-client \
            git://github.com/ajaxorg/treehugger.git;destsuffix=git/support/treehugger;name=treehugger \
            git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
-- 
1.7.12.2


