Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CD9D49C7B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:35:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6386.1769762157162393861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id DC226E625
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:35:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.165.56]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vljyp-0O5hfG0; Fri, 30 Jan 2026 09:35:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] pangomm: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Fri, 30 Jan 2026 09:35:43 +0100
Message-ID: <20260130083543.272427-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130083543.272427-1-f_l_k@t-online.de>
References: <20260130083543.272427-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769762151-057F9AF5-F5AA73FB/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cea7d31-0cd6-4adc-abb8-8e22d35f4785
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124008

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta=
-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
index d99c6ceac0..6afcf08a16 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929=
c1cb29a1e3fd737b499 \
 DEPENDS =3D "mm-common cairomm-1.16 glibmm-2.68 pango"
=20
 GNOMEBN =3D "pangomm"
-inherit gnomebase features_check
+inherit gnomebase
=20
 SRC_URI[archive.sha256sum] =3D "539f5aa60e9bdc6b955bb448e2a62cc14562744d=
f690258040fbb74bf885755d"
-REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.52.0


