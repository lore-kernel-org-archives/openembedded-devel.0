Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD96Y-0000LS-LK
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:45:06 +0200
Received: by eaae1 with SMTP id e1so616603eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=k+Z8xDb5gPx3MSPwlLMqIxdq/ArjqTAEHyKzSqC2xFI=;
	b=ln64bjaYvVHfcd9gxwpS/T8aWNfyZCK0WbooH/V3OhWF1UcLG1X5N/rKIIxv2iHurU
	k4HHrvpVXDmV4B0syz/PH733n14OAJPyQpLInerWYr6k1lvBSmC+s+5r+nz8d/q8cZmn
	bstEAbbidzbozx1KRwxNESyP8C3XkOyVU0nyh0ZnYeW6d6KxiVDCMXQQdxIZdDVO4HPC
	BVJt8vA24tA469tw7goiWlM85UNMkp4NweGptMz3H18QsQO2yQEZetLBAX2PUo1mJhnn
	LNreZqIteWcBF8uQ15m4OqrNlU5CpczeT97/gPkzlDs9NNLl7MoGt07G57MW6d22+NEe
	TL1g==
Received: by 10.180.88.199 with SMTP id bi7mr2504991wib.12.1333002963900;
	Wed, 28 Mar 2012 23:36:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm64248069wiy.7.2012.03.28.23.36.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:36:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:35:57 +0200
Message-Id: <082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1333002899.git.Martin.Jansa@gmail.com>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 1/2] linux-git: drop setversion fix, it's fixed in kernel.bbclass now
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
X-List-Received-Date: Thu, 29 Mar 2012 06:45:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux_git.bb |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index 00d2d52..222df31 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -18,15 +18,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;
 
 S = "${WORKDIR}/git"
 
-do_configure_prepend() {
-#otherwise it gets extra '+' "2.6.37+"
-#because:
-#$ scripts/setlocalversion . => +
-#$ make kernelversion => 2.6.37
-#$ make kernelrelease => 2.6.37+
-  rm -rf ${S}/.git
-}
-
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_collie = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
-- 
1.7.8.5



