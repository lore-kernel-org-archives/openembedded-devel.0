Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E6C88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18103.1789458262196681737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=jLc8vnle;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 3089237D03
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds5w0; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 17/31] gnome-software: upgrade 50.3 -> 51.0
Date: Tue, 15 Sep 2026 09:43:33 +0200
Message-ID: <20260915074347.6003-17-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-977FD9B9-D2097EB5/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f47568c-4fbb-49bc-a2e8-19fced16bbd6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=KOkQjalb80QsEwZeiYnyxPyDbE/RubCFEbzDkHV9V4k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jLc8vnletb+jzzraJkyBkJbXxsfY4NbYs1RJOYYxZNXd5wUhotRlOw+BSDC7d9o2P
	 3/C+9oEJSdplEp57M8oZCP5f7MdgzdNS1mYdf5kg9ib0C37oLzezuvh8z/4QwoX+h9
	 1K98vp+tdpNjPqTMziAJWvjoxcEymwisqBA2Ur4auwmlP+qfChjJNPWH3yN4aQPE9i
	 ++lhRf+ZPz2jT1umBqSfK8cvVc60OuW6SJYO4uwgXPzPBhinC9W/l4YVzjI2pSi3FI
	 JK97T40S3ymv5+l1puVMbORPq3bOYDZVJGqJod0zLBWimJDlwwYFodyraqqnKBn8vm
	 bYRfCgkTb3gNw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130040

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_50.3.bb =3D> gnome-software_51.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_50.3.bb =3D=
> gnome-software_51.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.bb
index 4b43be9052..6fc1eb4e52 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_51.0.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "b1318e68f02bb3902fcd8f904d56f03f534ea509=
8f65e4c6bb9c2c924da7f823"
+SRC_URI[archive.sha256sum] =3D "834b6035e61e36dd72339eb3e15d299b472ae0b3=
93467a5bb36bb0045e0ba123"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-software/-/=
tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


