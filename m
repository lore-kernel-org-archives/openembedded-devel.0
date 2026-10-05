Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B02CCA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 01:20:28 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10936.1791163224143479279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2026 18:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=JRJccMRw;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout09.t-online.de (Postfix) with SMTP id A4C3F379CB
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Oct 2026 03:20:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.181]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xDXND-2qQFRC0; Mon, 5 Oct 2026 03:20:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] luaposix: set the version from PV
Date: Mon,  5 Oct 2026 03:19:56 +0200
Message-ID: <20261005011956.1224267-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005011956.1224267-1-f_l_k@t-online.de>
References: <20261005011956.1224267-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791163211-9BFFC9BF-0CA063C5/0/0 CLEAN NORMAL
X-TOI-MSGID: db07eb2f-72a6-4570-9888-c672ab836024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791163211; i=f_l_k@t-online.de;
	bh=4Sfo4k8VW+mW/TTTmt1W4GZFIuUZkXPrv8lWyVyNcTc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JRJccMRwHiQ5tYoCg6ABEJNcBPke5H7ReZEmiinpg9DtCNR4K++iuVS/3rRxsnypc
	 zqOHKixCYvAYqqM/tXFBNSV3moDHkWHKkqTdq43ciLuXPPEalzSuyUglU2PkN4PUjJ
	 N0ZfQ49l9FvuUFBsSTLruQT9nsEmC0zwI3nJ0bDdotVOvo+qox4I0kT1/pvPjPyLEg
	 22/DkwLMcKkudieWfwG4eutWx1ogUf57OKeYZcANaFD3o8P6R1W3eUXE0sCgSB34Fe
	 mlKvugHTt8k47rjjriKX34AKnBDMw2z/XJWl+Yb1pLasZfESvedEmqYU3E3jzV4raq
	 yBDUoezVN2AVg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 01:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130622

The lukefile of the git checkout has version =3D '$USER', which only the
release tarballs replace, so posix/version.lua carried the name of the
user who built it. Set it to PV before building.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb b/meta-oe=
/recipes-devtools/luaposix/luaposix_36.3.bb
index 686b1365d0..e420c1a289 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb
@@ -14,6 +14,10 @@ B =3D "${S}"
=20
 inherit pkgconfig
=20
+do_configure() {
+    sed -i "s/^version *=3D .*/version  =3D '${PV}'/" ${S}/lukefile
+}
+
 do_compile() {
     ${S}/build-aux/luke LUA_INCDIR=3D${STAGING_INCDIR}
 }
--=20
2.55.0


