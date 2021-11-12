Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB39CC433FE
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:16:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.64.1636737418840737516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 067E1101E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:16:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26553F718
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:16:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libxmlb: put binary into separate package
Date: Fri, 12 Nov 2021 17:16:55 +0000
Message-Id: <20211112171655.1104612-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 17:16:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93917

xb-tool is for debugging purposes only and isn't needed in normal use.
Inherit lib_package so the binary isn't installed by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb b/meta-oe/rec=
ipes-gnome/libxmlb/libxmlb_0.3.3.bb
index 7feb209e0d..9b3a343b88 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/hughsie/libxmlb.git;branch=3D=
main;protocol=3Dhttps \
 SRCREV =3D "5108556a17bb1c2863c2ca5df088143ea65474a3"
 S =3D "${WORKDIR}/git"
=20
-inherit gobject-introspection gtk-doc meson ptest-gnome
+inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
=20
 PACKAGECONFIG ??=3D "\
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
@@ -16,3 +16,5 @@ PACKAGECONFIG ??=3D "\
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
 GTKDOC_MESON_OPTION =3D "gtkdoc"
+
+FILES:${PN}-bin +=3D "${libexecdir}/*"
--=20
2.25.1


