Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.5983.1610011751921457740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=llZiZ9iC;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id D56F44E1532;
	Thu,  7 Jan 2021 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1610011747; bh=Bxy0S47cZ+7TXNdMfIpxQTcVPkf9on8NYofyS6Saw/o=;
	h=From:To:Cc:Subject:Date;
	b=llZiZ9iC7x/QaNpER/gHLiylUQIU92mmLQStcYwu9yojrCHpluDWd5d1oRiZ0a0z0
	 cxglOmUhVoUy69b4c6ZCoJuKetJYQ7szAuZXUfm9x6aZgt9+cSKgnuocxg0vIcOIys
	 O7dchQezLGaHnMjrZY3AoB1Aof1InZIo2T+pnc6LW3h+gwMf1C8XG7zmRkE/v9fZU9
	 bychhuyxQ5M4wMnNTBL8KLefh87syJBeZ3yQjU7n4kIYzRM67MH9H9mnh1vOEt8a0Z
	 0odDe8Ye60vwdDRwcV7jcwWiph/r8iv4zdgt5qr+LSOyfLkLl9HLd/fvtrnPhiraR+
	 1F0FLpnbZ6dbQ==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe][meta-oe][PATCH] nodejs: 12.19.1 -> 12.20.1
Date: Thu,  7 Jan 2021 10:28:54 +0100
Message-Id: <20210107092854.2040757-1-sean@geanix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 .../nodejs/{nodejs_12.19.1.bb =3D> nodejs_12.20.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.1.bb =3D> nodejs_12=
.20.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.20.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
index 8021fedf4..0673a3202 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D30e27bd6830002d9415e4a5da7901=
f03"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c66ff8861d9f96076a7cb61e3d75=
f54"
=20
 DEPENDS =3D "openssl"
 DEPENDS_append_class-target =3D " nodejs-native"
@@ -26,7 +26,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
 SRC_URI_append_class-target =3D " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] =3D "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d824=
3e8511d478d1b17d"
+SRC_URI[sha256sum] =3D "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945e=
ac9870bf84321853"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.29.2

