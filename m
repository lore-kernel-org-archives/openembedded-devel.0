Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q78QG-0001DL-LH
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:44:04 +0200
Received: by yia13 with SMTP id 13so188434yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=HNgRa1hPAikEmczeMZBSuBIPTy5EJMoF4NgQZJp0gI8=;
	b=yEJjQMZGtb507+VgtOXkbgwBvk0FI1+zCyuSpAJazVXWBwD11YioFsy6RdNkRaz9o9
	4N8VojeujxDtDWHlSocvPctas5Xu5aXd/k8zKJq4chQogExye/Uk3skZVYNA3gNgel4Z
	j8iuB2jxXVwKyMz0skmt2W4+jRVMp7uBfx/GY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=l5rj2IGqS5tDnu2McRk79+NCCewvRHnuHxYV4TQ5rWoAV+I2b3F6vQzQ2MI+0Q4S0t
	JZI39pUGzGOn1fAWQR3BtucU9y6yAnaufTCrP/ypWSJM+l4bhc+oCL2+ndFBiuTbGcs2
	VLrR958u/XpvBHa1E4V4KqEcxlYnKbcfI9Nvk=
Received: by 10.150.63.4 with SMTP id l4mr655675yba.337.1302018118200;
	Tue, 05 Apr 2011 08:41:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm2737519yba.11.2011.04.05.08.41.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:41:57 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 10:41:47 -0500
Message-Id: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/5] linux-omap4: Add support for am45x-evm machine
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
X-List-Received-Date: Tue, 05 Apr 2011 15:44:04 -0000

* Add the am45x-evm machine type to the COMPATIBLE_MACHINEs
  for this kernel version.
* Add the defconfig file for am45x-evm machine type

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../{omap4430-panda => am45x-evm}/defconfig        |    0
 recipes/linux/linux-omap4_2.6.35.3.bb              |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 copy recipes/linux/linux-omap4/{omap4430-panda => am45x-evm}/defconfig (100%)

diff --git a/recipes/linux/linux-omap4/omap4430-panda/defconfig b/recipes/linux/linux-omap4/am45x-evm/defconfig
similarity index 100%
copy from recipes/linux/linux-omap4/omap4430-panda/defconfig
copy to recipes/linux/linux-omap4/am45x-evm/defconfig
diff --git a/recipes/linux/linux-omap4_2.6.35.3.bb b/recipes/linux/linux-omap4_2.6.35.3.bb
index 0502554..8c41441 100644
--- a/recipes/linux/linux-omap4_2.6.35.3.bb
+++ b/recipes/linux/linux-omap4_2.6.35.3.bb
@@ -1,4 +1,4 @@
-COMPATIBLE_MACHINE = "omap4430-panda"
+COMPATIBLE_MACHINE = "omap4430-panda|am45x-evm"
 
 require multi-kernel.inc
 
-- 
1.7.0.4



