Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A05CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:17:29 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40624.1781165833962859038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=tiXSyHcp;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id C2E84E780
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:17:08 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXab5-3mmk0f0; Thu, 11 Jun 2026 10:17:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nspr: align 0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
Date: Thu, 11 Jun 2026 10:16:33 +0200
Message-ID: <20260611081633.115065-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781165827-08FEF4DE-82247E19/0/0 CLEAN NORMAL
X-TOI-MSGID: b87462d4-d5fc-45c1-9e33-a610673e3b39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781165828; i=f_l_k@t-online.de;
	bh=Y4SlG5isaDDjvXujjnoeyQ1zMesgxKrRPFYMa4cDdLY=;
	h=From:To:Subject:Date;
	b=tiXSyHcpk+CY9lIMDuF9HABtbEZ+nZMGGpBGjC4RsvC9WHKIv53Nnj/iy0/5U4085
	 /Ip8T3nKF2t5RzDMTShmEldg+6hLQIYo42q2ENDzyhdxkG0Z0AU8ck5lNHsJDqIRMN
	 5F1ZGKAa3o9zV2ohpL1x4pquMTnQh81dQC8ZptMiz6CqPXWCo/U+MW95nPveKN8S0e
	 zGzcYB9VQWcXLlR+FZinBRffMp++urndVkRLP5gJ+kHhcyJpvFc3JuU7IRRvfP88nN
	 sw6+0hVLeAxfNRDC+vrgwOqFMo38AoBRmtdYEa5q5Mo3Sh+s5ss5gRyOBptQJ27pxp
	 bujOpQj4GLwKg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127517

After current update this patch fails:
'0005-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch'

and needs adjustment

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...remove-_BUILD_STRING-and-_BUILD_TIME.patch | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_B=
UILD_STRING-and-_BUILD_TIME.patch b/meta-oe/recipes-support/nspr/nspr/000=
5-Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
index 470ada591a..baed8fee7f 100644
--- a/meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_BUILD_ST=
RING-and-_BUILD_TIME.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0005-Makefile.in-remove-_BUILD_ST=
RING-and-_BUILD_TIME.patch
@@ -18,7 +18,6 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
  lib/ds/Makefile.in        | 8 +-------
  lib/libc/src/Makefile.in  | 8 +-------
- lib/prstreams/Makefile.in | 8 +-------
  pr/src/Makefile.in        | 8 +-------
  4 files changed, 4 insertions(+), 28 deletions(-)
=20
@@ -59,25 +58,6 @@ index 9ef2007..21abd6f 100644
 +	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
 =20
 =20
- $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
-diff --git a/lib/prstreams/Makefile.in b/lib/prstreams/Makefile.in
-index 5865ab8..a00d20c 100644
---- a/lib/prstreams/Makefile.in
-+++ b/lib/prstreams/Makefile.in
-@@ -102,13 +102,7 @@ endif
-=20
- $(TINC):
- 	@$(MAKE_OBJDIR)
--	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
--	@if test ! -z "$(SH_NOW)"; then \
--	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
--	else \
--	    true; \
--	fi
--	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
-+	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
-=20
-=20
  $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
 diff --git a/pr/src/Makefile.in b/pr/src/Makefile.in
 index a9e86f5..bbcbb67 100644
--=20
2.54.0


