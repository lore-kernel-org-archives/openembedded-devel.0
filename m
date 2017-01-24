Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9D471975
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 17:11:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0OHBVjE029750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:11:32 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 24 Jan 2017 09:11:31 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jan 2017 12:11:30 -0500
Message-ID: <1485277890-26052-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] xfce: add dbus-glib-native to DEPENDS to fix do_configure
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
X-List-Received-Date: Tue, 24 Jan 2017 17:11:34 -0000
Content-Type: text/plain

Now with the shared sysroot gone, an implicit dependency shows up as:

| checking for dbus-binding-tool... no
| configure: error: could not find dbus-binding-tool in $PATH. You can run
|   ./configure DBUS_BINDING_TOOL=/path/to/dbus-binding-tool to define
|   a custom location for it.
| ERROR: Function failed: do_configure (log file is located at /home/paul/poky/build/tmp/work/core2-64-overc-linux/xfdesktop/4.12.3-r0/temp/log.do_configure.9339)
ERROR: Task (/home/paul/poky/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb:do_configure) failed with exit code '1'

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
index e9513439974b..daecf828eab0 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar garcon exo"
+DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib dbus-glib-native thunar garcon exo"
 
 inherit xfce distro_features_check
 
-- 
2.7.4


