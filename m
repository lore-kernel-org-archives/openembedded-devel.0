Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ol7CT-0002He-JD
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 23:26:34 +0200
Received: by qwi2 with SMTP id 2so357015qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 14:26:15 -0700 (PDT)
Received: by 10.229.211.19 with SMTP id gm19mr4177485qcb.83.1281993975180;
	Mon, 16 Aug 2010 14:26:15 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id q8sm7829008qcs.12.2010.08.16.14.26.13
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Aug 2010 14:26:14 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 16:26:12 -0500
Message-Id: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bison: add flex dependency
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
X-List-Received-Date: Mon, 16 Aug 2010 21:26:35 -0000

It seems that bison was missing this dependency.  I'm not 100% certain this
is the right way to add it, so I'm leaving off my signed-off-by in hopes that
someone will ack this who really knows.

---
 recipes/bison/bison.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
index 22672e2..d32f454 100644
--- a/recipes/bison/bison.inc
+++ b/recipes/bison/bison.inc
@@ -3,12 +3,12 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPL"
 SECTION = "devel"
 PRIORITY = "optional"
-DEPENDS = "virtual/libintl"
+DEPENDS = "virtual/libintl virtual/flex"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 inherit autotools gettext
 
-- 
1.5.6.4



