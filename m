Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5816CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 10:06:45 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12583.1764410801035494799
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Nov 2025 02:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=bR8rFYbN;
 spf=pass (domain: web.de, ip: 212.227.17.12, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764410797; x=1765015597; i=jan.claussen10@web.de;
	bh=Oof8x4aZBl3QVwfHi9r6dD0KWPGq13IuvppcwMBlZBM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bR8rFYbNsaZkPPk5pDx76WKg+oEbdh7rnDDteJUQ78Pryoq6uG+ym4cFErEz290a
	 1AKLPyltzsHONLE+Rr+XKvQb44Ph9Cycv8N+dj4jIAnxmGbDHh7xMxXcAQxLpBFSD
	 /v694hkJIwQxL9aAGrfrPFL6qOTOAoOxK6LXACByjv9AteXvcnnHic95ovyk2ihvZ
	 uRMl1wc6DPnSik1ffIDZu+uI6U3HYS/NKbXn3XtibHc2/cyjvtR/14mEzE2GRwN3x
	 QQ3EbCZrsZDPrH7cF1oVMJtctOy9PEvzX0Tw+wF765rpYSxP4tWcJEWCFBP0eC2Z0
	 VEG9fjP807skmsZbuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810.fritz.box ([31.29.50.223]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1Mmhjw-1vq84Z2h0A-00hWwK; Sat, 29 Nov 2025 11:06:37 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [meta-python][PATCH v2] python3-soundcard: Add recipe
Date: Sat, 29 Nov 2025 11:06:36 +0100
Message-ID: <20251129100636.2844306-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xJkMtPoZi6mRUSxaDb68TUAJD1GvX6/3y8ci984Af/1GyMNS5gD
 2Mo7LMNrA7smmvnF1qpzhEuXP7dwmeLuRkUspUwunDvAWPMOOhMcQZk4bvafSQR29lGuMxC
 BroO/Q7uPG5ZS14VlHOLlm1NEQpiG8eXCndG28rEF+4L0DRJfStI2aK1ftPkxZAFtZuhvyZ
 7AmouxyV1qVUytZ8Hz5Pw==
UI-OutboundReport: notjunk:1;M01:P0:ji16oKTTWMQ=;y3id4v0FNMwgcip0kmClgX5c997
 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
 11pdkTqM=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 10:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122157

SoundCard is a library for playing and recording audio without resorting t=
o a CPython extension.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 .../python/python3-soundcard_0.4.5.bb         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_=
0.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
new file mode 100644
index 0000000000..5116892dad
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Python library for accessing soundcards"
+DESCRIPTION =3D "SoundCard is a library for playing and recording audio w=
ithout resorting to a CPython extension"
+HOMEPAGE =3D "https://github.com/bastibe/SoundCard"
+SECTION =3D "devel/python"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b04=
2c"
+
+SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08=
f54b832a56946aa"
+
+inherit pypi setuptools3 features_check
+
+REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
+
+RDEPENDS:${PN} +=3D " \
+    libpulse \
+    pulseaudio-server \
+    python3-cffi \
+    python3-numpy \
+"
=2D-=20
2.52.0


