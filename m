Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkn1-0006Ge-Uq
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:36 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2960917pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HkXsILFi3EmC7WpqI5FM+4p7Cjhv+1nraEZWnV+WcgI=;
	b=jj2qlZcqEgwd4AZeUEUunkfBaA8z020HGK0NsP1Zn1+YYr95aSOCGCvOg3XUkbzwdX
	7m81SQvm/N43c34YYrD4n+nUgXfB0iQppDLJUIA9F6b0m3AvZQv8y1yWgePdGHlyFCA5
	RBTTQ9VvssVBwFZF6bC1YG/cQ3Qs9zAcAasUAtbA1aSa/EsugpcPi7m+FIwb3/bqyrSo
	k2dk/LpBbzj0yUCC8ArK8/OAZggrh7z6j6KC9Hf0th4zgf4t9ZaFm02e9ja7y6nphxok
	lpFaPS92HciGZJjsciNtrf4MCnzNKhsBE20RheO5WFL4B0A68GF2ilv5afS+bqZZLrWY
	PqRg==
Received: by 10.66.76.226 with SMTP id n2mr7433530paw.67.1344110755444;
	Sat, 04 Aug 2012 13:05:55 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.52
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:35 -0700
Message-Id: <1344110736-6999-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
References: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V4 7/8] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:36 -0000

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



