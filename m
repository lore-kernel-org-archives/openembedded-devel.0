Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 726FA7ECCF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w6so26021962lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WY0MOp0q2qbkQKkQsb7Bt4ZsnUwsx0afHLfoNPXgBDU=;
	b=KPdfdTkXHYspghoYJ3zPEgOfkdETP3BUwTZoqhVwL+mRpR1RGjYlaJ7PSXAAYCHXHU
	ubTAQFFsv8IvWNoL51Gf3sgTnJd2HpRItq+2y6rB1QMuuoslho1hLGZUTqZ1wOBbTYuF
	jbpu1k+SDV2MKt5U1o5QnPeVZWJlI0yagqpPTxn90bLsvdfMBFTHNMUVbVS+I9+O1Cep
	L1aIGrk135hC4dFMyZciEgshFl0s/4PJCu4AvJZL+XBUhklsigYdz8KNVu3iOu3HaKaO
	eZfZ4MupZnUgWwOd2hqeKBFBcH71QGxyJYXeLxFS0zYgDvirloRQNjQrCUbF0+t/n4un
	d1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WY0MOp0q2qbkQKkQsb7Bt4ZsnUwsx0afHLfoNPXgBDU=;
	b=BgNbN30gjCftodwU9hePTd7iKuwEjvu7fkUMxEhqvR20+KdNbAkWNqokg/GAGBAPwK
	jt9waGLqxC4VlvzFp+/9DM44/JaAGlEHQOUsYnqgkDAMQ4X5Sse40XPExRz9dh87pnrW
	AzSYzwdl2gUL0/eusVr85LcOAhaY0xqGzdysCCBKiqWje/BLYmpqsIxOQr1nZaLdWf02
	0+qlPfabh9touUw7yO322IMruzdNrF/CuacwL/rdf6gc8UGs0XUZOFAkxm3v+f8R+OYs
	CFl+oxqeilkXasuaUYffBuDV4TecttPt8jISXiYlqghb0HLrOB4djy9GSXi+E44Dawdy
	BeCA==
X-Gm-Message-State: APjAAAVEZXgEw1O5TYDh59IlTcm1bbPmPV4pUsHHRzJKa0Cj+s8G1+QL
	/T1miPwxJzBBwHwk0fjlWVd367eXmPM=
X-Google-Smtp-Source: APXvYqxdZKFPyWmWZwRf3Y6ivSzol9ThbXKCM/7sLDNUgq5ifYJyslDXA7sCVzkaY0MqWnGk9TqUsA==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr36871981lfi.82.1568590885859; 
	Sun, 15 Sep 2019 16:41:25 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	g27sm7296936lja.33.2019.09.15.16.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:23 +0200
Message-Id: <20190915234123.12016-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] upower: update to 0.99.11
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:25 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...everity-of-unhandled-action-messages.patch | 31 -------------------
 .../{upower_0.99.7.bb => upower_0.99.11.bb}   |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
 rename meta-oe/recipes-support/upower/{upower_0.99.7.bb => upower_0.99.11.bb} (85%)

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
diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb b/meta-oe/recipes-support/upower/upower_0.99.11.bb
similarity index 85%
rename from meta-oe/recipes-support/upower/upower_0.99.7.bb
rename to meta-oe/recipes-support/upower/upower_0.99.11.bb
index ffa2c49ee..c4cc62711 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.11.bb
@@ -6,10 +6,9 @@ DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib"
 
 SRC_URI = " \
     http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-    file://0001-linux-lower-severity-of-unhandled-action-messages.patch \
 "
-SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
-SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
+SRC_URI[md5sum] = "abe6acb617f11f2e8dbd9846fcf86e24"
+SRC_URI[sha256sum] = "64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef"
 
 inherit autotools pkgconfig gettext gobject-introspection systemd distro_features_check
 
-- 
2.17.1


