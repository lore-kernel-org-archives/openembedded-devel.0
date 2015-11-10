Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8891C77194
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:13 +0000 (UTC)
Received: by wmec201 with SMTP id c201so21824711wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WEbOvHua5aUcy28RVcx00jVOlpdKKHUfAWYsD3dYY60=;
	b=B1vJGRMUpguCFqwfefbw2qjKQ5Ky9EYnx8SLwhIXBD9BsOSvnsA7NwteAGsqkcZlvW
	t/6ICCLkEQTdGMnY6BGd8o103V6BlYDlafmdArekzTivX4ETdAYQwUDhGOxqljB9yqVT
	hZLQwBouFtXKpjLYf4C8RQq6IiDTuLuNMKTbvrAPiUXZLP7Co7fWeUrTohTnLNKqYMxO
	oFIQMHxXjtwW3YOlgIdXCMu4sOteYzZrFwhc9t0EYvJOshJOYC8X7LrXt5rOeVK3CzCb
	V7eY46mOjwoyDfLpOPMl5icMdqIBTZzm6oXkMdPikI6rxEQ9agz8hPAa0mw8ltlKsCNZ
	ECHg==
X-Received: by 10.28.23.141 with SMTP id 135mr7492902wmx.84.1447192214028;
	Tue, 10 Nov 2015 13:50:14 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:13 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:23 +0100
Message-Id: <1447192164-9399-17-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 16/17] networkmanager: use bluetooth from distro
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:15 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 383aae9..9b358da 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
 
 DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
 
-inherit gnomebase gettext systemd
+inherit gnomebase gettext systemd bluetooth
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -52,6 +52,7 @@ EXTRA_OECONF = " \
 # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq adsl \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','bluetooth','${BLUEZ}','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
 "
 PACKAGECONFIG[systemd] = " \
-- 
2.4.3


