Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0892CC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.4199.1745526863291588147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 0FB661353
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSa0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/18] canopenterm: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:56 +0200
Message-ID: <20250424203406.2113462-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-FCFF6A5A-A06B368E/10/3626336762 SUSPECT URL
X-TOI-MSGID: da8bbd3c-3d51-4df8-a2ee-bc7a85797930
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117107

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
index b15a363305..dad8e8e8e2 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
@@ -13,7 +13,7 @@ BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenT=
erm/issues"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
=20
-DEPENDS =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
+DEPENDS =3D "cjson libinih virtual/libsdl2 lua libsocketcan pocketpy"
=20
 SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
=20
--=20
2.49.0


