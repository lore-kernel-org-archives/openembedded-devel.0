Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1F862731B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 22:35:44 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so111797562wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 14:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2j4ZIucY/e6YjFdFu5FNhhhtWGyqiy/uhuPyzSx8n6U=;
	b=cxQbpvyqhlEDuWCIZW7FkcvblnDODmwMo3IDb8GfjOo4ccWaYdB1urQbFodZBKb4HO
	rNsio4ejkIA1B/YnEG6OJG3LjsChWh4alYE2pP/86AUVWzUHnKZazc6cDRa2dBBCxurh
	SDs+PKG7cnuf5RMcbcl3SnnLCWwZXyRtBoQRI86hsKvh7NS/Wsl3AnFmovl8XgJO5jbD
	0rS4/F/nirHTSUhaNGRQ13IH9Rx+82kQJXT7TRztsiq76Shk9+wBHeYsJVpEsrRbuEuq
	LVC+bFalVTLl2vBDXhY/Xu9knKtDFMUkYSzKPn+BG1DUX8Cu0EurjhQGnULLzyBQCGPK
	xwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=2j4ZIucY/e6YjFdFu5FNhhhtWGyqiy/uhuPyzSx8n6U=;
	b=M7Jez6sIdcb9KjartFmL688Dr8nwc/A16jDfCgQKJUPQ9gjtNayoPsVA4dw6RMAsf7
	Ttp0YumDe7Z3moy0EgatV+zaCamWXXk5HjOsrNhprnVttesfmVVv+CJXCGZpGVLK5zSO
	qPCy6rTo7r72+ebMHzBbR/uvbbDkuEuG6zNAgA6sTCoWHMK7MfvIMuClpowV+Xev8NGk
	7aLQriMRQ3JAfh41IHkITMRMP5FNDixOuG7fCfBFSA8/H5Jh2RwMjEM4V9Tv80w2o0jQ
	UJ27YBNhDBrSdTyUVvIYzuuGyysBJvSFzzhPGVxKXUj422SEwINf5njIzic1MTPvO+7E
	d8pw==
X-Gm-Message-State: AG10YOS1D7he5rahIRktrAcRB6nM/EYun6WlzHYQ0XB2Ge6oCpuUXNfA45B0u+4e2PCeLg==
X-Received: by 10.28.176.131 with SMTP id z125mr29145588wme.5.1454884544626;
	Sun, 07 Feb 2016 14:35:44 -0800 (PST)
Received: from localhost.localdomain (p5B0A33CD.dip0.t-ipconnect.de.
	[91.10.51.205]) by smtp.googlemail.com with ESMTPSA id
	az10sm26865942wjc.28.2016.02.07.14.35.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Feb 2016 14:35:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Feb 2016 23:35:29 +0100
Message-Id: <1454884529-23770-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454884529-23770-1-git-send-email-schnitzeltony@googlemail.com>
References: <1454884529-23770-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] abiword: make build deterministic for meta-office [1] in layers
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
X-List-Received-Date: Sun, 07 Feb 2016 22:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The conditional DEPENDS was added for opendocument-plugin. Problem solving this
by PACKAGECONFIG is that --enable-plugins enables all plugins. Changing that to
--enable-plugins=<list of plugins> is a list which needs maintenance for future
versions of abiword. The change affects users adding meta-office in their
layers only. These tend to building libreoffice which DEPENDS on the additional
DEPENDS set her anyway - so there is not much additional build for these users.

[1] https://github.com/schnitzeltony/meta-office

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index d4c8c56..962a56c 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -4,7 +4,8 @@ SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 DEPENDS     = "perl-native wv libglade libfribidi jpeg libpng \
-               librsvg libwmf-native gtkmathview asio gtk+ evolution-data-server"
+               librsvg libwmf-native gtkmathview asio gtk+ evolution-data-server \
+               ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'redland rasqal', '', d)}"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
@@ -24,7 +25,11 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 inherit autotools-brokensep pkgconfig
 
-PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp"
+PACKAGECONFIG ??= " \
+    collab-backend-xmpp collab-backend-tcp \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'libical', '', d)} \
+"
+PACKAGECONFIG[libical] = "--with-libical,--without-libical,libical raptor2"
 PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
 PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth"
 PACKAGECONFIG[collab-backend-tcp] = "--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf libxml2"
-- 
2.5.0


