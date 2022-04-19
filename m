Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC12C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4558.1650332726810877556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23J1jPQs009452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Apr 2022 18:45:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Apr 2022 18:45:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-blivetgui: use symbolic list-add and
 edit- icons
Date: Tue, 19 Apr 2022 09:45:20 +0800
Message-ID: <20220419014520.23897-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96688

From: Kai Kang <kai.kang@windriver.com>

Backport patch from upstream for python3-blivetgui to use symbolic
list-add and edit- icons that Adwaita dropped old ones.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...Use-symbolic-list-add-and-edit-icons.patch | 56 +++++++++++++++++++
 .../python-blivet/python3-blivetgui_2.3.0.bb  |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch
new file mode 100644
index 000000000..3a95859ad
--- /dev/null
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport [https://github.com/storaged-project/blivet-gui/commit/eb8ec968]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From eb8ec968d1ee8b4b710568b1eb8536296f90751e Mon Sep 17 00:00:00 2001
+From: Adam Williamson <awilliam@redhat.com>
+Date: Thu, 17 Feb 2022 11:16:22 -0800
+Subject: [PATCH] Use symbolic list-add and edit- icons (Adwaita dropped old
+ ones)
+
+adwaita-icon-theme 42 no longer includes the non-symbolic icons
+for these names. The choices are to switch to symbolic ones or
+carry the non-symbolic ones downstream.
+
+Signed-off-by: Adam Williamson <awilliam@redhat.com>
+---
+ blivetgui/list_actions.py      | 8 ++++----
+ blivetgui/processing_window.py | 6 +++---
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/blivetgui/list_actions.py b/blivetgui/list_actions.py
+index b7c1f9c..5388feb 100644
+--- a/blivetgui/list_actions.py
++++ b/blivetgui/list_actions.py
+@@ -48,10 +48,10 @@ def __init__(self, blivet_gui):
+         self.blivet_gui = blivet_gui
+ 
+         icon_theme = Gtk.IconTheme.get_default()  # pylint: disable=no-value-for-parameter
+-        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add", 16, 0)
+-        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete", 16, 0)
+-        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all", 16, 0)
+-        icon_misc = Gtk.IconTheme.load_icon(icon_theme, "edit-paste", 16, 0)
++        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add-symbolic", 16, 0)
++        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete-symbolic", 16, 0)
++        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all-symbolic", 16, 0)
++        icon_misc = Gtk.IconTheme.load_icon(icon_theme, "edit-paste-symbolic", 16, 0)
+ 
+         self.action_icons = {"add": icon_add, "delete": icon_delete, "edit": icon_edit,
+                              "misc": icon_misc}
+diff --git a/blivetgui/processing_window.py b/blivetgui/processing_window.py
+index c400f90..a020ae8 100644
+--- a/blivetgui/processing_window.py
++++ b/blivetgui/processing_window.py
+@@ -93,9 +93,9 @@ def add_action_view(self):
+         """
+ 
+         icon_theme = Gtk.IconTheme.get_default()  # pylint: disable=no-value-for-parameter
+-        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add", 16, 0)
+-        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete", 16, 0)
+-        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all", 16, 0)
++        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add-symbolic", 16, 0)
++        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete-symbolic", 16, 0)
++        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all-symbolic", 16, 0)
+ 
+         actions_list = Gtk.ListStore(GdkPixbuf.Pixbuf, str, GdkPixbuf.Pixbuf)
+ 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index c26ae1fe9..29e7a267d 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -11,7 +11,8 @@ B = "${S}"
 SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
 SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https \
            file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
-          "
+           file://0002-Use-symbolic-list-add-and-edit-icons.patch \
+           "
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 systemd"
-- 
2.17.1


