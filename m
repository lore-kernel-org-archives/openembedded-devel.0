Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF124C77B71
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 11:11:06 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.3187.1681544782443110480
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Apr 2023 00:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=puCVSIf+;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1681544779;
	bh=IOM+npWLFSmFos3Jf1m7151+ZPvf24nXGuEROxKUGOk=;
	h=From:To:Cc:Subject;
	b=puCVSIf+TFpCUmvv0wpSQUMOF/gQ262zMsLoSo3y5y+vB0mx9n0KzZ5isBJ6CFqZy
	 lmCQngzWWPmwD+HQsYryqlEjVntnjQxH57euIGS6ihDBev+mib2F9CkjaWXw8ruhpW
	 0CgRa/hEwJ0ZGvDJVGdklheI9TOQDqe/SWIZPLp1A5WWfyD3ZItg0wKjmeq3TmM+1w
	 rvZgC8IyYoQTVo0Ll1AisjkXSsSaw1xs61wUWOUvUvbKYbhrLWxKcdd+3p7A19YZW4
	 bB1O6wFisdnDcxBQ1Fb2ZRyE9ikcMhfQZCuz9Nv+SNV+5SvZhPtmuGXzd/lLVhx/QU
	 SopXl2I5I7eug==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH] python3-gcovr: Add missing runtime dependency
Date: Sat, 15 Apr 2023 09:45:55 +0200
Message-Id: <20230415074555.9508-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Apr 2023 11:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102099

python3-gcovr requires standard python module multiprocessing as runtime
dependency.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 meta-python/recipes-devtools/python/python3-gcovr_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 901d0017d..21c36687e 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
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
2.40.0


