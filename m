Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB5CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 07:22:53 +0000 (UTC)
Received: from out-212.mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
 by mx.groups.io with SMTP id smtpd.web10.10529.1695280970628203332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 00:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=ro1XMNj7;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.212, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1695280968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ykqgnuigazaQCw41kTiqAEjv7t3YC43WsxqUOFHbNe4=;
	b=ro1XMNj7Xpn2dvmiR+RdoFVr3g/B5Q7eEq2FnWNozmuTkxIn6qurBafUxqRSgS3+c2jpPP
	Hs3xJab8kWPThdmRX7mNNyUKh5mx1nHGTbYYi0LF66d6iatP0P5M5No9gb+vs2IwnpKULY
	GgACjH+C/ztgA1LqOmK1QLLacW9PF3A=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-autoflake: add recipe for v2.2.1
Date: Thu, 21 Sep 2023 09:22:43 +0200
Message-Id: <20230921072243.311712-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 07:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105038

autoflake is a python library which removes unused imports and unused
variables from Python code. This recipe uses pypi as source:

	https://pypi.org/project/autoflake/

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-autoflake_2.2.1.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-autoflake=
_2.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-autoflake_2.2.1.=
bb b/meta-python/recipes-devtools/python/python3-autoflake_2.2.1.bb
new file mode 100644
index 000000000..7b7430866
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-autoflake_2.2.1.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Removes unused imports and unused variables"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D88246be6a34c1496c253f58599f3d=
b85"
+
+SRC_URI[sha256sum] =3D "62b7b6449a692c3c9b0c916919bbc21648da7281e8506bcf=
8d3f8280e431ebc1"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} +=3D "python3-pyflakes"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.40.1


