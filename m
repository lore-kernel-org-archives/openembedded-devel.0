Received: from [151.189.21.56] (helo=mail-in-16.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1MDrzB-0000hX-3l
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 05:26:53 +0200
Received: from mail-in-13-z2.arcor-online.net (mail-in-13-z2.arcor-online.net
	[151.189.8.30]) by mx.arcor.de (Postfix) with ESMTP id 7C2852571BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 05:17:18 +0200 (CEST)
Received: from mail-in-10.arcor-online.net (mail-in-10.arcor-online.net
	[151.189.21.50])
	by mail-in-13-z2.arcor-online.net (Postfix) with ESMTP id 63C06209042
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 05:17:18 +0200 (CEST)
Received: from localhost.localdomain (p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
	[114.177.118.77]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-10.arcor-online.net (Postfix) with ESMTPSA id 4B79A28EF2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 05:17:16 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-10.arcor-online.net 4B79A28EF2D
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jun 2009 12:17:10 +0900
Message-Id: <1244517430-17863-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Comment: I don't see a reason tosa and collie need to have their own
	MACHINE_KERNEL_PR.
Subject: (No subject)
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
X-List-Received-Date: Tue, 09 Jun 2009 03:26:53 -0000

Am I missing something here?



From 6b2ebec94fbd9c86041df4900d4af744610f9877 Mon Sep 17 00:00:00 2001
From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Date: Tue, 9 Jun 2009 11:53:36 +0900
Subject: [PATCH] zaurus-2.6.inc: drop machine specific MACHINE_KERNEL_PR.

Will result in kernel rebuild for tosa and collie.
---
 conf/machine/include/zaurus-kernel.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/zaurus-kernel.inc b/conf/machine/include/zaurus-kernel.inc
index 2ca00da..0e8fbfa 100644
--- a/conf/machine/include/zaurus-kernel.inc
+++ b/conf/machine/include/zaurus-kernel.inc
@@ -8,8 +8,6 @@ PREFERRED_PROVIDER_virtual/kernel_tosa = "linux"
 
 # Increase PR everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r11"
-MACHINE_KERNEL_PR_collie = "r8"
-MACHINE_KERNEL_PR_tosa = "r4"
 
 MACHINE_KERNEL_PR_pn-linux-kexecboot = "r13"
 
-- 
1.6.0.4



