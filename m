Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V2-0001kL-4P
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id BE3DF3148E50
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id s9GeBKxrlT99; Wed, 29 Sep 2010 22:37:20 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 37D873148E37;
	Wed, 29 Sep 2010 22:37:12 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:12 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:31 +0000
Message-Id: <1285792594-10032-16-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 15/18] sispmctl-2.7: initial recipe
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:37 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/sispmctl/sispmctl_2.7.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/sispmctl/sispmctl_2.7.bb

diff --git a/recipes/sispmctl/sispmctl_2.7.bb b/recipes/sispmctl/sispmctl_2.7.bb
new file mode 100644
index 0000000..43d6238
--- /dev/null
+++ b/recipes/sispmctl/sispmctl_2.7.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Control Gembird SIS-PM programmable power outlet strips"
+AUTHOR = "Mondrian Nuessle <nuessle@uni-mannheim.de>"
+HOMEPAGE = "http://sispmctl.sourceforge.net/"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "libusb"
+
+SRC_URI = "http://downloads.sourceforge.net/${PN}/${P}.tar.gz"
+
+SRC_URI[md5sum] = "2457f76cd129f880634f3381be0aeb76"
+SRC_URI[sha256sum] = "d24d34fc7e14992ac822cef3c5567b04a077cfc96252b0a6fb238c8a272c16f4"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-webless"
-- 
1.7.1



