Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B383AEB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:03:53 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.5789.1687780022915115743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 04:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=nF+v/tRR;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687780021;
	bh=nqpWWtQDzpnAljCChFAvDZ8A/9TK0CjTLeqtaOz7CmM=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=nF+v/tRRdwxhyWeIEK45O2V7M1nFAU8GQpWLGPCGyF6ImIiu+TuQICkYCOBznXZDL
	 oPUUJfsLsY/L6UMoCdzuZkJjj069laxeZux8BaydES+vmbueyDMlugzDvD1RrVCEI+
	 DezMawXN2WNzYDP3g3BStLDcQNK7BNmff+B0pMAG9xWi514Oson7C0s+c4kXYJQram
	 1aVvLGiDQA8WxJPmJwV81mYtgVFtCKDcHdRz9A0LR1Dgi1GUWMQf4ECpMNShlYDeua
	 CeYvsBR6TslRIyQLYvJfger1md0Ol2bZed4aUPCnHH0EHMaj3r0R7x+gVuuZLEcpvx
	 ocBoON+tzqcqQ==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 2/5] python3-filelock: Add initial recipe 3.12.0
Date: Mon, 26 Jun 2023 13:45:30 +0200
Message-ID: <20230626114533.221953-2-jasper@fancydomain.eu>
In-Reply-To: <20230626114533.221953-1-jasper@fancydomain.eu>
References: <20230626114533.221953-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103579

Dependency for python3-virtualenv and python3-tox

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-filelock_3.12.0.bb         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock_=
3.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.12.0.=
bb b/meta-python/recipes-devtools/python/python3-filelock_3.12.0.bb
new file mode 100644
index 0000000000..8deca31b5b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.12.0.bb
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: MIT
+# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
+
+SUMMARY =3D "A single module, which implements a platform independent fi=
le lock in Python, which provides a simple way of inter-process communica=
tion"
+HOMEPAGE =3D "https://py-filelock.readthedocs.io/"
+LICENSE =3D "Unlicense"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d695d=
19f"
+
+SRC_URI[sha256sum] =3D "fc03ae43288c013d2ea83c8597001b1129db351aad9c57fe=
2409327916b8e718"
+
+UPSTREAM_CHECK_URI =3D "https://pypi.org/project/lockfile/"
+UPSTREAM_CHECK_REGEX =3D "/lockfile/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND =3D "native nativesdk"
+inherit pypi python_hatchling
+
+DEPENDS +=3D "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
--=20
2.41.0


