Return-Path: <benjamin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9A4D72371
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 20:47:40 +0000 (UTC)
Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4786.1769374053860622618
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 12:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail2 header.b=wOEYCwnt;
 spf=pass (domain: geanix.com, ip: 79.135.106.117, mailfrom: benjamin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1769374049; x=1769633249;
	bh=Sr9ugSW7S5wJn/KE8luK6GA/0LthZjhUfaqXBY6s4Io=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wOEYCwntVMzTs32T8w/QCDV/CW+x7M/dlhDc0O1mf2dycEC8Ksixvrc6WaoFRtKPs
	 mIDIVknlZgN8xxWZw9N+isP+AhmuvKHvrVbMi8sILV4uIX3kcJw06NSMVdigIMFOD4
	 /h+lIRBlYeL94nBCY/BfzRF6Yxva6hqGVRR9x/wyVrx0FZ5/yf+VJUqlYxaRPjY+5N
	 olgLItidA8BIxt+soPdcrvwzHybIL+Zm6knemFPxREUwpIFOomZcB+PX3S0BD13T9V
	 0H5hpEZTXBjBdGcQjf5uF+WTyO5r/h1iTjcq77uzxTOyD98lWszM18xCfAvQPtqMDa
	 i+gU66f3s/oYw==
Date: Sun, 25 Jan 2026 20:47:23 +0000
To: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
From: benjamin@geanix.com
Cc: "Benjamin B. Frost" <benjamin@geanix.com>
Subject: [meta-networking] [PATCH] net-snmp: Add PACKAGECONFIG for aes
Message-ID: <20260125204637.34360-1-benjamin@geanix.com>
Feedback-ID: 134068578:user:proton
X-Pm-Message-ID: 130b290ff9ef71c56f39dfcf5befe33710e5dab9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 20:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123846

From: "Benjamin B. Frost" <benjamin@geanix.com>

Allows for net-snmp to be build with support for AES-192 and AES-256

Signed-off-by: Benjamin B. Frost <benjamin@geanix.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index b7c9607b3b..d7caf6444b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -49,6 +49,7 @@ PACKAGECONFIG[libnl] =3D "--with-nl, --without-nl, libnl"
 PACKAGECONFIG[perl] =3D "--enable-embedded-perl --with-perl-modules=3Dyes,=
 --disable-embedded-perl --with-perl-modules=3Dno, perl"
 PACKAGECONFIG[smux] =3D ""
 PACKAGECONFIG[systemd] =3D "--with-systemd, --without-systemd"
+PACKAGECONFIG[aes] =3D "--enable-blumenthal-aes,"
=20
 SYSCONTACT_DISTRO ?=3D "no-contact-set@example.com"
=20
--=20
2.51.0



