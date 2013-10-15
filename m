Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2376CA74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:14:59 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so4268761eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c2CKHpAO2oP+8arz0VJhrDG9U2EvQaRnnALoZPq+ywk=;
	b=i9/l8J2nqyvwaIM4dihS2cJeqyEucdcamVU7W/GviypHF+hn2XXjn8FUwGR9urhJUs
	kQXU3ZsLt+50mw7+e7Ig2GfLqOPrBYjJEQyyFNWp0PzRCW7bDaTwgEUkagX0HnPJugkc
	/6YAOUezwm/zgm+td5JB26GLgaD+ZRXcfawIbDJGfh7pve5bAUqKRFQQN8MKCD5Cl0Bl
	4FISgkgW6aTptGhy12g6LBz6lvmSZoUPixXZIgVHjyVONVldMQHIJgaKMhmMDHgVB+Im
	3aAVJHFD87URCxVgDE7iWtXOCpPqQcPheWCaT9uxW7RNxUiNaWGaoUQz3387Oirr/eNd
	KtAw==
X-Received: by 10.14.203.70 with SMTP id e46mr3765627eeo.33.1381871701216;
	Tue, 15 Oct 2013 14:15:01 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	h45sm171075658eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 14:15:00 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 23:14:56 +0200
Message-Id: <1381871696-17275-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus: readd sum.jffs2 imagetype
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 21:15:00 -0000

move common line from collie.conf

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/collie.conf        | 1 -
 conf/machine/include/zaurus.inc | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index baa2c0f..78c579a 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -8,7 +8,6 @@ require conf/machine/include/tune-strongarm1100.inc
 JFFS2_ERASEBLOCK = "0x20000"
 
 EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e ${JFFS2_ERASEBLOCK}"
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 480c855..9817625 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -3,6 +3,8 @@
 ########################
 
 IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
+
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
 
-- 
1.8.1.5


