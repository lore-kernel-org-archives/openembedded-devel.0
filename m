Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QKNLP-0003Op-HN
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 06:17:47 +0200
Received: by yxn22 with SMTP id 22so449430yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=eSgL8zuG1zzZt4JAGLIcd0zC8lg5IfRWv2exdSjVRa8=;
	b=WfPTWsxrenlhuHPdzZKT3aYEi5PpX/i3zosWIqPli0rI2ChdI2QGeF74v9bKqwxFey
	MHMNDnKWQNSoTuv0v+G9OcQ85ylfv5cv9/A/z98nQwG6zZbXyY1qw6sKFvIT4w7W8vKV
	xg9gK6vSm71jFQNbDelnjJbQHaJHNEB7ivTAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rF/NGAJFKuN6AbtY5hcrtD9lRMp8YjKXH5cgdnWBoNWEpNPh9TwqMO+zHIYQ0gkMMy
	Qv02pUO0yyO4B8IXVwWEpzEGhPHepdEiyCoZlEmgyuWj30N6aOhjRABeTjJ/mnjXsxbE
	B+rTZNM3E2wwu5zJvhUHitrSNEccrBPevSveE=
Received: by 10.91.21.27 with SMTP id y27mr137744agi.25.1305173699603;
	Wed, 11 May 2011 21:14:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id s36sm525916ano.1.2011.05.11.21.14.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 21:14:59 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 09:44:50 +0530
Message-Id: <1305173692-19917-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 1/3] ti816x machine: Fix JFFS Image command
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
X-List-Received-Date: Thu, 12 May 2011 04:17:47 -0000

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



