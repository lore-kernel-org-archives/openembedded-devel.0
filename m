Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E9BEC7C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:26:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B936C5C21BC;
	Thu, 17 Jan 2019 17:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547742395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=vEAoZh/ctvefni1dXhRGBUGh3Sf54ef+3z1LZPOda/Q=;
	b=f9yllzQULChkmqjkjgJHGSjiWzsJJgIxbfMepvL7P8OF55hmwBOJW4S1OClDknbtG97b22
	6iE0fdYy9VMJwyFALn69YVfXPm3RmtIE0HeNCTlT+6b8eDZh7dUm7XFUyQvutRqmYehlqi
	2/why6Q4qKyLf0QDzTqVf17KzuJKZes=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:29 +0100
Message-Id: <20190117162629.47677-5-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190117162629.47677-1-stefan@agner.ch>
References: <20190117162629.47677-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 5/5] modemmanager: enable polkit depending on distro feature
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
X-List-Received-Date: Thu, 17 Jan 2019 16:26:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Enable the polkit package config depending on whether polkit is
enabled in DISTRO_FEATURES.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index b374cb77a..f9b302a3d 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -21,8 +21,8 @@ SRC_URI[sha256sum] = "96f2a5f0ed15532b4c4c185b756fdc0326e7c2027cea26a1264f91e098
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-PACKAGECONFIG ??= "mbim qmi polkit \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+PACKAGECONFIG ??= "mbim qmi \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} \
 "
 
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
-- 
2.13.6


