Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3gN9-0007Ab-FA
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 03:01:31 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJI00BPLAIY9AFL@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 May 2009 19:54:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3D9A314AF66; Mon,
	11 May 2009 20:54:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 20:54:28 -0400
Message-id: <1242089668-11610-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242089668-11610-1-git-send-email-denis@denix.org>
References: <1242089668-11610-1-git-send-email-denis@denix.org>
Subject: [PATCH 8/8] u-boot: update git recipe with the new DaVinci EVMs
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
X-List-Received-Date: Tue, 12 May 2009 01:01:31 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/u-boot/u-boot_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 3d99067..ba31577 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,11 +1,13 @@
 require u-boot.inc
-PR ="r23"
+PR ="r24"
 
 FILESPATHPKG =. "u-boot-git:"
 
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
 SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
-SRCREV_davinci-dvevm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
+SRCREV_dm6446-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
+SRCREV_dm6467-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
+SRCREV_dm355-evm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
 SRCREV_akita = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_spitz = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_c7x0 = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
-- 
1.6.0.6



