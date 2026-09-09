Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82060C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:51:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15928.1788969083458370642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=u+9s/AFQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 009DCE70F
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Sep 2026 17:51:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.113]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4KZt-004wsa0; Wed, 9 Sep 2026 17:51:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cyrus-sasl: add login PACKAGECONFIG
Date: Wed,  9 Sep 2026 17:51:08 +0200
Message-ID: <20260909155108.9017-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788969073-DD9419C6-0B4CB341/0/0 CLEAN NORMAL
X-TOI-MSGID: c939230d-647b-428a-860b-1adefd1a9f4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788969077; i=f_l_k@t-online.de;
	bh=foxQ74CsKVVL+Z5QQEU3zPZ/VZXdlI+X2O6h3Q2Kc5s=;
	h=From:To:Subject:Date;
	b=u+9s/AFQMMRbrPINZnJwhvBWTUSTtarsUqIoB75TaP82gRLm0lBAOdfPvGb+WjSfr
	 x/CqzOFA4hUUhtBX8F3oaKLwvIj4dKPVKRzOU2VeR4JuQb5+UCHik6FEJ4o5pv0JqK
	 2CYWRy8POoq15Hvr+k/Cit+HFDOOMyoCjcjjdirLzDMM/EpF9Hu3la4xUrrta6aq/i
	 7MUVoBh982EOeM7RBEAHZzLjnL6daURbk8SEHGwVZfHpa4fWVnruA0injxtbX0PCc0
	 GeBnUDqYKOideeGWdLLSiRkNz2G7Bn/fMwuXqrrF8yWbijyENkyxnyO70k7ZEeazVj
	 +cMOn1y5ZTI+g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 15:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129888

The LOGIN mechanism is disabled by default in the configure script,
so libsasl2 clients fail with "no mechanism available" as soon as a
peer only offers AUTH LOGIN or the client is configured to use it.
Mail servers still commonly advertise AUTH LOGIN PLAIN and clients like
KMail default to LOGIN for SMTP transports. Debian, Fedora and Gentoo
all ship the plugin.

Add an opt-in PACKAGECONFIG that builds liblogin.so, off by default to
keep the current behaviour.

Tested on corei7-64 with the option enabled, liblogin.so is packaged
into ${libdir}/sasl2 next to the other mechanism plugins.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b=
/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 26ec8a71a1..4f15a666ac 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -41,6 +41,7 @@ PACKAGECONFIG[opie] =3D "--with-opie,--without-opie,opi=
e,"
 PACKAGECONFIG[des] =3D "--with-des,--without-des,,"
 PACKAGECONFIG[ldap] =3D "--with-ldap=3D${STAGING_LIBDIR} --enable-ldapdb=
,--without-ldap --disable-ldapdb,openldap,"
 PACKAGECONFIG[ntlm] =3D "--enable-ntlm=3Dyes,--enable-ntlm=3Dno,,"
+PACKAGECONFIG[login] =3D "--enable-login,--disable-login,,"
=20
 CFLAGS +=3D "-fPIC"
=20
--=20
2.55.0


