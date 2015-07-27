Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE6F76385
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:37:11 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so126602915wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=JU8XgIU5xdV0hOSBrriF+/ovZQUSv+mYOWGnOtbPjV0=;
	b=xarJqGg2UopvZzN49wYO4M/kNBtTHFF1uAmnKE6zaaExu53JCSEsMMzv+rCaW12s9k
	be1rNMGbWFngjjH2edkWHaNPtU/eGUwv7hbUYxOujcBHAx+htkec9OJAfu27qAwdgtD3
	7qbnfgAzxaCrflY6etcYSa1AlQjnyGe6oXieb2LIrV8jLnBkcN9DOUL0GV3qT4ogKjOS
	qCCaO+8RZ9LWj/MTsMErm6ViWQZEsqVsBnkB0vSbxOQ7ArHCMNJbFLQMsOkmiUC0l7DJ
	67abmqUPHsd1HxjQl+e2p3hxC1Jew2Z4iZ8BuBTbznBBjF/glA2ATCScN2kwYSynNT/h
	viEw==
X-Received: by 10.180.205.230 with SMTP id lj6mr28072640wic.82.1438025831214; 
	Mon, 27 Jul 2015 12:37:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k12sm23016995wjw.4.2015.07.27.12.37.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:37:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 21:36:53 +0200
Message-Id: <1438025815-31315-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
References: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libwnck: update to 2.31 / avoid conflicts with libwnck3
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
X-List-Received-Date: Mon, 27 Jul 2015 19:37:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both libwnck and libwnck3 install the commandline tools 'wnck-urgency-monitor'
and 'wnckprop' to bindir. The packages depending on libwnck were checked: In
none of them there is a trace for these tools.

To avoid conflicts the tools are installed by libwnck3 only. If something
requires 'wnck-urgency-monitor' or 'wnckprop' it needs to install libwnck3.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb | 15 ---------------
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 15 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
 create mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
deleted file mode 100644
index 61836d2..0000000
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-PR = "r2"
-
-SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native libxres"
-
-PACKAGECONFIG ??= "startup-notification"
-PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-
-inherit gnomebase
-SRC_URI[archive.md5sum] = "4162d5b96151e6d24ec02ae3a822203c"
-SRC_URI[archive.sha256sum] = "56b6681e89cd45491bb640165d62276d81369a08974042b26645dc1e0e954cc1"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
new file mode 100644
index 0000000..3e5370d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+SECTION = "x11/libs"
+DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native libxres"
+
+PACKAGECONFIG ??= "startup-notification"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+inherit gnomebase
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
+SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
+
+do_install_append() {
+    # to avoid conflicts with libwnck3 remove cmdline tools
+    # if the tools are requrired add libwnck3 to your image
+    rm ${D}${bindir}/wnckprop
+    rm ${D}${bindir}/wnck-urgency-monitor
+    rmdir ${D}${bindir}
+}
-- 
2.1.0


