Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsYow-0006J5-O8
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 14:02:24 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 04:46:08 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so349795wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 04:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=OcQdBE0ITauUKODDBn9+9Zs5bDGbei9skN3ROTqy3aE=;
	b=Z1289C/3S6qq8gG9ajpNJPl6U/H22zEI6ieG+Fb8jLHpvD0ZOuGECqVhtNGiIW3x4s
	07lOp7ow/VBm/wmytB9sg9a7AmGVs6R4SywN45C+2TNAJC4x+jPOgYBvx/Ykgdz6QFJm
	JFypaHIvmucuQ3PDmRHTWBA2lzLRqW+zvukQTOddriGz2hCX5BMu6P1GJ/Io+5ekKK6X
	ugsNeI5Ln1AMk+7CgYh/vrcGXQ6cs67R8bDAD4PUSA4blsWmc+1ATpaEcqXKcrv4Yf9I
	1EkUz/XKDzPuYUoAQ95SG110NaQWHfEoGWzqIwHnDi3oWpr9LXy+00JarW/r1tTGu3bT
	mn4w==
X-Received: by 10.180.87.228 with SMTP id bb4mr14455157wib.31.1357649228909;
	Tue, 08 Jan 2013 04:47:08 -0800 (PST)
X-Received: by 10.180.87.228 with SMTP id bb4mr14455144wib.31.1357649228746;
	Tue, 08 Jan 2013 04:47:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm18290333wiv.6.2013.01.08.04.47.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 04:47:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2013 12:45:11 +0000
Message-Id: <1357649112-11476-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkkf0BGPiyEJ9yErGJrdWf5JmHSWcqo0wYDe3/9RHm6hMnsEepY+5OptuY/NgUlt1fp3dP57NB3ACJ4yDKhQONgc9Dqte0TSOrC1+HvR9j2mjr6lGoSiLSQIlT4YxK958GD4MWeZ+DzDolMk7Dybzkqm8niy727fzhcozsx96xbPC3+yzxKoLVtFdfPEleJLVFpFSxN
Subject: [PATCH meta-gnome 1/2] at-spi2-core: add
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
X-List-Received-Date: Tue, 08 Jan 2013 13:02:26 -0000

This is a build dependency for GTK+ 3.6.x

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb

diff --git a/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb b/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb
new file mode 100644
index 0000000..658d10d
--- /dev/null
+++ b/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/${BPN}/2.6/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "eb1d3ca3332af8862791d3ff7dcfd20a"
+SRC_URI[sha256sum] = "fc4487ae46e847cfd057b329b852cf99923772ecd2ddc29f29670c9f2b15d0ea"
+
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi"
+
+inherit autotools gtk-doc
+
+EXTRA_OECONF = "--disable-introspection --disable-xevie"
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-- 
1.7.10.4



