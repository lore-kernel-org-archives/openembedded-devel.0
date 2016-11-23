Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A8F1271AF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c4so445307pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MDyJzOZIwa1P73i1ztBUonh1QuBSe3AapBCgZXpmwr0=;
	b=VxtixjmVOgGmgqZaebRFTp1bGPSxotLsPRpXmSsE7jgQdRgw1mj7GPGU4DEb1onynz
	TDQZqH3dsidyhZU2i9tJG2rMgWvYSo4283SJyFiKiueldN6NnqXZGwDkFHm0GIjghD2U
	WqZ7oY0oUWUvFj7riB98nNFipyPdOzHB1oYGUOmel7rVQanUl5Gg3xVzPN6+wXj6itir
	X7oMfwvsC0AvoVuIwNAW5JjRzH5QuirJWkzPwoPXzcKsxLwg+bosLYy1fNkSVGQtT7uD
	Tdia+TPPSj4YKLw5Oi8olCn55FtIiFwow6kRBvG3qps6Xzbsy6GNna9W3P6+0Gq65nP9
	HL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MDyJzOZIwa1P73i1ztBUonh1QuBSe3AapBCgZXpmwr0=;
	b=h501haXiMu6l2A9KW4yJiZGhvjkv7vqxLTyyqpIDVDxdihnqP0ZDLrs02wWv5xEfj5
	QNFVmmsIqCKEDaBeI0b+KQtBnp3XCD+VYLb3Mlc1+7avLx+3OaJNEWbRVVAdcHLbgaOt
	oadz2ynTdWqORqdG/V6O3foodd6w39+g4Is9fqOH1pFxOHCRPWehQF3cW+buoOfsI8ZO
	q3IDpmahMTjQSMf3AFRJa4axB08uTq4eE36c4YWzbcyBtF3e9TIdKUYsXtuGOOC7uYn9
	00wZSJX0dESI39WE+52wc/8BM0gNgC/kCYh5AzenTr55aNHbLC+fTtlh5irT5O1kNeez
	Ul2w==
X-Gm-Message-State: AKaTC013HM20Bw7Qo1jZPXZhEKx5Xf2h9/gX4j4px7Q0cOCNcTmLicgZ8YwV7K9w0uf8nw==
X-Received: by 10.99.230.83 with SMTP id p19mr3503257pgj.138.1479892970436;
	Wed, 23 Nov 2016 01:22:50 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:03 -0800
Message-Id: <20161123092209.23699-43-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 43/49] modemmanager: Fix build with clang
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../modemmanager/modemmanager/enum-conversion.patch | 21 +++++++++++++++++++++
 ...{modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} |  8 +++++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
new file mode 100644
index 0000000..a3fb0f3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
@@ -0,0 +1,21 @@
+Fixes errors found bt Clang
+
+| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error: implicit conversion from enumeration type 'MMBearerStatus' to different enumeration type 'MMBearerConnectionStatus' [-Werror,-Wenum-conversion]
+|         MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
+|                                  ~~~~~~~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| 1 error generated.
+
+
+Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
+===================================================================
+--- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
++++ ModemManager-1.6.4/src/mm-bearer-qmi.c
+@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
+             &connection_status,
+             NULL,
+             NULL)) {
+-        MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
++        MMBearerConnectionStatus bearer_status = (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER (self));
+ 
+         if (connection_status == QMI_WDS_CONNECTION_STATUS_DISCONNECTED &&
+             bearer_status != MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
index e26c227..5e4e220 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
@@ -11,9 +11,11 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[md5sum] = "d9d93d2961ee35b4cd8a75a6a8631cb4"
-SRC_URI[sha256sum] = "a94f4657a8fa6835e2734fcc6edf20aa8c8d452f62299d7748541021c3eb2445"
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
+           file://enum-conversion.patch \
+"
+SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
+SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.10.2


