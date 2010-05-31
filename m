Received: from smtp-out19.alice.it ([85.33.2.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1od-0002XH-54
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:01:51 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out19.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:10 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:09 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:09 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j4-0007XE-Or; Mon, 31 May 2010 11:56:06 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:53 +0200
Message-Id: <1275299757-28908-9-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:09.0768 (UTC)
	FILETIME=[7ED5F280:01CB00A7]
X-SA-Exim-Connect-IP: 85.33.2.19
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org, Ilya Petrov <ilya.muromec@gmail.com>
Subject: [PATCH 08/12] motorola-ezx-base.inc: Add support for ubifs
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
X-List-Received-Date: Mon, 31 May 2010 10:01:52 -0000

From: Ilya Petrov <ilya.muromec@gmail.com>

Signed-off-by: Ilya Petrov <ilya.muromec@gmail.com>
Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/machine/include/motorola-ezx-base.inc |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 792919c..c90b327 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -39,6 +39,23 @@ PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
 IMAGE_FSTYPES ?= "jffs2"
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
 
+# In order to enable UIBIFS add "uibi and ubifs" 
+#IMAGE_FSTYPES += "ubi ubifs"
+
+# From dmesg:
+# UBI: smallest flash I/O unit:    1
+# UBI: logical eraseblock size:    131072 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1996 LEBs
+MKUBIFS_ARGS = "-m 1 -e 130944 -c 487"
+
+# from dmesg:
+# UBI: smallest flash I/O unit:    1
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+UBINIZE_ARGS = "-m 1 -p 128KiB "
+
+
 EXTRA_IMAGEDEPENDS += "ezx-boot-usb-native ezx-gen-blob"
 
 IMAGE_INSTALL_append += "\
-- 
1.7.1



