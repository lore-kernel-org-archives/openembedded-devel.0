Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A97377E473
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so996093wrn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=P5kENrBQq5Pl/0AL9U/X7RBKTIOkguAk7KS08paKN9Q=;
	b=Uy5pd5Cvb8HSp0qbAEhRQ/VWbixJKUK5mOjI6umJwsuEGJV33JUflcI2K5s7zyBYyi
	zZF0aT/xIKfS0CBY8cl238zgnQaxr6vD8IGXn5uP/z8WNiJk0qRDJJzqSl0gdDoVOE3V
	1TUo+JEqUtLQSYvDeW0DewXlrLlEvt1zgxRuAKrPg8y86q+OnnhinfQSahAHlT9LZAV+
	b3lvbkVjB+ioF+CYn/Ufio6sNH8nABHp11ao/7ViaTxQ/234Z//2UtUIxQwHNCy1/K2K
	vXPyMWibTXKwDLiz8Wt98TLW8xL5RbP1yohn2JewMASFvv9/Hvad9gaL8Y6FQ60yXkkt
	NvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P5kENrBQq5Pl/0AL9U/X7RBKTIOkguAk7KS08paKN9Q=;
	b=CohlnJF036evEZ3HZVOoLqwQ7zAi9zyPXhDur3LX0UAIiP+ViychHQKxk3e5v4xaWf
	JNLAnkEszyL06MoSngnvtnFDWylFUr3206RAOZ+AjC4LeKjenPOPUqpfKTDl/sHoXWn2
	NY5Ph3sCQOJkTJ4stNeJZwGClKtFtGUhAkn+iKLn82yzdvRntyu4Tjodju8WgWVI1xcB
	4Pi+egrscNC194EtLBzSZfvwS9/ef+P5HrbHc4fx1H0y6/+XqFsJvecTWnPYnQsw3PDL
	4iEPaqadn4lklZrcRbFkNmkiODsVluLX/ugJ825jzgh4er2mO5BooP98/F/DHR0KVTqm
	szqw==
X-Gm-Message-State: APjAAAVz1tfjyYwdg/YkTIPYvglyXUl/B0ntUoPclugGeHbyjPfIdfYe
	OikZFVrn1xSDyHu35SO334FZuOY/mOI=
X-Google-Smtp-Source: APXvYqyHDwShygUcrIC952MOuFzZlHm77I4qKI9WQ/KCEW5x2hZ75VIv4Wdtm9mIe2/GJHJQcjCfvA==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr2275905wrn.235.1558594182375; 
	Wed, 22 May 2019 23:49:42 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:58 +0200
Message-Id: <20190523064859.24336-41-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 40/41] upower: upgrade 0.99.7 -> 0.99.10
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
X-List-Received-Date: Thu, 23 May 2019 06:49:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* backported patch can go
* unfortunately they stopped maintaining [1] without note and moved to gitlab
* since they hint with a checksum and we have not heard that gitlab rebuilds
  tarballs, let's try tarball download because it's cheaper

[1] https://upower.freedesktop.org/releases/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...everity-of-unhandled-action-messages.patch | 31 -------------------
 .../{upower_0.99.7.bb => upower_0.99.10.bb}   | 16 +++++-----
 2 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
 rename meta-oe/recipes-support/upower/{upower_0.99.7.bb => upower_0.99.10.bb} (73%)

diff --git a/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch b/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
deleted file mode 100644
index de89dc01c..000000000
--- a/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f64b6ce8054b47e5bdcc8c4c7965534b388e6151 Mon Sep 17 00:00:00 2001
-From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
-Date: Fri, 6 Apr 2018 11:26:54 -0700
-Subject: [PATCH] linux: lower severity of "unhandled action" messages
-
-Newer kernels emit bind/unbind uevents that are not of interest to
-powerd. To avoid littering logs with scary messages, let's lower their
-severity to "debug".
-
-https://bugs.freedesktop.org/show_bug.cgi?id=106019
-
-Upstream-Status: Backport
----
- src/linux/up-backend.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/linux/up-backend.c b/src/linux/up-backend.c
-index e668dc8..b8021e7 100644
---- a/src/linux/up-backend.c
-+++ b/src/linux/up-backend.c
-@@ -273,7 +273,7 @@ up_backend_uevent_signal_handler_cb (GUdevClient *client, const gchar *action,
- 		g_debug ("SYSFS change %s", g_udev_device_get_sysfs_path (device));
- 		up_backend_device_changed (backend, device);
- 	} else {
--		g_warning ("unhandled action '%s' on %s", action, g_udev_device_get_sysfs_path (device));
-+		g_debug ("unhandled action '%s' on %s", action, g_udev_device_get_sysfs_path (device));
- 	}
- }
- 
--- 
-2.17.0.484.g0c8726318c-goog
diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb b/meta-oe/recipes-support/upower/upower_0.99.10.bb
similarity index 73%
rename from meta-oe/recipes-support/upower/upower_0.99.7.bb
rename to meta-oe/recipes-support/upower/upower_0.99.10.bb
index 3fd91e958..8d5b2a4de 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.10.bb
@@ -4,12 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
-SRC_URI = " \
-    http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-    file://0001-linux-lower-severity-of-unhandled-action-messages.patch \
-"
-SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
-SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
+SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/uploads/c438511024b9bc5a904f8775cfc8e4c4/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "ac6b6bee31110fd8478a8e881c40fba6"
+SRC_URI[sha256sum] = "642251b97080ede8be6dbfeaf8f30ff6eadd6eb27aa137bc50f5b9b2295ba29d"
 
 inherit autotools pkgconfig gettext gobject-introspection systemd distro_features_check
 
@@ -33,7 +30,8 @@ do_configure_prepend() {
 
 RDEPENDS_${PN} += "dbus"
 RRECOMMENDS_${PN} += "pm-utils"
-FILES_${PN} += "${datadir}/dbus-1/ \
-                ${datadir}/polkit-1/ \
-                ${base_libdir}/udev/* \
+FILES_${PN} += " \
+    ${datadir}/dbus-1/ \
+    ${datadir}/polkit-1/ \
+    ${base_libdir}/udev/* \
 "
-- 
2.20.1


