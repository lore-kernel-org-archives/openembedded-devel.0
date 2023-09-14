Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10973EEAA69
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:32:13 +0000 (UTC)
Received: from out-223.mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
 by mx.groups.io with SMTP id smtpd.web11.3812.1694719928892794159
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 12:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=poL4/wyv;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.223, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1694719926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gp9ta3cEZKuNEUx6mHIaboCZM0GeON6QAgsGS3d9xkc=;
	b=poL4/wyvbvIqg+qEq/MuxeNWjcehuPq/VG4inXowoWmj6PklEupIGmyMZFgcxGDKAFJ2L6
	BbHOfx6melpge1gKijmB7MRHedulJLpgUtoQ0kc+vXzZNicqxcqxZtbyj5T5SEg5/UAxRR
	p6dPZQjGd6DtLYrlnRTONtwjHf05tcM=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: TicoTimo@gmail.com,
	derek@asterius.io,
	Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-shellingham: add recipe for v1.5.3
Date: Thu, 14 Sep 2023 21:31:03 +0200
Message-Id: <20230914193103.1853377-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 19:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104880

Shellingham is a python library to detect what shell the current
Python executable is running in. This recipe uses pypi as source:

	https://pypi.org/project/shellingham

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-shellingham_1.5.3.bb                | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-shellingh=
am_1.5.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-shellingham_1.5.=
3.bb b/meta-python/recipes-devtools/python/python3-shellingham_1.5.3.bb
new file mode 100644
index 000000000..aff5f24a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-shellingham_1.5.3.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Tool to Detect Surrounding Shell"
+SECTION =3D "devel/python"
+LICENSE =3D "ISC"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D78e1c0248051c32a38a7f820c30bd=
7a5"
+
+SRC_URI[sha256sum] =3D "cb4a6fec583535bc6da17b647dd2330cf7ef30239e05d547=
d99ae3705fd0f7f8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.40.1


