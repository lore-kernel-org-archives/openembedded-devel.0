Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B98BCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:04:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55778.1790597045464400682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=frtPFYz/;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout01.t-online.de (Postfix) with SMTP id 059C61C2D8
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 14:04:03 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.40.132]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBA5M-2yqiMS0; Mon, 28 Sep 2026 14:03:56 +0200
Date: Mon, 28 Sep 2026 14:03:50 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] kmscon: treat platform display
 controllers as primary GPUs
To: openembedded-devel@lists.openembedded.org
Message-Id: <EIP2MT.OK4FEQSC3TWN1@t-online>
In-Reply-To: <18D97A56FA04FDE1.2498962@lists.openembedded.org>
References: <18D97A56FA04FDE1.2498962@lists.openembedded.org>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1ekHrBqFEg2EontUJaph"
X-TOI-EXPURGATEID: 150726::1790597036-DA7FB99C-561C9C36/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d6736f8-b483-4941-945a-66197f4a7155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790597042; i=f_l_k@t-online.de;
	bh=3UxwA903w7SbF7nMo1D67S1tN7fb8M92e8BPOvpXY8s=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=frtPFYz/7UlsfaWOPSfxjP0LGEDI5XYYbSYG0Flgpfp0wJMnDDkvyHYr+bX74PKIe
	 23tVvfflA010WZFlcEExfXvpO5LXv+vWYxUc58NR+MH190ttqpMbvTP430WnaMDPRD
	 SyhpaAebCGaaQ6m89sc0i4Jw+nQ7eXBb3MM6lkDwMoFUFRsyxOZrrOAvJ/UeSP8F33
	 G4pCSZdlYuzUpr+jimsahnqCwImW9ygWBhehvTGmw8M+qov0sGISqik6Q5nWaVBFCD
	 GiPVidarb9BcJ2Ykzzfc0cX4kVnntfPI05WiCYSw36yAcyHQ7Os3caSqis80RMIV0x
	 ie5zxUj4IB4Uw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130434

--=-1ekHrBqFEg2EontUJaph
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: I tested all the previous issues again on actual hardware. The RPi 
won't boot without the patch, but it does with it. The Intel ARC is 
behaving normally and is no longer flooding the journal.

On Mon, Sep 28 2026 at 14:00:16 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> kmscon only counted a GPU as primary when its PCI parent had boot_vga
> set, so with gpus=primary it ignored vc4 on the Raspberry Pi 4 and 
> never
> showed a terminal. Treat DRM devices on the platform bus as primary,
> except for the firmware framebuffer drivers. Tested on a Raspberry Pi 
> 4
> booting through EDK2.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-display-controllers-as-primary-GPUs.patch | 84 
> +++++++++++++++++++
>  .../recipes-graphics/kmscon/kmscon_10.0.1.bb  |  5 +-
>  2 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644 
> meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
> 
> diff --git 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
> new file mode 100644
> index 0000000000..c85607783c
> --- /dev/null
> +++ 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
> @@ -0,0 +1,84 @@
> +From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Sat, 26 Sep 2026 10:00:57 +0200
> +Subject: [PATCH] uterm_monitor: treat platform display controllers 
> as primary
> + GPUs
> +
> +A GPU only counted as primary when its PCI parent had boot_vga set.
> +SoC display controllers such as vc4 on the Raspberry Pi are platform
> +devices without a PCI parent, so with gpus=primary kmscon ignored the
> +only display in the system and never showed a terminal.
> +
> +Treat DRM devices on the platform bus as primary, except for the
> +simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only
> +stand in until the native driver has loaded.
> +
> +Upstream-Status: Pending
> +
> +AI-Generated: Uses Claude Code (Claude Opus 5.5)
> +---
> + src/uterm_monitor.c | 29 ++++++++++++++++++++++++++---
> + 1 file changed, 26 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c
> +index d89bfa1..25ec91f 100644
> +--- a/src/uterm_monitor.c
> ++++ b/src/uterm_monitor.c
> +@@ -234,10 +234,15 @@ out_close:
> + 	return flags;
> + }
> +
> +-static bool is_drm_primary(struct uterm_monitor *mon, struct 
> udev_device *dev, const char *node)
> ++static char *get_drm_name(int fd);
> ++
> ++static bool is_drm_primary(struct uterm_monitor *mon, struct 
> udev_device *dev, const char *node,
> ++			   int fd)
> + {
> + 	struct udev_device *pci;
> + 	const char *id;
> ++	char *name;
> ++	bool res;
> +
> + 	pci = udev_device_get_parent_with_subsystem_devtype(dev, "pci", 
> NULL);
> + 	if (pci) {
> +@@ -246,9 +251,27 @@ static bool is_drm_primary(struct uterm_monitor 
> *mon, struct udev_device *dev, c
> + 			log_debug("DRM device %s is primary PCI GPU", node);
> + 			return true;
> + 		}
> ++		return false;
> + 	}
> +
> +-	return false;
> ++	/*
> ++	 * SoC display controllers are platform devices without a boot_vga
> ++	 * attribute. Treat them as primary, except for the generic 
> firmware
> ++	 * framebuffer drivers that only stand in until the real driver 
> loads.
> ++	 */
> ++	if (!udev_device_get_parent_with_subsystem_devtype(dev, 
> "platform", NULL))
> ++		return false;
> ++
> ++	name = get_drm_name(fd);
> ++	if (!name)
> ++		return false;
> ++
> ++	res = strcmp(name, "simpledrm") && strcmp(name, "efidrm") && 
> strcmp(name, "vesadrm") &&
> ++	      strcmp(name, "ofdrm");
> ++	if (res)
> ++		log_debug("DRM device %s is primary platform GPU (%s)", node, 
> name);
> ++	free(name);
> ++	return res;
> + }
> +
> + /*
> +@@ -334,7 +357,7 @@ static unsigned int get_drm_flags(struct 
> uterm_monitor *mon, struct udev_device
> + 		return flags;
> + 	}
> +
> +-	if (is_drm_primary(mon, dev, node))
> ++	if (is_drm_primary(mon, dev, node, fd))
> + 		flags |= UTERM_MONITOR_PRIMARY;
> + 	if (is_drm_usb(mon, node, fd))
> + 		flags |= UTERM_MONITOR_AUX;
> +--
> +2.55.0
> +
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb 
> b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> index c5cfd527d5..0336649551 100644
> --- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> @@ -23,7 +23,10 @@ DEPENDS = "\
>  SRC_URI = 
> "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
>  SRCREV = "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
> 
> -SRC_URI += 
> "file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch" 
> <file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch/>
> +SRC_URI += " \
> +    
> file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch 
> <file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch/> 
> \
> +    
> file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch 
> <file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-gpus.patch/> 
> \
> +"
> 
>  inherit meson pkgconfig systemd
> 
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130433): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130433>
> Mute This Topic: <https://lists.openembedded.org/mt/121469845/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-1ekHrBqFEg2EontUJaph
Content-Type: text/html; charset=us-ascii

<div id="convey-body" dir="auto"><div>v2: I tested all the previous issues again on actual hardware. The RPi won't boot without the patch, but it does with it. The Intel ARC is behaving normally and is no longer flooding the journal.</div></div><div id="convey-quote" dir="auto"><br>On Mon, Sep 28 2026 at 14:00:16 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">kmscon only counted a GPU as primary when its PCI parent had boot_vga
set, so with gpus=primary it ignored vc4 on the Raspberry Pi 4 and never
showed a terminal. Treat DRM devices on the platform bus as primary,
except for the firmware framebuffer drivers. Tested on a Raspberry Pi 4
booting through EDK2.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-display-controllers-as-primary-GPUs.patch | 84 +++++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_10.0.1.bb  |  5 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
new file mode 100644
index 0000000000..c85607783c
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
@@ -0,0 +1,84 @@
+From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Sat, 26 Sep 2026 10:00:57 +0200
+Subject: [PATCH] uterm_monitor: treat platform display controllers as primary
+ GPUs
+
+A GPU only counted as primary when its PCI parent had boot_vga set.
+SoC display controllers such as vc4 on the Raspberry Pi are platform
+devices without a PCI parent, so with gpus=primary kmscon ignored the
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
+ 
+-static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, const char *node)
++static char *get_drm_name(int fd);
++
++static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, const char *node,
++			   int fd)
+ {
+ 	struct udev_device *pci;
+ 	const char *id;
++	char *name;
++	bool res;
+ 
+ 	pci = udev_device_get_parent_with_subsystem_devtype(dev, "pci", NULL);
+ 	if (pci) {
+@@ -246,9 +251,27 @@ static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, c
+ 			log_debug("DRM device %s is primary PCI GPU", node);
+ 			return true;
+ 		}
++		return false;
+ 	}
+ 
+-	return false;
++	/*
++	 * SoC display controllers are platform devices without a boot_vga
++	 * attribute. Treat them as primary, except for the generic firmware
++	 * framebuffer drivers that only stand in until the real driver loads.
++	 */
++	if (!udev_device_get_parent_with_subsystem_devtype(dev, "platform", NULL))
++		return false;
++
++	name = get_drm_name(fd);
++	if (!name)
++		return false;
++
++	res = strcmp(name, "simpledrm") &amp;&amp; strcmp(name, "efidrm") &amp;&amp; strcmp(name, "vesadrm") &amp;&amp;
++	      strcmp(name, "ofdrm");
++	if (res)
++		log_debug("DRM device %s is primary platform GPU (%s)", node, name);
++	free(name);
++	return res;
+ }
+ 
+ /*
+@@ -334,7 +357,7 @@ static unsigned int get_drm_flags(struct uterm_monitor *mon, struct udev_device
+ 		return flags;
+ 	}
+ 
+-	if (is_drm_primary(mon, dev, node))
++	if (is_drm_primary(mon, dev, node, fd))
+ 		flags |= UTERM_MONITOR_PRIMARY;
+ 	if (is_drm_usb(mon, node, fd))
+ 		flags |= UTERM_MONITOR_AUX;
+-- 
+2.55.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
index c5cfd527d5..0336649551 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
@@ -23,7 +23,10 @@ DEPENDS = "\
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
 
-SRC_URI += "<a href="file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch" "="">file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch"</a>
+SRC_URI += " \
+    <a href="file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch">file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch</a> \
+    <a href="file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch">file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch</a> \
+"
 
 inherit meson pkgconfig systemd
 
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130433): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130433">https://lists.openembedded.org/g/openembedded-devel/message/130433</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121469845/3618223">https://lists.openembedded.org/mt/121469845/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-1ekHrBqFEg2EontUJaph--


