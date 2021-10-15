Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0DFC433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 00:13:49 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.2988.1634256828047289308
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 17:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id CE245E007F;
	Fri, 15 Oct 2021 13:13:43 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [meta-java][PATCH] icedtea7-native: -Wno-error=format-overflow for
 all gcc >= 9
Date: Fri, 15 Oct 2021 13:13:40 +1300
Message-Id: <20211015001341.588817-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 00:13:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93316

Using oe.utils.less_or_equal() in the reverse sense here, such that
we *don't* add the warning exclusion for gcc <=3D 8.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/iced=
tea/icedtea7-native.inc
index 331b7a4..0f317bb 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -30,8 +30,7 @@ CFLAGS:append =3D " -Wno-error=3Dstringop-overflow -Wno=
-error=3Dreturn-type"
=20
 # oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "=
9"
 HOST_COMPILER_MAJOR=3D"${@oe.utils.get_host_compiler_version(d)[1].split=
(".", 2)[0]}"
-# if compiler version 9 detected, add more CFLAGS
-CFLAGS:append =3D " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', =
'-Wno-error=3Dformat-overflow', '', d)}"
+CFLAGS:append =3D " ${@oe.utils.less_or_equal('HOST_COMPILER_MAJOR', '8'=
, '', ' -Wno-error=3Dformat-overflow', d)}"
=20
 # Explicitly pass -fcommon since GCC 10 defaults to -fno-common for C so=
urces
 CFLAGS:append =3D " -fcommon"
--=20
2.30.2


