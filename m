Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFE8C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:01:52 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47266.1789992106351823777
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=dwXMnFSL;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout07.t-online.de (Postfix) with SMTP id 4F032E05B
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 14:01:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8chq-1YmOCu0; Mon, 21 Sep 2026 14:01:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][RFC][PATCH 1/2] python3-cucumber-expressions: add recipe
Date: Mon, 21 Sep 2026 14:00:57 +0200
Message-ID: <20260921120058.55586-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789992070-B27FB9BA-F5397366/0/0 CLEAN NORMAL
X-TOI-MSGID: cf7474c6-bae0-4baa-a06d-e5833b45a23b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789992073; i=f_l_k@t-online.de;
	bh=Ny/jYUaPGb0ylYTg6ULtOyGdZoDWV2f3XztlED0rpds=;
	h=From:To:Subject:Date;
	b=dwXMnFSLJu+1nWrmKcxVHE2+ZyomVbCE3RxsVWjDo96B+WAICjhIQmXNt5okHxfGC
	 +Mgd4rcLOy8Qrut1rD3zHWagPHFhinmaS+JhPXTPPP2FEPhq1Uuh6TMKYduEt6vRwh
	 ZV3sL/aMlMEQmRPWtN1nSxxxYp5jPVl4cU4n2zgnEWynsXUGY42TqIYyk48BaMQzTQ
	 UHAiBmC/kg5yb8kPBLkFDJ/VDkuJo90HRKs8gU9+xJINZl8vBTJFVN6HbTPf35PDcO
	 X6IaqLXpWHcguKH8u3ViHMBY55Sr9VOmne33bpTy1Dhk29BzGeqoneIVmGMmwWivHW
	 +nJliGPy/+D4A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130156

cucumber-expressions provides the step-matcher expression parser that
behave requires from 1.4 onwards. Pure Python, no runtime dependencies
beyond the standard library, built with the uv backend that is already
used for python3-cucumber-tag-expressions.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
---
 .../python3-cucumber-expressions_20.1.0.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cucumber-=
expressions_20.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-express=
ions_20.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-exp=
ressions_20.1.0.bb
new file mode 100644
index 0000000000..ffce52f03b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20=
.1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Cucumber Expressions - a simpler alternative to Regular Exp=
ressions"
+DESCRIPTION =3D "Provides the cucumber-expression parser and matcher use=
d by cucumber/behave"
+HOMEPAGE =3D "https://github.com/cucumber/cucumber-expressions"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b2bb1048cefa23c375b8ce5f1331=
3ea"
+
+SRC_URI[sha256sum] =3D "0d216ec26e36c71b3e5643f2e72c41f9b266ef04eaa0c7e4=
7a6e3b2caf523b1a"
+
+inherit pypi python_uv_build
+
+PYPI_PACKAGE =3D "cucumber_expressions"
+
+RDEPENDS:${PN} +=3D " \
+    python3-core \
+    python3-numbers \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.55.0


