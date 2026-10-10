Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720BDCA6017
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:54:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5390.1791618857462968143
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=U46phUVV;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id 370A2857
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:54:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.158]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRuG-3wF0HR0; Sat, 10 Oct 2026 09:54:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blacksail][meta-gnome][PATCHv2 2/3] Revert "gnome-shell: upgrade 50.4 -> 51.0"
Date: Sat, 10 Oct 2026 09:54:04 +0200
Message-ID: <20261010075405.1740272-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010075405.1740272-1-f_l_k@t-online.de>
References: <20261010075405.1740272-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791618852-0FFFCBCA-6422FA29/0/0 CLEAN NORMAL
X-TOI-MSGID: 448e7215-55a0-45de-8f93-57c1e213b3cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618855; i=f_l_k@t-online.de;
	bh=3BWbnuL61RleEShsd+vAr2p78v5WZV1M/3Q5LLv2OtY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=U46phUVVDsIaylPDm/EqwFVhs7gz4cfv6q8UDH3TKjZPUEEXqB3esGt9S71AlLm9E
	 gaM726mdAkp1Sz0ZMFPmxSdl9U0qRnTCnD7svXXQVtKYuV7WwGiXFkSW33lIQE7rsv
	 inmfMZaGKNxAHM7nkITYkJ7JEX3n4O29nSZLcHkHbhh+A5qcZjAYlAIAwXGBaPNreN
	 v1qI5kiHRJofRisTCY1X8Uv8FvPmN0Qx9+UR0r3xhUo/SdoH9CJXeDfj/RyaK83SNQ
	 7kjtXN4SUWqmD1mLn+39+0TkcE2MFWcPRbvo5s7rk9V8Jv90IMtJRTD5ocSFGx3lfn
	 QrcH/sNXdaMXQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130722

This reverts commit d22efe5c4c2252226b8644ee805863d3c3b5e446.

gnome-shell 51.0 needs mutter >=3D 51.0, which goes back to 50.4 on
blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ver-Fix-build-failure-with-libical-4.patch | 44 +++++++++++++++++++
 ...nome-shell_51.0.bb =3D> gnome-shell_50.4.bb} |  7 ++-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002=
-calendar-server-Fix-build-failure-with-libical-4.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_51.0.bb =3D> gn=
ome-shell_50.4.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calend=
ar-server-Fix-build-failure-with-libical-4.patch b/meta-gnome/recipes-gno=
me/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-li=
bical-4.patch
new file mode 100644
index 0000000000..d64cf38ccc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-serv=
er-Fix-build-failure-with-libical-4.patch
@@ -0,0 +1,44 @@
+From 91eaa9221b45b506d7a5d84a9ec8c204b5c8c34f Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@xry111.site>
+Date: Fri, 8 May 2026 13:13:37 +0800
+Subject: [PATCH] calendar-server: Fix build failure with libical 4
+
+Fix the following build error with libical 4 due to function signature c=
hanges:
+
+    error: passing argument 4 of 'get_time_from_property' from incompati=
ble pointer type [-Wincompatible-pointer-types]
+    note: expected 'ICalTime * (*)(ICalProperty *)' but argument is of t=
ype 'ICalTime * (*)(const ICalProperty *)'
+
+Link: https://github.com/libical/libical/blob/4.0/docs/MigrationGuide_to=
_4.md
+Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/42=
15>
+
+Only the gnome-shell-calendar-server.c hunk of the upstream commit is ta=
ken;
+src/calendar-server/reminder-watcher.c does not exist in the 50.x series=
.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/=
commit/b34766f3992c7616b7816a47249fb463c053e5fa]
+---
+ src/calendar-server/gnome-shell-calendar-server.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/calendar-server/gnome-shell-calendar-server.c b/src/cal=
endar-server/gnome-shell-calendar-server.c
+index 0b2f88eb7..622c16181 100644
+--- a/src/calendar-server/gnome-shell-calendar-server.c
++++ b/src/calendar-server/gnome-shell-calendar-server.c
+@@ -112,11 +112,17 @@ typedef struct
+   time_t  end_time;
+ } CalendarAppointment;
+=20
++#if ICAL_CHECK_VERSION(4, 0, 0)
++typedef ICalTime * (* GetICalPropFunc) (const ICalProperty *prop);
++#else
++typedef ICalTime * (* GetICalPropFunc) (ICalProperty *prop);
++#endif
++
+ static gboolean
+ get_time_from_property (ECalClient            *cal,
+                         ICalComponent         *icomp,
+                         ICalPropertyKind       prop_kind,
+-                        ICalTime * (* get_prop_func) (ICalProperty *pro=
p),
++                        GetICalPropFunc        get_prop_func,
+                         ICalTimezone          *default_zone,
+                         ICalTime              **out_itt,
+                         ICalTimezone          **out_timezone)
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
index 549a3d5971..f39d72532e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
@@ -31,7 +31,8 @@ GIR_MESON_OPTION =3D ""
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
-SRC_URI[archive.sha256sum] =3D "2179bab13af353427065096af8bf3d30da7b86e0=
c516e5ba86a14998af9575f6"
+SRC_URI +=3D "file://0002-calendar-server-Fix-build-failure-with-libical=
-4.patch"
+SRC_URI[archive.sha256sum] =3D "c531939539db316a41aef23670370abd1330d325=
4f84bcb0f9f4dae5d6e362cf"
=20
 PACKAGECONFIG ??=3D " \
     camera-monitor \
@@ -43,6 +44,7 @@ PACKAGECONFIG ??=3D " \
 "
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
 PACKAGECONFIG[camera-monitor] =3D "-Dcamera_monitor=3Dtrue, -Dcamera_mon=
itor=3Dfalse, pipewire"
+PACKAGECONFIG[extensions-app] =3D "-Dextensions_app=3Dtrue, -Dextensions=
_app=3Dfalse"
 PACKAGECONFIG[extensions-tool] =3D "-Dextensions_tool=3Dtrue, -Dextensio=
ns_tool=3Dfalse, gnome-autoar json-glib libsoup-3.0"
 PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
, networkmanager libsecret, networkmanager"
 PACKAGECONFIG[portal-helper] =3D "-Dportal_helper=3Dtrue, -Dportal_helpe=
r=3Dfalse"
@@ -96,6 +98,9 @@ RDEPENDS:${PN} +=3D " \
 	librsvg-gtk \
 "
=20
+# The extensions app is a GJS application and pulls libadwaita at runtim=
e only.
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'extensions-a=
pp', 'libadwaita', '', d)}"
+
 PACKAGES =3D+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools =3D "${bindir}/*-tool"
 RDEPENDS:${PN}-tools =3D "python3-core"
--=20
2.55.0


