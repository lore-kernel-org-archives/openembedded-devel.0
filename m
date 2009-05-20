Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6geA-0005BI-Eq
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 09:55:33 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJX0027XN0071K8@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 May 2009 02:48:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3532814AF65; Wed,
	20 May 2009 03:47:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 03:47:57 -0400
Message-id: <1242805678-20645-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242805678-20645-1-git-send-email-denis@denix.org>
References: <1242805678-20645-1-git-send-email-denis@denix.org>
Subject: [PATCHv2 7/8] linux-davinci: build linux-davinci kernels for dm6446, dm6467 and dm355 EVMs
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
X-List-Received-Date: Wed, 20 May 2009 07:55:43 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/linux/linux-davinci_2.6.28.bb |    4 +++-
 recipes/linux/linux-davinci_git.bb    |   11 ++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes/linux/linux-davinci_2.6.28.bb b/recipes/linux/linux-davinci_2.6.28.bb
index a5fe57b..ef0e002 100644
--- a/recipes/linux/linux-davinci_2.6.28.bb
+++ b/recipes/linux/linux-davinci_2.6.28.bb
@@ -3,10 +3,12 @@ require linux.inc
 DESCRIPTION = "Linux kernel for Davinci processors"
 KERNEL_IMAGETYPE = "uImage"
 
-COMPATIBLE_MACHINE = "davinci-sffsdr"
+COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|davinci-sffsdr)"
 
 SRCREV = "0fc192ac07c977ad6f14333651b53096a6027bc6"
 
+PR = "r1"
+
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git;protocol=git \
            file://defconfig"
 
diff --git a/recipes/linux/linux-davinci_git.bb b/recipes/linux/linux-davinci_git.bb
index 332aeb6..8d074d7 100644
--- a/recipes/linux/linux-davinci_git.bb
+++ b/recipes/linux/linux-davinci_git.bb
@@ -3,14 +3,14 @@ require linux.inc
 DESCRIPTION = "Linux kernel for Davinci processors"
 KERNEL_IMAGETYPE = "uImage"
 
-COMPATIBLE_MACHINE = "(davinci-dvevm|davinci-sffsdr|dm355-leopard)"
+COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|dm355-evm|davinci-sffsdr|dm355-leopard)"
 
-DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE = "1"
 
 SRCREV = "486afa37130356662213cc1a2199a285b4fd72af"
 
 PV = "2.6.29+2.6.29-rc7-${PR}+gitr${SRCREV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git;protocol=git \
            file://update-mach-types.patch;patch=1 \
@@ -23,6 +23,11 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.g
            file://vfpe7.patch;patch=1 \
            file://defconfig"
 
+# No vfpe patches for DM6467
+SRC_URI_dm6467-evm = "git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git;protocol=git \
+           file://update-mach-types.patch;patch=1 \
+           file://defconfig"
+
 SRC_URI_append_davinci-sffsdr = " \
            file://0001-USB-musb-cppi-bugfixes.patch;patch=1 \
            file://0002-ARM-Mark-unsupported-syscalls-as-IGNORE.patch;patch=1 \
-- 
1.6.0.6



