Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1Nx3F3-0000BR-Ai
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 21:06:18 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id E23F920B2B; Wed, 31 Mar 2010 22:59:38 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 22:59:32 +0400
Message-Id: <1270061972-5564-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1270061972-5564-2-git-send-email-khimov@altell.ru>
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
	<1270061972-5564-2-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] postfix: add 2.7.0 version
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
X-List-Received-Date: Wed, 31 Mar 2010 19:06:18 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/postfix/files/volatiles  |    1 +
 recipes/postfix/postfix.inc      |    2 +-
 recipes/postfix/postfix_2.7.0.bb |    6 ++++++
 3 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 recipes/postfix/postfix_2.7.0.bb

diff --git a/recipes/postfix/files/volatiles b/recipes/postfix/files/volatiles
index bc330c9..3df6fb4 100644
--- a/recipes/postfix/files/volatiles
+++ b/recipes/postfix/files/volatiles
@@ -1,4 +1,5 @@
 d postfix nogroup 2755 /var/spool/mail none
+d postfix nogroup 0755 /var/lib/postfix none
 d root postfix 0755 /var/spool/postfix none
 d postfix root 0700 /var/spool/postfix/active none
 d postfix root 0700 /var/spool/postfix/bounce none
diff --git a/recipes/postfix/postfix.inc b/recipes/postfix/postfix.inc
index 5b18cef..51d5e8f 100644
--- a/recipes/postfix/postfix.inc
+++ b/recipes/postfix/postfix.inc
@@ -5,7 +5,7 @@ LICENSE = "IPL"
 
 INC_PR = "r13"
 
-SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz;name=postfix-${PV} \
 	   file://makedefs.patch;patch=1 \
 	   file://install.patch;patch=1 \
 	   file://main.cf_2.0 \
diff --git a/recipes/postfix/postfix_2.7.0.bb b/recipes/postfix/postfix_2.7.0.bb
new file mode 100644
index 0000000..fc41fad
--- /dev/null
+++ b/recipes/postfix/postfix_2.7.0.bb
@@ -0,0 +1,6 @@
+require postfix.inc
+
+SRC_URI[postfix-2.7.0.md5sum] = "df648f59421604e895cce56325f00bae"
+SRC_URI[postfix-2.7.0.sha256sum] = "c5b232ae5e396107bc58aed4178cf6cfd0a75b9dcbbedb49d158eb71d6c91b75"
+
+PR = "${INC_PR}.0"
\ No newline at end of file
-- 
1.6.4.2



