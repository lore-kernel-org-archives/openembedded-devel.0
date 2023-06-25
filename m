Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDDFEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:42:37 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.20820.1687729304464154127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=OTeJCYzw;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687729300;
	bh=ve13/I/TT3cfPLNQsl2h2cCyv/1wCMTUCUAEs7kKP9s=;
	h=From:To:Cc:Subject;
	b=OTeJCYzwnu2i+IbP/RRH3REsN3NS8RKIMcN0dAk2A1Xg7EQgI7J/1BQRZ6bAfc16A
	 ub/n6RJQg2iRoRiydKHsCBgYu/vPJUYFMRat+j+Zw0naMAoAdzJOKri5dhAFeLeetI
	 BCJM69xQT3Mp2F23y6Nj+MDjBDTviaR1Hj7lpF/M/nz7P/EYklGuk4oxa/3ItOEPDt
	 CFp1bNxHvmuhButZ22HMN6KwwmRVBZBkBVaSlEsWXVv8oOC0RwjNMCB2vFtBu9LrNK
	 7EreotFrE85bMuOBEd0+T9y8D48zHaLFUMpcputGcMl3wcKY0ZVNxXmogsKjFGMFEe
	 ZX/a6J1VuIX8A==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 1/3] python3-pytest-cov: Add initial recipe 4.1.0
Date: Sun, 25 Jun 2023 23:39:57 +0200
Message-ID: <20230625213959.2791472-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 21:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103566

Dependency for python3-platformdirs 3.6.0 ptest

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-pytest-cov_4.1.0.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-co=
v_4.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
new file mode 100644
index 0000000000..1ff3e75cbe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Pytest plugin for measuring coverage."
+HOMEPAGE =3D "https://github.com/pytest-dev/pytest-cov"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3Dcbc4e25353c748c817db2daffe605e43 \
+"
+
+SRC_URI[sha256sum] =3D "3904b13dfbfec47f003b8e77fd5b589cd11904a21ddf1ab3=
8a64f204d6a10ef6"
+
+inherit pypi setuptools3
+
+DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


