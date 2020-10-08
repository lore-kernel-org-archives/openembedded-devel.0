Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1417.1602173936574376512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1ECFD6E
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:18:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77D9C3F70D
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:18:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] mpv: fetch waf in do_fetch
Date: Thu,  8 Oct 2020 17:18:49 +0100
Message-Id: <20201008161850.3097336-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The mpv git repository doesn't include a copy of waf, instead there is a
bootstrap script to fetch it.

This recipe calls the bootstrap script in a do_patch postfunc, but
downloading should be done in do_fetch. Instead of calling
./bootstrap.sh simply add waf to the SRC_URI so that Bitbake can use the
mirrors/proxies/caching/checksum functionality.

This is both better code and also works in buildtools environments
where urllib2 can't make secure connections without configuration.

[ YOCTO #14073 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.32.0.bb
index e5f1096b6..5273fc040 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -18,7 +18,9 @@ LICENSE_FLAGS =3D "commercial"
 SRCREV_mpv =3D "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI =3D " \
     git://github.com/mpv-player/mpv;name=3Dmpv \
+    https://waf.io/waf-2.0.20;name=3Dwaf;subdir=3Dgit \
 "
+SRC_URI[waf.sha256sum] =3D "bf971e98edc2414968a262c6aa6b88541a26c3cd2486=
89c89f4c57370955ee7f"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -101,14 +103,10 @@ EXTRA_OECONF =3D " \
     ${PACKAGECONFIG_CONFARGS} \
 "
=20
-do_patch[postfuncs] +=3D "get_waf"
-
-get_waf() {
-    cd ${S}
-    ./bootstrap.py
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
-    cd -
+link_waf() {
+    ln -s waf-2.0.20 ${S}/waf
 }
+do_unpack[postfuncs] +=3D "link_waf"
=20
 FILES_${PN} +=3D " \
     ${datadir}/icons \
--=20
2.25.1

