Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8E8C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 18:27:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15171.1705084059802966157
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 10:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30CD11FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:28:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EBCB3F5A1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:27:38 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] telepathy-glib: inherit gtk-doc
Date: Fri, 12 Jan 2024 18:27:32 +0000
Message-Id: <20240112182736.3448071-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108245

From: Ross Burton <ross.burton@arm.com>

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1=
.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 1891eae40d..e083039232 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "9e0df1d8f857e0270cf0b32e2d1ca5a=
24aa7282873361785d573f72ad7
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De413d83db6ee8f2c8e6055719096a=
48e"
=20
-inherit autotools pkgconfig gettext gobject-introspection vala
+inherit autotools pkgconfig gettext gobject-introspection vala gtk-doc
=20
 # Respect GI_DATA_ENABLED value when enabling vala-bindings:
 # configure: error: GObject-Introspection must be enabled for Vala bindi=
ngs
--=20
2.34.1


