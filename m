Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D8C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 16:48:43 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17480.1788972516232431588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 09:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hsh/De6F;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id D4B1D38A04
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Sep 2026 18:48:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.113]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4LT0-2KGLoG0; Wed, 9 Sep 2026 18:48:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] malcontent: pass the useradd options to every system user
Date: Wed,  9 Sep 2026 18:48:02 +0200
Message-ID: <20260909164802.335873-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788972490-391A59B4-56D1DA7B/0/0 CLEAN NORMAL
X-TOI-MSGID: 878c809f-389b-4cac-889d-94a6afd977fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788972496; i=f_l_k@t-online.de;
	bh=SH20B5PABdsE3w1qQz4nAqw4Y6KhSNYH6/VssuJPgns=;
	h=From:To:Subject:Date;
	b=hsh/De6FIOtn9jVgCBPCoD3ObbA3TPJP6qrv+xD08tJK7vt/doGx/UBNQcM5rQwBu
	 MAd4XO7JuyL7tdgVwfzMA06lrEM6PwMDfhHm6d6fkN0p+KDo1gH5h/mTdr5hMCfYNM
	 xKs1ZqMvKMBOD20KQoQy56VmTeQAwK+52OLI26hCgWXH34edFUaD84kE7GBtM6rlBs
	 cylJoL1PVfNG9mHTuaCpPelESvflBJ3jzb/oFBp7Oxf2XK267qH0ighRQPcPcYaeeT
	 IojfOBQ3wmoONLmR2wvzQkvQUmlwJS+LYiNdVdVSs+IcUhKrI1oBwRK917RSKXRiX2
	 N3nUPxm7BHZ9w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 16:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129891

USERADD_PARAM is a semicolon separated list of complete useradd
invocations. Only the first entry carried the options, so
malcontent-timerd and malcontent-webd were created with the useradd
defaults: regular UIDs from the user range, /bin/sh as shell and
/home/malcontent-timerd and /home/malcontent-webd created in the
rootfs. Upstream declares all three as system users without a home in
its sysusers.d fragments.

Repeat the options for each user and point the home of the two daemons
at the StateDirectory their units use, so no directory shows up under
/home.

Tested on corei7-64: the rootfs of plasma-image contains only the real
user under /home and all three accounts have system UIDs, /bin/false
and no home directory.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
---
 meta-oe/recipes-gnome/malcontent/malcontent.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/rec=
ipes-gnome/malcontent/malcontent.bb
index a6aa59513d..0bb258e2b0 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -37,5 +37,9 @@ FILES:${PN} +=3D " \
 "
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell =
/bin/false --home-dir ${localstatedir}  malcontent-timer-ext-agent;malcon=
tent-timerd;malcontent-webd"
+USERADD_PARAM:${PN} =3D " \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir} malcontent-timer-ext-agent; \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir}/lib/malcontent-timerd malcontent-timerd; \
+    --system --no-create-home --user-group --shell /bin/false --home-dir=
 ${localstatedir}/lib/malcontent-webd malcontent-webd \
+"
=20
--=20
2.55.0


