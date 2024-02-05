Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF757C48299
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:56 +0000 (UTC)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
 by mx.groups.io with SMTP id smtpd.web10.62241.1707137927592547387
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=qTXYzCWU;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.171, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nee7Cwk/pfa8BqWRVczOokkCSMVny9CJi2I+lTWeZkY=;
	b=qTXYzCWU8tOJCrBo6EcHr+tEJqNw6n2gbg4TvN8ARsr59WI44MHevE9kjm18B5i87kPCfD
	MVXtkiKJNFbaLT2pAt32ZfRvvJFvZWmH7ir1VmyWNrCTnMwxZDIAqbtvy8GT14wtci17xy
	LUr/9DOdLhQk9mALnHsVHI8BsClHJaM=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 4/5] python3-httpcore: add recipe for v1.0.2
Date: Mon,  5 Feb 2024 13:58:28 +0100
Message-Id: <20240205125829.152301-5-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
References: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108571

A minimal low-level HTTP client.

This recipe is currently provided without trio support, as the author
has no use for it and it would require to add a new python3-trio recipe.

This recipe uses pypi as source:

	https://pypi.org/project/httpcore

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httpcore_=
1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.2.b=
b b/meta-python/recipes-devtools/python/python3-httpcore_1.0.2.bb
new file mode 100644
index 000000000..3bfe5ed4a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.2.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "A minimal low-level HTTP client."
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D1c1f23b073da202e1f4f9e4264=
90210c"
+
+inherit pypi python_hatchling
+
+SRC_URI[sha256sum] =3D "9fc092e4799b26174648e54b74ed5f683132a464e95643b2=
26e00c2ed2fa6535"
+
+DEPENDS +=3D "\
+    python3-hatch-fancy-pypi-readme-native \
+"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[http2] =3D ",,,python3-h2"
+PACKAGECONFIG[socks] =3D ",,,python3-socksio"
+PACKAGECONFIG[asyncio] =3D ",,,python3-anyio"
+# Don't provide "trio" PACKAGECONFIG as nothing provides "python3-trio" =
currently.
+# If somebody needs this please feel free to add python3-trio and enable=
 the
+# packageconfig below:
+#PACKAGECONFIG[trio] =3D ",,,python3-trio"
+
+RDEPENDS:${PN} +=3D "\
+    python3-certifi \
+    python3-h11 \
+"
--=20
2.40.1


