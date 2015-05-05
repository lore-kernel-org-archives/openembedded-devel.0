Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id E0E3E73C5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:19 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so111588978igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oKkbzXq4HZWtosAFupZAKfSuSs7gDB4Suua76boFwRo=;
	b=QUWPr8/FehT4VB3lsWQPW8m0YJYF9Q/vCjL43KwbrOrSmfQpssDB8Da8XwhFYDh/Ys
	6b5TWyGCnfTw9RlUjNtTEGZq5GDftlVoAvnL6ttQyeMU0WtYOFM6YlDafwfPa6D+PHsV
	BIqaHsfHXXA+VytVuPSUedIinD5bbmvwjDFtppPbknCx7r3io39Oo/VbOn6G/7JILibK
	bHIT+jkzlgs3yWdgRFa3DF4YkD4aXIqtGxQjqCS7RBeeUf6iwa+n9YY2VKu0ZSB2PqcD
	/aBPBiOgC1Cd9Udustzgi6M8ZJBE9Ja0l/Jm7HSp/7Gj1eTmgtwtj9oQvf8RsUPSr79A
	iDcA==
X-Received: by 10.107.156.69 with SMTP id f66mr27045813ioe.36.1430852960976;
	Tue, 05 May 2015 12:09:20 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:11 -0700
Message-Id: <1430852951-18707-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][meta-gnome][PATCH 7/7] obex, gnome-bluetooth: Depend on bluez5
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
X-List-Received-Date: Tue, 05 May 2015 19:09:21 -0000

bluez4 is removed from oe-core
this needs runtime testing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                 | 4 ++--
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 2 +-
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb        | 3 +--
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb                  | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index f28f77b..02b364e 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,7 +1,7 @@
 SUMMARY = "OBEX Server and Client"
 # obexd was integrated into bluez5
-DEPENDS = "glib-2.0 dbus bluez4 libical"
-RCONFLICTS_${PN} = "bluez5"
+DEPENDS = "glib-2.0 dbus bluez5 libical"
+#RCONFLICTS_${PN} = "bluez5"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 8711b8a..ddc78e6 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 PR = "r1"
 
 SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
+DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez5 gnome-keyring virtual/libx11 libxi intltool-native"
 
 inherit gnomebase gtk-icon-cache
 
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index afe6106..8bb5374 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX cli
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ bluez4 dbus-glib imagemagick openobex"
-RCONFLICTS_${PN} = "bluez5"
+DEPENDS = "gtk+ bluez5 dbus-glib imagemagick openobex"
 
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index b07779d..f4744c0 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-DEPENDS = "virtual/libusb0 bluez4"
+DEPENDS = "virtual/libusb0 bluez5"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-- 
2.1.4


