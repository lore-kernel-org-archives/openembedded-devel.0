Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web09.34255.1613995989599028767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=PwLVTWY5;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.. (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id B0F8C10226EC;
	Mon, 22 Feb 2021 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1613995976; bh=r7g6Ys+87aLPcG4rCJVNZx4SZhSUxpaR6FDcXeVdnOc=;
	h=From:To:Cc:Subject:Date;
	b=PwLVTWY5rOWWW1Hp5MSomPgQ4zJQduwviNS/XGnVP0fdHNgMxrlSD/lzRGqyN7nJS
	 DMq8ssEAyO63JOdI5ymZShRWfOJyU4AtPnjTv8KhPYJjviYXmpG66xWo6sG6f91mZN
	 I+KpCiyEIJAprCt6EhlaxsAgRpBUqrRWI1je6pRCrS6HcYmNcNz3wpRqzUJtP1jVzO
	 46pmOiWC1kKdt5mGwf3vTwIxUfRA+gS8W/XEcXuGrSNbdzWqEyROdSOMGFjk7tnbbL
	 5FiZFlQywDn9VcfQYYJzcwobAhdPn14Avd/y8osyiEGy7KXDyE3YRiRisEun165xea
	 HAnTXZ9ScCdqg==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe][meta-oe][PATCH] can-utils: split into more packages
Date: Mon, 22 Feb 2021 13:12:50 +0100
Message-Id: <20210222121250.2835405-1-sean@geanix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=disabled
	version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 93bd6fdb21b5
Content-Transfer-Encoding: quoted-printable

---
 .../socketcan/can-utils_git.bb                | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-o=
e/recipes-extended/socketcan/can-utils_git.bb
index bc930ac9d..3b2b6a9da 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -14,6 +14,33 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig update-alternatives
=20
+PACKAGES =3D+ "${PN}-access ${PN}-isotp ${PN}-j1939 ${PN}-cantest ${PN}-=
slcan ${PN}-log"
+
+FILES_${PN}-access =3D " \
+    ${bindir}/cangw \
+    ${bindir}/canlogserver \
+    ${bindir}/bcmserver \
+    ${bindir}/socketcand \
+    ${bindir}/cannelloni \
+"
+
+FILES_${PN}-isotp =3D "${bindir}/isotp*"
+
+FILES_${PN}-j1939 =3D " \
+    ${bindir}/j* \
+    ${bindir}/testj1939 \
+"
+
+FILES_${PN}-cantest =3D " \
+    ${bindir}/canbusload \
+    ${bindir}/can-calc-bit-timing \
+    ${bindir}/canfdtest \
+"
+
+FILES_${PN}-slcan =3D "${bindir}/slcan*"
+
+FILES_${PN}-log =3D "${bindir}/*log*"
+
 ALTERNATIVE_${PN} =3D "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] =3D "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] =3D "${bindir}/cansend"
--=20
2.29.2

