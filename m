Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P69Wy-0000l3-Vq
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 00:10:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 30DD03149DCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 00:10:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2QrIEL82y7wm; Thu, 14 Oct 2010 00:10:09 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 17B2F3149D3C;
	Thu, 14 Oct 2010 00:10:08 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 13 Oct 2010 22:10:08 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 22:09:42 +0000
Message-Id: <1287007782-1554-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287007782-1554-1-git-send-email-obi@opendreambox.org>
References: <1287007782-1554-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] module.bbclass: fix dependency on specific kernel
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
X-List-Received-Date: Wed, 13 Oct 2010 22:10:42 -0000

* Previously, the kernel version did not show up in the
  generated control file (debian ipk).
* Use the same format as in kernel.bbclass.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/module.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/module.bbclass b/classes/module.bbclass
index 0e0018e..601a882 100644
--- a/classes/module.bbclass
+++ b/classes/module.bbclass
@@ -1,4 +1,4 @@
-RDEPENDS_${PN} += "kernel (${KERNEL_VERSION}) update-modules"
+RDEPENDS_${PN} += "kernel-${KERNEL_VERSION} update-modules"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
-- 
1.7.1



