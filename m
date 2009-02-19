Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LaFUS-0002zU-Or
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 21:27:25 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LaFS0-00009B-3E
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 04:25:03 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 13:24:39 -0700
Message-Id: <1235075079.6859.211.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: [PATCH] add paroli autostart
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
X-List-Received-Date: Thu, 19 Feb 2009 20:27:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

---
 packages/images/fso-paroli-image.bb |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/packages/images/fso-paroli-image.bb
b/packages/images/fso-paroli-image.bb
index 1d4bdd5..d7ac2d9 100644
--- a/packages/images/fso-paroli-image.bb
+++ b/packages/images/fso-paroli-image.bb
@@ -1,12 +1,18 @@
 require fso-zhone-image.bb

-# no extra apps
-GTK_INSTALL = ""
+ILLUME_THEME = ""
+
+# not many extra apps
+GTK_INSTALL = " \
+   vala-terminal \
+"
+
 GAMES_INSTALL = ""
-APP_INSTALL = ""
+APPS_INSTALL = ""

 # fso+zhone
 ZHONE_INSTALL = "\
   task-fso-compliance \
   paroli \
+  paroli-autostart \
 "
--
1.5.6.5





