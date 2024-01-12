Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE708C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 18:27:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15172.1705084060030964469
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 10:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDB822F4
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:28:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 062E03F5A1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:27:38 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] glade: inherit gtk-doc, fix FILES
Date: Fri, 12 Jan 2024 18:27:33 +0000
Message-Id: <20240112182736.3448071-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112182736.3448071-1-ross.burton@arm.com>
References: <20240112182736.3448071-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108244

From: Ross Burton <ross.burton@arm.com>

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

Also, clean up FILES:

Don't package all of ${datadir} in PN, as this means the locale
information isn't split into the appropriate packages.

.la files are deleted globally so there's no need to package them in
PN-dev.

Debug files are managed automatically so there's no need to package them
at all.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/rec=
ipes-devtools/glade/glade_3.22.2.bb
index 3936e04c6d..d11751a4b2 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "gtk+3 glib-2.0 libxml2 intltool-native \
            autoconf-archive-native \
 "
 GNOMEBASEBUILDCLASS =3D "autotools"
-inherit features_check autotools pkgconfig gnomebase gobject-introspecti=
on mime-xdg
+inherit features_check autotools pkgconfig gnomebase gobject-introspecti=
on mime-xdg gtk-doc
=20
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
@@ -23,7 +23,4 @@ SRC_URI[sha256sum] =3D "edefa6eb24b4d15bd52589121dc109b=
c08c286157c41288deb74dd9cc3
=20
 EXTRA_OECONF +=3D "--disable-man-pages"
=20
-FILES:${PN} +=3D "${datadir}/* ${libdir}/glade/modules/libgladegtk.so"
-FILES:${PN}-dev +=3D "${libdir}/glade/modules/libgladegtk.la"
-FILES:${PN}-dbg +=3D "${libdir}/glade/modules/.debug/libgladegtk.so"
-
+FILES:${PN} +=3D "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/m=
odules/libgladegtk.so"
--=20
2.34.1


