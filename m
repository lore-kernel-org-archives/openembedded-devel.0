Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B353C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 09:44:15 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web08.4200.1650966244950186786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 02:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=mSRfam6s;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4KncQn4bW7z9sbv
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 11:44:01 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1650966240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=axskNZ6PaSzVBLHGp5LEo0o4NnH8npGcHsYmvijZK/8=;
	b=mSRfam6sxz9MW7vzCW9dD6Yea7SFlLISvORvtqKZa/Go+2o6Aqr2tFfPxau3TyrJki3epl
	gUXuZjPzoQv0FXtJwAq9RPMN4Zb6a9I5ZY0DpsAXVYGOVKVTuKzkSRd3RgsXr9GcYGsmXu
	fHp1MUjnkW/OyixafEC1KZeAJ8h8u9fusJlzPEPE9vwDXP0eeIkeSWWwEXPGhW4YrrReGB
	h9U8kIgDWRSokhFEa6kZ3qcPvURixvzE7VyduCKk464bW5wpVXosfMioRbT7+4Wy/sxyEE
	LIh9LwWK8UNDlZDThZdje8x5yPeBctCSiifQNcF87A+ETfGBfSSnkjn0AiZI9w==
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade to version 0.3.50
Date: Tue, 26 Apr 2022 11:43:47 +0200
Message-Id: <20220426094347.15196-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 50a6c16cd4787918fe4
X-MBO-RS-META: ij9st8r1ankgthmmzk5ghbuu1ps9zkp4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 09:44:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96797

This is a bugfix release. Notably, this makes pw-dot work again - it
required workarounds via pw-dump to output a non-empty dot graph in 0.3.4=
9.

Full changelog:

https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.50

0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
is no no longer needed since it has been merged and is part of 0.3.50.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...-to-enable-disable-legacy-RTKit-modu.patch | 44 -------------------
 ...{pipewire_0.3.49.bb =3D> pipewire_0.3.50.bb} |  6 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/000=
1-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.49.bb =3D=
> pipewire_0.3.50.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson=
-Add-option-to-enable-disable-legacy-RTKit-modu.patch b/meta-multimedia/r=
ecipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-=
legacy-RTKit-modu.patch
deleted file mode 100644
index 61bcdb3dd..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-op=
tion-to-enable-disable-legacy-RTKit-modu.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b311f9e75f13205fd0738f7e89fd2062b9e7b237 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <crg7475@mailbox.org>
-Date: Wed, 30 Mar 2022 19:44:38 +0200
-Subject: [PATCH] meson: Add option to enable/disable legacy RTKit module
-
-The RTKit module is being replaced by the RT module. Currently, it is
-always built if D-Bus is present. For packagers, it can be beneficial to
-be able to disable the legacy module. Add a Meson option to allow for
-exactly that. Make it enabled by default to not change default behavior.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipe=
wire/-/merge_requests/1204]
----
- meson_options.txt       | 4 ++++
- src/modules/meson.build | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 49d5b2203..2687bfe7e 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -237,3 +237,7 @@ option('libcanberra',
-        description: 'Enable code that depends on libcanberra',
-        type: 'feature',
-        value: 'auto')
-+option('legacy-rtkit',
-+       description: 'Build legacy rtkit module',
-+       type: 'boolean',
-+       value: 'true')
-diff --git a/src/modules/meson.build b/src/modules/meson.build
-index ee724bf52..2d26cc459 100644
---- a/src/modules/meson.build
-+++ b/src/modules/meson.build
-@@ -139,7 +139,7 @@ pipewire_module_rt =3D shared_library('pipewire-modu=
le-rt', [ 'module-rt.c' ],
-   dependencies : [dbus_dep, mathlib, dl_lib, pipewire_dep],
- )
-=20
--build_module_rtkit =3D dbus_dep.found()
-+build_module_rtkit =3D dbus_dep.found() and (get_option('legacy-rtkit')=
 =3D=3D true)
- if build_module_rtkit
- # TODO: This serves as a temporary alias to prevent breaking existing s=
etups
- #       while `module-rtkit` is being migrated to `module-rt`
---=20
-2.32.0
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
index b821f4400..0d725b9ee 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
@@ -13,10 +13,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "075e7b266876802eab0077afd13ea8e1cee5e1fd"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps \
-           file://0001-meson-Add-option-to-enable-disable-legacy-RTKit-m=
odu.patch \
-           "
+SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.32.0


