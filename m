Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylh-0001l8-6Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:17 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=78MLyDno/+splnP/wGRfpilKDT8i3sT2JRSYKwVdyiI=;
	b=xkootaAYBtjxVZ9F7Xvus2Tp6cSZvGx24JsvUQpUk01ewAtwL3smFaSueBknlmRTgD
	WrVcOeDW3YmqIhYaFiSfjlvbE0tQ6Sld+EB2Ziiv1CL2KWoIVJ8X8IL+2mWciIqguaut
	fx2BKyW+djDrlQg5qwbwAWqQkKPUS0O4dHpiecHxEdmQA6QsnqdhsGtxVS7QJHbMGvyr
	qQAJFqFy5zu+XdaouO6nEmLb6+ii39uzg43ld+qeRAIl6mbZx5BihKUdkYWkJ/vJYIVP
	pQYdKNqTff21BVfl9FTchkeRchTXlcKuo5wvvCbL9OssQzO2ua6i1VIX0vsGLbuPefke
	GRrg==
Received: by 10.204.10.92 with SMTP id o28mr4119bko.39.1347977679473;
	Tue, 18 Sep 2012 07:14:39 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:58 +0200
Message-Id: <1347977601-28665-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 17/40] thunar: update to 1.4.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar/{thunar_1.2.3.bb => thunar_1.4.0.bb}    |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.2.3.bb => thunar_1.4.0.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
index 86fcc79..39b1254 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
@@ -2,13 +2,12 @@ DESCRIPTION = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
-
-PR = "r1"
+DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
 
 inherit xfce
 
-# SRC_URI must follow inherited one
+SRC_URI[md5sum] = "737ad2c36ed36b10fef82e860b9e990a"
+SRC_URI[sha256sum] = "2c11a19e64cef708a264fb4d5d933389899c3d132fe7b1e313dd6e37bfe4c8ba"
 SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
 
 S = "${WORKDIR}/Thunar-${PV}/"
@@ -23,6 +22,3 @@ FILES_${PN} += "${libdir}/thunarx-2/* \
 FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
                     ${libdir}/Thunar/.debug/"
-
-SRC_URI[md5sum] = "0a2c36cdd3cb3a2ab52cbf6055415b85"
-SRC_URI[sha256sum] = "e66aa9ad61a9202e15cc7c5fffc7b961da9ab3b4428f874c1ec8e46eb4ffaca6"
-- 
1.7.6.5



