Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TVjDJ-0005xX-CV
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 14:29:10 +0100
Received: from localhost ([127.0.0.1]:39445 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVj00-00060r-Aq; Tue, 06 Nov 2012 13:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=x1jf/buaO4FAl12zxsY0AdVS
	IVg=; b=vbGNnvLoE0iQUQBJWo44DESQNSHS/AXedddmBRJaUo1SNQYAxiiRjY6J
	+KnQzpv/ACSfL4d0kFQZM0I/IoPKUSb1WwhXd3nCzSS5oSL2gDJD9hfzHbAyYma5
	SX+qPCOO0yPZGAgdQDWKkidt6951frO0vZVfUq5bqoQufIr7KHw=
Received: from [195.171.99.130] (port=46854 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TVj00-00060n-6y; Tue, 06 Nov 2012 13:15:24 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Nov 2012 13:17:20 +0000
Message-Id: <1352207841-25397-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH v2 1/2] hiawatha: update to 8.6
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
X-List-Received-Date: Tue, 06 Nov 2012 13:29:10 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/{hiawatha_8.5.bb => hiawatha_8.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_8.5.bb => hiawatha_8.6.bb} (91%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 71cc885..393e77f 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -9,8 +9,8 @@ SECTION = "net"
 SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
            file://hiawatha-init"
 
-SRC_URI[md5sum] = "71d3903657953c93fc930758d158097d"
-SRC_URI[sha256sum] = "2567e6b4b4c6666388087b586238e6e91a4afd80e10a879920020a097fcdc946"
+SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
+SRC_URI[sha256sum] = "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
 
 inherit cmake update-rc.d
 
-- 
1.8.0



