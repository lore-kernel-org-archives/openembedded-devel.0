Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DA8B5771A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:33 +0000 (UTC)
Received: by wmec201 with SMTP id c201so61716213wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=waHnpkDUMYUL5yhsCPrKC+3ErnIL+Gt+0WVbDDlCHV4=;
	b=M+1fr2hQEfoDmbj/blxXtQ5OPAdEpgSk3krH7WLhFQrhtaokaT/znHfNYzL76Xxlm0
	rB9W+Oq6ddA1yYgsBxocF6Yko4yJlKjN3Nua+4WfAih6bcUQUsEqGPG/t/rCuv53huy6
	F6D7ZO4GU8CMG5Z4wWn5WyKF5R0mWD4HBJyXU+ac81U82z7QyLP7x/uRhxwEU0NnW9o1
	UoUaE2qO0FZsyGVpGzIrZD6psx4nmEozf8R8Sc9EAqcY8zA01P86kjiZCdQzFLe8x1oO
	4ZTJ9lilUVO8xBS4ZXzJb02whgZ+GL/kyoIPrG4rhZnsqE8A2kMF59MuD38Wnm93bz3X
	srWA==
X-Received: by 10.194.192.106 with SMTP id hf10mr12098211wjc.131.1447271313543;
	Wed, 11 Nov 2015 11:48:33 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm9700824wjd.32.2015.11.11.11.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 11:48:32 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2015 20:48:06 +0100
Message-Id: <1447271300-4153-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH V2 03/17] modemmanager: Add PACKAGECONFIGs
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:34 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../modemmanager/modemmanager_1.4.12.bb                 | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index db7a28d..b1768ca 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 inherit gnomebase gettext systemd
 
-DEPENDS = "glib-2.0 libmbim libqmi (>=1.12.4) polkit libgudev dbus-glib"
+DEPENDS = "glib-2.0 libgudev dbus-glib" 
 
 SRC_URI = "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"
 SRC_URI[md5sum] = "66cc7266b15525cb366253e6639fc564"
@@ -17,6 +17,21 @@ SRC_URI[sha256sum] = "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
+# If you need a different configuration for modemmanager, add a statement
+# similar to the following example to your local.conf or distro config
+# PACKAGECONFIG_remove_pn-modemmanager = "polkit"
+PACKAGECONFIG ??= "mbim qmi polkit"
+
+EXTRA_OECONF = " \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '', d)} \
+"
+PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
+# Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
+PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim,libmbim"
+# Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
+PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi (>=1.12.4),libqmi (>=1.12.4)"
+
+
 FILES_${PN} += " \
     ${datadir}/icons \
     ${datadir}/polkit-1 \
-- 
2.4.3


