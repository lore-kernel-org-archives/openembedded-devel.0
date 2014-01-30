Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 44A3E6E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 16:41:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2014 08:41:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,750,1384329600"; d="scan'208";a="447151178"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2014 08:41:25 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0UGZPdo007769; Thu, 30 Jan 2014 16:35:25 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id s0UGZPHs010005;
	Thu, 30 Jan 2014 16:35:25 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id s0UGZPGa010001;
	Thu, 30 Jan 2014 16:35:25 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jan 2014 16:35:14 +0000
Message-Id: <1391099714-9945-2-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
In-Reply-To: <1391099714-9945-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1391099714-9945-1-git-send-email-krzysztof.m.sywula@intel.com>
Cc: eric@eukrea.com
Subject: [dylan][PATCH 2/2] cloud9: Fix branch param
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
X-List-Received-Date: Thu, 30 Jan 2014 16:41:27 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index a755470..44b2142 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/ace.wiki.git;destsuffix=git/support/ace/doc/wiki;name=acewiki \
            git://github.com/ajaxorg/apf.git;destsuffix=git/support/apf;name=apf \
            git://github.com/ajaxorg/async.js.git;destsuffix=git/support/asyncjs;name=asyncjs \
-           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect \
+           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect;branch=ajaxorg \
            git://github.com/jashkenas/coffee-script.git;destsuffix=git/support/connect/support/coffee-script;name=coffee-script \
            git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
            git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
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


