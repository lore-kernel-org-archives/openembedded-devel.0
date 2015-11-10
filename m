Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA0FD77170
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:01 +0000 (UTC)
Received: by wmww144 with SMTP id w144so136524618wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rw4wTWuNQDiPb8NcGpwngyUhwL9e6Njqwvq/9ji0kzI=;
	b=aWZy+XbK95TYSYDZUnLMEBoQdTCQk0LYSkw0up+2g32bOaL6DKdma5rM1WYbvI6yt0
	/nbO/1cp4i8aBMTNxXONs26G4eoytFE5SqWoQi0Zg9aJx7AaP/BXhUHSJZSedS5J8NRa
	RpNMpQIRlcd+3NZHiLAY4fOagnn/TdohqDmYVAsf7GYe/f7ZaC/VP1wbtH61AtT8DYb4
	8PgjSH0Of5B4+d52HD4W+a3mxMROjOyv2uiZgP4diALdWMI1wd8eiG7yPhf/JlzSbMfu
	c+8o7Z8n6hFcaSCnpjgK9oT7g/W7IW2wExhvAAT5VtpztfCuFw5ikWRsEtngW+m/75jx
	CvCA==
X-Received: by 10.194.90.79 with SMTP id bu15mr7454282wjb.36.1447192201573;
	Tue, 10 Nov 2015 13:50:01 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:01 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:09 +0100
Message-Id: <1447192164-9399-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 02/17] modemmanager: Update to 1.4.12
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

 - Fixes segfaults, memleaks and other bugs
 - Support more modems

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../{modemmanager_1.4.2.bb => modemmanager_1.4.12.bb}        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.4.2.bb => modemmanager_1.4.12.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
index b273c91..db7a28d 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
@@ -1,19 +1,19 @@
 SUMMARY = "ModemManager is a daemon controlling broadband devices/connections"
 DESCRIPTION = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ModemManager/"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0 & LGPL-2.1"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit autotools gettext gtk-doc systemd
+inherit gnomebase gettext systemd
 
-DEPENDS = "glib-2.0 libmbim libqmi polkit libgudev dbus-glib"
+DEPENDS = "glib-2.0 libmbim libqmi (>=1.12.4) polkit libgudev dbus-glib"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[md5sum] = "fe74eaa9a77e51e552b4356b4c7195cb"
-SRC_URI[sha256sum] = "07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef0b3a06e37703585d"
+SRC_URI = "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"
+SRC_URI[md5sum] = "66cc7266b15525cb366253e6639fc564"
+SRC_URI[sha256sum] = "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6bc70b3" 
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.4.3


