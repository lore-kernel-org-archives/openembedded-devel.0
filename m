Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylg-0001lE-3R
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:16 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=YDBty3SJG1DPQKBKKXODZhtjh+eOSWNtNEqOVon+aCw=;
	b=zo1jcH4GCgOxpwSt2qAMdGVHHcgNjFXJz6jxvYJDWI3VVYFKQlRn7zskRXqvWUUxJs
	xniopAzzLicosOOBtKq64IocDWOCa/r6EQiXwrZUV/UskOj8/Xnu8Hy3XWdGc9bi2weT
	BKm2FjJl20gvLzA5yr0JMieoKi3FC/vOZ+RZeMeTa+o5ooZSPdsb7HPfkFZ4FpjNdOgR
	lskyZbuftb6ZvartmsGGQ2fpoR4QzC5U9DnlfCymt6kJN5WOH3kiVmyNrSf0HLDX3gTp
	Vdowbhkp9P2ct2THEb2BosMrcHY/CNlrVGfJqfUa2wADFJhjmNnWqS60wCGvNVU4XYEZ
	FZ7A==
Received: by 10.204.147.65 with SMTP id k1mr10914bkv.29.1347977678151;
	Tue, 18 Sep 2012 07:14:38 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:57 +0200
Message-Id: <1347977601-28665-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 16/40] xfce4-panel: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-panel_4.8.6.bb => xfce4-panel_4.10.0.bb} |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.8.6.bb => xfce4-panel_4.10.0.bb} (81%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
index b59fde0..5d03425 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
@@ -4,10 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
 
-PR = "r3"
-
 inherit xfce
 
+SRC_URI[md5sum] = "cf7351a4b952dbe3fc5ff509c68def33"
+SRC_URI[sha256sum] = "3321f998af2bbd14ba68654a8881774f6ea2ec4f1a3544598e7f47d3ed0009b9"
+
 python populate_packages_prepend() {
     plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
     plugin_name = bb.data.expand('${PN}-plugin-%s', d)
@@ -18,9 +19,6 @@ python populate_packages_prepend() {
                                          '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
                                          '${bindir}/*%s*'])
 }
-do_install_append () {
-    find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -f {} +
-}
 
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
@@ -29,5 +27,3 @@ FILES_${PN} += "${libdir}/xfce4/panel/migrate \
 
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 		   "
-SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
-SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
-- 
1.7.6.5



