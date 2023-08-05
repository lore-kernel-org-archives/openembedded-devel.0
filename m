Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57964EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 05:58:29 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.1446.1691215099054361535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 22:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout09.t-online.de (Postfix) with SMTP id 733DCAFF1
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:58:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.235]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qSAIq-27FpMf0; Sat, 5 Aug 2023 07:58:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: add support for liblc3
Date: Sat,  5 Aug 2023 07:57:55 +0200
Message-ID: <20230805055755.212192-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691215096-F67E2EBC-D456BE37/0/0 CLEAN NORMAL
X-TOI-MSGID: a43e119a-36cb-484d-afdf-657283eda8aa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 05:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104232

- add liblc3 recipe

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/liblc3/liblc3_1.0.4.bb      | 14 ++++++++++++++
 .../recipes-multimedia/pipewire/pipewire_0.3.77.bb |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.=
4.bb

diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb b/=
meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
new file mode 100644
index 0000000000..7f531efc63
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.0.4.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Low Complexity Communication Codec (LC3)"
+HOMEPAGE =3D "https://github.com/google/liblc3"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+SRC_URI =3D "git://github.com/google/liblc3.git;protocol=3Dhttps;branch=3D=
main"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "1a5938ebaca4f13fe79ce074f5dee079783aa29f"
+
+inherit pkgconfig meson
+
+BBCLASSEXTEND =3D "native nativesdk"
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
index d4b725ba34..34b372096a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
@@ -101,6 +101,7 @@ PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3D=
disabled,avahi"
 PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
 PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
 PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
+PACKAGECONFIG[bluez-lc3] =3D "-Dbluez5-codec-lc3=3Denabled,-Dbluez5-code=
c-lc3=3Ddisabled,liblc3"
 # From the pipewire git log:
 # "Some Linux phones doesn't use oFono but ModemManager to control the m=
odem."
 # This packageconfig enables modemmanager specific code in the BlueZ bac=
kend.
--=20
2.41.0


