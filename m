Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043F0C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 12:20:29 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.102224.1683532315107936946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 00:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=r8Tg9ODc;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1683532311;
	bh=ob7nxf7gOHlPXupfXdn0+90/jCz1FkTiP7jrnB/zD3o=;
	h=From:To:Cc:Subject;
	b=r8Tg9ODcc/7Jhu6KRbrJS+0lf2uHHWEhV+XPpIJkQi4MqOnpHhdczKR7VCx4h25uY
	 HZpRZWy8Iz13J3OxA0d08HBl6hqvYTzOWkZVVDR1P+QZygPSvN/lMrREBbsdgiGOmF
	 kjFUtBzIdK8NqkZi3xxprPxbijgJ0BkWloe/1EBkRyL/KucePqT+J/eHOQ81Du6sfh
	 8xXqPxEGMIp4FYuvTNiQX2HHl4I/jVByv1pWVqDQO/XkprGbRCJJX0DdbAPXsJZ0O/
	 qtbEdHY9AXrUGRfAtTk2Ja/OaSwotuZvcXPua2lK9yUIWPfN9OzUVUc08SUUmpawTP
	 Q16jTN5B43tiw==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] python3-gcovr: Add missing runtime dependency
Date: Mon,  8 May 2023 09:50:13 +0200
Message-Id: <20230508075012.5876-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 12:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102437

python3-gcovr requires standard python module multiprocessing as runtime
dependency.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(Cherry-picked from commit 5564dbb8ff22d9ca4296a68f92f3c9d05fbdf99f)

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 meta-python/recipes-devtools/python/python3-gcovr_5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_5.1.bb
index 995f3b779..1c4279fd1 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
@@ -12,6 +12,6 @@ S =3D "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE =3D "gcovr"
=20
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-=
setuptools ${PYTHON_PN}-pygments"
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-=
setuptools ${PYTHON_PN}-pygments ${PYTHON_PN}-multiprocessing"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.40.1


