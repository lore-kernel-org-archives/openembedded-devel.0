Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Po17o-00041v-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:06:00 +0100
Received: by fxm17 with SMTP id 17so3074956fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=YysIeB4nhhrnbtRdkjW3CHTbwhyv/p5YudjOntP3K9o=;
	b=lGOA/EjNVqqI60nV2mwzP7itiBLEmPXtN11fqHqffZihFeiW0dgUiBb/mLnEe60+tR
	AeZGDqkkJrav0iwPs7TKGAjakDcs7dP4EErNPYiffMwO66ARILV3OjUNTQvOJdy1cqEY
	qvc79b+vI8/UrUmI0XVkekapPUpiHjlwriHLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=dsOViaD4V3mDAehteipGB6rm+RBPxPYQDal7ZSRDue0dodHeawxb4YJBhlQhMenoyw
	HcaTwtl6UcC222z4212rGjwVM05K+RiYgtdkH4ghj3GvcDC7py7IyOyoEYs+emw4huqF
	iKN0MKucT+rUVYL1AOuWbqwCkreFgNEijoZhk=
Received: by 10.223.98.204 with SMTP id r12mr1115240fan.102.1297461894141;
	Fri, 11 Feb 2011 14:04:54 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id 21sm638689fav.17.2011.02.11.14.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 14:04:53 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 23:04:42 +0100
Message-Id: <1297461882-5965-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] distro/jlime-2010.1.conf: cleaned up RDEPENDS, beefed up FEATURES.
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
X-List-Received-Date: Fri, 11 Feb 2011 22:06:00 -0000

tslib and dialog should be pulled in by appropiate dependencies and
wireless-tools comes from wifi in DISTRO_FEATURES.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 conf/distro/jlime-2010.1.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index 7af9106..8673ffa 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -23,8 +23,7 @@ OVERRIDES .= ":jlime"
 #
 # What we want on the bootstrap image (extra) 
 #
-DISTRO_EXTRA_RDEPENDS = "wireless-tools nano keymaps tslib-calibrate \
-			 console-tools tslib-tests dialog apt"
+DISTRO_EXTRA_RDEPENDS = "nano keymaps console-tools apt"
 
 #
 # Our Image files should look abit better.
@@ -68,7 +67,7 @@ TARGET_FPU_armeb = "soft"
 TARGET_FPU_mipsel = "soft"
 TARGET_FPU_mips = "soft"
 
-DISTRO_FEATURES += " eabi "
+DISTRO_FEATURES += "eabi wifi pcmcia"
 
 LIBC ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc = "${LIBC}"
-- 
1.7.1



