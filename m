Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383CBCF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 17:18:36 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.17393.1727543907604222394
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 10:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 078A41107E
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 19:17:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.24]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sub4Y-0nkCXp0; Sat, 28 Sep 2024 19:17:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: add patch to fix zero initialization
Date: Sat, 28 Sep 2024 19:19:17 +0200
Message-ID: <20240928171917.545696-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727543854-DE7FA48D-DEFABE9C/0/0 CLEAN NORMAL
X-TOI-MSGID: 7b24fdf2-accf-4a40-b5cc-668fa4d9f81f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 17:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112543

There are issues at least in combination with kodi
[https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4325]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...er.h-avoid-missing-field-intializers.patch | 41 +++++++++++++++++++
 .../pipewire/pipewire_1.2.5.bb                |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/000=
1-parser.h-avoid-missing-field-intializers.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0001-parse=
r.h-avoid-missing-field-intializers.patch b/meta-multimedia/recipes-multi=
media/pipewire/files/0001-parser.h-avoid-missing-field-intializers.patch
new file mode 100644
index 000000000..daeff7e13
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/files/0001-parser.h-avo=
id-missing-field-intializers.patch
@@ -0,0 +1,41 @@
+From a6d8d98845754b015e2e155c396091b0791a23c9 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 28 Sep 2024 18:39:43 +0200
+Subject: [PATCH] fix zero initialization
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipe=
wire/-/issues/4325]
+---
+ spa/include/spa/pod/builder.h | 2 +-
+ spa/include/spa/pod/parser.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/spa/include/spa/pod/builder.h b/spa/include/spa/pod/builder=
.h
+index 0564d94ea..b0487bf48 100644
+--- a/spa/include/spa/pod/builder.h
++++ b/spa/include/spa/pod/builder.h
+@@ -49,7 +49,7 @@ struct spa_pod_builder {
+ 	struct spa_callbacks callbacks;
+ };
+=20
+-#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {0}, {0} })
++#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {}, {} })
+=20
+ static inline void
+ spa_pod_builder_get_state(struct spa_pod_builder *builder, struct spa_p=
od_builder_state *state)
+diff --git a/spa/include/spa/pod/parser.h b/spa/include/spa/pod/parser.h
+index 083f91171..387298927 100644
+--- a/spa/include/spa/pod/parser.h
++++ b/spa/include/spa/pod/parser.h
+@@ -33,7 +33,7 @@ struct spa_pod_parser {
+ 	struct spa_pod_parser_state state;
+ };
+=20
+-#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {0} })
++#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {} })
+=20
+ static inline void spa_pod_parser_init(struct spa_pod_parser *parser,
+ 				       const void *data, uint32_t size)
+--=20
+2.46.0
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
index b37ae0a53..a02c5de8c 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
@@ -14,6 +14,7 @@ DEPENDS =3D "dbus ncurses"
=20
 SRCREV =3D "71fac7fa818f21234da4c356de0b44e47e1a2ef2"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
+SRC_URI +=3D "file://0001-parser.h-avoid-missing-field-intializers.patch=
"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.46.0


