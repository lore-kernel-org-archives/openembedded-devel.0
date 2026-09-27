Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C23C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 14:13:46 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37067.1790518416479150580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 07:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=rKWumhc9;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id C3C6A5CC
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 16:13:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.136]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xApcp-3Y4cme0; Sun, 27 Sep 2026 16:13:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fwupd: create the fwupd-refresh user
Date: Sun, 27 Sep 2026 16:12:57 +0200
Message-ID: <20260927141257.8721-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790518387-8A7FB90A-BA6556F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a765db9-3e6f-48fb-a310-fd23d5bfdf63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790518387; i=f_l_k@t-online.de;
	bh=tXQAgNKjg7YQoyjJaGOw/9bK3Ga5VMitPJbxsCYyH04=;
	h=From:To:Subject:Date;
	b=rKWumhc9HhfkesIjLBw+VZM54kRmd0mnwUn3M2P/k38uif1Xz4yogNKpJ678yNqdL
	 AbrxeZVL6vInHY2mPSzgBSGo52bTKMqAbwua14/QDkzsDVEh1McfKa9HmQWQVS6uDw
	 1Tuu2v0JstrY50p2wYxcz7n73fv7y2YiN3OZPTr4aCOfZ/0NhFCtyaQSS+2EJ05quv
	 TyY0+Jl1Tq3zFOrfLWOHWhGMnLZllzmKcKgfx6A+nWldwQRJDAe52Y95qIicPJkqE9
	 eRXqOGdEV8eSCqZpu1UqITxDhV46bIa2HzmSCZDS59ZbsEn/fNfVMKcmJo/XPdFlxN
	 Xg5KTz8gLFntw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 14:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130370

fwupd-refresh.service runs as fwupd-refresh, which is only declared in
sysusers.d, so do_rootfs warns "User fwupd-refresh has never been
defined". Create it with useradd.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb b/meta-oe/recipes-b=
sp/fwupd/fwupd_2.1.7.bb
index bab444be7e..9d1ac8de7d 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
@@ -26,7 +26,7 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to b=
uild the UEFI plugins
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages
+inherit meson vala gobject-introspection systemd useradd bash-completion=
 pkgconfig gi-docgen ptest manpages
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
@@ -36,6 +36,9 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 EXTRA_OEMESON =3D "-Dvendor_ids_dir=3D${datadir}/hwdata"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${localstatedir}/lib/fwupd --shell /sbin/nologin fwupd-refresh"
+
 PACKAGECONFIG ??=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)=
} \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
--=20
2.55.0


