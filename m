Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7aXI-0005nq-SB
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 23:12:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 220293149CF2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 23:12:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zjvRZdd9QOAC; Sun, 17 Oct 2010 23:12:16 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 83E7F3148DD0;
	Sun, 17 Oct 2010 23:12:15 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 21:12:15 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 21:12:05 +0000
Message-Id: <1287349925-14997-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] directfb-1.4.6: fix packaging
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
X-List-Received-Date: Sun, 17 Oct 2010 21:12:59 -0000

* Files were searched in the wrong directory, because $RV was wrong.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/directfb/directfb_1.4.6.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/directfb/directfb_1.4.6.bb b/recipes/directfb/directfb_1.4.6.bb
index 1d4f34a..70c0225 100644
--- a/recipes/directfb/directfb_1.4.6.bb
+++ b/recipes/directfb/directfb_1.4.6.bb
@@ -1,7 +1,7 @@
 require directfb.inc
 
-RV = "1.4-0"
-PR = "r1"
+RV = "1.4-5"
+PR = "r2"
 
 DEPENDS += "sysfsutils"
 
@@ -21,7 +21,7 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-LEAD_SONAME = "libdirectfb-1.4.so.0"
+LEAD_SONAME = "libdirectfb-1.4.so.5"
 
 SRC_URI[md5sum] = "dbe1957932f81790742b58b94c1c7b84"
 SRC_URI[sha256sum] = "b18121e60e9a084ee347037a53a46cfaea1c09505bd99d673c2e65eca285e69b"
-- 
1.7.1



