Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgbsr-00067T-Hn
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:48:31 +0100
Received: by ghrr17 with SMTP id r17so5948062ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=82YQzdjkfDgHvXKWOpJ7iuop8DLhD0Sc20FaVK+/svk=;
	b=RsUU/krYF0lfI2aRyHB/jj4l64hQudSMWeVsyiVRvp7+kQ2KD6OmgoA53mNhHs/eOO
	A/lmQnbukUutKEaxS3jgMIEKmF5SiJAZES8+U5GRlF8yPNQt5deqa1AFESh1zdPZcFSE
	wuczFypfBy4eFXWWFfLzvnY4LYA7cLE5KsPM4=
Received: by 10.236.153.1 with SMTP id e1mr50472055yhk.106.1325248873436;
	Fri, 30 Dec 2011 04:41:13 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id j21sm92455611ann.0.2011.12.30.04.41.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 04:41:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2011 12:40:56 +0000
Message-Id: <06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325248824.git.otavio@ossystems.com.br>
References: <cover.1325248824.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325248824.git.otavio@ossystems.com.br>
References: <cover.1325248824.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 12:48:32 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/tasks/task-x11_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
index 67ff93b..af92e49 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r9"
+PR = "r10"
 
 inherit task
 
@@ -17,7 +17,7 @@ RRECOMMENDS_${PN} = "\
 VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 
 # elsa, xserver-nodm-init
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init-systemd"
 
 RDEPENDS_${PN}-utils = "\
   ${VIRTUAL-RUNTIME_xserver_common} \
-- 
1.7.2.5



