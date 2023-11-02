Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33B7C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 06:29:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25281.1698906569980730938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 23:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LPrB7ex3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9670a5cd56=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A241Vhg017650
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Nov 2023 06:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=guJgDwR/GTbUzwPxAnbjadEelBXSBJmMYJ5ixVTXxow=; b=
	LPrB7ex3BRXxgDRvSbhnxDAa6x4Zc8Ap8M7In5lIbAV8Tr5iuFfM2z6rpGOicwjx
	2utbb2MRq9GD3qibtB+V3YiMXkeW9XpHKi/v6h7wDnZjDZtUkq5UPS/qMlsg8JYC
	TSzmIOFbIQM67dLB0chQjwgndMOvCY8qM3iXcPkl1UoumKM2+y2MYKkZ3qKVG+Bm
	e1ZIacsoDKXw2H/OAzN2BBVl7SGCRMkfkhqSxZOT95wcXM6HtdnATqRnBhrb0dBE
	9faFmvXm7MspQ1sGU7LhIMJkimqUj1j2h5Bu+vwS8vC+dAns+fRvZtxWOqaM+pCl
	gEqk0cle65rJF+Q956evqw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u430h84k4-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 06:29:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 23:29:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 23:29:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-blivetgui: 2.3.0 -> 2.4.2
Date: Thu, 2 Nov 2023 14:29:24 +0800
Message-ID: <20231102062924.786081-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102062924.786081-1-kai.kang@windriver.com>
References: <20231102062924.786081-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LqnZCw141Nuvob7qClNt5z5uTFMPuTYu
X-Proofpoint-ORIG-GUID: LqnZCw141Nuvob7qClNt5z5uTFMPuTYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 06:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105836

From: Kai Kang <kai.kang@windriver.com>

Update python3-blivetgui from 2.3.0 to 2.4.2

* drop patches that there are not needed any more
* not set var `B` that out of source tree build is supported
* inherit setuptools3 rather than setuptools3_legacy

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ols-instead-of-distutils-in-setup.py.patch | 30 ----------
 ...Use-symbolic-list-add-and-edit-icons.patch | 56 -------------------
 ...ui_2.3.0.bb => python3-blivetgui_2.4.2.bb} | 18 ++----
 3 files changed, 5 insertions(+), 99 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.3.0.bb => python3-blivetgui_2.4.2.bb} (61%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
deleted file mode 100644
index c88912bfa..000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0001-Use-setuptools-instead-of-distutils-in-setup.py.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 54014061be2fed20d6c35aba9719ea70a9fea9ea Mon Sep 17 00:00:00 2001
-From: Vojtech Trefny <vtrefny@redhat.com>
-Date: Wed, 1 Sep 2021 08:59:19 +0200
-Subject: [PATCH] Use setuptools instead of distutils in setup.py
-
-The distutils module is deprecated and will be removed in Python
-3.12.
-
-Upstream-Status: Backport [https://github.com/kraj/blivet-gui/commit/54014061be2fed20d6c35aba9719ea70a9fea9ea]
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index aa8ef57..77849a1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,7 +1,7 @@
- from __future__ import print_function
- 
--from distutils.core import setup
--from distutils.command.sdist import sdist
-+from setuptools import setup
-+from setuptools.command.sdist import sdist
- import glob
- import sys
- 
--- 
-2.35.1
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch b/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch
deleted file mode 100644
index 3a95859ad..000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui/0002-Use-symbolic-list-add-and-edit-icons.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport [https://github.com/storaged-project/blivet-gui/commit/eb8ec968]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From eb8ec968d1ee8b4b710568b1eb8536296f90751e Mon Sep 17 00:00:00 2001
-From: Adam Williamson <awilliam@redhat.com>
-Date: Thu, 17 Feb 2022 11:16:22 -0800
-Subject: [PATCH] Use symbolic list-add and edit- icons (Adwaita dropped old
- ones)
-
-adwaita-icon-theme 42 no longer includes the non-symbolic icons
-for these names. The choices are to switch to symbolic ones or
-carry the non-symbolic ones downstream.
-
-Signed-off-by: Adam Williamson <awilliam@redhat.com>
----
- blivetgui/list_actions.py      | 8 ++++----
- blivetgui/processing_window.py | 6 +++---
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/blivetgui/list_actions.py b/blivetgui/list_actions.py
-index b7c1f9c..5388feb 100644
---- a/blivetgui/list_actions.py
-+++ b/blivetgui/list_actions.py
-@@ -48,10 +48,10 @@ def __init__(self, blivet_gui):
-         self.blivet_gui = blivet_gui
- 
-         icon_theme = Gtk.IconTheme.get_default()  # pylint: disable=no-value-for-parameter
--        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add", 16, 0)
--        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete", 16, 0)
--        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all", 16, 0)
--        icon_misc = Gtk.IconTheme.load_icon(icon_theme, "edit-paste", 16, 0)
-+        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add-symbolic", 16, 0)
-+        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete-symbolic", 16, 0)
-+        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all-symbolic", 16, 0)
-+        icon_misc = Gtk.IconTheme.load_icon(icon_theme, "edit-paste-symbolic", 16, 0)
- 
-         self.action_icons = {"add": icon_add, "delete": icon_delete, "edit": icon_edit,
-                              "misc": icon_misc}
-diff --git a/blivetgui/processing_window.py b/blivetgui/processing_window.py
-index c400f90..a020ae8 100644
---- a/blivetgui/processing_window.py
-+++ b/blivetgui/processing_window.py
-@@ -93,9 +93,9 @@ def add_action_view(self):
-         """
- 
-         icon_theme = Gtk.IconTheme.get_default()  # pylint: disable=no-value-for-parameter
--        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add", 16, 0)
--        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete", 16, 0)
--        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all", 16, 0)
-+        icon_add = Gtk.IconTheme.load_icon(icon_theme, "list-add-symbolic", 16, 0)
-+        icon_delete = Gtk.IconTheme.load_icon(icon_theme, "edit-delete-symbolic", 16, 0)
-+        icon_edit = Gtk.IconTheme.load_icon(icon_theme, "edit-select-all-symbolic", 16, 0)
- 
-         actions_list = Gtk.ListStore(GdkPixbuf.Pixbuf, str, GdkPixbuf.Pixbuf)
- 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
similarity index 61%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
index 42bcf4651..b6e04e081 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
@@ -5,20 +5,14 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-S = "${WORKDIR}/git"
-B = "${S}"
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https"
+SRCREV = "9b6a83a7aef546ddacafcc656984c9bbed67a8ec"
 
-SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
-SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https \
-           file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
-           file://0002-Use-symbolic-list-add-and-edit-icons.patch \
-           "
+S = "${WORKDIR}/git"
 
-inherit features_check
+inherit features_check setuptools3
 REQUIRED_DISTRO_FEATURES = "x11 systemd gobject-introspection-data"
 
-inherit setuptools3_legacy python3native
-
 PIP_INSTALL_PACKAGE = "blivet_gui"
 
 RDEPENDS:${PN} = "python3-pygobject python3 \
@@ -26,6 +20,4 @@ RDEPENDS:${PN} = "python3-pygobject python3 \
                   python3-pid libreport \
 "
 
-FILES:${PN} += " \
-    ${datadir}/* \
-    "
+FILES:${PN} += "${datadir}/*"
-- 
2.34.1


