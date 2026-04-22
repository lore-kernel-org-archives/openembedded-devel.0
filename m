Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8B4FA1FE7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 18:59:34 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90241.1776884365100676459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 11:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 00A20620FD; Wed, 22 Apr 2026 18:59:22 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id CAEA660754;
	Wed, 22 Apr 2026 18:59:22 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: update to version 2.02+git
Date: Wed, 22 Apr 2026 20:59:10 +0200
Message-ID: <20260422185910.12558-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126558

- This patch incorporates all previously suggested changes
- Introduced a new API function: print_result()
- Added support for configuring a dynamic number of filters when
  executing replay.lua
- Added script to interact with the STM32 CAN bootloader (stm32.lua)
- Add Unified Diagnostic Services (ISO 14229-1) script written in Lua
  (uds.lua)
- Various updates and fixes required by the Debian package and to be able
  to get certified by Microsoft
- Added manpages

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../{canopenterm_2.01.bb =3D> canopenterm_2.02.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.01.bb =3D> ca=
nopenterm_2.02.bb} (87%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
similarity index 87%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
index f44312a6e4..0e8a7a1c8a 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
@@ -15,13 +15,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc7=
21b4a0289efe949bdbe7dda79"
=20
 DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
-SRCREV  =3D "4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19"
+PV .=3D "+git"
+
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
+SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"
=20
=20
 inherit cmake ptest
=20
-EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
+EXTRA_OECMAKE +=3D "-DUSE_SYSTEM_LIBS=3DON"
=20
 FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
=20
--=20
2.53.0


