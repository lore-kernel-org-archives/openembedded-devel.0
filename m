Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF06C79F9E
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:30 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10851.1788687444805624294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J1IjU8q/;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout02.t-online.de (Postfix) with SMTP id A6A49E2F0
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJt0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 14/15] gnome-calculator: upgrade 48.0 -> 50.0
Date: Sun,  6 Sep 2026 11:37:12 +0200
Message-ID: <20260906093713.797648-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-A5FF8956-9EB89B3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 55894c5a-8e99-4140-9264-1571de5b650f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=4LjHEPelUpo0rShg95ee/Wt6YnKhx/k440RD1qMfXVU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J1IjU8q/btELnt70abxYR4EsLK2SEH5fAhumIPs+VZjJe2rjIgd/xriYjVHaYadEz
	 5Xe1SZZTfWxJ8S0gB73sJrpw1ugNYhZsHSJFWdw8pdy0quDHEjnigYCn1pJ/rpu9Uq
	 yzlW02qXLozZg/E0uDXFDto9mOh9ywPpf90uWcADsy0TrAoQiTYprtOhDEAQV1eeNq
	 Hw2swWwF0Ij7sEIEhpzFMoy/PvHcRrYkce+U1zH467kOCMk/dL6xeSTuPpCopBG9On
	 xWxzV7ZQkMjfDdJpET7VfXovrdL8K/Rf9eavYdJyE468ZWx7rJIbJWfo1uYZJ3HfuG
	 1Ajs4JH9nw63Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129792

blueprint-compiler-native is a new build dependency.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_48.0.bb =3D> gnome-calculator_50.0.bb}   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_48.0.=
bb =3D> gnome-calculator_50.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
8.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_50.0.=
bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_48=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_50.0=
.bb
index b8433a2b5a..4330e25df1 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_50.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
 SECTION =3D "x11/gnome"
=20
 DEPENDS =3D " \
+    blueprint-compiler-native \
     yelp-tools-native \
     gtk4 \
     libsoup-3.0 \
@@ -29,7 +30,9 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "07b627136bbfddb6142b324acc30440911f77f51=
37009103276a2d35ffd39510"
+export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
+
+SRC_URI[archive.sha256sum] =3D "8053d6891565e882874b65c1db51c5bf310005eb=
788b8bac3546390743350a90"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.55.0


