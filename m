Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z7e-00049M-Kn
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:10:30 +0200
Received: by bke11 with SMTP id 11so5874249bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FqekPAUeK2+j6C7tCbmzlv4qwCDfkLysJpXUm/+EqMU=;
	b=cVqd1OabPRg4YwwMbJtf8GHrSBzOMPhR263XZo6tqy5ZTtfU/sbwiSUlioIIYcdvV0
	HewUPbKPmqchOwljf65BWe6sQjP5J+Fr59GkMpUAFeO7NeyQWmB8G0xCUdif51UZKT8a
	XVp4pQpYc/uAqxPOatBvjBEIfz2XPPXmSEFjc=
Received: by 10.204.149.72 with SMTP id s8mr1120447bkv.126.1316181449626;
	Fri, 16 Sep 2011 06:57:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p9sm1602368fah.1.2011.09.16.06.57.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:57:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:14 +0200
Message-Id: <e385700f08328a74d40d2eb3630f912cd3c2e430.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/10] task-x11: define better default XSERVER/XSERVER_COMMON values and make whole recipe MACHINE_ARCH
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
X-List-Received-Date: Fri, 16 Sep 2011 14:10:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-x11.bb |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11.bb b/meta-oe/recipes-core/tasks/task-x11.bb
index 66af8bd..a7faa00 100644
--- a/meta-oe/recipes-core/tasks/task-x11.bb
+++ b/meta-oe/recipes-core/tasks/task-x11.bb
@@ -3,7 +3,7 @@ SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r7"
+PR = "r8"
 
 # WORK IN PROGRESS
 
@@ -21,12 +21,10 @@ RRECOMMENDS_${PN} = "\
 
 # Some machines don't set a *runtime* provider for X, so default to Xfbdev here
 # virtual/xserver won't work, since the kdrive recipes will build multiple xserver packages
-XSERVER ?= "xserver-kdrive-fbdev"
-XSERVER_COMMON ?= "xserver-kdrive-common"
-XSERVER_COMMON_shr = "xserver-common"
+XSERVER ?= "xserver-xorg"
+XSERVER_COMMON ?= "xserver-common"
 
-# This is also the reason why we have to make this package machine specific :/
-PACKAGE_ARCH_${PN}-server = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN}-server = "\
   ${XSERVER} \
-- 
1.7.6.1



