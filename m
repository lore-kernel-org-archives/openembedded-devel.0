Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSJ-0007zx-5W
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:31 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wLkwk/n0h6JbvFolQn6SOSpN7OU2UEMM3yTX7hu/4s0=;
	b=tO9zqVJOoUskqLSKfUyHTrGVi75tsMad8haNq6IO1T8emadb1uxzyCf+lgk0JIjhML
	wWAQGU/a4W32PiGSFpojjZAwrHVtbq0ECxepoeO/NmSP4l2sw99bhUnrEmdGtcXHm6Yj
	Oo9hC+3Upi0pj1wR2uVMfT6QtGxs+FSR7yFFXD0PMEhMFjiWQfFHBpdzzJi4t8SxMTrw
	2ruQ6bMb8YNoPq0LkFgXONe5j3ekOYs5BlVqoGeyl02CcCr/yoe4RNIOX8PIXWdEDuBz
	z/aEIxpMy2+NwLNgC022klY9dRsf3xycxb3+FNrpHJGTVisfGblChEy9mDqh3whZ3cmA
	bKmg==
Received: by 10.205.133.11 with SMTP id hw11mr157641bkc.46.1342168279041;
	Fri, 13 Jul 2012 01:31:19 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:16 +0200
Message-Id: <1342168240-7760-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 08/32] task-x11: in case meta-systemd is part of BBLAYERS, xserver-nodm-init-systemd is recommended automatically
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/tasks/task-x11_1.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
index 628789a..326e09f 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 inherit task allarch
 
@@ -16,8 +16,8 @@ RRECOMMENDS_${PN} = "\
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "xserver-common"
 
-# elsa, xserver-nodm-init or xserver-nodm-init-systemd
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init-systemd"
+# elsa or xserver-nodm-init(-systemd)
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 RDEPENDS_${PN}-utils = "\
   ${VIRTUAL-RUNTIME_xserver_common} \
-- 
1.7.6.5



