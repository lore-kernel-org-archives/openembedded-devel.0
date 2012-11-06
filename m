Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TVjDJ-0005xY-FG
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 14:29:10 +0100
Received: from localhost ([127.0.0.1]:36543 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVj00-00060v-Jr; Tue, 06 Nov 2012 13:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=3
	m6D1pNvZETEhbwkjyb4rxZML70=; b=MBV2WHXPMDK6DJ6QvLECiFXvWHxzzBREu
	H/Jmhpti7rc1kqmkLijk7IjMkTTiI2jFug6kLtx2dIg00ZXFCHgg9d/I5iGdT262
	RTICW5CK1bUuO2QL5YsWO6ICw5S/f0kS81KyHX4SoybUkcziHXIwJLCp0LAl6NYN
	k7s0kHAgO0=
Received: from [195.171.99.130] (port=46854 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVj00-00060n-G4; Tue, 06 Nov 2012 13:15:24 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Nov 2012 13:17:21 +0000
Message-Id: <1352207841-25397-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1352207841-25397-1-git-send-email-ml@communistcode.co.uk>
References: <1352207841-25397-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH v2 2/2] hiawatha: disable caching by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2012 13:29:11 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Caching shouldn't be on by default as it can cause some unpredictable
results in certain situations.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 393e77f..2e6955e 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -18,7 +18,7 @@ INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
 
 EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
-                  -DENABLE_CACHE=ON \
+                  -DENABLE_CACHE=OFF \
                   -DENABLE_DEBUG=OFF \
                   -DENABLE_SSL=OFF \
                   -DENABLE_TOOLKIT=OFF \
-- 
1.8.0



