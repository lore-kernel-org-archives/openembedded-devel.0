Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2499F6A9F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:34 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c50so3468234eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tSQFwLEuSFpJtq/kciiGzK1LWq2e1gwqsvBkhG5WCJ4=;
	b=VYoU9p+2RUy8nTiPxLnh8EIIeslh7JiH0aNbdD+9x+8FwUlMGB8TjCOElMF0sv8Fge
	Sj16rdwOwCveQguvca7S83yTBRi3BZQs1akIiCvhZHRwNX1VlZinJjEcfFqVO4NFWD2O
	LjrED8ntPi+qwnVRW8iCl8xlvLI1SLItDoJNcddwNZzn/OXPARACBk+VRnKzR57MYckM
	wMJ5EZXj6AqWHQLADjEQKI8z6k5sTHa4mQDoBEXmmCV/AHwsX8IZrqpEDnkCe/KFIyle
	MUwUxVm2C5WhzH4DbN6Cb8iozcE0oOUnoYWLDm8euv22tDjqo9f5hZ6Wkz+1C3VBLPEU
	FRTg==
X-Received: by 10.15.35.129 with SMTP id g1mr14631734eev.110.1370929055873;
	Mon, 10 Jun 2013 22:37:35 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:36 +0200
Message-Id: <1370928876-14423-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 15/15] xarchiver: update to 0.5.3 for various bugfixes
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xarchiver is unmaintained for long time. Since I think it is worth to invest
further development I did collect pending patches, wrote some myself, pushed
into my git repo and contacted the developer. He signalled 'green light' for me
maintaining xarchiver in the future. As long as I have not yet created/uploaded
a tarball let us use my git-repo for the sources.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xarchiver_0.5.2.bb => xarchiver_git.bb}       |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.2.bb => xarchiver_git.bb} (60%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
similarity index 60%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index 6482adc..b616267 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -1,22 +1,28 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
-PR = "r3"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
-SRC_URI[md5sum] = "2bc7f06403cc6582dd4a8029ec9d038d"
-SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a"
+SRC_URI = "git://gitorious.org/xfce/xarchiver.git;protocol=git;branch=master"
+SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
+PV = "0.5.3"
+S = "${WORKDIR}/git"
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
 
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
+
 FILES_${PN} += "${libdir}/thunar-archive-plugin"
 
-RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip xz"
-- 
1.7.6.5


