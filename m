Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD3B7EB1D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 15:23:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SFNACN030399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 08:23:20 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 08:22:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Jun 2019 23:22:56 +0800
Message-ID: <1561735377-29354-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 1/2] xfce4-panel: use lxdm to replace dm-tool
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
X-List-Received-Date: Fri, 28 Jun 2019 15:23:50 -0000
Content-Type: text/plain

OE does not support lightdm but lxdm,
so use lxdm to replace dm-tool

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-use-lxdm-to-replace-dm-tool.patch   | 49 ++++++++++++++++++++++
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch
new file mode 100644
index 0000000..b06e26e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch
@@ -0,0 +1,49 @@
+From b80108f01b1425427f98341168ea44c4b1a5a2cf Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 28 Jun 2019 16:02:13 +0800
+Subject: [PATCH] use lxdm to replace dm-tool
+
+OE does not support lightdm but lxdm,
+so use lxdm to replace dm-tool
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ plugins/actions/actions.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/plugins/actions/actions.c b/plugins/actions/actions.c
+index 474798e..63eb41d 100644
+--- a/plugins/actions/actions.c
++++ b/plugins/actions/actions.c
+@@ -905,12 +905,12 @@ actions_plugin_actions_allowed (void)
+   GError          *error = NULL;
+ 
+   /* check for commands we use */
+-  path = g_find_program_in_path ("dm-tool");
++  path = g_find_program_in_path ("lxdm");
+   if (path != NULL)
+     PANEL_SET_FLAG (allow_mask, ACTION_TYPE_SWITCH_USER);
+   else
+   {
+-    /* check for gdmflexiserver if dm-tool is not present */
++    /* check for gdmflexiserver if lxdm is not present */
+     g_free (path);
+     path = g_find_program_in_path ("gdmflexiserver");
+     if (path != NULL)
+@@ -1027,9 +1027,9 @@ actions_plugin_action_activate (GtkWidget      *widget,
+       break;
+ 
+     case ACTION_TYPE_SWITCH_USER:
+-      path = g_find_program_in_path ("dm-tool");
++      path = g_find_program_in_path ("lxdm");
+       if (path != NULL)
+-        succeed = g_spawn_command_line_async ("dm-tool switch-to-greeter", &error);
++        succeed = g_spawn_command_line_async ("lxdm -c USER_SWITCH", &error);
+       else
+         succeed = g_spawn_command_line_async ("gdmflexiserver", &error);
+       g_free (path);
+-- 
+2.8.1
+
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
index a4b200a..cebddf6 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
@@ -12,6 +12,7 @@ SRC_URI[md5sum] = "376e360fb87095edaea7df8ca34fe6a7"
 SRC_URI[sha256sum] = "0d05b6dd8c91c154a364a3e31583c5f423c33e26d44d43cc409165f7d578ca15"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
+    file://0001-use-lxdm-to-replace-dm-tool.patch \
 "
 
 python populate_packages_prepend() {
-- 
2.7.4


