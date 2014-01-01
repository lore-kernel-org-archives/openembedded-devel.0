Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 645676B89F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:33 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so5846428ead.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dP95guqyZIFf7muLVEBqW4Q30X7D49DDJw0tyvKR0rw=;
	b=aAr705OEN0l7kOpucB93ELQPhe8S1dvmOyFF88tKDTF4MAnxOz/NrUTki7uVmEwwyP
	pl6yv2kd3TfXyZxTFJPbArnsh2ngq8rqk5vvto7tMpWgobTz+7sJKKblzfx5JKGaBYop
	c5YGdS1w2JznL1ojB3ABk7hpU0LpUHo2J+h8wN9jAJ7PZymT2bujlm7Ze7vPONTPoZ9f
	ZOTMOZItNz1AIx0wCkD9lyjdohQR0FBP5cSpz3RHSLA0nPVylvYMyWtJ3SWribPAi+hw
	Vo0ASBqynwWNQsfSM18SLouUxAXSApAxE8MBe+ErOl+6gps0LwkOAzxPukjdCmINbjPl
	K7wQ==
X-Received: by 10.15.65.1 with SMTP id p1mr4606735eex.108.1388581054111;
	Wed, 01 Jan 2014 04:57:34 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm126867069eeo.17.2014.01.01.04.57.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:26 +0100
Message-Id: <1388581046-8713-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 8/8] cloud9: Fix branch param
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.8.4.3


