Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43880.1793023711197614126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 07:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nPJ8Ghq4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 541372720
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 07:08:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23CBF3F7B4
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023710; bh=68H3idL8stvg35FsAEVyxAbXhxPBLk1oUyk0AHbs/xE=;
	h=From:To:Subject:Date:From;
	b=nPJ8Ghq4X7sZkJLvnNRizzpPaYxVvQN84Gl41cOmC26OwjJVmcKWshkxUE3ouMQq7
	 /WpIItkxP6awzjnaP1Hn8IH6ozaDmhycBCm4fPOhvMXyta1m45pEXXnvLuXX0Fv/cW
	 G11P+bgmuLeBSDeHlmtSQD15wo857e/YAplLy03g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-importlib-metadata: clean up recipe
Date: Mon, 26 Oct 2026 14:08:27 +0000
Message-ID: <20261026140827.2132834-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 14:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131437
Content-Type: text/plain; charset="utf-8"

S is the default, and the dependencies can be consolidated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-importlib-metadata_9.0.1.bb              | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metada=
ta_9.0.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metad=
ata_9.0.1.bb
index 89fc9af824..b30f9c2309 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.=
1.bb
@@ -7,11 +7,7 @@ inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "ab830580bc0ef3db61ce8fae716389e5462b67e033018bab=
6d8f80ef17172f99"
=20
-S =3D "${UNPACKDIR}/importlib_metadata-${PV}"
-
 DEPENDS +=3D "python3-setuptools-scm-native python3-coherent-licensed-na=
tive"
-RDEPENDS:${PN} +=3D "python3-zipp"
-RDEPENDS:${PN}:append:class-target =3D " python3-misc"
-RDEPENDS:${PN}:append:class-nativesdk =3D " python3-misc"
+RDEPENDS:${PN} +=3D "python3-misc python3-zipp"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0

