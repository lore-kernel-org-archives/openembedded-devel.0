Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A78C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:46 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
 by mx.groups.io with SMTP id smtpd.web10.62240.1707137925952261618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=mHvEUEox;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.183, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mj2nYZkzxoXGSgcMJ0rpFzOmhiTKS0Pn/ess3ncsNYM=;
	b=mHvEUEoxBwPEDd1QeQfN3TaYxQiSmPDQKtRPy2rc+7bOyCI4yUyfcbHCayPa5/BSgPPQ/z
	LKLLZtqqVD9nZY6J2rC6m8fOAbData1ImbiuKhSIHZm7TsfqDG2Z3lYWmyWy0q3K+AsyAW
	Pt+bpZMpUcvvA3KEabZe7rXEAeaP1z8=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 3/5] python3-sniffio: add recipe for v1.3.0
Date: Mon,  5 Feb 2024 13:58:27 +0100
Message-Id: <20240205125829.152301-4-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
References: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108570

Sniff out which async library your code is running under. This recipe
uses pypi as source:

	https://pypi.org/project/sniffio/

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../recipes-devtools/python/python3-sniffio_1.3.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sniffio_1=
.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb=
 b/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
new file mode 100644
index 000000000..448ac34f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sniffio_1.3.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Sniff out which async library your code is running under"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT | Apache-2.0"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE;md5=3Dfa7b86389e58dd4087a8d2b833e5fe96 \
+    file://LICENSE.MIT;md5=3De62ba5042d5983462ad229f5aec1576c \
+    file://LICENSE.APACHE2;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] =3D "e60305c5e5d314f5389259b7f22aaa33d8f7dee497631192=
34af3755c55b9101"
--=20
2.40.1


