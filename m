Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1930BC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:41:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.2124.1634251286322839545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=CFbbaDkV;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7E9828365D;
	Fri, 15 Oct 2021 00:41:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634251284;
	bh=jxMowXCbBF4qoxJQJMqP6ym5W2J1eU6ADDJhVeydHAs=;
	h=From:To:Cc:Subject:Date:From;
	b=CFbbaDkVBbIDwbxoMPAtM5OgsIDAl6fO5L2OAi/ZjQS4yQ+PLybanFJDM2J854Qw1
	 l8O27vKVr3M+Ov/BS+rSFj52jYploEQUV7Jhvd8YSJmJ3rErapXK7Uxt0BuzbrxTVH
	 gSvkcK0fDv6A0x41eHGfQ/74+RTeZwruQyAMCRuS9nQfE427huVLcmEIXHmX2wVPse
	 iILLS4zJaGa1k0wWWEfFZ3/MzSJFVzEVk6hRqQ3JOcCCwGs9G1Z8lHBi6bLvs/Rz0a
	 2l1qYkHuWeUECCB9nw7JkktcDh8ZpLYXbQUeq+bQiIQX1aLzO6QDYkYAChO4rgkJEP
	 iAF8I0wdZU9KA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Conditionally enable X11 support
Date: Fri, 15 Oct 2021 00:41:20 +0200
Message-Id: <20211014224120.84927-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93312

In case DISTRO_FEATURES contain both x11 and opengl, enable X11 support
in apitrace, because all the requirements are satisfied.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_10.0.bb
index 57ec1f8e0..f097f78a9 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -13,12 +13,13 @@ SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git \
 S =3D "${WORKDIR}/git"
=20
 DEPENDS +=3D "zlib libpng python3-native"
+DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'li=
bx11', '', d)} "
=20
 inherit cmake
=20
 EXTRA_OECMAKE +=3D "\
     -DENABLE_GUI=3DOFF \
-    -DENABLE_X11=3DOFF \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', '-DENABLE_X11=3D=
ON', '-DENABLE_X11=3DOFF', d)} \
     -DENABLE_STATIC_LIBGCC=3DOFF \
     -DENABLE_STATIC_LIBSTDCXX=3DOFF \
     -DPython3_ROOT_DIR=3D/usr/bin/python3-native \
--=20
2.33.0


