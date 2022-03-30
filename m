Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E7C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 19:11:33 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web12.2366.1648667492203576084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 12:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=b/OjLYPD;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4KTGJ22h6fz9sSF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 21:11:30 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1648667486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fnmv8Pwnz/TuMISrr3bcwXcd6hmPXLhDHPs7DL991bQ=;
	b=b/OjLYPD2aZLvgUPpVoERqyRYCjJXCsG+hLrVbl+41sZHNJrv/CUsoLrqLhXSIEnFUuPsM
	IJVETab9FAUAeODuipUHjwubX14vjr0VN8OsHO73igNDtSlNtleYq4KpOWudz89UoJ9f+1
	kg+Rco3on0W5HkoLCl4a3VIYCLotQvJ3D196dDd8j/zZheTJbDJ56AxY46nDs9jXFYocBz
	p3tXh7LJoIFB2KKbcfqPSMMOWAj1LN3597+ozY6VYyZFDULU2QmCZAjGWTQuhM0MxYgsE3
	9z9yUnm65QCUpo1GLOq0J3U8x+5gmv2wQZrBguNUsAC9t34sHIF+sjI+EPNhCA==
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade to version 0.3.49
Date: Wed, 30 Mar 2022 21:11:14 +0200
Message-Id: <20220330191115.112414-2-crg7475@mailbox.org>
In-Reply-To: <20220330191115.112414-1-crg7475@mailbox.org>
References: <20220330191115.112414-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 19:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96270

ChangeLogs can be found here:

https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.46
https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.47
https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.48
https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.49

Main recipe change is about the RTKit module, which was deprecated and
replaced by the new RT module. The recipe disables the legacy rtkit
module (which exists for backwards compatibility with older existing
PipeWire installations that use rtkit in their configuration files).

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...-to-enable-disable-legacy-RTKit-modu.patch | 44 +++++++++++++++++++
 ...{pipewire_0.3.45.bb =3D> pipewire_0.3.49.bb} | 15 +++++--
 2 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/000=
1-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.45.bb =3D=
> pipewire_0.3.49.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson=
-Add-option-to-enable-disable-legacy-RTKit-modu.patch b/meta-multimedia/r=
ecipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-=
legacy-RTKit-modu.patch
new file mode 100644
index 000000000..61bcdb3dd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-op=
tion-to-enable-disable-legacy-RTKit-modu.patch
@@ -0,0 +1,44 @@
+From b311f9e75f13205fd0738f7e89fd2062b9e7b237 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <crg7475@mailbox.org>
+Date: Wed, 30 Mar 2022 19:44:38 +0200
+Subject: [PATCH] meson: Add option to enable/disable legacy RTKit module
+
+The RTKit module is being replaced by the RT module. Currently, it is
+always built if D-Bus is present. For packagers, it can be beneficial to
+be able to disable the legacy module. Add a Meson option to allow for
+exactly that. Make it enabled by default to not change default behavior.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipe=
wire/-/merge_requests/1204]
+---
+ meson_options.txt       | 4 ++++
+ src/modules/meson.build | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 49d5b2203..2687bfe7e 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -237,3 +237,7 @@ option('libcanberra',
+        description: 'Enable code that depends on libcanberra',
+        type: 'feature',
+        value: 'auto')
++option('legacy-rtkit',
++       description: 'Build legacy rtkit module',
++       type: 'boolean',
++       value: 'true')
+diff --git a/src/modules/meson.build b/src/modules/meson.build
+index ee724bf52..2d26cc459 100644
+--- a/src/modules/meson.build
++++ b/src/modules/meson.build
+@@ -139,7 +139,7 @@ pipewire_module_rt =3D shared_library('pipewire-modu=
le-rt', [ 'module-rt.c' ],
+   dependencies : [dbus_dep, mathlib, dl_lib, pipewire_dep],
+ )
+=20
+-build_module_rtkit =3D dbus_dep.found()
++build_module_rtkit =3D dbus_dep.found() and (get_option('legacy-rtkit')=
 =3D=3D true)
+ if build_module_rtkit
+ # TODO: This serves as a temporary alias to prevent breaking existing s=
etups
+ #       while `module-rtkit` is being migrated to `module-rt`
+--=20
+2.32.0
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
index 6ba312484..b821f4400 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
@@ -13,8 +13,10 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "bdd407fe66cc9e46d4bc4dcc989d50679000482b"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+SRCREV =3D "075e7b266876802eab0077afd13ea8e1cee5e1fd"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps \
+           file://0001-meson-Add-option-to-enable-disable-legacy-RTKit-m=
odu.patch \
+           "
=20
 S =3D "${WORKDIR}/git"
=20
@@ -49,6 +51,10 @@ SYSTEMD_PACKAGES =3D "${PN}"
 #
 # AptX and LDAC are not available in OE. Currently, neither
 # are lv2 and ROC.
+#
+# The RTKit module is deprecated in favor of the newer RT module.
+# It still exists for legacy setups that still include it in
+# their PipeWire configuration files.
 EXTRA_OEMESON +=3D " \
     -Devl=3Ddisabled \
     -Dtests=3Ddisabled \
@@ -62,6 +68,7 @@ EXTRA_OEMESON +=3D " \
     -Droc=3Ddisabled \
     -Dbluez5-codec-aptx=3Ddisabled \
     -Dbluez5-codec-ldac=3Ddisabled \
+    -Dlegacy-rtkit=3Dfalse \
 "
=20
 PACKAGECONFIG ??=3D "\
@@ -306,8 +313,8 @@ FILES:${PN}-spa-tools =3D " \
 FILES:${PN}-modules =3D ""
 RRECOMMENDS:${PN}-modules +=3D "${PN}-modules-meta"
=20
-CONFFILES:${PN}-modules-rtkit =3D "${datadir}/pipewire/client-rt.conf"
-FILES:${PN}-modules-rtkit +=3D " \
+CONFFILES:${PN}-modules-rt =3D "${datadir}/pipewire/client-rt.conf"
+FILES:${PN}-modules-rt +=3D " \
     ${datadir}/pipewire/client-rt.conf \
     "
=20
--=20
2.32.0


