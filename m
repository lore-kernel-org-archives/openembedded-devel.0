Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqpRU-0003Ji-0K
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 19:50:44 +0200
Received: by yhjj56 with SMTP id j56so1932990yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5HTiakdSsPAzByGqnFeAMaYz1rdX2XVK20oeOwVSr9w=;
	b=XHZpIFVsbCYTu05ZUAQG0SyebGon9PzAXNvJwoILjOL6K8O6MMmDBVaNTmP+FO6ezx
	Z5GLczIYsSbapG4JB7Fu/yUYiUvJdSndL/LdKIOmOFk+DPFAkGpbxvEkS2msj3P+fo/9
	3YYv8uAFpOXzDVGm0z/9ftEbPGXdicr64aHs7j3RtyODBZBdq9Yq0MEI9kOr9Ocqwl+r
	d9FW4pnEapC5XgTBi7AosR5oiYkUvcLamQGJxuY9X2c92R0sr3ycZY0bLyXPWMrc1+fE
	q2H58CXKT4LDB8jMNJ2lqcUYy7ZSTLEhH5KOueRbaKqkdXzyLNQN2/SYSbUSQwozk8n3
	y+dg==
Received: by 10.66.89.170 with SMTP id bp10mr24421490pab.12.1342460364022;
	Mon, 16 Jul 2012 10:39:24 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ms9sm9490305pbb.43.2012.07.16.10.39.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 10:39:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 10:38:36 -0700
Message-Id: <1342460316-5489-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
Subject: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 17:50:44 -0000

This class is angstrom specific so lets move it to more
appropriate layer

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



