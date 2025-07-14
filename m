Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723EAC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:25:32 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
 by mx.groups.io with SMTP id smtpd.web11.77924.1752499525077502529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 06:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=Wis6Q7ED;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.181, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1752499522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tjSwEO1Sc68Gl8eLv2QlahF4NpfKI6BJDKEPus5khTc=;
	b=Wis6Q7EDqkmxDYsyFTk3VS8IVh3hEBrtnvTsNIu46fasVfbr0KDc/Xsu5dSuLZJDh+Ct7G
	3GBcfzBZAE7iugRWm5aQIU2L3Eq434Xuy7DjTI6P6VtA3Zc48l5kzdYMpdwsHVYpquGh02
	Abx1g6gO5FUo8ym5+W8O/g2M6hWMZTE=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-crc: add initial recipe for version 7.1.0
Date: Mon, 14 Jul 2025 15:25:07 +0200
Message-ID: <20250714132507.3571968-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 13:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118531

Add support for the python3 crc library to calculate CRC checksums,
verify CRC checksum using predefined CRC configurations or custom
CRC configurations.

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../recipes-devtools/python/python3-crc_7.1.0.bb    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-crc_7.1.0=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-crc_7.1.0.bb b/m=
eta-python/recipes-devtools/python/python3-crc_7.1.0.bb
new file mode 100644
index 0000000000..d0bd3972b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crc_7.1.0.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "Library and CLI to calculate and verify all kinds of CRC ch=
ecksums"
+DESCRIPTION =3D "\
+    Calculate CRC checksums, verify CRC checksum, predefined CRC configu=
rations, \
+    custom CRC configurations"
+BUGTRACKER =3D "https://github.com/Nicoretti/crc/issues"
+HOMEPAGE =3D "https://nicoretti.github.io/crc/"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df94c07350a9f2e0ce3a246fed=
3b32353"
+
+SRC_URI[sha256sum] =3D "99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f=
331052a41d66c07d"
+
+inherit pypi python_poetry_core
--=20
2.47.2


