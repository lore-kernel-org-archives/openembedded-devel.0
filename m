Received: from mail.infocentr.ru ([78.108.66.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1Oq7XC-0004EY-Jo
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:48:40 +0200
Received: from localhost.localdomain (unknown [192.168.62.150])
	by mail.infocentr.ru (Postfix) with ESMTP id 184FFB00178A;
	Mon, 30 Aug 2010 22:48:06 +0600 (YEKST)
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 22:47:56 +0600
Message-Id: <1283186879-971-1-git-send-email-norguhtar@gmail.com>
X-Mailer: git-send-email 1.6.0.6
X-SA-Exim-Connect-IP: 78.108.66.4
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 1/4] remove upstart_0.3.8.bb
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
X-List-Received-Date: Mon, 30 Aug 2010 16:48:40 -0000

* remove recipe upstart_0.3.8.bb it's not buildable. I'm got error:

wire.c: In function 'upstart_pop_int':
wire.c:120: error: 'INT_MIN' undeclared (first use in this function)
wire.c:120: error: (Each undeclared identifier is reported only once
wire.c:120: error: for each function it appears in.)
wire.c:120: error: 'INT_MAX' undeclared (first use in this function)
wire.c: In function 'upstart_pop_unsigned':
wire.c:196: error: 'UINT_MAX' undeclared (first use in this function)
make[2]: *** [wire.lo] Error 1

Not found any recipe depends on it.

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
---
 recipes/upstart/upstart_0.3.8.bb |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/upstart/upstart_0.3.8.bb

diff --git a/recipes/upstart/upstart_0.3.8.bb b/recipes/upstart/upstart_0.3.8.bb
deleted file mode 100644
index 1b2cfb5..0000000
--- a/recipes/upstart/upstart_0.3.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require upstart.inc
-
-SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2 \
-file://autoconf_version.patch"
-
-PR = "r1"
-
-
-SRC_URI[md5sum] = "5cdd2dc3a3f02089c9450edf4e8f4941"
-SRC_URI[sha256sum] = "9a2a37455ad4e9dd2856b5a0f15adb1a3f84439f60d0f63b041584a2666e9835"
-- 
1.6.0.6



