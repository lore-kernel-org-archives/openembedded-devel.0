Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BF8EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:11:13 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web10.6086.1687781411168218490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 05:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=SGVmQy5g;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687781408;
	bh=ve13/I/TT3cfPLNQsl2h2cCyv/1wCMTUCUAEs7kKP9s=;
	h=From:To:Cc:Subject;
	b=SGVmQy5g18EBFbm2AW2gBYtVXD1vTGJUA0+xsi27ymcrV9/+3V6jtxcknII3J5LZ1
	 n0eWjURja4cGJPVXZrWRF3hUuRWTGY4q44ULtExx9TEHltKhwGmfIm2VkIFSdDW4I8
	 c7Sk3iPfgNeEaX+W0IuCfoSA64SrHOnE1IiF2SJOlGLIGuYoSZGqWypfNCLxjJVAk9
	 XuY9wbRP9LKzSpU26AjwEsqt1EtfZLJHZfc3Z5njOAnNXX87PHa5PtEFMyvxZE3z8q
	 mDlHcjs+gC3OsRHrSENRmht+OC3+tZssk7dC94evK98Fb2HOp8Bua/5/yOvYEwxlIX
	 N74mE1+1ZioNw==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH v2 1/3] python3-pytest-cov: Add initial recipe 4.1.0
Date: Mon, 26 Jun 2023 14:08:58 +0200
Message-ID: <20230626120900.224602-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103581

Dependency for python3-platformdirs 3.6.0 ptest

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-pytest-cov_4.1.0.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-co=
v_4.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
new file mode 100644
index 0000000000..1ff3e75cbe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Pytest plugin for measuring coverage."
+HOMEPAGE =3D "https://github.com/pytest-dev/pytest-cov"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3Dcbc4e25353c748c817db2daffe605e43 \
+"
+
+SRC_URI[sha256sum] =3D "3904b13dfbfec47f003b8e77fd5b589cd11904a21ddf1ab3=
8a64f204d6a10ef6"
+
+inherit pypi setuptools3
+
+DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


