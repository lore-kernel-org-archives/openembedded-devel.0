Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QK1HT-0005R4-35
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 06:44:15 +0200
Received: by gwb11 with SMTP id 11so59484gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 21:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=eSgL8zuG1zzZt4JAGLIcd0zC8lg5IfRWv2exdSjVRa8=;
	b=d5fRym8sWoa/lYrQgKoSpAj6nT0eNA0mfNYshWwTn80RzlAZPfr2YfSfxC3kfe3RtT
	Z+pZm89N5Sh4Fh28Z9eUxPtwjLS0BMXgJnK6KrS/pHpQdV3fwwUcvy/TaVA1WdzX7JDq
	6mWLSVV3AiirBSWXOO6e4JSZpnuY13kGr5soY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dajNMzpJ6Xc+Pb7lk0W4bPvWtmwCOuoSqAWx2hD4SU3lFCKYS0QwXaTsUz9sPxxNph
	snVD4nNIPahhR4CMPdCR7P36RC78xa/8LrW4kFyzNEAb+yHJfaEJf5TqOP1P+0PKBi3o
	WTcZBCRgzbz5fAVkbbpiaWJI1Q6/zuzn+RRns=
Received: by 10.91.8.3 with SMTP id l3mr7363103agi.2.1305088888263;
	Tue, 10 May 2011 21:41:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u11sm6708310anq.23.2011.05.10.21.41.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 21:41:27 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2011 10:11:20 +0530
Message-Id: <1305088881-3527-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/2] ti816x machine: Fix JFFS Image command
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
X-List-Received-Date: Wed, 11 May 2011 04:44:15 -0000

From: Siddharth Heroor <heroor@ti.com>

* Fixes a bug in the command passed for JFFS2 Image creation.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 conf/machine/include/ti816x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
index ebf5166..9db1df8 100644
--- a/conf/machine/include/ti816x.inc
+++ b/conf/machine/include/ti816x.inc
@@ -21,6 +21,6 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 
 # Ship all kernel modules
 IMAGE_FSTYPES += "jffs2 tar.bz2"
-EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
 SERIAL_CONSOLE = "115200 ttyS2"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4



