Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BE5CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:47:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12780.1790865770953602402
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Sq7rUK4h;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A705B1A10B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 14:42:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BC6660341
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 14:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62321103281F9;
	Thu,  1 Oct 2026 16:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790865764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bWqXV44LWjGivgVuWanUU5bLsX+Eu9/jM3x3nc6FTYA=;
	b=Sq7rUK4hGPfWr9Tbi3I95bqOHp6cGf0H1qTusqhfhpaAT8EjoA80xqZrEfjfGLls3DVlVF
	A0vRHJbRgTzuCmJsJgwEWm1vrnHQD0BUl4jz9riR+FWWCPq3nNmJtfpcLVrN5tio/fpohB
	7hv2QCdtUSYOgL3hDCNcY2/iggwProVoBZ2RthSnEvi+dZJEWt5re6t4jhEGfcJ0h/o/WW
	CUW9oECQsQpUVDAzlUN9jmDLlPWWJ2uL/vj2145or2tUhlkR+VWUBWVw2FaSeeLhIOXQa2
	Dwv6uGFTEBm0OIO/wOilxBpQs8TEPsIe2osXroaRw+iUC2FNWsDD6/zDJywtVg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [meta-networking][scarthgap][PATCH] ntpsec: add CVE_STATUS for CVE-2016-1548
Date: Thu,  1 Oct 2026 16:42:23 +0200
Message-ID: <20261001144223.2075665-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 14:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130595

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This vulnerability was fixed since v0.9.3 (tag name 'NTPsec_0_9_3') [1],
and the version range is not well defined as of today, for instance,
in NVD database [2]. This can lead to false positives in CVE reports.

Mark this CVE as fixed.

[1] https://github.com/ntpsec/ntpsec/blob/master/NEWS.adoc#2016-05-17-093
[2] https://nvd.nist.gov/vuln/detail/cve-2016-1548

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/me=
ta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
index 9ad97e7689..4b6125b4c5 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
@@ -19,6 +19,8 @@ SRC_URI =3D "https://ftp.ntpsec.org/pub/releases/ntpsec=
-${PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea1=
18a62f0a3226950e"
=20
+CVE_STATUS[CVE-2016-1548] =3D "fixed-version: fixed at ntpsec upstream, =
since NTPsec_0_9_3 tag"
+
 UPSTREAM_CHECK_URI =3D "ftp://ftp.ntpsec.org/pub/releases/"
=20
 inherit pkgconfig python3-dir python3targetconfig systemd update-alterna=
tives update-rc.d useradd waf features_check
--=20
2.55.0


