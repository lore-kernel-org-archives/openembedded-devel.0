Received: from smtp-out12.alice.it ([85.37.17.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nD-0002SQ-7b
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:25 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out12.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:11 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:10 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:09 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j4-0007XH-VR; Mon, 31 May 2010 11:56:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:54 +0200
Message-Id: <1275299757-28908-10-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:09.0635 (UTC)
	FILETIME=[7EC1A730:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.107
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 09/12] openezx-kernel_git: update recipe
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
X-List-Received-Date: Mon, 31 May 2010 10:00:25 -0000

* bump KV
* bump SRCREV: The new version enables CONFIG_DEVTMPFS by default and
  some other stuff, and fixes usblan on gen2 when booting from MMC
* Provide a fallback CMDLINE
* Keep OABI config setting
* Use a -oe LOCALVERSION both in KV and in .config

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/linux/openezx-kernel_git.bb |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes/linux/openezx-kernel_git.bb b/recipes/linux/openezx-kernel_git.bb
index 55461d1..76929e0 100644
--- a/recipes/linux/openezx-kernel_git.bb
+++ b/recipes/linux/openezx-kernel_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "OpenEZX 2.6 Linux Development Kernel for the Motorola EZX GSM phones"
 AUTHOR = "The OpenEZX Team <openezx-devel@lists.openezx.org>"
 HOMEPAGE = "http://www.openezx.org"
-SRCREV = "b390bb1ee708277297fdfd38e26d955b17d81c2e"
-KV = "2.6.33"
+SRCREV = "c485cc5953bbebdab1c52032754accca75031837"
+KV = "2.6.34-oe"
 PV = "${KV}+gitr${SRCREV}"
-PR = "r4"
+PR = "r5"
 
 require linux.inc
 
@@ -25,7 +25,10 @@ S = "${WORKDIR}/git"
 COMPATIBLE_HOST = "arm.*-linux"
 COMPATIBLE_MACHINE = '(a780|e680|a910|a1200|rorkre2|rokre6)'
 
-# The Kernel command line parameters are given via boot_usb or gen-blob
+# Provide a fallback kernel command line, even if parameters should be given
+# via boot_usb or gen-blob
+CMDLINE = "console=tty1 root=/dev/mmcblk0p2 rootfstype=ext2 rootdelay=3 ip=192.168.0.202:192.168.0.200:192.168.0.200:255.255.255.0"
+ARM_KEEP_OABI = "1"
 
 ###############################################################
 # module configs specific to this kernel
@@ -36,3 +39,9 @@ COMPATIBLE_MACHINE = '(a780|e680|a910|a1200|rorkre2|rokre6)'
 do_configure_prepend() {
 	install -m 0644 ${S}/arch/arm/configs/ezx_defconfig ${WORKDIR}/defconfig
 }
+
+# linux.inc overrides LOCAVERSION but we like to have one
+do_compile_prepend() {
+	sed -i -e '/CONFIG_LOCALVERSION=/d' ${S}/.config
+	echo 'CONFIG_LOCALVERSION="-oe"' >>${S}/.config
+}
-- 
1.7.1



