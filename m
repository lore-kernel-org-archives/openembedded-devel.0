Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F66BCCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 13:37:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15616.1761917872908162622
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 06:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8692E1595
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 06:37:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3FA73F66E
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 06:37:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] psqlodbc: set SRCREV
Date: Fri, 31 Oct 2025 13:37:49 +0000
Message-ID: <20251031133749.2019140-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 13:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121233

This recipe was moved from tarballs to git in the 17.00.0006 upgrade,
but the recipe failed to set SRCREV. This meant bitbake had to look up
the tag name on every parse.

Set SRCREV, and remove the now-obsolete SRC_URI[sha256sum].

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb b/meta-o=
e/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
index 2fbd8b78e4..183f810216 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
@@ -19,7 +19,6 @@ HOMEPAGE =3D "https://odbc.postgresql.org/"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3D6db3822fc7512e83087ba798d=
a013692"
=20
-PV_WITH_USCORE =3D "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI =3D "git://github.com/postgresql-interfaces/psqlodbc.git;protoco=
l=3Dhttps;branch=3Dmain;tag=3DREL-${PV_WITH_USCORE} \
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
@@ -28,7 +27,8 @@ SRC_URI =3D "git://github.com/postgresql-interfaces/psq=
lodbc.git;protocol=3Dhttps;br
     file://run-ptest \
 "
=20
-SRC_URI[sha256sum] =3D "afd892f89d2ecee8d3f3b2314f1bd5bf2d02201872c6e343=
1e5c31096eca4c8b"
+SRCREV =3D "251c8e8200c7a030fa46e59429d3fec7a73de4ec"
+PV_WITH_USCORE =3D "${@d.getVar('PV').replace('.', '_')}"
=20
 DEPENDS +=3D "postgresql unixodbc"
=20
--=20
2.43.0


