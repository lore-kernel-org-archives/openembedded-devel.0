Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O3wtn-0006V8-MA
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 21:44:52 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 08BABCA9991
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 21:34:08 +0200 (CEST)
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 577D14B01B1;
	Mon, 19 Apr 2010 21:34:04 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 579424B0142;
	Mon, 19 Apr 2010 21:34:02 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 21:34:38 +0200
Message-Id: <1271705678-11080-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.10
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] kernel.bbclass : fix install for x86
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
X-List-Received-Date: Mon, 19 Apr 2010 19:44:52 -0000

bitbake linux for a x86 machine fails with the following message :
cp: target `.../image/kernel//include/asm-x86/' is not a directory

so create $kerneldir/include/asm-x86 before trying to copy something in
this directory.

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 7504c11..498f4bf 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -142,6 +142,7 @@ kernel_do_install() {
 
 	# Check for arch/x86 on i386
 	elif [ -d arch/x86/include/asm/ ]; then
+	        mkdir -p $kerneldir/include/asm-x86
 		cp -fR arch/x86/include/asm/* $kerneldir/include/asm-x86/
 		install -d $kerneldir/arch/x86/include
 		cp -fR arch/x86/* $kerneldir/arch/x86/
-- 
1.6.3.3



