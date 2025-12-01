Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28A1D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:59 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18823.1764585955538640886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 02:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=RpGSGWCW;
 spf=pass (domain: web.de, ip: 212.227.15.14, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764585953; x=1765190753; i=jan.claussen10@web.de;
	bh=/8cEVgV0/wdKN44os79R2qPwCCp30NLqD9qdiowuSVI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RpGSGWCWGkQjXF5x+ua1rDAZLBXxJJTAUwRQG2VZlej1QlbRkh6EgQGyjjwUDw8R
	 QT4D3e66tYnLUldYHDfBbFQKMj06F10YndEva6ffnKmjzJcOdjvBau9+80LnJifEh
	 E2w0LfM0E47ZNFuVqDeAmjKmewlY5xtD5RwiybatMkf/pnB/pG3D71EAL1fAIlnJv
	 /UbP8JICky3vFa/lNm+OTkoTUvz60jJiA+mDWppgSreX8AHOGwvPGteXeTxt7ZhPT
	 VGPqdqmx/fY2SuaAZRd/69EJpyOhWThoitoP6nOkD0tbrZ437al8Hbjksi3N2CVsf
	 qxzrbWSkkyEe7aF+tQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810.fritz.box ([46.22.14.193]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MbkWQ-1vwcc222da-00ZwaN; Mon, 01 Dec 2025 11:45:52 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [meta-python][master][PATCH] python3-mpv: Add recipe
Date: Mon,  1 Dec 2025 11:45:50 +0100
Message-ID: <20251201104550.175387-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rnr4fHVnCiQYwVSXHLEMjBeLCfhaNyHdyc/JQzY6L8H4SzJdMnT
 UtNlCdPjxN5CAZ41vG8u7zWveUu6YLF0Zrk2nTJu7dl0xGF1Kcdem8EFpGB4MPXkyM8E5z3
 W1uK2QuEXaEHHkszz9tCUWGVg3nvUt4twRuI0x3cg/O+DIbcCtiulps7JNK/EtGlk7OR3yT
 Xv1tkVqRUbI7aT2E5QYjw==
UI-OutboundReport: notjunk:1;M01:P0:Ra6xbLjweQQ=;CrlqeMPuyGk3OK9NBURcch30fEs
 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
 OI8tUnMh3vpOkvggQ=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 10:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122201

python-mpv is a ctypes-based python interface to the mpv media player.
=2D--
 .../recipes-devtools/python/python3-mpv_1.0.8.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mpv_1.0.8.=
bb

diff --git a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb b/me=
ta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
new file mode 100644
index 0000000000..c11ad4a118
=2D-- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Python bindings for mpv"
+DESCRIPTION =3D "python-mpv is a ctypes-based python interface to the mpv=
 media player"
+HOMEPAGE =3D "https://github.com/jaseg/python-mpv"
+SECTION =3D "devel/python"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
+
+SRC_URI[sha256sum] =3D "95dbd4d869cd8de7a27914ad33e776accc0f01cb82a6d5b31=
ca439ade2208ffb"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} +=3D "\
+    mpv \
+    python3-ctypes \
+"
=2D-=20
2.52.0


