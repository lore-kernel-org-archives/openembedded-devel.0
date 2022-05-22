Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FABC433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:49:06 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.14667.1653209341582716786
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id 0B8267242
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 10:49:00 +0200 (CEST)
Received: from localhost.localdomain ([84.163.33.213]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshGl-0nUFhx0; Sun, 22 May 2022 10:48:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv2] pipewire: reduce native/nativesdk
 dependencies; add backport patch
Date: Sun, 22 May 2022 10:48:51 +0200
Message-Id: <20220522084851.1855227-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653209339-0000F5B3-35BEFAFA/0/0 CLEAN NORMAL
X-TOI-MSGID: 1b79a2fd-c551-456c-992d-365b5c77347d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 May 2022 08:49:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97218

- pipewire is by default built with lots of dependencies.
  Reduce them for native/nativesdk
- add a backport patch to fix pipewire support in libsdl2
- allow native/nativesdk build

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-spa-fix-c90-header-include.patch     | 47 +++++++++++++++++++
 .../pipewire/pipewire_0.3.50.bb               |  9 +++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-spa-fix-c90-header-include.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-sp=
a-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipew=
ire/pipewire/0001-spa-fix-c90-header-include.patch
new file mode 100644
index 000000000..ad6448a10
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c=
90-header-include.patch
@@ -0,0 +1,47 @@
+From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Wed, 13 Apr 2022 21:57:49 +0000
+Subject: [PATCH 001/154] spa: fix c90 header include
+
+placing declarations after code is invalid under ISO c90
+
+Fixes !1211
+
+Patch-Status: Backport
+---
+ spa/include/spa/utils/string.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/stri=
ng.h
+index e80434537..43d19616c 100644
+--- a/spa/include/spa/utils/string.h
++++ b/spa/include/spa/utils/string.h
+@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size=
_t size, const char *format, .
+ static inline float spa_strtof(const char *str, char **endptr)
+ {
+ 	static locale_t locale =3D NULL;
++	locale_t prev;
+ 	float v;
+ 	if (SPA_UNLIKELY(locale =3D=3D NULL))
+ 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
+-	locale_t prev =3D uselocale(locale);
++	prev =3D uselocale(locale);
+ 	v =3D strtof(str, endptr);
+ 	uselocale(prev);
+ 	return v;
+@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float=
 *val)
+ static inline double spa_strtod(const char *str, char **endptr)
+ {
+ 	static locale_t locale =3D NULL;
++	locale_t prev;
+ 	double v;
+ 	if (SPA_UNLIKELY(locale =3D=3D NULL))
+ 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
+-	locale_t prev =3D uselocale(locale);
++	prev =3D uselocale(locale);
+ 	v =3D strtod(str, endptr);
+ 	uselocale(prev);
+ 	return v;
+--=20
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
index 0d725b9ee..0f527c0a5 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
@@ -14,7 +14,10 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "dbus ncurses"
=20
 SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+SRC_URI =3D " \
+	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;prot=
ocol=3Dhttps \
+	file://0001-spa-fix-c90-header-include.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -69,7 +72,7 @@ EXTRA_OEMESON +=3D " \
     -Dlegacy-rtkit=3Dfalse \
 "
=20
-PACKAGECONFIG ??=3D "\
+PACKAGECONFIG:class-target ??=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
@@ -335,3 +338,5 @@ FILES:${PN}-v4l2 +=3D " \
 FILES:gstreamer1.0-pipewire =3D " \
     ${libdir}/gstreamer-1.0/* \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


