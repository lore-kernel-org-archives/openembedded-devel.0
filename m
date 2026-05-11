Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13911CD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:56:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48516.1778500563692753421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 04:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@semalibre.com header.s=dkim header.b=XPWQtBAF;
 spf=pass (domain: semalibre.com, ip: 185.171.202.116, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0513C5E176;
	Mon, 11 May 2026 11:56:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2652E60646;
	Mon, 11 May 2026 11:56:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B2D411AE8081;
	Mon, 11 May 2026 13:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778500561;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+ltAhh4WvTIgQvKvr6k5NG+95sY8TJBe49YTn08550M=;
	b=XPWQtBAFQfBSI+3FMa6eo/FbOZ9oKh//+/cHIYYie+0xWgx1m1iRi9oKGk3Nhv8/kVm+U3
	9iJufpRLiTKv9nTFawmuVmPIwglPbzqaaYKjA3fQUXYLSi/oUwURgM+pgkp3xF0z8594Ds
	TU2ChsmRURWkhLBpi4ngozLpYoYtKKY/pYBeUsnZN1zQW+KNqnqgDau9DJUcK+UDLmNpet
	o+PoUYUC+3wVWKOVM5Uqt4Y9W1+lzGD2Sw2YDwEaRABLhCErVnsfXI6LF9o56nth8WQOrD
	dOtdsdwaReFrPvM4tmInWQQcHi7Hniy7bqz/GZjwcq6882BrhZYVvwdaLT0dFQ==
From: Louis Rannou <louis.rannou@semalibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	pascal.eberhard@non.se.com
Subject: [meta-networking][PATCH v2] openvpn: create an extra package for the dns-updown script
Date: Mon, 11 May 2026 13:54:45 +0200
Message-ID: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506-bash-rr-5fd0820519e4>
References: <20260506-bash-rr-5fd0820519e4>
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778500012; l=1832; i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id; bh=Ak15XMMxbMKcTUukb9UZ6uXAq9ojZ6Vpr1NDZ+t4Frg=; b=qZmqx+UPQGElZ3Qpy3RzsiRwKKmnGp+s8GpEqr9rRBPyXAO3CLmzJSaRiKeq0LC2pea9TmqLD f542t5JaO/xC7rLdEKfb9zYDl1XYFHIHG0DvkRfpLPY3Q6podzNmYy6
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519; pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126849

From: Louis Rannou <louis.rannou@non.se.com>

The dns-updown script is written in bash which is under the GPLv3
license. As this script is optional, it is preffered to have it in an ext=
ra
package.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
change in v2: new package openvpn-dns-updown
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 0cbe4641cd..6ddebde4d1 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,iproute=
2,iproute2-ip"
 PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
=20
-RDEPENDS:${PN}:append =3D " bash"
+RDEPENDS:${PN}-dns-updown:append =3D " bash"
 RDEPENDS:${PN}-ptest:append =3D " bash"
=20
 do_install:append() {
@@ -114,7 +114,7 @@ do_install_ptest() {
     cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
 }
=20
-PACKAGES =3D+ " ${PN}-sample "
+PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
=20
 RRECOMMENDS:${PN} =3D "kernel-module-tun"
=20
@@ -124,5 +124,6 @@ FILES:${PN} +=3D "${systemd_system_unitdir}/openvpn-s=
erver@.service \
                 ${systemd_system_unitdir}/openvpn-client@.service \
                 ${nonarch_libdir}/tmpfiles.d \
                "
+FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
 FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
                      "

---
base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
change-id: 20260506-bash-rr-5fd0820519e4

Best regards,
--=20
Louis Rannou <louis.rannou@non.se.com>

