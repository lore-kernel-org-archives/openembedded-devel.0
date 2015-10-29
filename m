Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9A075E80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:04:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T24YZw011692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 19:04:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 28 Oct 2015 19:04:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Oct 2015 09:55:34 +0800
Message-ID: <1446083734-19381-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] mousepad: inherit gsettings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 02:04:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When launch mousepad, it fails with:

| glib-gio-error setting schema 'org.xfce.mousepad' is not installed

It needs to call glib-compile-schemas to compile its schema file.
Inherit gsettings to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
index 4c8c1f5..4ca21a6 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 # which fixes mousepad/Makefile.am:72: error: HAVE_DBUS does not appear in AM_CONDITIONAL
 DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-native"
 
-inherit xfce-app
+inherit xfce-app gsettings
 
 SRC_URI[md5sum] = "f55314c5dda6323883241e6cf01550a7"
 SRC_URI[sha256sum] = "60114431eac8db6bb6ce18bd38f1630cccb684375b97a445a1b6fd619848d132"
-- 
2.6.1


