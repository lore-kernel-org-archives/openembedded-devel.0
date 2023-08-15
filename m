Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F8DC001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:45:43 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.139347.1692117939581498234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 5E60261DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 18:45:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVxAg-3e0HAn0; Tue, 15 Aug 2023 18:45:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] appstream: disable docs
Date: Tue, 15 Aug 2023 18:45:23 +0200
Message-ID: <20230815164523.2400133-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692117931-0492CEBC-71A73A90/0/0 CLEAN NORMAL
X-TOI-MSGID: 915bbbdb-a149-41be-be57-bee742d5cad4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 16:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104361

Appstream requests 'daps' for building api-documentation. Without having
knowledge of its advantages it looks like overkill to me.
Disable docs to avoid break if DISTRO_FEATURE 'api-documentation'
is set.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/appstream/appstream_0.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.2.bb b/meta=
-oe/recipes-support/appstream/appstream_0.16.2.bb
index 1ba4521834..240e63a1bd 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.2.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.2.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemmi=
ng=3Dfalse,libstemmer"
=20
 FILES:${PN} +=3D "${datadir}"
=20
+EXTRA_OEMESON:append =3D " -Ddocs=3Dfalse"
 EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.c=
ross"
=20
 do_write_config:append:class-target() {
--=20
2.41.0


