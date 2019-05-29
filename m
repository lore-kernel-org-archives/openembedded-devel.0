Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB93B6C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:41:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T2fUOd022483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:41:31 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 28 May 2019 19:41:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 May 2019 22:40:39 -0400
Message-ID: <20190529024039.45241-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] lxdm: provides fake gdmflexiserver for xfce desktop environment
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2019 02:41:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Xfce4 plugin 'actions' which stays in tray area provides a menu 'Switch
User' but the menu grayed out. It calls whether 'dm-tool' from lightdm
or 'gdmflexiserver' from gdm to support switch users.

Since recipe gdm has been removed from meta-gnome, create a fake
'gdmflexiserver' which calls lxdm to make menu 'Switch User' work
according to:

https://wiki.archlinux.org/index.php/Xfce#User_switching_action_button_is_greyed_out

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver | 3 +++
 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend     | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
 create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend

diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver b/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
new file mode 100644
index 000000000..4ef8baf29
--- /dev/null
+++ b/meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+lxdm -c USER_SWITCH
diff --git a/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend b/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
new file mode 100644
index 000000000..4a799a98a
--- /dev/null
+++ b/meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${BPN}:"
+
+SRC_URI += "file://gdmflexiserver"
+
+do_install_append () {
+    install -D -m 0755 ${WORKDIR}/gdmflexiserver ${D}${bindir}/gdmflexiserver
+}
-- 
2.20.0


