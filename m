Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036B5C48299
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:47 +0000 (UTC)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
 by mx.groups.io with SMTP id smtpd.web10.62239.1707137923472456880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=wySDAQud;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.175, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvonjSZr/F0sKbnuUBzZD+36rzrHeIZwVGgv4NqW75Y=;
	b=wySDAQudfNCOfGoBjv3GCfFgljcDIt27KiipoJXL7P7GjW8OrvM4tsc1cRaaoDM320GBLG
	7pLCXELNpeqEzFIEj7mJnIErUE1fXmu08HSPg/+6CxTDGbzIfUY9cPfiw8s/3diWXJNCUj
	iWFkjp6XzB+phiAXU8AZwz0dOKTFRTg=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 1/5] python3-socksio: add recipe for v1.0.0
Date: Mon,  5 Feb 2024 13:58:25 +0100
Message-Id: <20240205125829.152301-2-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
References: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108568

Sans-I/O implementation of SOCKS4, SOCKS4A, and SOCKS5. This recipe uses
pypi as source:

	https://pypi.org/project/socksio

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++++++++++++
 .../python/python3-socksio_1.0.0.bb           | 10 +++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-socksio/0=
001-Unpin-flit-core-dependency.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-socksio_1=
.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-socksio/0001-Unp=
in-flit-core-dependency.patch b/meta-python/recipes-devtools/python/pytho=
n3-socksio/0001-Unpin-flit-core-dependency.patch
new file mode 100644
index 000000000..75be61fc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-socksio/0001-Unpin-flit=
-core-dependency.patch
@@ -0,0 +1,21 @@
+From 5c50fd76e7459bb822ff8f712172a78e21b8dd04 Mon Sep 17 00:00:00 2001
+From: Theodore Ni <3806110+tjni@users.noreply.github.com>
+Date: Sun, 13 Aug 2023 09:21:49 -0700
+Subject: [PATCH] Unpin flit-core dependency
+
+Upstream-Status: Submitted [https://github.com/sethmlarson/socksio/pull/=
61]
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 2d6c5a3..60c63ea 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires =3D ["flit_core >=3D2,<3"]
++requires =3D ["flit_core >=3D2"]
+ build-backend =3D "flit_core.buildapi"
+=20
+ [tool.flit.metadata]
diff --git a/meta-python/recipes-devtools/python/python3-socksio_1.0.0.bb=
 b/meta-python/recipes-devtools/python/python3-socksio_1.0.0.bb
new file mode 100644
index 000000000..4353a52ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-socksio_1.0.0.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Sans-I/O implementation of SOCKS4, SOCKS4A, and SOCKS5."
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0b4dda8edb09eec767aaded3cbf8f=
6b1"
+
+inherit pypi python_flit_core
+
+SRC_URI +=3D "file://0001-Unpin-flit-core-dependency.patch"
+
+SRC_URI[sha256sum] =3D "f88beb3da5b5c38b9890469de67d0cb0f9d494b78b106ca1=
845f96c10b91c4ac"
--=20
2.40.1


