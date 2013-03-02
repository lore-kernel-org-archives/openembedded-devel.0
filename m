Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UBlJz-0005nV-HO
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 13:13:51 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id B795DEA04E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2013 13:15:41 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 14224A43448; Sat,  2 Mar 2013 12:57:33 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2013 12:57:05 +0100
Message-Id: <a6ae4b8eabff550f5a82af6f2eb0b17c7dafaf43.1362223895.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <f60395b6f7952d3cbfa5c04f06e3c4e327d2e4d4.1362223895.git.apelete@seketeli.net>
References: <f60395b6f7952d3cbfa5c04f06e3c4e327d2e4d4.1362223895.git.apelete@seketeli.net>
In-Reply-To: <cover.1362223895.git.apelete@seketeli.net>
References: <cover.1362223895.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 4/7] netbase: update SRC_URI
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
X-List-Received-Date: Sat, 02 Mar 2013 12:14:00 -0000

Update SRC_URI to downloads.yoctoproject.org since netbase source
package is no longer available from developer.irexnet.com.
---
 recipes/netbase/netbase_4.21.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 075c9db..b46b363 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -17,7 +17,7 @@ INITSCRIPT_PARAMS_openmn = "start 85 1 2 3 4 5 . stop 85 0 6 1 ."
 INITSCRIPT_PARAMS_slugos = "start 42 S 0 6 ."
 
 SRC_URI = "\
-  http://developer.irexnet.com/pub/iOn/Sources/1.0/Third%20party/all/netbase-${PV}.tar.gz \
+  http://downloads.yoctoproject.org/mirror/sources/netbase-${PV}.tar.gz \
   file://options \
   file://init \
   file://hosts \
-- 
1.7.10.4



