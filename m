Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B96C48298
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:58:46 +0000 (UTC)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
 by mx.groups.io with SMTP id smtpd.web11.61798.1707137921071009401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=v46b+ByT;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.172, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707137918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EROVfBwPlcmFoWYvEPiB2slkD0m3XBDFE/GwnBDDqII=;
	b=v46b+ByTgfaFyhZugjpDslLxLQTVZq2zaNmwEatltfaP0y/heU5uaccOmpRVxw6EBXC8DL
	UD5UPJh4GG/l+WHEwPfm/K0MliXZvNKjrxXgcMxojig0fpqfswQri6bprQk0Ds2xRT7zwL
	/U1y1i35gBoJ4QClPRSBsk1EXYPzqy4=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH 0/5] Add python3-httpx support
Date: Mon,  5 Feb 2024 13:58:24 +0100
Message-Id: <20240205125829.152301-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108567

This series adds support for python3-httpx and its dependencies.

Richard Leitner (5):
  python3-socksio: add recipe for v1.0.0
  python3-anyio: add recipe for v4.2.0
  python3-sniffio: add recipe for v1.3.0
  python3-httpcore: add recipe for v1.0.2
  python3-httpx: add recipe for v0.26.0

 .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
 .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
 .../python/python3-httpx_0.26.0.bb            | 44 +++++++++++++++++++
 .../python/python3-sniffio_1.3.0.bb           | 12 +++++
 .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
 .../python/python3-socksio_1.0.0.bb           | 10 +++++
 6 files changed, 136 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-anyio_4.2=
.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-httpcore_=
1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-httpx_0.2=
6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sniffio_1=
.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-socksio/0=
001-Unpin-flit-core-dependency.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-socksio_1=
.0.0.bb

--=20
2.40.1


