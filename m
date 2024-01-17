Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E269C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 20:24:32 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.14628.1705523063287532373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 12:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=bzHCTzBx;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 41826240103
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 21:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705523061; bh=rfv0oe91cF3V7v1kD62jCFZw5QzzytifxD10yH2AApE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=bzHCTzBxRHuaZ0RsLE+by/1O/v+6nxL1NbzeOzupMo9rkq0ywtFhWp8BZHvltsmmX
	 bJQ6bQPWemSNPIEA1lREXJUj3Vexf0jP2V13aEj7ujwrIN08eI6q3ZpCc76qNHBvOG
	 KKUls71q9QHCPkkBCMi7gSltkJtqhkUC4P4knrE3GtKWrEErz6cLKAgmlgIdwEc9jb
	 UMP+0RJeRJhQfGmNt8QvC5U36HYV/NaLEZqvfvZBXcn9ywRbyDVYF63+rEv/orzIPH
	 uDppkMGD8lxccUKDkTPtb8ZdvwvYOnH84LA6ZcXngB4Q5hKJnAD91OI+rqDcD5U46I
	 3zS2nJZjYwr7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TFcmN4Wltz6txX;
	Wed, 17 Jan 2024 21:24:19 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [meta-oe][PATCH] open-cl: stop using "virtual/" in RPROVIDES
Date: Wed, 17 Jan 2024 20:24:05 +0000
Message-Id: <20240117202405.29013-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 20:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108339

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

For RPROVIDES and RDEPENDS the string "/virtual" holds no special meaning
and hence packages should avoid the use of "virtual/" there. Update it
for opencl to the suggested alternative "-virtual". See also the
discussion on the yocto docs mailing list:
https://lists.yoctoproject.org/g/docs/message/1785

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
 meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
index 93fac969c..d43ea281a 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -15,6 +15,6 @@ inherit autotools
=20
 DEPENDS =3D "ruby-native"
 PROVIDES =3D "virtual/opencl-icd"
-RPROVIDES:${PN} =3D "virtual/opencl-icd"
+RPROVIDES:${PN} =3D "virtual-opencl-icd"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
index 6bf01a248..146ec6e47 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
@@ -9,7 +9,7 @@ inherit pkgconfig cmake
 DEPENDS +=3D "opencl-headers"
=20
 PROVIDES =3D "virtual/opencl-icd"
-RPROVIDES:${PN} =3D "virtual/opencl-icd"
+RPROVIDES:${PN} =3D "virtual-opencl-icd"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


