Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBgGC-0001hl-5m
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 08:17:16 +0200
Received: by obblz20 with SMTP id lz20so2115227obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 23:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=z4zuiLVKDw9HZTgDDpGHYH4kpwKS5IhbAZjkcUUsF3E=;
	b=BDD4FRJcdUufgslFZbDOKU6LS4Sh36U+zqVtdGyRYnPxx9ZgNCwYMy3MG0gO8WdiVv
	Frk49pJavKFiFup1vW8PxmPZVzgrm3LXqsPGpYxNZL3V9OyRyJKrrkwlHlFI8ADbFqtz
	zoe+WuKKXttc2YF3UEIh6R3aAO3KV5gfmmlrizZ61r3vGBm9G9r6P0L/J6VYb9uii7WI
	Hp2NM5l9ZMtAZNyh0lU2mDcMMhnZTdx9it2N7//DDRdtR6Wp9v0ZoLO8K9U3lkrsCj4r
	7WFXDhG+Iu42gD+stkw4WyJlWi87wjvNOjiBySeo3A1E99+2oIL/IfHGTIy/YYoIo1zu
	bozw==
Received: by 10.182.119.72 with SMTP id ks8mr20855030obb.10.1347429884091;
	Tue, 11 Sep 2012 23:04:44 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ql3sm19072887obc.17.2012.09.11.23.04.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 23:04:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 23:03:35 -0700
Message-Id: <1347429815-19634-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1347429815-19634-1-git-send-email-raj.khem@gmail.com>
References: <1347429815-19634-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V5 2/2] blacklist.bbclass: Remove
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
X-List-Received-Date: Wed, 12 Sep 2012 06:17:16 -0000

moved into OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/blacklist.bbclass |   20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/classes/blacklist.bbclass

diff --git a/meta-oe/classes/blacklist.bbclass b/meta-oe/classes/blacklist.bbclass
deleted file mode 100644
index 7bf4a73..0000000
--- a/meta-oe/classes/blacklist.bbclass
+++ /dev/null
@@ -1,20 +0,0 @@
-# anonymous support class from angstrom
-# 
-# Features:
-#
-# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
-#
-
-python () {
-    import bb
-
-    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
-    pkgnm = bb.data.getVar("PN", d, 1)
-    distro = bb.data.getVar("DISTRO", d, 1)
-
-    if blacklist:
-	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
-
-}
-
-- 
1.7.9.5



