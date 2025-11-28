Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81C7D116F3
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 11:58:09 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14470.1764331085896500381
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 03:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=nOSOCBJ/;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764331082; x=1764935882; i=jan.claussen10@web.de;
	bh=ac6NLVgNYCFsWuZdd5q+ZKgyhwdf1KHI5qH9qRThAoY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nOSOCBJ/zDTl/ZyXUFb85PwJtVBJjwW2Nf15GHzR3dDYV/5fcmaoLoPf4TvV2e8I
	 VR7yTbM8qVfvwU+d3goczA5mdkCggxx1jCJM+j7Ut8AToFtYev32SczGwB4XNHEFE
	 HjLndA3y0TrNxqTjdYfIVxqvEjdHxmGPoETdd5jS04oOy8mvZNwVMT0bqWhUJOajx
	 5x7Ub1dt6ZKxOIw9jQwMr404NnYcVcIceECWIU1s2Ej7N+jFfG2Tk0t6rkS7v4yfl
	 XFCYaOeWzKHU98jm0FsN8ArVpwrxIHzj6y1MOXmre1yzgfGDYXpmXdfjTWTRCh0fr
	 3y7NGdUeVwFw8kCQJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810.fritz.box ([192.196.196.197]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MzCEB-1wKN5d2NMp-00sAyq; Fri, 28 Nov 2025 12:58:02 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [meta-python][master][PATCH] python3-soundcard: Add recipe
Date: Fri, 28 Nov 2025 12:58:00 +0100
Message-ID: <20251128115800.2757259-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SmywsEg0tWRIiteX5h8MfHSbNYnjnQqBqTcTogFjUjJyKw4P7e8
 CuP1t6HDiOln9O5e1ZHOMWct8c/DdkrSIRQ4iT3DeE9/rRUgZSdCn+WmZvWQ7FJ78OSIHec
 d4eXWTD57NNWgkO4gmeg/tBH63lCL/glj+dD4l6SCymlkg2vVc3YbLvDjDEI1eOHz5psw0F
 Abi87QeJgo5+Xu1NLWf4g==
UI-OutboundReport: notjunk:1;M01:P0:aoOXgjrbjWM=;Ek8FvUV2YTbDM5k+6xc6rhVvlk4
 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
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 11:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122121

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_=
0.4.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
new file mode 100644
index 0000000000..632b54eaef
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Python library for accessing soundcards"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b04=
2c"
+
+SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08=
f54b832a56946aa"
+
+inherit pypi setuptools3
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


