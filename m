Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylT-0001lE-06
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:03 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=JKPweCnxm01ciY+akXd0QXHp0qTvadRN7SumtghiZe4=;
	b=vLg5tz7sKltpMj3R2VMCdnrvsq6sA1PJInocWPLp5WozhueFEgR6kW/o5j9ZNE+kuf
	pG60UgiHP3Of3ysnj+Xpm165tkztok1BR3d7eoVRdND8CUjc+SmuYlQ8DhKg/37qLXJd
	GjGa/P0P2VBMJ16RraKFazGdSZK4xRab4aOOV9KpImbcgdXU4rL30ZH2kZzm7Xmw7Xs/
	P6pWb9icPWchf6EfcOKJa2QHAX0ynW7Ng+UbOGOx4Y4AGWAkJFW/0KOs+LQDPByKHA40
	zVaL1X0X3AlJrYN/Z+x1ANh4nxEGsKTdL4oyhBjaQF2A0Bbhj5/6eHXDHIMCqmYgZZLx
	Qisg==
Received: by 10.204.128.68 with SMTP id j4mr128509bks.122.1347977665270;
	Tue, 18 Sep 2012 07:14:25 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:49 +0200
Message-Id: <1347977601-28665-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 08/40] xfce-utils: remove since they are not needed anymore
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Functionality has been moved in xfce4-session, libxfce4ui, xfce4-appfinder or is removed [1].

[1] http://xfce.org/download/changelogs/4.10pre1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-base.bb        |    3 +--
 .../recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb    |   20 --------------------
 2 files changed, 1 insertions(+), 22 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 41e1d4a..d091e92 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -20,7 +20,6 @@ RDEPENDS_${PN} = " \
     \
     gtk-xfce-engine \
     \
-    xfce-utils \
     xfce4-panel-plugin-actions \
     xfce4-panel-plugin-applicationsmenu \
     xfce4-panel-plugin-clock \
diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
deleted file mode 100644
index e4b8686..0000000
--- a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION="Xfce4 Utilities"
-SECTION = "x11"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "gtk+ virtual/libx11 dbus libxfce4util libxfce4ui"
-
-inherit xfce
-
-# usually we do not migrate (requires perl on target)
-EXTRA_OECONF += "--disable-xfconf-migration"
-
-FILES_${PN} += " \ 
-	${libdir}/xfce4/xfconf-migration \
-        ${datadir}/dbus-1/* \
-        ${datadir}/xsessions/xfce.desktop \
-"
-RDEPENDS_${PN} = "xrdb openssh-misc"
-
-SRC_URI[md5sum] = "03b5fba5f63f4f1a31cc7d3728f3c87e"
-SRC_URI[sha256sum] = "035070d7e608b29dbaeeb6ec541d8c2edbd28152d3ef111316c33871ab02b926"
-- 
1.7.6.5



