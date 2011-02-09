Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnGaM-0001Lc-4G
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:24:22 +0100
Received: by fxm17 with SMTP id 17so599722fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=ARsTlZcAnwnC4yRpN+wF7DdX84NbN9p3TJJxhJ2QTfo=;
	b=GWCp6Rrr4lTIIriPSgKCLXodVqb4oW1iUhJXt9uBS9YPRJ2o+3lNK3Rp6A0PzJGq+d
	kDIQZoZNxpEOMaSDEZwfgQch8Ur41hVtLHe6gxl0wvmE7M2A47k1agQQj38b20ysaljW
	sx2gVvB83Jk3Zv2K4YmLtROyLpJ7OLlWUOas0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=mvh8G1zcrQwnSLiS2pL4h29LJJZRoVJgLgj+MFJrKYAkwhausT8qnFvckoH9t+i0uZ
	qN07TVPwDMfhCNkJyKpWsNwQ+CKl3bCFBF+fLlDuhjlBcHOhy/mT3SSx7Wvt2YHDffhR
	tRpIug2TNWal1HEkdQvbGDWqAo7f2q48F5gsc=
Received: by 10.223.83.134 with SMTP id f6mr15545989fal.1.1297282998135;
	Wed, 09 Feb 2011 12:23:18 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id n1sm361560fam.40.2011.02.09.12.23.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Feb 2011 12:23:17 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kristoffer.ericson@gmail.com
Date: Wed,  9 Feb 2011 21:23:09 +0100
Message-Id: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Wed, 09 Feb 2011 20:24:22 -0000

We use the scsi subsystem for PCMCIA ATA access, so device files are
/dev/sda*, not /dev/hda*.
See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/base-files/base-files/jornada7xx/fstab |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/base-files/base-files/jornada7xx/fstab b/recipes/base-files/base-files/jornada7xx/fstab
index f0c23d9..a06a1b6 100644
--- a/recipes/base-files/base-files/jornada7xx/fstab
+++ b/recipes/base-files/base-files/jornada7xx/fstab
@@ -1,7 +1,7 @@
 proc		/proc	proc	defaults	        0  0
-/dev/hda2       /       ext2    defaults                0  0
-/dev/hda1	/mnt/cf	auto	defaults,sync,noauto	0  0
-/dev/hda3       none    swap    sw                      0  0
+/dev/sda2       /       ext2    defaults                0  0
+/dev/sda1	/mnt/cf	auto	defaults,sync,noauto	0  0
+/dev/sda3       none    swap    sw                      0  0
 tmpfs		/var/volatiles	tmpfs	defaults	        0  0
 tmpfs		/mnt/ram	tmpfs	defaults	0  0
 tmpfs                /dev/shm             tmpfs      mode=0777             0  0
-- 
1.7.1



