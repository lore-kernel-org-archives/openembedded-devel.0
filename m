Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B7F5D766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:02 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so29559007wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LsTiky6657fg17xgt57edQT6/Wg2QEgwTHxLu8oMHKk=;
	b=PNTJM6Dea5xO/Ju3ssELk94WLSf/cZAyVRATp75nosgOdbMof7OIUrKwpYh88B9pD/
	zTF005eP3gSrFoWHj6j+fqUxzRdpg4zGSZgmtlieEYQl+ZmOLm4cJezmwsP9YFZfL7GB
	yX7UjoH0+x+VQW7Lzuisexe16mEcoY1y1pOa7Oi0R7DwVh/XdjxMtbaSDIo8endjVqBJ
	DtPMgReM0y3HkWnwkoma/2Uw70E0C0HsTirFT05WwZO05ova7vgesAWkGT8LnQ1b/6kR
	0GBq7zhODIq4V4O3WiFcV1dgtQQDWC6JF4M3WXVkgZPpjk0UMv7G8gb5Xhz5sF0pxXzU
	N2Jg==
X-Received: by 10.28.147.142 with SMTP id v136mr7618547wmd.53.1447192202310;
	Tue, 10 Nov 2015 13:50:02 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:01 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:10 +0100
Message-Id: <1447192164-9399-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 03/17] modemmanager: Add PACKAGECONFIGs
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:03 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../modemmanager/modemmanager_1.4.12.bb                 | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index db7a28d..1d630a9 100644
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
+# PACKAGECONFIG_pn-modemmanager = "mbim qmi"
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


