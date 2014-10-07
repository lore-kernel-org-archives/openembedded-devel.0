Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 03D8571808
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 01:11:21 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so8134395wgg.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 18:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kH+XfTZV9fqGtn+ZT/m5yL8mgy9FL/O16A6yU5Ia0vI=;
	b=TJW5uhBzIz9M4tkRBhlrLL3+iNv55q+jPKI3iQNebCNmT2kKMw2SstDQX9XRpdIJL1
	wSdFfs27+G2aGch828zv5l5+vxJMjlaAj21JacJhrXdWa9VCHwWw26iJcDKToPnW5nrJ
	7aXO2p1ADoLfoNBiN2NwEJtIVK9MTbf6FKc7vzp4qa3LJGVWm7cgx35ca/53H/QNhGjP
	6nmsuDhuS/HQLoeh/gXEUgk6WT8PQiHnB38nk75Uw7efyggcKPuDLu4tj/MeoFOAx6hn
	Afo9DTuo2dDbfrk84WiO7V+XXcHGo/uztK6RkrEacxhpkaaaBtkYLQ2uEmJo06pdq52G
	jUbg==
X-Received: by 10.181.11.133 with SMTP id ei5mr485463wid.9.1412644282241;
	Mon, 06 Oct 2014 18:11:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k2sm6287769wiz.18.2014.10.06.18.11.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 18:11:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 03:12:19 +0200
Message-Id: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [oe-core][RFC][PATCH 1/3] gcr: blacklist because of conflict with gnome-keyring
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
X-List-Received-Date: Tue, 07 Oct 2014 01:11:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index f30fcf1..1a70ac0 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
 
+PNBLACKLIST[gcr] = "CONFLICT: 4 files conflict with gnome-keyring"
+# e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
+#      sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pgp.convert
+
 inherit autotools gnomebase gtk-icon-cache gtk-doc
 
 GNOME_COMPRESS_TYPE="xz"
-- 
2.1.1


