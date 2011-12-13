Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbG-00020u-5f
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:06 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so12091124wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uN1WFf/Qy1FPC/R8dvPTTmAIHIeE3Ci8Uay4uCVgUaM=;
	b=QirMstZkfaNZsOLJrRyh/Ui5BxQEwmiuAww/o1X0LtMXsZObz28ApXZ/26dnVeblul
	Y/EmDfTh02NJ4SUA89yEmjlZOO3L7YFczC1357c22iR0h8Ktroa58BwU092N8vAvCt7K
	pvfPrSiUyAbWh7cHqdivNsvq4qfcb4Q4ts2cI=
Received: by 10.227.209.82 with SMTP id gf18mr17320108wbb.8.1323794772797;
	Tue, 13 Dec 2011 08:46:12 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.10 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:11 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:40 +0400
Message-Id: <1323794683-24233-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 3/6] task-opie, task-opie-16mb: make whole recipe a machine-only
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:06 -0000

Currently bitbake spills warnings on task-opie and task-opie-16mb
recipes containing machine packages, while being non-machine ones.
Disable this warning by replacing all PACKAGE_ARCH_xxx stuff with a
single PACKAGE_ARCH = "${MACHINE_ARCH}"

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/tasks/task-opie-16mb.bb |    5 ++---
 recipes-opie/tasks/task-opie.bb      |    9 ++-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/recipes-opie/tasks/task-opie-16mb.bb b/recipes-opie/tasks/task-opie-16mb.bb
index 42ed6a4..33eb19a 100644
--- a/recipes-opie/tasks/task-opie-16mb.bb
+++ b/recipes-opie/tasks/task-opie-16mb.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Tasks for small OPIE image"
 SECTION = "opie/base"
 LICENSE = "MIT"
-PR = "r3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r4"
 
 inherit task
 
@@ -34,8 +35,6 @@ RDEPENDS_task-opie-16mb-applets = "opie-aboutapplet opie-clockapplet opie-suspen
     ${@base_contains("COMBINED_FEATURES", "pcmcia", "opie-cardapplet", "",d)} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "opie-vtapplet opie-logoutapplet", "",d)}"
 
-PACKAGE_ARCH_task-opie-16mb-applets = "${MACHINE_ARCH}"
-
 #
 # clamshell models can benefit from the autorotate applet
 #
diff --git a/recipes-opie/tasks/task-opie.bb b/recipes-opie/tasks/task-opie.bb
index 5e3a113..64e6492 100644
--- a/recipes-opie/tasks/task-opie.bb
+++ b/recipes-opie/tasks/task-opie.bb
@@ -1,8 +1,9 @@
 DESCRIPTION = "Tasks for OPIE stuff"
 SECTION = "opie/base"
 LICENSE = "MIT"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r15"
+PR = "r16"
 
 inherit task
 
@@ -37,8 +38,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS ?= "320"
 RRECOMMENDS_task-opie-base = "opie-taskbar-images-${MACHINE_DISPLAY_WIDTH_PIXELS}x${MACHINE_DISPLAY_HEIGHT_PIXELS} \
                               opie-taskbar-images-${MACHINE_DISPLAY_HEIGHT_PIXELS}x${MACHINE_DISPLAY_WIDTH_PIXELS}"
 
-PACKAGE_ARCH_task-opie-base = "${MACHINE_ARCH}"
-
 #
 # things for reasonable bootstrap image
 #
@@ -51,8 +50,6 @@ RDEPENDS_task-opie-base-applets = "opie-aboutapplet opie-clockapplet opie-suspen
     ${@base_contains("COMBINED_FEATURES", "pcmcia", "opie-cardapplet", "",d)} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "opie-vtapplet opie-logoutapplet", "",d)}"
 
-PACKAGE_ARCH_task-opie-base-applets = "${MACHINE_ARCH}"
-
 #
 # clamshell models can benefit from the autorotate applet
 #
@@ -78,8 +75,6 @@ RDEPENDS_task-opie-extra-settings = "opie-language opie-doctab opie-mediummount
     ${@base_contains("DISTRO_FEATURES", "ppp", "opie-networksettings-pppplugin", "",d)} \
 			    "
 
-PACKAGE_ARCH_task-opie-extra-settings = "${MACHINE_ARCH}"
-
 RDEPENDS_task-opie-base-decorations = "opie-deco-flat opie-deco-liquid opie-deco-polished"
 
 RDEPENDS_task-opie-base-styles = "opie-style-flat opie-style-fresh opie-style-web opie-style-phase"
-- 
1.7.7.3



