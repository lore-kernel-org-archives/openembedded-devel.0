Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E272471AE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:37 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so668594pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i/AyGfJdE1qJBGT2echkx3CaBMfGrGY+UxBmi6GLkIY=;
	b=YFyZLAPnDUahmp5TGezyX7VZO4uUZ/dDJDzx9Fj50f6qJfdwL6uAMCjZ5toPPVqwWA
	RjQ9nTBfy0jNJ4cgHEO3GYlEekSz3cGb1laNpwc5x8PTH+PWv6K1kAzM5tgkDRnjaPCz
	uJ2nPw53pGSnCPS1W1tkidIJaDtfklYYIvmqis6s/VOkW7mgBHGHS2RVD5dCSSDYEefY
	9QkXwKgc/lHjXDGCx3QbJt1UATeUr6Pp6virDUUwkPa6oyGCKOR4QVIAzHPRXzpXfeRw
	8xpxSzQ7aZvVL5IZm/sVopL1wKWk3djbBJpjiqZFrdvmS1dpjTHtRtnWlrcsqT7iWqJI
	CpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i/AyGfJdE1qJBGT2echkx3CaBMfGrGY+UxBmi6GLkIY=;
	b=fmoIHBnjrf3v4FeokrlUD92k+j6P1m7zTHUTAw+ClywyevDJfaWXKRl9tdOZHGQT5p
	7U020gZtMEs1QcEruEwkuXk9nlqqOmWG2wRl6GLyOK6XJvjFd5fM31qxis12WsoZ/lB4
	gq9Hro16Zh2c9BYXNjE8f/minU+Inv4YG4ZdXJRCx/y5rvi4gpjAv5fpkM6bjFokB7Gr
	v5KZGQrvTydAEuZ8Xw9a3c2lG8QQU8xxTS9+50E9NOjCYL6bRY+FKreTjSNycgAQT21o
	+Bj7//SQI/SJwzoyiTY5xaZ/PphI9lawKv+idS33zZZvNyY0ntBGP2sin80dZX7tElt3
	4KmA==
X-Gm-Message-State: AKaTC02OmLwGDLLynVihCOOhqt8K33zsFMUKY0KZZLPQNpw388a0sRY/+Noh+xRY9abVjw==
X-Received: by 10.84.129.111 with SMTP id 102mr4638875plb.103.1479892959709;
	Wed, 23 Nov 2016 01:22:39 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:50 -0800
Message-Id: <20161123092209.23699-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 30/49] networkmanager-openvpn: Update 1.0.8->1.2.6
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:38 -0000

Remove .la files which are new
Package the new .name files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...anager-openvpn_1.0.8.bb => networkmanager-openvpn_1.2.6.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.0.8.bb => networkmanager-openvpn_1.2.6.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
index fe1d601..7ae566e 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
@@ -9,20 +9,24 @@ DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native"
 inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "758a9951ad5e20a37c72cc7326c9c750"
-SRC_URI[sha256sum] = "1b979519d72ba4d78e729d4856c5b53fad914ca7ee3ca91209ce489ba78912ac"
+SRC_URI[md5sum] = "47ed9b6c43ca364976a15e84207687df"
+SRC_URI[sha256sum] = "2373e2bb0a8a876cb2997cd8b0e3d6e10012d9bef3705ea3ac21f6394b3f1fb0"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
+do_install_append () {
+    rm -rf ${D}${libdir}/NetworkManager/*.la
+}
+
 # Create user and group nm-openvpn that are needed since version 1.0.6
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
     ${libdir}/NetworkManager/*.so \
+    ${libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
 
 RDEPENDS_${PN} = " \
-- 
2.10.2


