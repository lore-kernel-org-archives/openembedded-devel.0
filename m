Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073E5C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:00:41 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56739.1790596840239026086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=K/v+BPvr;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 9AE40A0B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:00:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.132]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBA26-41AEZE0; Mon, 28 Sep 2026 14:00:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] kmscon: treat platform display controllers as primary GPUs
Date: Mon, 28 Sep 2026 14:00:16 +0200
Message-ID: <20260928120016.43158-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790596834-DEFFA9F5-8B05C86E/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b66e5fe-5626-417a-8743-3da0b4bc669e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790596837; i=f_l_k@t-online.de;
	bh=Lj4efS7qHOSOPrZ6cJWnBYlM3t9+1eF6HWPOOwMZhiU=;
	h=From:To:Subject:Date;
	b=K/v+BPvrzlGrwHEqqorjACsw39aIxeNJlB0pLPnQW89L/BNXlnhRKGfhtGbbMX3GQ
	 8fwDmLhY5ZsWDURyh/sx0IkEF4yJU9CzuEAJyH94Hm8TlxeRISK3XPX2dgIKiAsSJn
	 PtCLgXfGBJ2pIyExW7lBaAiU5V9drAfaVBokl+cg3mlFHKWQM6+mOHWOglZfcSDAb6
	 MshoQsBRD+mawcEIbpaDc49VRv2qvrzimVqc7MHvGrNHJaKIVrfz2+d8g2VZSeqhfK
	 Cn9KlbGjxP2tnsTErpdJCicOexYv66Xtgj/O38sa3GVraUCtoAw1OvgUBs1pZWmv9N
	 gT7INr2wK19qQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130433

kmscon only counted a GPU as primary when its PCI parent had boot_vga
set, so with gpus=3Dprimary it ignored vc4 on the Raspberry Pi 4 and neve=
r
showed a terminal. Treat DRM devices on the platform bus as primary,
except for the firmware framebuffer drivers. Tested on a Raspberry Pi 4
booting through EDK2.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-display-controllers-as-primary-GPUs.patch | 84 +++++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_10.0.1.bb  |  5 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_mon=
itor-treat-platform-display-controllers-as-primary-GPUs.patch

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-tr=
eat-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-=
graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controll=
ers-as-primary-GPUs.patch
new file mode 100644
index 0000000000..c85607783c
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-pla=
tform-display-controllers-as-primary-GPUs.patch
@@ -0,0 +1,84 @@
+From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 26 Sep 2026 10:00:57 +0200
+Subject: [PATCH] uterm_monitor: treat platform display controllers as pr=
imary
+ GPUs
+
+A GPU only counted as primary when its PCI parent had boot_vga set.
+SoC display controllers such as vc4 on the Raspberry Pi are platform
+devices without a PCI parent, so with gpus=3Dprimary kmscon ignored the
+only display in the system and never showed a terminal.
+
+Treat DRM devices on the platform bus as primary, except for the
+simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only
+stand in until the native driver has loaded.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5.5)
+---
+ src/uterm_monitor.c | 29 ++++++++++++++++++++++++++---
+ 1 file changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c
+index d89bfa1..25ec91f 100644
+--- a/src/uterm_monitor.c
++++ b/src/uterm_monitor.c
+@@ -234,10 +234,15 @@ out_close:
+ 	return flags;
+ }
+=20
+-static bool is_drm_primary(struct uterm_monitor *mon, struct udev_devic=
e *dev, const char *node)
++static char *get_drm_name(int fd);
++
++static bool is_drm_primary(struct uterm_monitor *mon, struct udev_devic=
e *dev, const char *node,
++			   int fd)
+ {
+ 	struct udev_device *pci;
+ 	const char *id;
++	char *name;
++	bool res;
+=20
+ 	pci =3D udev_device_get_parent_with_subsystem_devtype(dev, "pci", NULL=
);
+ 	if (pci) {
+@@ -246,9 +251,27 @@ static bool is_drm_primary(struct uterm_monitor *mo=
n, struct udev_device *dev, c
+ 			log_debug("DRM device %s is primary PCI GPU", node);
+ 			return true;
+ 		}
++		return false;
+ 	}
+=20
+-	return false;
++	/*
++	 * SoC display controllers are platform devices without a boot_vga
++	 * attribute. Treat them as primary, except for the generic firmware
++	 * framebuffer drivers that only stand in until the real driver loads.
++	 */
++	if (!udev_device_get_parent_with_subsystem_devtype(dev, "platform", NU=
LL))
++		return false;
++
++	name =3D get_drm_name(fd);
++	if (!name)
++		return false;
++
++	res =3D strcmp(name, "simpledrm") && strcmp(name, "efidrm") && strcmp(=
name, "vesadrm") &&
++	      strcmp(name, "ofdrm");
++	if (res)
++		log_debug("DRM device %s is primary platform GPU (%s)", node, name);
++	free(name);
++	return res;
+ }
+=20
+ /*
+@@ -334,7 +357,7 @@ static unsigned int get_drm_flags(struct uterm_monit=
or *mon, struct udev_device
+ 		return flags;
+ 	}
+=20
+-	if (is_drm_primary(mon, dev, node))
++	if (is_drm_primary(mon, dev, node, fd))
+ 		flags |=3D UTERM_MONITOR_PRIMARY;
+ 	if (is_drm_usb(mon, node, fd))
+ 		flags |=3D UTERM_MONITOR_AUX;
+--=20
+2.55.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb b/meta-oe/r=
ecipes-graphics/kmscon/kmscon_10.0.1.bb
index c5cfd527d5..0336649551 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
@@ -23,7 +23,10 @@ DEPENDS =3D "\
 SRC_URI =3D "git://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dma=
in;tag=3Dv${PV}"
 SRCREV =3D "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
=20
-SRC_URI +=3D "file://0001-terminal-open-the-pty-only-once-a-display-is-a=
ttached.patch"
+SRC_URI +=3D " \
+    file://0001-terminal-open-the-pty-only-once-a-display-is-attached.pa=
tch \
+    file://0002-uterm_monitor-treat-platform-display-controllers-as-prim=
ary-GPUs.patch \
+"
=20
 inherit meson pkgconfig systemd
=20
--=20
2.55.0


