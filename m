Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7716A65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 07:46:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45yTCQ0Ppjz2M
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 09:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564472802;
	bh=ydZjxRUlGyYUrUcCbnlS/aiwVUCcRedxhD3eofC9+GM=;
	h=From:To:Subject:Date:From;
	b=tK/AptZWJzEyhV8L0vZuuQrFUi+ej1IXNmwZnmJtVw+HAwuSPQxEPJhpK61KPebZV
	pxPjB8JySbwTKrEEMbQf+V2jop204PyHw8AIuaOlaUBSHS4vZE3BrKgOqv/zWPVwbW
	2l/bk6BakFPzJTSzee7xhSJDF4c90FlSSlx6To1Yp1Lf1ZTaj4baS16rn7je1xuNa7
	qBGXbRakln3oC8BY4kgc1c566eez1bLSIpwH4LjNIPhtrdEQ75BGgLx0iYT18gN7Fh
	JRgNpNVTh047cobdhBHLfld7NiChU87vP36i5D8xch/2NzuZqM2AhH68poiLL+Xw86
	YbEK/Q3+ei03sQ31UsnrqKIgo4YQ0MF7Ky1pX7etyKt0OBWI4gKys9UOo7PGv6MXqB
	5AkJUGeKKh6tDvznuvu5XGzgpBLRXGqkUGOz3Zup3hPg43lrd5ef8EVgzjS9fbCOtg
	yHVMScz9GZbi8e/BffZyor7WehW8hqu8hkM/nskOlqFKnSPz4S06Nx6ll26OLn/zaq
	RvgCp7MrCqRiGQySixMwmwDP10uv3dk9qA65mf5/8uaiEXM3VZk73HTPlnvJO1yaLJ
	T2hVTKsvlzUIVC6Dldzi7a/sVZ+/1Q+SOAMTIPQjiuGh9que/WugzuPpSpVVi7v/TW
	rTH2kTWT3+tKpFzOP+6sUbR4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2019 10:46:41 +0300
Message-Id: <20190730074641.2127-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH v2] gnome-system-monitor: Add DEPENDS on polkit
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
X-List-Received-Date: Tue, 30 Jul 2019 07:46:42 -0000

The build fails without polkit in DISTRO_FEATURES:
FAILED: org.gnome.gnome-system-monitor.policy
msgfmt: cannot locate ITS rules for org.gnome.gnome-system-monitor.policy.in

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
index 701b0891c..8930e1222 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
@@ -10,13 +10,14 @@ DEPENDS = " \
     gtkmm3 \
     libgtop \
     librsvg \
+    polkit \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gconf gtk-icon-cache distro_features_check gettext
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
 SRC_URI[archive.md5sum] = "6c2c5c5bf8f15d3e6985faacbd3055dd"
 SRC_URI[archive.sha256sum] = "af00c4a42dd1db17d9abe88edb11c7751b20982db1a8a2a467bab206fd8a77e3"
-- 
2.17.1


