Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.6695.1613730297154845141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 02:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=Vg0Ix9MN;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 5B1C248;
	Fri, 19 Feb 2021 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1613730294; bh=11odymbX411opeoN9LRaUd/SpmTdef91WPHfskOtDRw=;
	h=From:To:Cc:Subject:Date;
	b=Vg0Ix9MN8vwGnsl1PCiF1GhxGaFpG6y0EOeemgukSgWghi3YuKNZED9y3TTMiGuTn
	 I5hu7460Y0WNv4XeOoSQ5KPXmGrPk396eF1/ZtkiWleVr7H6f6LsOGMVL6P95ak/Bp
	 2zA5OaBApNDeaz9F59MvaR6AkYeXdoASr/ICRWJilQaZZJUtZc+1pCXJgB/NhBx0aO
	 1sWXnG3Q0P0iCzL7DHFswlSLa22in48h6U93gvWSwP9uml3w7m7aKCkUAbHt6+GiFC
	 hob+I+t9BcmzVAuCHPUX0jH5st3m0UNzATizyFVsC4Ggkyz7cnO7DgDbr9kwBVJfNo
	 I1Q2MrrPzXfYg==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe][meta-oe][PATCH] nodejs: 12.20.1 -> 12.20.2
Date: Fri, 19 Feb 2021 11:24:50 +0100
Message-Id: <20210219102450.817786-1-sean@geanix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 93bd6fdb21b5
Content-Transfer-Encoding: quoted-printable

---
 .../nodejs/{nodejs_12.20.1.bb =3D> nodejs_12.20.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb =3D> nodejs_12=
.20.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.20.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
index 0673a3202..6acc36b4f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
 SRC_URI_append_class-target =3D " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] =3D "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945e=
ac9870bf84321853"
+SRC_URI[sha256sum] =3D "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7=
774796756eec6d3c"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.29.2

