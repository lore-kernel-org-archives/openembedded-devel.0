Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rx2ig-0003T5-3D
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 21:41:54 +0100
Received: by eaal10 with SMTP id l10so1586701eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 12:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wyKwDULADeLBk548Uv+0y19bFUGZKXrME/Z0aIdubwc=;
	b=U92hRhp49ObUr9Bm3ct/02DW3oIY7pzmvVd46AiloCFeKSM2ehEK2vMoy5edDLl9+/
	XEG+ih8tQGinrhgribegm5aCbfrYJgwxLVNS1d+AXNXD0nNM+L7ZaWY+Yy5Bq7o6lxiY
	V/GdYkNZzmMdQVN1W7lZYPeEhvOolOF+mAolQ=
Received: by 10.14.94.66 with SMTP id m42mr5604207eef.66.1329165224535;
	Mon, 13 Feb 2012 12:33:44 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id c16sm64722820eei.1.2012.02.13.12.33.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 12:33:43 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 21:31:22 +0100
Message-Id: <1329165082-18663-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <CALbNGRRXRVVjAN-soiseru_RBJkM0KQMBWnAzfy4Ah4AEDaDZA@mail.gmail.com>
References: <CALbNGRRXRVVjAN-soiseru_RBJkM0KQMBWnAzfy4Ah4AEDaDZA@mail.gmail.com>
Subject: [PATCH 3/3 v3] xfce4-panel: Remove static version of panel plugins.
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
X-List-Received-Date: Mon, 13 Feb 2012 20:41:54 -0000

They have no actual use and trigger QA warnings.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index 0cd8eba..a2b3ea9 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
 
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
@@ -19,6 +19,10 @@ python populate_packages_prepend() {
 	                                     '${bindir}/*%s*'])
 }
 
+do_install_append () {
+    find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -f {} +
+}
+
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
@@ -27,8 +31,5 @@ FILES_${PN} += "${libdir}/xfce4/panel/migrate \
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 		   "
 
-FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
-                   "
-
 SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
 SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
-- 
1.7.3.4



