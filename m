Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD2EC369AB
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 01:02:31 +0000 (UTC)
Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
 by mx.groups.io with SMTP id smtpd.web10.19513.1744496736552604746
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 15:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=JXaX0T/W;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.69, mailfrom: jeroen@myspectrum.nl)
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4ZZp6605YVzxPD4;
	Sun, 13 Apr 2025 00:25:34 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission6.mail.transip.nl (Postfix) with ESMTPSA id 4ZZp645hTSz2pRDk4;
	Sun, 13 Apr 2025 00:25:32 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id DF18F202E0;
	Sat, 12 Apr 2025 22:25:29 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Sun, 13 Apr 2025 00:25:29 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe] [meta-networking] php: sort PACKAGECONFIG options
Date: Sun, 13 Apr 2025 00:24:17 +0200
Message-ID: <20250412222515.849622-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1744496732; h=from:subject:to:cc:date:
 mime-version; bh=PPNaZxONtDUsYronqt1B98rkFPgZxpJw7hPxY2k7EnU=;
 b=JXaX0T/WGBv4v/vz63Z8wCBKg06XofJ2/cyLkAxF09OycYe6G+AR1ocBiq8cfCD/9go+C4
 stlIOtH7WLM/NUGHCFOwp9oMQHd3Q9lANuEtUAmvSjK7sNSZizx+l2TJGmRXiQIREDL93Q
 QXXE21MmSV2ANXYrzswSpg4Vsdv24N1ip3AYrZMUJgwq6dtSGSe5M1OkRVmIkS4XLAF1oJ
 bND5UiW1XyMtfA3ixmJ/lezhbuDGDsYsuFzWMvl9qjoaoIVbYqk+aNIYMaAOzzP6gIPPwT
 HUIM4QCdkOC5bJfXhDRJVXDKi4cC0mJE+7LC5jDdSP/DY9sU214anW3eD3fHhw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 01:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116821

From: Jeroen Hofstee <jhofstee@victronenergy.com>

---
 meta-oe/recipes-devtools/php/php_8.4.5.bb | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.5.bb b/meta-oe/recipes-=
devtools/php/php_8.4.5.bb
index cf4b756b85..7c7c425d3d 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.5.bb
@@ -92,27 +92,25 @@ PACKAGECONFIG ??=3D "mysql sqlite3 opcache openssl \
 "
 PACKAGECONFIG:class-native =3D ""
=20
-PACKAGECONFIG[zip] =3D "--with-zip --with-zlib-dir=3D${STAGING_EXECPREFI=
XDIR},,libzip"
-
+PACKAGECONFIG[apache2] =3D "--with-apxs2=3D${STAGING_BINDIR_CROSS}/apxs,=
,apache2-native apache2"
+PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[mbregex] =3D "--enable-mbregex, --disable-mbregex, oniguru=
ma"
+PACKAGECONFIG[mbstring] =3D "--enable-mbstring,,"
 PACKAGECONFIG[mysql] =3D "--with-mysqli=3Dmysqlnd \
                         --with-pdo-mysql=3Dmysqlnd \
                         ,--without-mysqli --without-pdo-mysql \
                         ,mysql5"
-
+PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-opcache"
+PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[pam] =3D ",,libpam"
+PACKAGECONFIG[pgsql] =3D "--with-pgsql=3D${STAGING_DIR_TARGET}${exec_pre=
fix},--without-pgsql,postgresql"
+PACKAGECONFIG[soap] =3D "--enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_LIBDIR}/.. \
                           --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
-PACKAGECONFIG[pgsql] =3D "--with-pgsql=3D${STAGING_DIR_TARGET}${exec_pre=
fix},--without-pgsql,postgresql"
-PACKAGECONFIG[soap] =3D "--enable-soap, --disable-soap, libxml2"
-PACKAGECONFIG[apache2] =3D "--with-apxs2=3D${STAGING_BINDIR_CROSS}/apxs,=
,apache2-native apache2"
-PACKAGECONFIG[pam] =3D ",,libpam"
-PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-opcache"
-PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[valgrind] =3D "--with-valgrind=3D${STAGING_DIR_TARGET}/usr=
,--with-valgrind=3Dno,valgrind"
-PACKAGECONFIG[mbregex] =3D "--enable-mbregex, --disable-mbregex, oniguru=
ma"
-PACKAGECONFIG[mbstring] =3D "--enable-mbstring,,"
+PACKAGECONFIG[zip] =3D "--with-zip --with-zlib-dir=3D${STAGING_EXECPREFI=
XDIR},,libzip"
=20
 export HOSTCC =3D "${BUILD_CC}"
 export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
--=20
2.43.0


