Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B79AC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 06:45:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.1927.1743835538564755535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 23:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id 923AE19B2
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Apr 2025 08:45:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.218]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u0xHZ-1I6SJd0; Sat, 5 Apr 2025 08:45:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] accountsservice: fix Upstream-Status
Date: Sat,  5 Apr 2025 08:45:27 +0200
Message-ID: <20250405064527.849323-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743835533-6B7FDCE7-80F1ECCC/0/0 CLEAN NORMAL
X-TOI-MSGID: b59f48e9-a2ca-4432-83db-cd17ab7cb168
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 06:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116596

This fixes:
ERROR: accountsservice-23.13.9-r0 do_patch: QA Issue: Malformed Upstream-=
Status in patch
/home/flk/poky/meta-openembedded/meta-gnome/recipes-support/accountsservi=
ce/accountsservice/00b6e12ad4044d33cc54c71c75773c5a653dad09.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../00b6e12ad4044d33cc54c71c75773c5a653dad09.patch              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
0b6e12ad4044d33cc54c71c75773c5a653dad09.patch b/meta-gnome/recipes-suppor=
t/accountsservice/accountsservice/00b6e12ad4044d33cc54c71c75773c5a653dad0=
9.patch
index f016057562..d7b6525934 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/00b6e12a=
d4044d33cc54c71c75773c5a653dad09.patch
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/00b6e12a=
d4044d33cc54c71c75773c5a653dad09.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Disable tests when cross compilin=
g and allow
=20
  specifying path_wtmp
 =20
- Upstream-Status: Backport [https://gitlab.freedesktop.org/accountsservi=
ce/accountsservice/-/commit/00b6e12ad4044d33cc54c71c75773c5a653dad09]
+Upstream-Status: Backport [https://gitlab.freedesktop.org/accountsservic=
e/accountsservice/-/commit/00b6e12ad4044d33cc54c71c75773c5a653dad09]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
--=20
2.49.0


