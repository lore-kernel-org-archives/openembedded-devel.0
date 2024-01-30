Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FBCC47DDF
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 21:08:18 +0000 (UTC)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
 by mx.groups.io with SMTP id smtpd.web10.8162.1706648890593215994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=DetKj9E+;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.175, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1706648888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NsVWMmpWp1P1jL2+l5mUns3y7LEwFSzuhZVUuI1s3t0=;
	b=DetKj9E+jFYdDEoq23Gl7tEyy0xv8/x9wV/54BvQmu+3IFLAaQqWUTiAYLtNw+AIs/N1OI
	2d2mCthq8NGxYz1BuoOlzu7OfQU+r8RFGSXrbPzGA9uh/HYP5sqVJJNHtJPFwNfl7kp9cE
	GPtxYlpxfS4O2nxeGwxVNKq+VIuTVyo=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH v2] python3-janus: add recipe for v1.0.0
Date: Tue, 30 Jan 2024 22:07:34 +0100
Message-Id: <20240130210734.493630-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 21:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108502

janus is a python library providing a mixed sync-async queue to
interoperate between asyncio tasks and classic threads. This recipe uses
pypi as source:

	https://pypi.org/project/janus/

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-janus_1.0.0.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-janus_1.0=
.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb b=
/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
new file mode 100644
index 000000000..c709bcfbf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-janus_1.0.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Mixed sync-async queue to interoperate between asyncio task=
s and classic threads"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D23878c357ebb4c8ce1109be365043=
349"
+
+SRC_URI[sha256sum] =3D "df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3a=
d0e10de058cb1612"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} +=3D "\
+    python3-asyncio \
+    python3-threading \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.40.1


