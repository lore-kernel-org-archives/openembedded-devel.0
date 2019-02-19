Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 86AB77C9B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 22:23:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w2so9109763wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 14:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3l9unGwWFEcETs8j5s2SYmpwfR1a1fJ+rt+6nzfvzDM=;
	b=tIL/EAdk2284pT9JPZrinlgwEDiQqmCZjHf3aaJ1y+j2m21zSZ8ta/NrTU7LLOIPtb
	doH6kHdLLF9eHWcaIWEXw0OYqYAJGyyD2NV9uCJ5IkHY7eyp58aYnnvK0w77lgt/Hod8
	LdaRaOBgXDPtGXaHKz+k3w36Q9820l10eH6WQzz2rdPnoKVaO/ZiCPRVhx6wxEP3bxcm
	autQzU14VHldNmIv5JC25BLgJDLN0QXuGvmDwJ/m1vIKxiMa36+sm7RRF4lE9I42gWAg
	6ewd/SYr8Px9Ynnc8Wccp+hErZiEDXeFhS686becjEa2KzqtrWJpeF7sMqOkmhFxk6/Q
	buhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3l9unGwWFEcETs8j5s2SYmpwfR1a1fJ+rt+6nzfvzDM=;
	b=OdlC9GWkx6JYpxjcYm1Gz1PKbL0JQug4+XDlBpsFIRp+MoEPZ/es7VSDMB+djsm3nj
	ac92ELae/SWSvOS7ErCxMMv+z+PLdbOjmu2UP8fvGvZGylsGDPGsm18nSJQqRat1kZyK
	J8VSI6sAisOTWhn5eJluW5A3SjgRAZs6TruGgo02oA2/49LYztfFjZwg0/ZDltT1RUBE
	f8XUC5cumdEn79VHuT97h2SKiaNgnGPydRkjV76QsfPrqDZGAXWA/3eduhyDkOempfOy
	rCzaM+JnrYFnScWAIM4ySEbUft1j1E0POfygEKimtwN0fhA7VtUDXmCj4CBVYfAYpUvk
	AoRQ==
X-Gm-Message-State: AHQUAubh6P9tY/IOWluwEfaF3+PHE0jNm+ep26S5eXOitKKb3QGpAgdE
	V7jh/qyf2zaqiNXmf3NKPmBMzBCl
X-Google-Smtp-Source: AHgI3IZeF2u4BGzeJnldx16xE3d8ze0EV/XJxsfwLcCg+u/fcfa7j5Xz+FSOW2pVM0kaqbshFC5O+g==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr4178866wrm.72.1550615014003;
	Tue, 19 Feb 2019 14:23:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F065789FB9A06193E8AB1B8.dip0.t-ipconnect.de.
	[2003:f0:7f06:5789:fb9a:619:3e8a:b1b8])
	by smtp.gmail.com with ESMTPSA id
	d24sm55158896wrb.47.2019.02.19.14.23.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:23:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2019 23:23:19 +0100
Message-Id: <20190219222319.21370-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219222319.21370-1-schnitzeltony@gmail.com>
References: <20190219222319.21370-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] xarchiver: upgrade to upstream 0.5.4.14
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
X-List-Received-Date: Tue, 19 Feb 2019 22:23:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build with gtk+3
* add 7z support

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/xarchiver/xarchiver_git.bb   | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index a27c8f553..7445cd7c5 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -5,22 +5,29 @@ SECTION = "x11"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
+DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 
-SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
-SRCREV = "5a26dd8ceab0af71b30c83286d7c7398a858c814"
-PV = "0.5.3"
+SRC_URI = "git://github.com/ib/xarchiver.git"
+SRCREV = "9ab958a4023b62b43972c55a3143ff0722bd88a6"
+PV = "0.5.4.14"
 S = "${WORKDIR}/git"
 
-inherit xfce-git gettext pkgconfig autotools gtk-icon-cache distro_features_check
+inherit gettext pkgconfig autotools gtk-icon-cache distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
 
-EXTRA_OECONF += "--enable-maintainer-mode"
+EXTRA_OECONF += " \
+    --enable-maintainer-mode \
+    --disable-doc \
+"
+
+do_configure_prepend() {
+     touch ${S}/NEWS ${S}/AUTHORS
+}
 
 FILES_${PN} += "${libdir}/thunar-archive-plugin"
 
-RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip xz"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip xz p7zip"
-- 
2.20.1


