Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EC3C38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 14:24:37 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.11340.1720103068389539273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 07:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=TDspRaW1;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1720103064;
	bh=SwsgYXb8xxzSZhnQ3YN94Jo0e+ilZ3Xhyjwx/4OkFk4=;
	h=From:To:Cc:Subject;
	b=TDspRaW1i13IdkE7Be/a82Daz1S+oC5Qxz9YK4VPXpn+glfbpTGyrtuudoqS2iiTo
	 xYcPIx/go6sTkuwSOHaZ2WoIkKrPlmLeFlnMm/h8kqHtogHhHPgig1+kPhSU1dBO+h
	 /30h3PETJE6/yKQEEg2R/aDUIqOTQDXZ1J39dng761ZE/bMTXJwc7K4RQ9xKwYWLL8
	 RozPQ4Dn7T2GwcBxUimMPAAiIKmddcmhv3me1Qw/mzZ2yL7O07nukcKu205qsvBpO4
	 n92vf/9F6xjiAvCUgydBFuLUucoHcZl9ssS8HNdemA/HaKo8m/V3yHugro9sJEXTZO
	 i6aU7bTCdr8wg==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-webserver][kirkstone][PATCH] nginx-1.20.1: Drop reference to removed patch
Date: Thu,  4 Jul 2024 16:23:57 +0200
Message-ID: <20240704142357.46586-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 14:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111255

From: Jasper Orschulko <jasper@fancydomain.eu>

Follow-up to commits 38a07ce and 8e297cd.

Also remove remaining reference to removed patch in nginx 1.20.1.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.20.1.bb
index 8bed04d6d..09a1b4559 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -2,7 +2,6 @@ require nginx.inc
=20
 SRC_URI +=3D "file://CVE-2021-3618.patch \
             file://CVE-2022-41741-CVE-2022-41742.patch \
-            file://0001-HTTP-2-per-iteration-stream-handling-limit.patch=
 \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D206629dc7c7b3e87acb31162363ae=
505"
--=20
2.45.2


