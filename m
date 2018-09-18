Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id EB67871B99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 17:00:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a108-v6so2870829wrc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qhfHVQQJ2DZKqON1s8nlniWH5irw0N+8bFNgdEfhMls=;
	b=vg/ose1mvhGXzTt+UlsrValJTC1iMtQKAdR7SQ1juIgHXvNY77p3Ud4PhM6XPKAbfZ
	YfnrmmlYtiSQOVqwBjkwHTLTW3vMNlgK8JRU/6RPIyL8onkAg1yLyaAy1tcmtwsAEEwm
	5fCqhDBi7wC5Cb7WjNZR1WZR/FhuoRLpHy1lZzdUrnXZrjUajEeOLF0xEZzFQR8HKPAI
	GRT0YgTnCeowpyF8etU6iUus445yknykFIy03DshEq30luC9bpnz362gQQYtPQ5WECk4
	d+SNM82wEoN2KXsD1elDPlVATbGgc3IScAYsDDwpO3P9s1uO4yd6UX9IZhH2Um2fbGEG
	GRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qhfHVQQJ2DZKqON1s8nlniWH5irw0N+8bFNgdEfhMls=;
	b=Y0Eh8HapOIqFEkzpmNd7jMcoM+CWnuv2espplCq9mm7zp39rGeN0PMf+1C8pS3nKfU
	zaiz9QcabwAY6BZ9kUgEnzd0ufL9EmJzVKnrfAgpQeHkLhjLjVWMw7p9HuxEIjRRR8cd
	KP8GfkRm34Yz+kq9ucfDyNvGaPU7ajDR9xkk1JHCv3qACstmWF+HwsyzIG/94tuF0OUf
	xn+tSbTHXH5q/ERg3H/i+RMig73cZ4Tg0scvboeVss51e+MnsekuCbQkGO4G847OUpZZ
	F8z5Il5+Jn2W4QguXvM/6M/210D8yW1LrjlK2Jq6nWBuNY6jmp9bbRyeWJnWCPvkCIOl
	TmaQ==
X-Gm-Message-State: APzg51Dqz5hp1mSM3OfOealNX5EdKS9l89wUM8npzom0pHxh4da/Zp/N
	n68mgod75oqBz9Z1/KdLjNTT+msC
X-Google-Smtp-Source: ANB0Vdbiu8YbKrcvKg3tfI1BDGWGk3r9x0wldBa5rC6YhR+AaEqKfcrTOEIFvf7oSW7NOxFaoVpgQg==
X-Received: by 2002:adf:a299:: with SMTP id
	s25-v6mr343086wra.100.1537290016042; 
	Tue, 18 Sep 2018 10:00:16 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BD5FC901E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bd5:fc90:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q200-v6sm2867150wmd.2.2018.09.18.10.00.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Sep 2018 10:00:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 19:00:05 +0200
Message-Id: <20180918170005.12042-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] upower: avoid scary messages in journal/syslog
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
X-List-Received-Date: Tue, 18 Sep 2018 17:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When inserting/removing USB device not handled by upower
(Mouse/Keyboard/USB-Sticks..) upower spams on later kernels:

| Sep 17 15:38:46 imx6qdl-variscite-som upowerd[553]: unhandled action 'bind' on /sys/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb1/1-1/1-1.2
| Sep 17 15:38:46 imx6qdl-variscite-som upowerd[553]: unhandled action 'bind' on /sys/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb1/1-1/1-1.2/1-1.2:1.0
| Sep 17 15:38:46 imx6qdl-variscite-som upowerd[553]: unhandled action 'bind' on /sys/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb1/1-1/1-1.2/1-1.2:1.0/0003:41>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...wer-severity-of-unhandled-action-messages.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-support/upower/upower_0.99.7.bb    |  5 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch

diff --git a/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch b/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
new file mode 100644
index 000000000..de89dc01c
--- /dev/null
+++ b/meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
@@ -0,0 +1,31 @@
+From f64b6ce8054b47e5bdcc8c4c7965534b388e6151 Mon Sep 17 00:00:00 2001
+From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Date: Fri, 6 Apr 2018 11:26:54 -0700
+Subject: [PATCH] linux: lower severity of "unhandled action" messages
+
+Newer kernels emit bind/unbind uevents that are not of interest to
+powerd. To avoid littering logs with scary messages, let's lower their
+severity to "debug".
+
+https://bugs.freedesktop.org/show_bug.cgi?id=106019
+
+Upstream-Status: Backport
+---
+ src/linux/up-backend.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/linux/up-backend.c b/src/linux/up-backend.c
+index e668dc8..b8021e7 100644
+--- a/src/linux/up-backend.c
++++ b/src/linux/up-backend.c
+@@ -273,7 +273,7 @@ up_backend_uevent_signal_handler_cb (GUdevClient *client, const gchar *action,
+ 		g_debug ("SYSFS change %s", g_udev_device_get_sysfs_path (device));
+ 		up_backend_device_changed (backend, device);
+ 	} else {
+-		g_warning ("unhandled action '%s' on %s", action, g_udev_device_get_sysfs_path (device));
++		g_debug ("unhandled action '%s' on %s", action, g_udev_device_get_sysfs_path (device));
+ 	}
+ }
+ 
+-- 
+2.17.0.484.g0c8726318c-goog
diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb b/meta-oe/recipes-support/upower/upower_0.99.7.bb
index 973fbe771..2cf3163bb 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
-SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = " \
+    http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+    file://0001-linux-lower-severity-of-unhandled-action-messages.patch \
+"
 SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
 SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
 
-- 
2.14.4


