Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1PC5eu-0003wW-V1
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 09:15:26 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 4DF663D4C5; Sat, 30 Oct 2010 11:14:36 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Oct 2010 11:14:29 +0400
Message-Id: <1288422869-3296-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] valgrind: remove versions prior to 3.6.0
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
X-List-Received-Date: Sat, 30 Oct 2010 07:15:26 -0000

If you're using valgrind, you probably want latest and versions removed with
this patch are 2+ years old.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/valgrind/valgrind_3.2.1.bb |   17 -----------------
 recipes/valgrind/valgrind_3.2.3.bb |   19 -------------------
 recipes/valgrind/valgrind_3.3.1.bb |   19 -------------------
 3 files changed, 0 insertions(+), 55 deletions(-)
 delete mode 100644 recipes/valgrind/valgrind_3.2.1.bb
 delete mode 100644 recipes/valgrind/valgrind_3.2.3.bb
 delete mode 100644 recipes/valgrind/valgrind_3.3.1.bb

diff --git a/recipes/valgrind/valgrind_3.2.1.bb b/recipes/valgrind/valgrind_3.2.1.bb
deleted file mode 100644
index e125493..0000000
--- a/recipes/valgrind/valgrind_3.2.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Valgrind memory debugger"
-HOMEPAGE = "http://www.valgrind.org/"
-SECTION = "devel"
-LICENSE = "GPL"
-DEPENDS = "virtual/libx11"
-PR = "r0"
-
-SRC_URI = "http://www.valgrind.org/downloads/archive/valgrind-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "9407d33961186814cef0e6ecedfd6318"
-SRC_URI[sha256sum] = "7f9a15d7be16ca03a0912191e8d55a486bf69690e11bb76ccece3eaff3730a33"
-
-inherit autotools
-
-EXTRA_OECONF = "--enable-tls"
-
-COMPATIBLE_HOST = "^i.86.*-linux"
diff --git a/recipes/valgrind/valgrind_3.2.3.bb b/recipes/valgrind/valgrind_3.2.3.bb
deleted file mode 100644
index 5032204..0000000
--- a/recipes/valgrind/valgrind_3.2.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Valgrind memory debugger"
-HOMEPAGE = "http://www.valgrind.org/"
-SECTION = "devel"
-LICENSE = "GPL"
-DEPENDS = "virtual/libx11"
-PR = "r0"
-
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF = "--enable-tls"
-
-COMPATIBLE_HOST = "^i.86.*-linux"
-
-FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
-
-SRC_URI[md5sum] = "978847992b136c8d8cb5c6559a91df1c"
-SRC_URI[sha256sum] = "1bca920527f43fd0c68e8f8eb16a7996b34f415e73af54de0f2cd43a8247c441"
diff --git a/recipes/valgrind/valgrind_3.3.1.bb b/recipes/valgrind/valgrind_3.3.1.bb
deleted file mode 100644
index b2cdd7f..0000000
--- a/recipes/valgrind/valgrind_3.3.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Valgrind memory debugger"
-HOMEPAGE = "http://www.valgrind.org/"
-SECTION = "devel"
-LICENSE = "GPL"
-DEPENDS = "virtual/libx11"
-PR = "r0"
-
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF = "--enable-tls"
-
-COMPATIBLE_HOST = "^i.86.*-linux"
-
-FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
-
-SRC_URI[md5sum] = "0539e2fa4aadb2cd4ca4bba65b1fe8b5"
-SRC_URI[sha256sum] = "95b7b4d815bd479332637c93e69ec24167cd28d4f9d9f9b718e1b091bb88aafa"
-- 
1.6.4.2



