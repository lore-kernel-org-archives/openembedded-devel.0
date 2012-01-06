Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8I-00081w-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:18 +0100
Received: by yenm12 with SMTP id m12so800396yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ux7c+Xp9zXA//bze8wXnKi5IG3U5mga/os8632CiA8Q=;
	b=dB8g7HWjjcJE6OKNXd/5yni0AZOuiD+VV7+UE8RbB5ULsGYyuWEo5G8SFjDqkIkKs+
	C30Afl52VFSMCGApnf2SyiCGsPlglWIs8Yckjy0d71RqgxdTVii/x1h8tfx4dhoA1rKB
	UhP1lLAoMVqMz9bb+dIVjc+4ZO112zOgeplxw=
Received: by 10.236.78.6 with SMTP id f6mr9377194yhe.109.1325876393986;
	Fri, 06 Jan 2012 10:59:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:33 +0000
Message-Id: <c03d4bb5994b001bf034135516ed74b3b30f45ac.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/5] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/tasks/task-x11_1.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
index 67ff93b..681e4f3 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r9"
+PR = "r10"
 
 inherit task
 
@@ -16,8 +16,8 @@ RRECOMMENDS_${PN} = "\
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 
-# elsa, xserver-nodm-init
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+# elsa, xserver-nodm-init or xserver-nodm-init-systemd
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init-systemd"
 
 RDEPENDS_${PN}-utils = "\
   ${VIRTUAL-RUNTIME_xserver_common} \
-- 
1.7.2.5



