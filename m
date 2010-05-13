Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OCYnh-0001U0-Ma
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 15:50:10 +0200
Received: by pvg2 with SMTP id 2so105504pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=gLkCnmXfKGZ6NcKS8C/IjuBhYn8neAIKzUETYqgg6FQ=;
	b=iRJJG0D4SoGIvCZt0lz73UtH6cO4cKjE06htC8xjK+Uc8maMKEXhgIDoqfs1DT6eRM
	RPnqKwKveTvB2PgevWWJiVOiK7b9dS+n5oX0GyiY4fBBbLewV0wBo6Ca2GzGWs98q5hs
	CvcCt8yCMAn9jfPpbERXmXS7xkLCOui4e5d/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ugbLbijUdykVOpdvajeieTApuDg+OGGb9TS6f8lBvJPt45/3MFlYQizZAqTlskkAQh
	CXPKJEDqgg0iCh8i5KmJ+T4kNpjRrGJfJMYpAOfD4QGjSfLKUKzc9hU27YpeTJQ6muqs
	h7/nkE3RGAZsQVkcTRGL9SqWZ68FZbDlFmMPE=
Received: by 10.140.88.9 with SMTP id l9mr6133442rvb.286.1273758373110;
	Thu, 13 May 2010 06:46:13 -0700 (PDT)
Received: from localhost.localdomain ([201.153.77.51])
	by mx.google.com with ESMTPS id d14sm1098627rva.18.2010.05.13.06.46.10
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 May 2010 06:46:12 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 08:46:35 -0500
Message-Id: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5 v2] xilinx-ml507: add screen option
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
X-List-Received-Date: Thu, 13 May 2010 13:50:10 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
index 693f904..8c888b2 100644
--- a/conf/machine/xilinx-ml507.conf
+++ b/conf/machine/xilinx-ml507.conf
@@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
 
 KERNEL_IMAGETYPE = "uImage"
 
-MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet screen"
 MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
 
 UBOOT_ARCH = "ppc"
@@ -30,7 +30,7 @@ PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
 # XILINX_BOARD = "ml507"
 
 # Don't use tty1
-USE_VT = "0"
+# USE_VT = "0"
 SERIAL_CONSOLE = "9600 ttyS0"
 
 # Device nodes add xsa for (system ace)
-- 
1.6.6.1



