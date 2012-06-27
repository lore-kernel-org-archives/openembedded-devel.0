Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SjoT1-0006Uf-4i
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 11:23:19 +0200
Received: by eekd49 with SMTP id d49so254885eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 02:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/QuPFN9v851bR6ND3xzfv/qlyXMaTHTk1TUlGSibmKk=;
	b=RDPO0/f42tE5dtoJ/pCHHNSWs2Erh97PGn/w996zESiHzDNJiPraiOKhhuczyKecA6
	RyBrrqefPfMl9T30kLpPunxg8T2UmhQMCgMOMvoBshle71V75yRh9qftLvMXcBJzGZ3m
	86Ic4NszTFz0FyCqgJ+/wlS2LWH5sjKuoF/6IvWnOXkF73/JFq9F8c/4Iw7im6KyuJ2t
	F4qSDx8XAjd5SeL2DGxasXuactWi2YEQjwwZsDyIjUmHIFPOKt+1jhTB3yvlfMNKs/aw
	fjHJQ/Z4yCqs9bwEkYSBfs+0boEsE68SDGE/XB0VIc3UnnD+1jG9DQ7/9cLCWaOeDPQW
	ThfQ==
Received: by 10.14.37.12 with SMTP id x12mr3888746eea.161.1340788345946;
	Wed, 27 Jun 2012 02:12:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id p41sm157044515eef.5.2012.06.27.02.12.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 02:12:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2012 11:12:15 +0200
Message-Id: <1340788335-12701-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmIvOqOVi90fW5IHa/QtAxqX8lwqbVo69B9dMYVwvEjRND79u4REUR9nAky3A2lremZ54EF
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libatasmart: update to 0.19
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
X-List-Received-Date: Wed, 27 Jun 2012 09:23:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libatasmart/libatasmart-0.17/strpool.patch              |   11 -----------
 .../{libatasmart_0.17.bb => libatasmart_0.19.bb}            |    7 ++-----
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libatasmart/libatasmart-0.17/strpool.patch
 rename meta-oe/recipes-support/libatasmart/{libatasmart_0.17.bb => libatasmart_0.19.bb} (77%)

diff --git a/meta-oe/recipes-support/libatasmart/libatasmart-0.17/strpool.patch b/meta-oe/recipes-support/libatasmart/libatasmart-0.17/strpool.patch
deleted file mode 100644
index e9f6ab3..0000000
--- a/meta-oe/recipes-support/libatasmart/libatasmart-0.17/strpool.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- git/Makefile.am.orig	2010-09-24 11:03:40.917602895 +0200
-+++ git/Makefile.am	2010-09-24 11:07:04.145852660 +0200
-@@ -81,5 +81,8 @@
- BUILT_SOURCES = \
- 	atasmart.strpool.c
- 
-+strpool: $(strpool_SOURCES)
-+	$(BUILD_CC) -o $@ $?
-+
- atasmart.strpool.c: atasmart.c strpool
- 	$(top_builddir)/strpool $< $@
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
similarity index 77%
rename from meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb
rename to meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 6162b58..9e7d2fc 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.17.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -2,13 +2,10 @@ DESCRIPTION = "ATA S.M.A.R.T. Reading and Parsing Library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r1"
-
 DEPENDS = "udev"
 
-SRCREV = "v${PV}"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git \
-	file://strpool.patch"
+SRCREV = "de6258940960443038b4c1651dfda3620075e870"
+SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10



