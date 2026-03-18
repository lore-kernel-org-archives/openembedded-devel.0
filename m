Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427A810775FD
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:47:18 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20523.1773856029099554425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Vorg+lMQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id 56A697DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 18:47:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.42.31]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w2uz3-428jKL0; Wed, 18 Mar 2026 18:47:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.6.0 -> 1.6.2
Date: Wed, 18 Mar 2026 18:46:58 +0100
Message-ID: <20260318174658.138693-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773856025-56FFA8FB-D414C916/0/0 CLEAN NORMAL
X-TOI-MSGID: be894420-4ca5-4fa5-be97-fd845775fabf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1773856026; i=f_l_k@t-online.de;
	bh=F/CJ2rc5OmTo4A4lDkqUWkCJRRo9DsaeAEUgQzRZ/Cc=;
	h=From:To:Subject:Date;
	b=Vorg+lMQh96aMSwchrD//UHzdw7S4OkO3ZhtORfPyxjAR0boyo+zzowsma+4TDay7
	 zOQ7O9mXdaSZ8Mx6jStQW+OJ2KBoHjBLp3usuozzsatlnZ9ATa70Gdf7yYMm4aM75V
	 REnsakM3ueURWxT0W0m+SvUzREbc2R3fNdvuCGciu9K14iC8fNovkXT8PFidCCRaI1
	 t03H+ZYQMCK9n+Fy8xSGYOh4lh8gbA7mm9OHgpV5/r30q9aAMoyT6vnHz0u3qjhsmu
	 0SBMwzj/B8J6qWEmIkz2e5XatWoVUmhaUuuKTB01brx7goi4NFkPa02en/ORvO4MB8
	 DZEk+En7exAYA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 17:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125361

- remove two backport patches

PipeWire 1.6.2 (2026-03-16)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a potential crash when the wrong memory was freed.
  - Fix a optimization with shared memory over some links that could
    cause errors later on.
  - Fix SOFA filter and default control input in LADSPA and LV2.
  - Some other small fixes and improvements.

PipeWire
  - Remove an optimization to skip share mem in links, it causes problems
    later on. (#5159)

Modules
  - Don't try to free invalid memory or close invalid fds when the client
    aborted before allocating buffer memory. (#5162)

SPA
  - support ACP_IGNORE_DB in udev.
  - Use 0x as a prefix for hex values.
  - Mark Props as write-only in libcamera.
  - Small optimization in the audio mixer.
  - Fix initialization of control properties for SOFA and biquads in the
    filter-graph. (#5152)
  - Fix min/max default values for LADSPA and LV2.

JACK
  - Fix jack_port_type_id(). Return values that are compatible with JACK1=
/2.

Older versions:

PipeWire 1.6.1 (2026-03-09)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix socket activation, which could cause a failure to start PipeWire =
in
    some setups.
  - Fix crashes in many JACK apps when nodes/ports are quickly added/remo=
ved
    such as when there are notifications (like when changing the volume i=
n
    KDE).
  - Fix playback of encoded formats in pw-cat again.
  - Some other smaller fixes and improvements.

Modules
  - Fix socket activation. (#5140)
  - Remove node.link-group from driver nodes.

SPA
  - Fix the libcamera stop sequence.

JACK
  - Never return NULL from jack_port_by_id(). (#3512)

GStreamer
  - Improve the timestamps on buffers.

Tools
  - Fix playback of encoded formats. (#5155)
---
 ...rotocol-native-Fix-socket-activation.patch | 86 ------------------
 ...ewide-fix-some-Wdiscarded-qualifiers.patch | 89 -------------------
 .../{pipewire_1.6.0.bb =3D> pipewire_1.6.2.bb}  |  6 +-
 3 files changed, 2 insertions(+), 179 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-module-protocol-native-Fix-socket-activation.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-treewide-fix-some-Wdiscarded-qualifiers.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.0.bb =3D=
> pipewire_1.6.2.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-mo=
dule-protocol-native-Fix-socket-activation.patch b/meta-multimedia/recipe=
s-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-act=
ivation.patch
deleted file mode 100644
index c345067932..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-pr=
otocol-native-Fix-socket-activation.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From f4e174870eb8cbe60c922d3bf181f3eb2347523c Mon Sep 17 00:00:00 2001
-From: Jonas Holmberg <jonashg@axis.com>
-Date: Mon, 2 Mar 2026 10:28:26 +0100
-Subject: [PATCH] module-protocol-native: Fix socket activation
-
-Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS since
-the function that uses it is called more than once and it was not unset
-when sd_listen_fds() was used.
-
-Fixes #5140
-Upstream-Status: Backport
-[https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870eb8c=
be60c922d3bf181f3eb2347523c]
----
- src/modules/module-protocol-native.c       |  2 +-
- src/modules/module-protocol-pulse/server.c |  2 +-
- src/modules/network-utils.h                | 14 +++++---------
- 3 files changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/src/modules/module-protocol-native.c b/src/modules/module-p=
rotocol-native.c
-index 2be92a847..98a43829b 100644
---- a/src/modules/module-protocol-native.c
-+++ b/src/modules/module-protocol-native.c
-@@ -907,7 +907,7 @@ static int add_socket(struct pw_protocol *protocol, =
struct server *s, struct soc
- 	bool activated =3D false;
-=20
- 	{
--		int i, n =3D listen_fd();
-+		int i, n =3D listen_fds();
- 		for (i =3D 0; i < n; ++i) {
- 			if (is_socket_unix(LISTEN_FDS_START + i, SOCK_STREAM,
- 						s->addr.sun_path) > 0) {
-diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules/mo=
dule-protocol-pulse/server.c
-index aeab710b0..637757dfd 100644
---- a/src/modules/module-protocol-pulse/server.c
-+++ b/src/modules/module-protocol-pulse/server.c
-@@ -576,7 +576,7 @@ static bool is_stale_socket(int fd, const struct soc=
kaddr_un *addr_un)
-=20
- static int check_socket_activation(const char *path)
- {
--	const int n =3D listen_fd();
-+	const int n =3D listen_fds();
-=20
- 	for (int i =3D 0; i < n; i++) {
- 		const int fd =3D LISTEN_FDS_START + i;
-diff --git a/src/modules/network-utils.h b/src/modules/network-utils.h
-index a89b7d3bd..6ff80dd7a 100644
---- a/src/modules/network-utils.h
-+++ b/src/modules/network-utils.h
-@@ -143,7 +143,7 @@ static inline bool pw_net_addr_is_any(struct sockadd=
r_storage *addr)
-=20
- /* Returns the number of file descriptors passed for socket activation.
-  * Returns 0 if none, -1 on error. */
--static inline int listen_fd(void)
-+static inline int listen_fds(void)
- {
- 	uint32_t n;
- 	int i, flags;
-@@ -161,8 +161,6 @@ static inline int listen_fd(void)
- 			return -1;
- 	}
-=20
--	unsetenv("LISTEN_FDS");
--
- 	return (int)n;
- }
-=20
-@@ -192,12 +190,10 @@ static inline int is_socket_unix(int fd, int type,=
 const char *path)
- 		if (addr.sun_family !=3D AF_UNIX)
- 			return 0;
- 		size_t length =3D strlen(path);
--		if (length > 0) {
--			if (len < offsetof(struct sockaddr_un, sun_path) + length)
--				return 0;
--			if (memcmp(addr.sun_path, path, length) !=3D 0)
--				return 0;
--		}
-+		if (len < offsetof(struct sockaddr_un, sun_path) + length + 1)
-+			return 0;
-+		if (memcmp(addr.sun_path, path, length + 1) !=3D 0)
-+			return 0;
- 	}
-=20
- 	return 1;
---=20
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-tr=
eewide-fix-some-Wdiscarded-qualifiers.patch b/meta-multimedia/recipes-mul=
timedia/pipewire/pipewire/0001-treewide-fix-some-Wdiscarded-qualifiers.pa=
tch
deleted file mode 100644
index e8e677910b..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-treewide-=
fix-some-Wdiscarded-qualifiers.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From fa64e2873682180eae5ce5bd02298fa6739cf005 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Barnab=3DC3=3DA1s=3D20P=3DC5=3D91cze?=3D <pobrn@proton=
mail.com>
-Date: Thu, 19 Feb 2026 20:56:36 +0100
-Subject: [PATCH] treewide: fix some `-Wdiscarded-qualifiers`
-
-Newer glibc versions have made certain `str*()` functions into macros
-that ensure that the const-ness of the argument is propagated to the
-return type.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [https://github.com/PipeWire/pipewire/commit/e=
46bfe67b60458e444ee2495209144b49e97d2f1]
----
- pipewire-jack/src/pipewire-jack.c | 2 +-
- spa/plugins/bluez5/bluez5-dbus.c  | 7 ++-----
- spa/plugins/support/logger.c      | 4 ++--
- 3 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/pipewire-jack/src/pipewire-jack.c b/pipewire-jack/src/pipew=
ire-jack.c
-index 1bef74283..73627a67e 100644
---- a/pipewire-jack/src/pipewire-jack.c
-+++ b/pipewire-jack/src/pipewire-jack.c
-@@ -5318,7 +5318,7 @@ int jack_set_freewheel(jack_client_t* client, int =
onoff)
- 	pw_thread_loop_lock(c->context.loop);
- 	str =3D pw_properties_get(c->props, PW_KEY_NODE_GROUP);
- 	if (str !=3D NULL) {
--		char *p =3D strstr(str, ",pipewire.freewheel");
-+		const char *p =3D strstr(str, ",pipewire.freewheel");
- 		if (p =3D=3D NULL)
- 			p =3D strstr(str, "pipewire.freewheel");
- 		if (p =3D=3D NULL && onoff)
-diff --git a/spa/plugins/bluez5/bluez5-dbus.c b/spa/plugins/bluez5/bluez=
5-dbus.c
-index 21a5e53de..7dfe45911 100644
---- a/spa/plugins/bluez5/bluez5-dbus.c
-+++ b/spa/plugins/bluez5/bluez5-dbus.c
-@@ -720,14 +720,12 @@ static const char *bap_features_get_uuid(struct ba=
p_features *feat, size_t i)
- /** Get feature name at \a i, or NULL if uuid doesn't match */
- static const char *bap_features_get_name(struct bap_features *feat, siz=
e_t i, const char *uuid)
- {
--	char *pos;
--
- 	if (i >=3D feat->dict.n_items)
- 		return NULL;
- 	if (!spa_streq(feat->dict.items[i].value, uuid))
- 		return NULL;
-=20
--	pos =3D strchr(feat->dict.items[i].key, ':');
-+	const char *pos =3D strchr(feat->dict.items[i].key, ':');
- 	if (!pos)
- 		return NULL;
- 	return pos + 1;
-@@ -1336,7 +1334,6 @@ static struct spa_bt_adapter *adapter_find(struct =
spa_bt_monitor *monitor, const
- static int parse_modalias(const char *modalias, uint16_t *source, uint1=
6_t *vendor,
- 		uint16_t *product, uint16_t *version)
- {
--	char *pos;
- 	unsigned int src, i, j, k;
-=20
- 	if (spa_strstartswith(modalias, "bluetooth:"))
-@@ -1346,7 +1343,7 @@ static int parse_modalias(const char *modalias, ui=
nt16_t *source, uint16_t *vend
- 	else
- 		return -EINVAL;
-=20
--	pos =3D strchr(modalias, ':');
-+	const char *pos =3D strchr(modalias, ':');
- 	if (pos =3D=3D NULL)
- 		return -EINVAL;
-=20
-diff --git a/spa/plugins/support/logger.c b/spa/plugins/support/logger.c
-index c6e6ca4b8..6ea5f31b5 100644
---- a/spa/plugins/support/logger.c
-+++ b/spa/plugins/support/logger.c
-@@ -73,7 +73,7 @@ impl_log_logtv(void *object,
- 	char timestamp[18] =3D {0};
- 	char topicstr[32] =3D {0};
- 	char filename[64] =3D {0};
--	char location[1000 + RESERVED_LENGTH], *p, *s;
-+	char location[1000 + RESERVED_LENGTH], *p;
- 	static const char * const levels[] =3D { "-", "E", "W", "I", "D", "T",=
 "*T*" };
- 	const char *prefix =3D "", *suffix =3D "";
- 	int size, len;
-@@ -118,7 +118,7 @@ impl_log_logtv(void *object,
-=20
-=20
- 	if (impl->line && line !=3D 0) {
--		s =3D strrchr(file, '/');
-+		const char *s =3D strrchr(file, '/');
- 		spa_scnprintf(filename, sizeof(filename), "[%16.16s:%5i %s()]",
- 			s ? s + 1 : file, line, func);
- 	}
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
index 596e86845b..14e467fa33 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "700cea78dbe7564131d51b21a7795e2567ee048a"
+SRCREV =3D "95da54a482b68475958bbc3fa572a9c20df0df74"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV} \
-    file://0001-treewide-fix-some-Wdiscarded-qualifiers.patch \
-    file://0001-module-protocol-native-Fix-socket-activation.patch"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
 inherit meson pkgconfig systemd gettext useradd
=20
--=20
2.53.0


