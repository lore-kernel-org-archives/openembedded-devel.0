Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38943FD5F88
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:04:02 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100561.1775631836896661681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 00:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=eJtt3z57;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 962F4230
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 09:03:54 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.170.104]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wAMx4-30h6ht0; Wed, 8 Apr 2026 09:03:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libcanberra: disable gtk-doc
Date: Wed,  8 Apr 2026 09:03:43 +0200
Message-ID: <20260408070343.232478-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775631830-6AFFA80B-67691E9A/0/0 CLEAN NORMAL
X-TOI-MSGID: 02c7d9de-b1fc-4b67-8743-2119ad5da742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775631834; i=f_l_k@t-online.de;
	bh=ECj0dIIhSdV2oCsqE85RpRi//j3/NxJVBBhkKXy6vIo=;
	h=From:To:Subject:Date;
	b=eJtt3z57XwYWPwqoXPwXsUA43KCHCQNdY3rMvuerOyHqbwjJ9wDAVgFtlEicHbTWq
	 hGJIIGTxnA3S3BTguqUV0MQPGKPnPc+kVOI9Z4FuggXsocPLncjQwtQx2hVFHQGHm4
	 vXWUOH2ixeXxg5dc+HtA2SS9c+3jywn8EhMk5+D07kZqm1cDpPmgPEVFggrWTqCgNa
	 LDyHlPiCMM1zjyoeeqPsvpZU6r/HRpqRYm91CUVrh+hGsaah8oxui63UzUDhTepOeO
	 nClnGih228kXi4XE1mWWqvxMm/vzwRd3e1TCNTkK+VrQPNjvRZmLT+0l5KlTYmKDvn
	 P3QIcSPlpjL8g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126100

gkt-doc build uses the deprecated gtkdoc-mktmpl tool, which was dropped b=
y upstream
in version 1.26 of gtk-doc and fails if 'api-documentation' is in DISTRO_=
FEATURES.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b=
/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
index 2c063fd995..1f1c23d041 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF =3D "\
     --disable-oss \
     --disable-tdb \
     --disable-lynx \
+    --disable-gtk-doc \
 "
=20
 PACKAGECONFIG ??=3D " \
--=20
2.53.0


