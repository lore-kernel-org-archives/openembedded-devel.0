Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F36C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:43:32 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
 by mx.groups.io with SMTP id smtpd.web10.77217.1752497005533202497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=NnIVDCgc;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.182, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1752497003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hRnW/ZRHGSjf5EoDCOLYnoeVwP2s5PkpFtJK0U1vEWw=;
	b=NnIVDCgcsxFbVBQPyriLbkR/oVm1CSvKWpRoamW6v/kraNYVuh+E0sqfvGNQB8xq51tIbo
	NF1FXKLTGnwbfm8gqsFhpJYCthU8mwdvPnH3fh2oUeauRhQKY5EaHamFhafZpB6VyXajF7
	VD+5H19/I+P7bQq8ZRh9R9VCGfOTcNM=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-vector: add initial recipe for version 1.6.2
Date: Mon, 14 Jul 2025 14:42:33 +0200
Message-ID: <20250714124233.3427031-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 12:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118530

Add support for the python3 vector library. Vector is a Python
library for 2D and 3D spatial vectors, as well as 4D space-time
vectors. It is especially intended for performing geometric
calculations on arrays of vectors, rather than one vector at a time
in a Python for loop.

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-vector_1.6.2.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-vector_1.=
6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.6.2.bb =
b/meta-python/recipes-devtools/python/python3-vector_1.6.2.bb
new file mode 100644
index 0000000000..9452a838b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-vector_1.6.2.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Python library for arrays of 2D, 3D, and Lorentz vectors"
+DESCRIPTION =3D "\
+    Vector is a Python library for 2D and 3D spatial vectors, as well as=
 4D space-time vectors. \
+    It is especially intended for performing geometric calculations on a=
rrays of vectors, rather \
+    than one vector at a time in a Python for loop.\
+"
+HOMEPAGE =3D "https://github.com/scikit-hep/vector"
+BUGTRACKER =3D "https://github.com/scikit-hep/vector/issues"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2963f0dc7a24919505850460dd1a7=
85b"
+
+DEPENDS +=3D "python3-hatch-vcs-native"
+
+SRC_URI[sha256sum] =3D "6e59d9db8b615016fa542a2e8150d0c819046fe6940badd2=
67811a454a7f0eca"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} +=3D "\
+    python3-numpy \
+    python3-packaging \
+"
--=20
2.47.2


