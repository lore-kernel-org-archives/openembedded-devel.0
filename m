Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXf-0002vg-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:36 +0100
Received: (qmail 13925 invoked by uid 813007); 22 Mar 2010 11:08:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:47 +0100
Message-Id: <1269256016-13155-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][STABLE] shadow: add 4.1.4
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:36 -0000

From: Steve Sakoman <steve@sakoman.com>

---
 conf/checksums.ini             |    4 ++++
 recipes/shadow/shadow_4.1.4.bb |   11 +++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/shadow/shadow_4.1.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a8b8cbf..952e9e3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23054,6 +23054,10 @@ sha256=7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959
 md5=45f77f33a6b2a5c09c28511ebb733b87
 sha256=7fd6495d6c3e8dac7ba086c68abed4930c958a94afc15359223074614559e462
 
+[ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-4.1.4.tar.gz]
+md5=e1072df927bfb4410ee4dfe26dd81a17
+sha256=7e38a7826f6e71e89b55669e8343af05ae33ecfba99aad178cad45845d950a93
+
 [http://freedesktop.org/~hadess/shared-mime-info-0.20.tar.bz2]
 md5=62184241d497d34138285bc248b3fabc
 sha256=6febe616fb850f4319efa7017312abb796024e7ac20da37c4d2ce34afa41776c
diff --git a/recipes/shadow/shadow_4.1.4.bb b/recipes/shadow/shadow_4.1.4.bb
new file mode 100644
index 0000000..393edce
--- /dev/null
+++ b/recipes/shadow/shadow_4.1.4.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "login/password utilities"
+LICENSE = "GPL"
+
+inherit autotools
+
+SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.gz"
+
+S = "${WORKDIR}/shadow-${PV}"
+
+CFLAGS_append = " -I../include"
+
-- 
1.7.0.2





