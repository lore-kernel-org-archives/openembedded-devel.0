Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cks-0007eY-ID
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:03:55 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iW9GbHztURAublDzYJ/ouv2YKrTOAfmari2pDf1ufnU=;
	b=bglE37xXXc8QYPLEO1DPRNPtLSqtETpvKepaKtQkK6ZnONtgclYkByTMHXAhC+dnSq
	0zOvEARwOSqr0z2vc6jrODxDrVoF+saM/rE9CbSlafqr3Nicc8N9OYFeM8q6AzYpxpI9
	bJUh911HOrEAJxequzs7kZP5HcR7prUpoTu9k=
Received: by 10.204.133.78 with SMTP id e14mr8154403bkt.248.1317387506236;
	Fri, 30 Sep 2011 05:58:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm4891688bkd.6.2011.09.30.05.58.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:58:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:47 +0200
Message-Id: <52046d7c472cf34b6344175dd0df223d6fc2100d.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 11/15] task-x11: use xserver-xf86-lite as default XSERVER
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
X-List-Received-Date: Fri, 30 Sep 2011 13:06:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-x11.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11.bb b/meta-oe/recipes-core/tasks/task-x11.bb
index a7faa00..31c7c43 100644
--- a/meta-oe/recipes-core/tasks/task-x11.bb
+++ b/meta-oe/recipes-core/tasks/task-x11.bb
@@ -3,7 +3,7 @@ SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r8"
+PR = "r9"
 
 # WORK IN PROGRESS
 
@@ -21,7 +21,7 @@ RRECOMMENDS_${PN} = "\
 
 # Some machines don't set a *runtime* provider for X, so default to Xfbdev here
 # virtual/xserver won't work, since the kdrive recipes will build multiple xserver packages
-XSERVER ?= "xserver-xorg"
+XSERVER ?= "xserver-xf86-lite"
 XSERVER_COMMON ?= "xserver-common"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6.1



