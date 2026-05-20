Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB674CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:29:59 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8345.1779269389315996812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 02:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Od1gl6GC;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout07.t-online.de (Postfix) with SMTP id 52D11E281
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 11:29:47 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.167.29]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wPd8V-0d42m90; Wed, 20 May 2026 11:22:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pycurl: use pep517 for packaging
Date: Wed, 20 May 2026 11:22:36 +0200
Message-ID: <20260520092236.1882798-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779268964-B37FDF83-B75D3B8B/0/0 CLEAN NORMAL
X-TOI-MSGID: 138e39a4-4151-4ad6-b28a-2a5bf73647b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779269387; i=f_l_k@t-online.de;
	bh=hf+wrg4HOzcZmXmZbIJhgEhwfvdGDNBawA5QgPK+BGI=;
	h=From:To:Subject:Date;
	b=Od1gl6GCLVs7HxxfiCu4UxJSXSDf8SMu2P728wkJ/6zP8Vf0Zu2XO5VFjqoez+t3H
	 F+6zmRu9CMw2JKLBuCBl0qlGJ7gBA+vseyRoW6ATIKqXvjjoaaII0aMxayLxMZ+MKO
	 P2UgWVsU45a9Xi1s6SNWsbLfjeeDYU5xUXnemxJX4PCNSr9Mi5NhfCflvMfmI59FxC
	 0jYmdKvD6USk66XZQysluZp9d7bgbhZCaZo5AaOV3uks2Hcy0d+QeTO+PssfXCA8/U
	 WccdK8o+35p38pwMkYsKys8JHZQPQ+LVI/IpoAoFRZsEd4cq9f45Qa/Oszq/bIDN0P
	 m1SFh9s9JcpxQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127107

This avoids:
WARNING: python3-pycurl-7.46.0-r0 do_check_backend: QA Issue: inherits se=
tuptools3 but has pyproject.toml with setuptools.build_meta, use the corr=
ect class [pep517-backend]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb=
 b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
index 8bcd65309d..fa98ad1e03 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
@@ -16,6 +16,6 @@ SRC_URI[sha256sum] =3D "422ed7005b98768fe60fe6b6cb8bb6a=
4e1fc18b5433402e8fbdaba9181
=20
 DEPENDS =3D "curl"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND  +=3D "native nativesdk"
--=20
2.54.0


