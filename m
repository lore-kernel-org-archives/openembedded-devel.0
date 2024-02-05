Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE73C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:46 +0000 (UTC)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
 by mx.groups.io with SMTP id smtpd.web11.61801.1707137924890271732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=ryPw/4H7;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.175, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfAvYp76devZQc3OKkJCFAGm1s+XIAkjA0wrzpUCF/s=;
	b=ryPw/4H7ajqXLDRnpyIPd0lIE1Y3Fy0XKaRJLyJdR2DTMbkK+xq3KB/+gVcxnbdZlkR9DL
	jtt00B89Wh7Y3ycqLG1b4Vff1hU/5q2too+dlf6V0eiNpzsQDDp8RM45Nk1Aqa3wcLpgCi
	VSf1Ap0JN0P1VleK4GVcS2hMUcVLTTw=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 2/5] python3-anyio: add recipe for v4.2.0
Date: Mon,  5 Feb 2024 13:58:26 +0100
Message-Id: <20240205125829.152301-3-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
References: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108569

High level compatibility layer for multiple asynchronous event loop
implementations.

This recipe is currently provided without trio support, as the author
has no use for it and it would require to add a new python3-trio recipe.

This recipe uses pypi as source:

    https://pypi.org/project/anyio

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-anyio_4.2.0.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-anyio_4.2=
.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb b=
/meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb
new file mode 100644
index 000000000..0bf907de7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.2.0.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "High level compatibility layer for multiple asynchronous ev=
ent loop implementations"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0a769411d2af7894099e8ff75058=
c9f"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] =3D "e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6=
e64c9be77e3be50f"
+
+DEPENDS +=3D " \
+	python3-setuptools-scm-native \
+"
+
+# Don't provide "trio" PACKAGECONFIG as nothing provides "python3-trio" =
currently.
+# If somebody needs this please feel free to add python3-trio and enable=
 the
+# packageconfig below:
+#PACKAGECONFIG ??=3D ""
+#PACKAGECONFIG[trio] =3D ",,,python3-trio"
+
+RDEPENDS:${PN} +=3D "\
+    python3-idna \
+    python3-sniffio \
+"
--=20
2.40.1


