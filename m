Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web09.6196.1613726477944706983
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 01:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=dwcc+Ci5;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 75D4046;
	Fri, 19 Feb 2021 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1613726473; bh=bciLjFTHPZ2R62MiC2zDExUTXSb/vwzx74HCKKEeIQI=;
	h=From:To:Cc:Subject:Date;
	b=dwcc+Ci5cabKUTZrov/ty1n372OL5ypauN6wQA2n2PiL7M6wyXZesBpGN+f0sJJLI
	 5pHRkz3+VZqCibQbRLE3emXBnKyLQoSIYkmgtwfu8qNEd6y474JZkeGNCk+ZLfd9Jk
	 L/a3IQLYnGMpS7O20ZQrlJu9flALS/71MoKCY1DQ7CoeXxOzCNdgul8kyOQl2th659
	 YwtUdZp1xUAs1K50iM/XYFmvhkiXqJZLdVmXf7a9wDbTWpQoEnfQkS0r4Klq1P/U2C
	 UOmQUomepJCY2Wz974UwkWqr8N3m7K1VcI0V3DhTajzaDHua7waQZ4K7I5k3cVXxED
	 oHG57Cz30zLQQ==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe][meta-oe][PATCH] zstd: split bin into separate package
Date: Fri, 19 Feb 2021 10:20:46 +0100
Message-Id: <20210219092046.3240165-1-sean@geanix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 93bd6fdb21b5
Content-Transfer-Encoding: quoted-printable

---
 meta-oe/recipes-extended/zstd/zstd_1.4.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb b/meta-oe/recipe=
s-extended/zstd/zstd_1.4.5.bb
index cd0b471e1..d0cc625aa 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
@@ -9,6 +9,8 @@ LICENSE =3D "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7f0b161edbe52f5f345a3d1311d0=
b32 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
=20
+inherit lib_package
+
 SRC_URI =3D "git://github.com/facebook/zstd.git;nobranch=3D1 \
            file://0001-Fix-legacy-build-after-2103.patch \
            "
--=20
2.29.2

