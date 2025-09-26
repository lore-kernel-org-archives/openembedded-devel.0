Return-Path: <mo.krautwald@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2602CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:30:32 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web10.18817.1758897028423219847
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=Ocj1U+rZ;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=DMrKzxru;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: mo.krautwald@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cYCfn6zCvz9sWC
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 16:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758897026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JymKzvUatQm197w9IEUzPQhsdrxeSsWm3vOS3qbhrNo=;
	b=Ocj1U+rZW+r1DWnlt/yTu3ZMZCpCSHe9XZcvvUJzy9ES8xLYqHZgxFQdei3srlyxnGLVq9
	v6wFY3Rr1LmutuNe7bpSp3xCADo+R+yBvpqa1c9r+XbarrA0/++dL4hAYuK1TJExPXvB9m
	qf97XsiLZ6sEzLbpR75ueRmmEcwd59s+XoExMZV/4RyF9CKlddh61lAcF+rUnyKL+M43gU
	4nQHn0ikvs2YN/kZR6L8eCqeRt4erCbhWJCIPRZ45Lxu5ERrtMwv5pLMB2W23+gPAOR2xP
	hma76QAZN/ePsEGEPJPhBVsC2AI8cCmDzqhJMtZISXIyHaaIYX1iNm8EKmp7Kg==
From: Mo Krautwald <mo.krautwald@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758897023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JymKzvUatQm197w9IEUzPQhsdrxeSsWm3vOS3qbhrNo=;
	b=DMrKzxruPYCNMz540FE25q2c8SHROMdTTPoBUZW75IpqgHbhrsTtR1EZ2q7ZUsnADU5jUo
	OnXg5Qys2+toEeQONNmh2XC/r/D7uKKKN0eXbhBfe2zBxG7mRWphGMO8DspPPvA5KYl8+2
	if8I8Jo9w0JzH8d4zD/u8+IQhZM6ToWcMrOEzhuRmv+Gua+4yHQTacldSuOYAnJZi6xGm9
	huJf+IF+09XzsKjMJgiB2L2/BaXuALhfdsmd+4j8QNrYHjwD2R0zxOVQ/R1F/kRLciRPQ0
	TaazHkTNIJX9+/HPQ5Y7vY6HoQL3U4zYBCosE/aqu/ZnlH5fwzf5PtDEppMAOA==
To: openembedded-devel@lists.openembedded.org
Cc: Mo Krautwald <mo.krautwald@mailbox.org>
Subject: [meta-python][PATCH] package pipx
Date: Fri, 26 Sep 2025 16:28:32 +0200
Message-ID: <20250926142922.627071-1-mo.krautwald@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 85a27770a706599b8d9
X-MBO-RS-META: 1ujikcnrgqd48tzenwfcsn64j17i1n3g
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119930

Package pipx und its unpackaged dependency userpath
---
 .../python/python3-pipx_1.7.1.bb              | 21 +++++++++++++++++++
 .../python/python3-userpath_1.9.2.bb          | 14 +++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pipx_1.7.=
1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-userpath_=
1.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb b/=
meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb
new file mode 100644
index 0000000000..2a04624c1d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pipx_1.7.1.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "pipx - Install and Run Python Applications in Isolated Envi=
ronments"
+HOMEPAGE =3D"https://pipx.pypa.io/stable/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35c8e045b3a9ac6e7b19f25cb6cc0=
8bd"
+
+SRC_URI[md5sum] =3D "7b2bd7c1397e74e7e7beb04b121702c4"
+SRC_URI[sha256sum] =3D "762de134e16a462be92645166d225ecef446afaef534917f=
5f70008d63584360"
+
+PYPI_PACKAGE =3D "pipx"
+
+DEPENDS +=3D "python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} +=3D " \
+    python3-argcomplete \
+    python3-packaging \
+    python3-platformdirs \
+    python3-userpath \
+"
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-userpath_1.9.2.b=
b b/meta-python/recipes-devtools/python/python3-userpath_1.9.2.bb
new file mode 100644
index 0000000000..b6d6280866
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-userpath_1.9.2.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "userpath - a tool for modifying a user's PATH"
+HOMEPAGE =3D"https://github.com/ofek/userpath"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D35c8e045b3a9ac6e7b19f25cb6cc0=
8bd"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db2d8ecec3b363659695a29c2d=
11c8a88"
+
+SRC_URI[md5sum] =3D "0bcebc971ce7fb38aa3fde3b137d39e2"
+SRC_URI[sha256sum] =3D "6c52288dab069257cc831846d15d48133522455d4677ee69=
a9781f11dbefd815"
+
+PYPI_PACKAGE =3D "userpath"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} +=3D " python3-click "
--=20
2.51.0


