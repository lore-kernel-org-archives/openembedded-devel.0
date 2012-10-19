Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TP1jU-0007Vc-Tj
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 03:50:41 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so5434195wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 18:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=RY8r7LOrxWK4oaWXvLLgxj+OTBWpeqvGhZJgfm+8v+0=;
	b=n6ZgBEPAPwQo4S6s0zSQ2cAkE9GrXV5FHkRL8FCYCjEYUEUQRFhHpE9KmTCmQSrju9
	ko71mv2+JaFqxQpvm2Cw2/XpAaOiaXz4bk8NCMdpNvJ7710vw37EoopYk3xwLZ1g4hdB
	GsCMaWaHYQQeGUS0tRtPBj4PevLyLjroAP4aTyMwD8W17r0yjbXN9ArWPcigpbaZmjLU
	SjGcuuau061FZgFzsJ8rIVMlY7UlGumR55PkqRZaLa1OmshBBuE1ISOJ91vi5pOi9heu
	xmgZ3a3OrqV15xlVt6FtucIDTqnGaraC/dt3LJoX4iYoSxkFIjCIOw/oJH4W0RwenVO0
	Z7nw==
Received: by 10.180.79.34 with SMTP id g2mr15214394wix.19.1350610640478;
	Thu, 18 Oct 2012 18:37:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF119A.dip.t-dialin.net.
	[79.223.17.154])
	by mx.google.com with ESMTPS id cl8sm32345347wib.10.2012.10.18.18.37.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 18:37:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Oct 2012 03:46:12 +0200
Message-Id: <1350611172-3182-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] devilspie2: initial add 0.24
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
X-List-Received-Date: Fri, 19 Oct 2012 01:50:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/devilspie/devilspie2_0.24.bb  |   30 +++++++++++++
 .../recipes-graphics/devilspie/files/default.lua   |   46 ++++++++++++++++++++
 .../devilspie/files/devilspie2.desktop             |    5 ++
 3 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb
 create mode 100644 meta-oe/recipes-graphics/devilspie/files/default.lua
 create mode 100644 meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop

diff --git a/meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb b/meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb
new file mode 100644
index 0000000..05311fd
--- /dev/null
+++ b/meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Devilspie2 is a window matching utility, allowing the user to perform scripted actions on windows as they are created"
+HOMEPAGE = "http://www.gusnan.se/devilspie2"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
+                    file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "gtk+ glib-2.0 libwnck lua5.1 virtual/libx11"
+
+SRC_URI = " \
+	http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \
+	file://default.lua \
+	file://devilspie2.desktop \
+"
+SRC_URI[md5sum] = "90b354662659e2922bd051fdde3b0971"
+SRC_URI[sha256sum] = "9c94fa13ed8c0bf6914fdda513e21a4bd527821b97a53d8004168a8d465a646a"
+
+inherit pkgconfig
+
+do_compile() {
+	export GTK2=1
+	oe_runmake CC="${CC}" CPPFLAGS="${CPPFLAGS}" LDFLAGS=" -ldl -lm ${LDFLAGS}"
+}
+
+do_install() {
+	oe_runmake DESTDIR="${D}" PREFIX="${prefix}" install
+	install -d ${D}/${sysconfdir}/devilspie2
+	install -m 644 ${WORKDIR}/default.lua ${D}/${sysconfdir}/devilspie2
+	install -d ${D}/${sysconfdir}/xdg/autostart
+	install -m 644 ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
+}
diff --git a/meta-oe/recipes-graphics/devilspie/files/default.lua b/meta-oe/recipes-graphics/devilspie/files/default.lua
new file mode 100644
index 0000000..22a17fe
--- /dev/null
+++ b/meta-oe/recipes-graphics/devilspie/files/default.lua
@@ -0,0 +1,46 @@
+-- Copyright (c) 2012 Andreas Müller <schnitzeltony@googlemail.com>
+--
+-- this is an example 
+-- * undecorating all windows opened maximized
+-- * maximizing and undecorating all appplication's windows in apps_list
+-- for further information see
+-- http://www.gusnan.se/devilspie2/manual.php
+
+wnd_type = get_window_type()
+
+if(wnd_type == "WINDOW_TYPE_NORMAL") then
+
+	-- add only applications you want maximized+undecorated and
+	-- which don't keep maximized state
+	apps_list = 
+	{
+		"Terminal",
+		"ristretto",
+		"xarchiver",
+	}
+
+	app_name = get_application_name()
+
+	-- to have some informational output, start devilspie2 with --debug 
+	-- option and uncomment the following lines:
+
+	--debug_print ("Window Name: " .. get_window_name())
+	--debug_print ("Application name: " .. app_name)
+	--debug_print ("window-type: " .. wnd_type)
+
+	-- undecorate all windows starting maximized 
+	if (get_window_is_maximized()) then
+		undecorate_window()
+
+	-- maximize/undecorate all windows in apps_list
+	-- (unfortunately for some also their settings)
+	else
+		for line, str in ipairs(apps_list) do
+			if (string.find(app_name, str)) then
+				maximize()
+				undecorate_window()
+				break
+			end
+		end
+	end
+end
diff --git a/meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop b/meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop
new file mode 100644
index 0000000..e34e881
--- /dev/null
+++ b/meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop
@@ -0,0 +1,5 @@
+[Desktop Entry]
+Type=Application
+Name=Devilspie2
+Exec=devilspie2 -f /etc/devilspie2
+
-- 
1.7.4.4



