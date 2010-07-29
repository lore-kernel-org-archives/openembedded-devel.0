Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OeSFZ-0007HH-5h
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:31:08 +0200
Received: by ywe9 with SMTP id 9so78266ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=p08xfwXcPgH2w5DmHfs7AgTQC2G9uWfztQ5WxvLDU0M=;
	b=dBY/iX12lp/OKbflJWlp1v+3tee46UK6tHJk7839IzlR67arb+o+h8Mqdo8EP0A+Qd
	sF4/4bQxQ4bwdex0rjiVWHS+ecenAJRBMngyHtu9VPFhTeVrCnThb5wdc2urnNR2/Cng
	Txizu36U2gY5DSqQWFYKc4qIRMQ20H7DxtZQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oIeqsuOZr2UJ5O0QkvEqm+up6Z/ReqAlN5GmFIEjs5up8yrKDmPF7qyj6dTtv47myB
	1dZlqHmIR+SV12I+8iCVYjGr8SDaADbb49LFAbjPV3wNqtS0v1ztxx9L/yE+7rRS94HB
	6kZJF3IWEO1lPjgLrf+I/fOZhv+32f+nkUu18=
Received: by 10.151.63.18 with SMTP id q18mr1044329ybk.100.1280406592057;
	Thu, 29 Jul 2010 05:29:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e7sm7379938ybe.16.2010.07.29.05.29.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jul 2010 05:29:51 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 07:26:16 -0500
Message-Id: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/2] x-load_git: defined config for dm37x and am37x machines
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
X-List-Received-Date: Thu, 29 Jul 2010 12:32:45 -0000

* Defined the XLOAD_MACHINE value for dm37x-evm and am37x-evm
  machine types.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/x-load/x-load_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
index cbcbf17..a14d6cb 100644
--- a/recipes/x-load/x-load_git.bb
+++ b/recipes/x-load/x-load_git.bb
@@ -9,7 +9,7 @@ SRCREV_beagleboard = "1c9276af4d6a5b7014a7630a1abeddf3b3177563"
 
 PV = "1.42+${PR}+gitr${SRCREV}"
 PV_beagleboard = "1.44+${PR}+gitr${SRCREV}"
-PR ="r15"
+PR ="r16"
 PE = "1"
 
 SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
@@ -34,11 +34,13 @@ PV_omap3evm = "1.46+${PR}+gitr${SRCREV}"
 SRC_URI_dm37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
 SRCREV_dm37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
 PV_dm37x-evm = "1.46+${PR}+gitr${SRCREV}"
+XLOAD_MACHINE_dm37x-evm = "omap3evm_config"
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRC_URI_am37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
 SRCREV_am37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
 PV_am37x-evm = "1.46+${PR}+gitr${SRCREV}"
+XLOAD_MACHINE_dm37x-evm = "omap3evm_config"
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRC_URI_am3517-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
-- 
1.7.0.4



