Received: from [63.139.215.209] (helo=maxie.russound.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jims@russound.com>) id 1OUkS5-0006KL-7T
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 19:55:05 +0200
Received: from localhost.localdomain (unknown [10.0.3.77])
	by maxie.russound.com (Postfix) with ESMTP id 4E584674034;
	Fri,  2 Jul 2010 13:32:19 -0400 (EDT)
From: Jim Sheldon <jims@russound.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 13:32:19 -0400
Message-Id: <1278091939-24947-1-git-send-email-jims@russound.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 63.139.215.209
X-SA-Exim-Mail-From: jims@russound.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] allow KERNEL_IMAGEDEST to be redefined
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
X-List-Received-Date: Fri, 02 Jul 2010 17:55:06 -0000


Signed-off-by: Jim Sheldon <jims@russound.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index b0c6534..d9c9eed 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -59,7 +59,7 @@ KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
 
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
-KERNEL_IMAGEDEST = "boot"
+KERNEL_IMAGEDEST ?= "boot"
 
 #
 # configuration
-- 
1.5.4.3



