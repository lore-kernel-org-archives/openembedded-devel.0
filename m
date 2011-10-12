Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDv8m-00005k-BJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 11:30:20 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so705782bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5I5rgmY0XXMFoLVOJqSh7ifmVnm+tAMvirITHu00XnI=;
	b=JEMen1WiF2sZ/UMw5hvxqy9Zhe5G4qGW3CrZcYxS41e7oKn6lrDZP6EJm6L/MdGFRt
	NPkKQ5E33S5G1MgJsU86p2BOWNGpd49JctlMX3UHuNfLQe2wU5/z6N6BcVUIIodJANlj
	wuuTbZFhnWHKNdDVyqZMq3IUEfBUhCkh/BgR8=
Received: by 10.204.139.21 with SMTP id c21mr788180bku.63.1318411479895;
	Wed, 12 Oct 2011 02:24:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm1388473bkv.3.2011.10.12.02.24.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 02:24:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 11:24:22 +0200
Message-Id: <75ad3df1683ae38e7cb33f3849a09994f20ecbbe.1318411412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1126404121c5f4f21439ca69ca6aaa6ea6821c91.1318411412.git.Martin.Jansa@gmail.com>
References: <1126404121c5f4f21439ca69ca6aaa6ea6821c91.1318411412.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318411412.git.Martin.Jansa@gmail.com>
References: <cover.1318411412.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 2/2] linux: bump SRCREV for 3.1.0-rc9 and use repo on kernel.org again
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
X-List-Received-Date: Wed, 12 Oct 2011 09:30:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-git.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
index 91aeb7f..1e92e8d 100644
--- a/recipes-kernel/linux/linux-git.inc
+++ b/recipes-kernel/linux/linux-git.inc
@@ -1,11 +1,10 @@
-KERNEL_RELEASE = "3.1.0-rc6"
+KERNEL_RELEASE = "3.1.0-rc9"
 OLD_KERNEL_RELEASE = "3.0.99"
 PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
 
-SRCREV = "b6fd41e29dea9c6753b1843a77e50433e6123bcb"
+SRCREV = "65112dccf8a113737684366349d7f9ec373ddc47"
 
-#git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
-SRC_URI = "git://github.com/torvalds/linux.git;protocol=git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master \
            file://defconfig"
 S = "${WORKDIR}/git"
 
-- 
1.7.7



