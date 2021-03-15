Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9788.1615819860372293473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 07:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8A71FB
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 07:50:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22CD3F792
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 07:50:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libxmlb: upgrade to 0.3.0
Date: Mon, 15 Mar 2021 14:50:55 +0000
Message-Id: <20210315145055.2573461-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 .../libxmlb/{libxmlb_0.1.15.bb =3D> libxmlb_0.3.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.1.15.bb =3D> libxmlb_0.3=
.0.bb} (90%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.0.bb
similarity index 90%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.0.bb
index c545993174..d677d2436f 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.0.bb
@@ -6,7 +6,7 @@ SRC_URI =3D "\
     git://github.com/hughsie/libxmlb.git \
     file://run-ptest \
 "
-SRCREV =3D "ee4aafdd97844f1c73021a4978a43460f0835d5c"
+SRCREV =3D "8f2f28eda419dbe31cb1a9aa022f0ca9d30ecb6a"
 S =3D "${WORKDIR}/git"
=20
 inherit gobject-introspection gtk-doc meson ptest-gnome
--=20
2.25.1

