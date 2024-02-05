Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1B5C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:56 +0000 (UTC)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
 by mx.groups.io with SMTP id smtpd.web11.61802.1707137929707976691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=iH131qTo;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.184, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56pgujGwtufnqMpCYbttmwjKDzzmHnKslHc/fQsTy88=;
	b=iH131qTosw/vs1tK6VQz1TtOHzGaBAfQB+ajww7IdK+jZmzqrqOiGgbeqzaaN7SUK4gHm7
	4egCCCPGG06ctj8Iwh1p0aCVLhILHNShG+pFeUFAuQOE0XxuQ0vpZigQXsxFii4hyjRo9i
	lxecd8rRRFq91K1GDeCnbog3tU3yVzo=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 5/5] python3-httpx: add recipe for v0.26.0
Date: Mon,  5 Feb 2024 13:58:29 +0100
Message-Id: <20240205125829.152301-6-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
References: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108572

The next generation HTTP client. This recipe uses pypi as source:

    https://pypi.org/project/httpx

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-httpx_0.26.0.bb            | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httpx_0.2=
6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb =
b/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
new file mode 100644
index 000000000..9abd13e2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
@@ -0,0 +1,44 @@
+SUMMARY =3D "A next generation HTTP client for Python."
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dc624803bdf6fc1c4ce39f5ae11=
d7bd05"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] =3D "451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced=
6ff69ad37ec1dfaf"
+
+DEPENDS +=3D "\
+    python3-hatch-fancy-pypi-readme-native \
+"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[brotli] =3D ",,,python3-brotli"
+PACKAGECONFIG[http2] =3D ",,,python3-h2"
+PACKAGECONFIG[socks] =3D ",,,python3-socksio"
+
+RDEPENDS:${PN} +=3D "\
+    python3-anyio \
+    python3-certifi \
+    python3-httpcore \
+    python3-idna \
+    python3-sniffio \
+"
+
+PACKAGES +=3D "\
+    ${PN}-cli \
+"
+
+RDEPENDS:${PN}-cli +=3D "\
+    ${PN} \
+    python3-click \
+    python3-pygments \
+    python3-rich \
+"
+
+FILES:${PN} =3D "\
+    /usr/lib/python${PYTHON_BASEVERSION} \
+"
+
+FILES:${PN}-cli =3D "\
+    /usr/bin/httpx \
+"
--=20
2.40.1


