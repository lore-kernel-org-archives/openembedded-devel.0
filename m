Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Q2mcq-0000HQ-3V
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:39:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2D59E314F49A;
	Thu, 24 Mar 2011 16:37:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WFNHvinXaBNu; Thu, 24 Mar 2011 16:37:06 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 51886314F49D;
	Thu, 24 Mar 2011 16:37:05 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 24 Mar 2011 15:37:05 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 15:37:04 +0000
Message-Id: <1300981024-9111-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1300981024-9111-1-git-send-email-obi@opendreambox.org>
References: <1300981024-9111-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
References: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
Cc: Denis Dydychkin <nyrl@mail.ru>
Subject: [PATCH] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 24 Mar 2011 15:39:04 -0000

Based on http://comments.gmane.org/gmane.comp.handhelds.openembedded/42905

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Denis Dydychkin <nyrl@mail.ru>
CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/kernel.bbclass      |   10 +++++++++-
 classes/module-base.bbclass |   10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 0109ce6..a462ab4 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -24,7 +24,15 @@ python __anonymous () {
     machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
 
     if machine_kernel_pr:
-       bb.data.setVar('PR', machine_kernel_pr, d)
+       # Append
+       # a) .X, if the recipe's PR is rX, or
+       # b) +${PR}, if the recipe's PR doesn't begin with r
+       pr = bb.data.getVar('PR', d, True)
+       if pr.startswith('r'):
+               suffix = '.' + pr[1:]
+       else:
+               suffix = '+' + pr
+       bb.data.setVar('PR', machine_kernel_pr + suffix, d)
 }
 
 INITRAMFS_IMAGE ?= ""
diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
index 9aaaa4e..edc0774 100644
--- a/classes/module-base.bbclass
+++ b/classes/module-base.bbclass
@@ -11,7 +11,15 @@ python __anonymous () {
     machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
 
     if machine_kernel_pr:
-       bb.data.setVar('PR', machine_kernel_pr, d)
+       # Append
+       # a) .X, if the recipe's PR is rX, or
+       # b) +${PR}, if the recipe's PR doesn't begin with r
+       pr = bb.data.getVar('PR', d, True)
+       if pr.startswith('r'):
+               suffix = '.' + pr[1:]
+       else:
+               suffix = '+' + pr
+       bb.data.setVar('PR', machine_kernel_pr + suffix, d)
 }
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
-- 
1.7.2.3



