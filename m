Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id C6D5C60DB1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Feb 2020 15:16:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b17so14144128wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2020 07:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JIj6ECFpsyJyC8gfihsE/zEAguD6tLL2KkH5n95EnR8=;
	b=g+FwyEMflH4bGB6cSczggM3i5tqkZSFvNwtI+NUZW3afvi7mYA72gSE3cpXeOk3BpC
	BpNsPvjZZiZAKu9PLetEV+C4Q4yUmRar0TNlgYxPFzVolWXMAVn1R21fZLh78KYvM0AN
	fq8gR2XpTGMoEFvubNVxDlqRgpkXF1x9fiMVbBxBdi9BP50Ua8/EkLxVp4XGxqoFiagz
	ggV4BufYJplCFohadN0p4LO0IxrlcSCNrBMcEOykn78xxfMt6+e26AHV8oDf6s0KK5Xh
	LQqA/dqeFHWPRKq/2AX+awbyXC/uGu2REYnxrsIWH0CnaNkYR8mFm6VrOO/33L7XsrJr
	DwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JIj6ECFpsyJyC8gfihsE/zEAguD6tLL2KkH5n95EnR8=;
	b=ARZJp1zXJ5BvQHUzsY41h81DqK6xJEEr/Ytgtk2MhnTrfN1ZP3iHL3zn6xZXih8Xx8
	mxrlKVeSNZbdeIEnEQDCYnPzSekU3jk1XK1Nnyrb023j3k6s0r/lQPeBFacCr/ZODzFT
	HjZEMSPBGOmFg6P/Ubzj0PD6xgtgDutE2RNuuEBX+2k4sRNVW4NolFmfJZp+JyvoDEzk
	FI3CYdcPsn5fegMFUoRcm+mXsteL/uavK/MTiPv0WFBAkJVwk5MeDqYUqzdSxfwrwnJ1
	tcVw/mQoEpG8uyYmq91tUbArIRzk0LvQjx8Y6CzZnilbRX90k3PxIy8Kh+O/TQDjcZFk
	lxvg==
X-Gm-Message-State: APjAAAVKSioC2Nc++fsKr79OCPemL6qGaezDcoAvIB/JvHQycPpsZ3gi
	dksKVkBCEgCytU7s0LiKktQJpt0s
X-Google-Smtp-Source: APXvYqyLh65EsfgWiFnAPuDG4uw0/+svh0XS7PFDkoVoZa5BveRltq3gRm6FtnHzMvvGwZ7A/wLk1w==
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr24719046wmi.66.1580656601999; 
	Sun, 02 Feb 2020 07:16:41 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	x10sm21681315wrp.58.2020.02.02.07.16.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 07:16:41 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2020 16:15:22 +0100
Message-Id: <20200202151522.25732-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] openbox: use python 3
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
X-List-Received-Date: Sun, 02 Feb 2020 15:16:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...box-xdg-autostart-convert-to-python3.patch | 138 ++++++++++++++++++
 .../recipes-graphics/openbox/openbox_3.6.1.bb |   3 +-
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-openbox-xdg-autostart-convert-to-python3.patch

diff --git a/meta-oe/recipes-graphics/openbox/files/0001-openbox-xdg-autostart-convert-to-python3.patch b/meta-oe/recipes-graphics/openbox/files/0001-openbox-xdg-autostart-convert-to-python3.patch
new file mode 100644
index 000000000..5ebeb0169
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/files/0001-openbox-xdg-autostart-convert-to-python3.patch
@@ -0,0 +1,138 @@
+From b7de9cff2a9578dd92d191241c28437cd6bbb595 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sun, 2 Feb 2020 14:39:21 +0000
+Subject: [PATCH] openbox-xdg-autostart: convert to python3
+
+Upstream-Status: Pending
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ data/autostart/openbox-xdg-autostart | 72 ++++++++++++++--------------
+ 1 file changed, 36 insertions(+), 36 deletions(-)
+
+diff --git a/data/autostart/openbox-xdg-autostart b/data/autostart/openbox-xdg-autostart
+index 04a17a1..52d763f 100755
+--- a/data/autostart/openbox-xdg-autostart
++++ b/data/autostart/openbox-xdg-autostart
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ # openbox-xdg-autostart runs things based on the XDG autostart specification
+ # Copyright (C) 2008       Dana Jansens
+@@ -28,9 +28,9 @@ try:
+     from xdg.DesktopEntry import DesktopEntry
+     from xdg.Exceptions import ParsingError
+ except ImportError:
+-    print
+-    print >>sys.stderr, "ERROR:", ME, "requires PyXDG to be installed"
+-    print
++    print()
++    print("ERROR:", ME, "requires PyXDG to be installed", file=sys.stderr)
++    print()
+     sys.exit(1)
+ 
+ def main(argv=sys.argv):
+@@ -51,7 +51,7 @@ def main(argv=sys.argv):
+             try:
+                 autofile = AutostartFile(path)
+             except ParsingError:
+-                print "Invalid .desktop file: " + path
++                print("Invalid .desktop file: " + path)
+             else:
+                 if not autofile in files:
+                     files.append(autofile)
+@@ -99,9 +99,9 @@ class AutostartFile:
+ 
+     def _alert(self, str, info=False):
+         if info:
+-            print "\t ", str
++            print("\t ", str)
+         else:
+-            print "\t*", str
++            print("\t*", str)
+ 
+     def _showInEnvironment(self, envs, verbose=False):
+         default = not self.de.getOnlyShowIn()
+@@ -146,14 +146,14 @@ class AutostartFile:
+ 
+     def display(self, envs):
+         if self._shouldRun(envs):
+-            print "[*] " + self.de.getName()
++            print("[*] " + self.de.getName())
+         else:
+-            print "[ ] " + self.de.getName()
++            print("[ ] " + self.de.getName())
+         self._alert("File: " + self.path, info=True)
+         if self.de.getExec():
+             self._alert("Executes: " + self.de.getExec(), info=True)
+         self._shouldRun(envs, True)
+-        print
++        print()
+ 
+     def run(self, envs):
+         here = os.getcwd()
+@@ -165,34 +165,34 @@ class AutostartFile:
+         os.chdir(here)
+ 
+ def show_help():
+-    print "Usage:", ME, "[OPTION]... [ENVIRONMENT]..."
+-    print
+-    print "This tool will run xdg autostart .desktop files"
+-    print
+-    print "OPTIONS"
+-    print "  --list        Show a list of the files which would be run"
+-    print "                Files which would be run are marked with an asterix"
+-    print "                symbol [*].  For files which would not be run,"
+-    print "                information is given for why they are excluded"
+-    print "  --help        Show this help and exit"
+-    print "  --version     Show version and copyright information"
+-    print
+-    print "ENVIRONMENT specifies a list of environments for which to run autostart"
+-    print "applications.  If none are specified, only applications which do not "
+-    print "limit themselves to certain environments will be run."
+-    print
+-    print "ENVIRONMENT can be one or more of:"
+-    print "  GNOME         Gnome Desktop"
+-    print "  KDE           KDE Desktop"
+-    print "  ROX           ROX Desktop"
+-    print "  XFCE          XFCE Desktop"
+-    print "  Old           Legacy systems"
+-    print
++    print("Usage:", ME, "[OPTION]... [ENVIRONMENT]...")
++    print()
++    print("This tool will run xdg autostart .desktop files")
++    print()
++    print("OPTIONS")
++    print("  --list        Show a list of the files which would be run")
++    print("                Files which would be run are marked with an asterix")
++    print("                symbol [*].  For files which would not be run,")
++    print("                information is given for why they are excluded")
++    print("  --help        Show this help and exit")
++    print("  --version     Show version and copyright information")
++    print()
++    print("ENVIRONMENT specifies a list of environments for which to run autostart")
++    print("applications.  If none are specified, only applications which do not ")
++    print("limit themselves to certain environments will be run.")
++    print()
++    print("ENVIRONMENT can be one or more of:")
++    print("  GNOME         Gnome Desktop")
++    print("  KDE           KDE Desktop")
++    print("  ROX           ROX Desktop")
++    print("  XFCE          XFCE Desktop")
++    print("  Old           Legacy systems")
++    print()
+ 
+ def show_version():
+-    print ME, VERSION
+-    print "Copyright (c) 2008        Dana Jansens"
+-    print
++    print(ME, VERSION)
++    print("Copyright (c) 2008        Dana Jansens")
++    print()
+ 
+ if __name__ == "__main__":
+         sys.exit(main())
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 33f34e428..e269a264f 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = " \
     http://icculus.org/openbox/releases/openbox-${PV}.tar.gz \
     file://0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch \
+    file://0001-openbox-xdg-autostart-convert-to-python3.patch \
 "
 
 SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
@@ -54,4 +55,4 @@ FILES_${PN}-gnome += " \
 
 FILES_${PN}-config += "${sysconfdir}"
 
-RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks python python-shell pyxdg"
+RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks python3 python3-shell pyxdg"
-- 
2.20.1


