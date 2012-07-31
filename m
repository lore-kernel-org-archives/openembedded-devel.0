Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnd-0001C0-VZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:10 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so10617093pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HkXsILFi3EmC7WpqI5FM+4p7Cjhv+1nraEZWnV+WcgI=;
	b=KHP5WXTSEezmRU9pUs+Rzx84bM7n08G8mLEdJaIkBYbXldoe8QyZLWqwXceRSSu9Na
	APlodosubIyIwcwVz/SwapS+PYLi2TYdpC4G6zXYdoGOmAa9KKmU0z6xEcBAbHV0vxwV
	aMtzUxB7/YskSB03VUB3xH5zDr7ycXVyMuxdKXs/3Cl9m1BiEK2ZtmM3sM4vwxAFuxeQ
	6pJX+7eiIP2cOExv3Oa9IgFoQA5Ju8GP0MmmMSH8ipuePC7MoVeZAef8uJ2WFpeD8HI3
	faxrkY1AlngzFuyNSDUvfnmhBCSjUuUTYTmipJ6BALNeeYJjiZeNdoiZa1toCc9yksEo
	HITQ==
Received: by 10.68.232.229 with SMTP id tr5mr45678973pbc.101.1343760994498;
	Tue, 31 Jul 2012 11:56:34 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.32
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:16 -0700
Message-Id: <1343760977-3290-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:10 -0000

This class is angstrom specific so lets move it to more
appropriate layer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/blacklist.bbclass |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)
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
1.7.5.4



