Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Bg6-0007qx-7n
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2012 14:40:46 +0100
Received: by mail-ww0-f43.google.com with SMTP id dr12so2433057wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2012 05:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.103.35 as permitted sender)
	client-ip=10.180.103.35; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.103.35 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.103.35])
	by 10.180.103.35 with SMTP id ft3mr8997607wib.0.1330867935252 (num_hops
	= 1); Sun, 04 Mar 2012 05:32:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.103.35 with SMTP id ft3mr7185147wib.0.1330867935203;
	Sun, 04 Mar 2012 05:32:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm30523674wiy.3.2012.03.04.05.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 05:32:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2012 14:32:05 +0100
Message-Id: <1330867925-23330-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330867925-23330-1-git-send-email-koen@dominion.thruhere.net>
References: <1330867925-23330-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlnR6Cfgg2wzvv5LcpsOXAW+D39mcsfWYrcXc7GJUYG6mGxjpYedL1AhOQanaqQPUjWofbT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 4/4] polkit 0.104 bbappend: append to PACkAGECONFIG instead of overwriting it
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
X-List-Received-Date: Sun, 04 Mar 2012 13:40:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 1e2cccd..2383c5b 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,6 +1,8 @@
 PRINC := "${@int(PRINC) + 3}"
 
-PACKAGECONFIG ??= "systemd"
+POLKITAUTH ??= "systemd"
+
+PACKAGECONFIG += "${POLKITAUTH}"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 # there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
 PACKAGECONFIG[consolekit] = ",,,consolekit"
-- 
1.7.2.5



