Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F09CA6004
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 21:06:33 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1950.1791407185235480464
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 14:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=WF8WZ5Bn;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 3141E1C1CF
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Oct 2026 23:06:23 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.167.22]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xEYqB-03s3hA0; Wed, 7 Oct 2026 23:06:19 +0200
Date: Wed, 07 Oct 2026 23:06:12 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] kmscon: upgrade 10.0.1 -> 10.0.4
To: openembedded-devel@lists.openembedded.org
Message-Id: <DM2KMT.S8ES4Q6GIDOU3@t-online>
In-Reply-To: <18DC5B316D5BB4DF.3217699@lists.openembedded.org>
References: <18DC5B316D5BB4DF.3217699@lists.openembedded.org>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7wyqq6qfEKloM0EXoZ5h"
X-TOI-EXPURGATEID: 150726::1791407179-83FFC99C-EF1C1C44/0/0 CLEAN NORMAL
X-TOI-MSGID: 49ba7c97-5be1-485d-a3d6-5ac5b0ecbc15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791407183; i=f_l_k@t-online.de;
	bh=Ly9fA2zKbwLEGyG9p9LYwtbhzPscxTBWqa2ZU0cv+TI=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=WF8WZ5Bn0pA8MVkeraW2vINoELR0DC0I3RghZymqv77fOe2yfNWpuh7be+FGWWFT5
	 2F7dWiEAp4pIqLP0yTfUu6ABjFKt7l8pwENRkeEGwfVtXcmlfWTeutJlT44Xg+Jqso
	 ITPaWClOgTwroF1hSXxWI28FfDaN/WnYmC2AFUmTOt4LEOHoswRgRtlkmXvBpkjMUZ
	 b0a36Ik2NLubkyfS8PbQflblH4QzEAyauh2eiPpvJrJzI7Dz2U5QCuUfIzJ7ORerGN
	 8U687F4DjhV2cdoskbzjUrkSJMp6Avc7O9ZojqjMS63NcvsCbc66leKmZRtqr/VaTx
	 VRsfvTIlpBeIA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 21:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130662

--=-7wyqq6qfEKloM0EXoZ5h
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: update 
0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch to 
the one that was merged upstream and make its Upstream-Status Backport

On Wed, Oct 7 2026 at 23:03:19 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Drop the pty patch, the problem is fixed upstream since 10.0.2.
> Refresh the platform GPU patch to the version merged upstream,
> which also excludes USB displays from the primary GPUs. Backport the
> libseat build fix, 10.0.4 does not build with libseat otherwise.
> Tested on a Raspberry Pi 4 with gpus=primary.
> 
> License-Update: COPYING now states that the Unifont font is licensed
> under OFL-1.1 instead of GPL, drops the third-party notices for the
> dbus-loop, wcwidth and vt.c code and updates the path of the htable
> code to src/shl/htable.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-pty-only-once-a-display-is-attached.patch | 64 --------------
>  ...-display-controllers-as-primary-GPUs.patch | 53 ++++++++++++
>  ...-display-controllers-as-primary-GPUs.patch | 84 
> -------------------
>  ...x-build-error-due-to-logging-changes.patch | 32 +++++++
>  .../{kmscon_10.0.1.bb => kmscon_10.0.4.bb}    |  8 +-
>  5 files changed, 89 insertions(+), 152 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
>  create mode 100644 
> meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
>  delete mode 100644 
> meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
>  create mode 100644 
> meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
>  rename meta-oe/recipes-graphics/kmscon/{kmscon_10.0.1.bb => 
> kmscon_10.0.4.bb} (89%)
> 
> diff --git 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
> deleted file mode 100644
> index 68f2ccc157..0000000000
> --- 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From c63a880187db708b50d25c37b6fc1e24ed68492a Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Fri, 18 Sep 2026 21:52:35 +0200
> -Subject: [PATCH] terminal: open the pty only once a display is 
> attached
> -
> -The session type handed to the child (TERM_SESSION_TYPE=kms or fb) is
> -decided in terminal_open() from the displays attached at that moment.
> -On a real VT the first session is activated as soon as the seat wakes
> -up, which happens before the DRM display has finished probing, so the
> -login is spawned with TERM_SESSION_TYPE=fb even though the terminal
> -ends up on a KMS display a few hundred milliseconds later.
> -
> -Session managers such as uwsm rely on that variable to decide whether
> -they have to ask kmscon to release the display before starting a
> -compositor. With the wrong type the request is never sent, kmscon
> -keeps DRM master, and the compositor fails to open the device until 
> it
> -gives up.
> -
> -Defer opening the pty until the first display has been added to the
> -terminal, and open it from terminal_add_display() when the terminal 
> is
> -already awake at that point.
> -
> -Upstream-Status: Pending
> -
> -AI-Generated: Uses Claude Code (Claude Opus 5)
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ----
> - src/kmscon_terminal.c | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/kmscon_terminal.c b/src/kmscon_terminal.c
> -index 15b00b4..42b6cd9 100644
> ---- a/src/kmscon_terminal.c
> -+++ b/src/kmscon_terminal.c
> -@@ -107,6 +107,7 @@ struct kmscon_terminal {
> - #define BLINK_TIMER_NS (500 * 1000 * 1000)
> -
> - static int font_set(struct kmscon_terminal *term);
> -+static int terminal_open(struct kmscon_terminal *term);
> -
> - static void coord_to_cell(struct kmscon_terminal *term, int32_t x, 
> int32_t y, unsigned int *posx,
> - 			  unsigned int *posy)
> -@@ -726,6 +727,9 @@ int terminal_add_display(struct kmscon_terminal 
> *term, struct display *disp)
> - 	update_pointer_max_all(term);
> - 	display_ref(scr->disp);
> - 	do_redraw_screen(scr);
> -+
> -+	if (term->awake && !term->opened)
> -+		terminal_open(term);
> - 	return 0;
> -
> - err_text:
> -@@ -1124,7 +1128,7 @@ void terminal_activate(struct kmscon_terminal 
> *term)
> - {
> - 	term->awake = true;
> - 	ev_timer_enable(term->blink_timer);
> --	if (!term->opened)
> -+	if (!term->opened && !shl_dlist_empty(&term->screens))
> - 		terminal_open(term);
> - 	if (term->pointer.visible)
> - 		hw_cursor_show(term, term->pointer.x, term->pointer.y);
> ---
> -2.55.0
> -
> diff --git 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
> new file mode 100644
> index 0000000000..af0f829ebb
> --- /dev/null
> +++ 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
> @@ -0,0 +1,53 @@
> +From 92b87c18f67ba9c01b23b50d014c5c5cfa72717e Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Wed, 7 Oct 2026 13:09:58 +0200
> +Subject: [PATCH] uterm: treat platform display controllers as 
> primary GPUs
> +
> +A GPU only counted as primary when its PCI parent had boot_vga set.
> +SoC display controllers such as vc4 on the Raspberry Pi are platform
> +devices without a PCI parent, so with gpus=primary kmscon ignored the
> +only display in the system and never showed a terminal.
> +
> +Treat DRM devices on the platform bus as primary. USB displays are
> +excluded: on these systems the USB controller is a platform device 
> too,
> +so they would otherwise be taken as primary.
> +
> +Tested on a Raspberry Pi 4 with --gpus=primary: before, card0 (vc4)
> +was ignored as "no primary GPU"; now the terminal comes up on HDMI-A
> +with the drm2d backend. The USB exclusion is not tested on hardware.
> +
> +Assisted-By: Claude Opus 5.5
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Backport 
> [<https://github.com/kmscon/kmscon/pull/551/changes/e8d5af950b1046f060604932440306dd16c9039e>]
> +---
> + src/uterm/monitor.c | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/uterm/monitor.c b/src/uterm/monitor.c
> +index f2141969..ccb5e422 100644
> +--- a/src/uterm/monitor.c
> ++++ b/src/uterm/monitor.c
> +@@ -244,9 +244,21 @@ static bool is_drm_primary(struct uterm_monitor 
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
> ++	 * attribute. Treat them as primary. USB displays sit below a 
> platform
> ++	 * USB controller on such systems, but are never primary.
> ++	 */
> ++	if (udev_device_get_parent_with_subsystem_devtype(dev, "usb", 
> NULL))
> ++		return false;
> ++	if (!udev_device_get_parent_with_subsystem_devtype(dev, 
> "platform", NULL))
> ++		return false;
> ++
> ++	log_debug("DRM device %s is primary platform GPU", node);
> ++	return true;
> + }
> +
> + /*
> \ No newline at end of file
> diff --git 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
> deleted file mode 100644
> index c85607783c..0000000000
> --- 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Sat, 26 Sep 2026 10:00:57 +0200
> -Subject: [PATCH] uterm_monitor: treat platform display controllers 
> as primary
> - GPUs
> -
> -A GPU only counted as primary when its PCI parent had boot_vga set.
> -SoC display controllers such as vc4 on the Raspberry Pi are platform
> -devices without a PCI parent, so with gpus=primary kmscon ignored the
> -only display in the system and never showed a terminal.
> -
> -Treat DRM devices on the platform bus as primary, except for the
> -simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only
> -stand in until the native driver has loaded.
> -
> -Upstream-Status: Pending
> -
> -AI-Generated: Uses Claude Code (Claude Opus 5.5)
> ----
> - src/uterm_monitor.c | 29 ++++++++++++++++++++++++++---
> - 1 file changed, 26 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c
> -index d89bfa1..25ec91f 100644
> ---- a/src/uterm_monitor.c
> -+++ b/src/uterm_monitor.c
> -@@ -234,10 +234,15 @@ out_close:
> - 	return flags;
> - }
> -
> --static bool is_drm_primary(struct uterm_monitor *mon, struct 
> udev_device *dev, const char *node)
> -+static char *get_drm_name(int fd);
> -+
> -+static bool is_drm_primary(struct uterm_monitor *mon, struct 
> udev_device *dev, const char *node,
> -+			   int fd)
> - {
> - 	struct udev_device *pci;
> - 	const char *id;
> -+	char *name;
> -+	bool res;
> -
> - 	pci = udev_device_get_parent_with_subsystem_devtype(dev, "pci", 
> NULL);
> - 	if (pci) {
> -@@ -246,9 +251,27 @@ static bool is_drm_primary(struct uterm_monitor 
> *mon, struct udev_device *dev, c
> - 			log_debug("DRM device %s is primary PCI GPU", node);
> - 			return true;
> - 		}
> -+		return false;
> - 	}
> -
> --	return false;
> -+	/*
> -+	 * SoC display controllers are platform devices without a boot_vga
> -+	 * attribute. Treat them as primary, except for the generic 
> firmware
> -+	 * framebuffer drivers that only stand in until the real driver 
> loads.
> -+	 */
> -+	if (!udev_device_get_parent_with_subsystem_devtype(dev, 
> "platform", NULL))
> -+		return false;
> -+
> -+	name = get_drm_name(fd);
> -+	if (!name)
> -+		return false;
> -+
> -+	res = strcmp(name, "simpledrm") && strcmp(name, "efidrm") && 
> strcmp(name, "vesadrm") &&
> -+	      strcmp(name, "ofdrm");
> -+	if (res)
> -+		log_debug("DRM device %s is primary platform GPU (%s)", node, 
> name);
> -+	free(name);
> -+	return res;
> - }
> -
> - /*
> -@@ -334,7 +357,7 @@ static unsigned int get_drm_flags(struct 
> uterm_monitor *mon, struct udev_device
> - 		return flags;
> - 	}
> -
> --	if (is_drm_primary(mon, dev, node))
> -+	if (is_drm_primary(mon, dev, node, fd))
> - 		flags |= UTERM_MONITOR_PRIMARY;
> - 	if (is_drm_usb(mon, node, fd))
> - 		flags |= UTERM_MONITOR_AUX;
> ---
> -2.55.0
> -
> diff --git 
> a/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
> new file mode 100644
> index 0000000000..63db2e5297
> --- /dev/null
> +++ 
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
> @@ -0,0 +1,32 @@
> +From 153db63d679df719a99dd36505f9c2f55d9c59f6 Mon Sep 17 00:00:00 
> 2001
> +From: Jocelyn Falempe <jfalempe@redhat.com 
> <mailto:jfalempe@redhat.com>>
> +Date: Mon, 28 Sep 2026 11:46:21 +0200
> +Subject: [PATCH] vt_libseat: Fix build error due to logging changes
> +
> +Commit "efda2b5 log: Simplify logging, remove timestamp, and level 
> for notice and info."
> +changed the log_submit() arguments, and this was not updated in
> +vt_libseat.c
> +
> +Upstream-Status: Backport 
> [<https://github.com/kmscon/kmscon/commit/153db63d679df719a99dd36505f9c2f55d9c59f6>]
> +
> +Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com 
> <mailto:jfalempe@redhat.com>>
> +---
> + src/uterm/vt_libseat.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/uterm/vt_libseat.c b/src/uterm/vt_libseat.c
> +index 4f65c84..2097628 100644
> +--- a/src/uterm/vt_libseat.c
> ++++ b/src/uterm/vt_libseat.c
> +@@ -260,7 +260,7 @@ static enum log_severity log_level(enum 
> libseat_log_level level)
> +
> + static void log_libseat(enum libseat_log_level level, const char 
> *fmt, va_list args)
> + {
> +-	log_submit(LOG_DEFAULT, log_level(level), fmt, args);
> ++	log_submit(log_level(level), "libseat", fmt, args);
> + }
> +
> + static void vt_libseat_input(struct input *input, struct 
> input_key_event *ev, void *data)
> +--
> +2.55.0
> +
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb 
> b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> rename to meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
> index 0336649551..400d9b5f59 100644
> --- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
> @@ -11,7 +11,7 @@ CVE_PRODUCT = "kmscon"
>  SECTION = "graphics"
> 
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=6d4602d249f8a3401040238e98367d9e" 
> <file://copying;md5=6d4602d249f8a3401040238e98367d9e/>
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=e88b340bd6389ec41d4cf634a770a771" 
> <file://copying;md5=e88b340bd6389ec41d4cf634a770a771/>
> 
>  DEPENDS = "\
>      libtsm \
> @@ -21,11 +21,11 @@ DEPENDS = "\
>  "
> 
>  SRC_URI = 
> "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
> -SRCREV = "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
> +SRCREV = "68fc8e1b2601e816e3a4ef95e3d8e700677509b9"
> 
>  SRC_URI += " \
> -    
> file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch 
> <file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch/> 
> \
> -    
> file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch 
> <file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-gpus.patch/> 
> \
> +    
> file://0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch 
> <file://0001-uterm-treat-platform-display-controllers-as-primary-gpus.patch/> 
> \
> +    
> file://0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch 
> <file://0002-vt_libseat-fix-build-error-due-to-logging-changes.patch/> 
> \
>  "
> 
>  inherit meson pkgconfig systemd
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130661): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130661>
> Mute This Topic: <https://lists.openembedded.org/mt/121635504/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-7wyqq6qfEKloM0EXoZ5h
Content-Type: text/html; charset=us-ascii

<div id="convey-body" dir="auto"><div>v2: update&nbsp;<span style="white-space: break-spaces;">0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch to the one that was merged upstream and make its Upstream-Status Backport</span></div></div><div id="convey-quote" dir="auto"><br>On Wed, Oct 7 2026 at 23:03:19 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Drop the pty patch, the problem is fixed upstream since 10.0.2.
Refresh the platform GPU patch to the version merged upstream,
which also excludes USB displays from the primary GPUs. Backport the
libseat build fix, 10.0.4 does not build with libseat otherwise.
Tested on a Raspberry Pi 4 with gpus=primary.

License-Update: COPYING now states that the Unifont font is licensed
under OFL-1.1 instead of GPL, drops the third-party notices for the
dbus-loop, wcwidth and vt.c code and updates the path of the htable
code to src/shl/htable.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-pty-only-once-a-display-is-attached.patch | 64 --------------
 ...-display-controllers-as-primary-GPUs.patch | 53 ++++++++++++
 ...-display-controllers-as-primary-GPUs.patch | 84 -------------------
 ...x-build-error-due-to-logging-changes.patch | 32 +++++++
 .../{kmscon_10.0.1.bb =&gt; kmscon_10.0.4.bb}    |  8 +-
 5 files changed, 89 insertions(+), 152 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
 delete mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
 rename meta-oe/recipes-graphics/kmscon/{kmscon_10.0.1.bb =&gt; kmscon_10.0.4.bb} (89%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
deleted file mode 100644
index 68f2ccc157..0000000000
--- a/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c63a880187db708b50d25c37b6fc1e24ed68492a Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Fri, 18 Sep 2026 21:52:35 +0200
-Subject: [PATCH] terminal: open the pty only once a display is attached
-
-The session type handed to the child (TERM_SESSION_TYPE=kms or fb) is
-decided in terminal_open() from the displays attached at that moment.
-On a real VT the first session is activated as soon as the seat wakes
-up, which happens before the DRM display has finished probing, so the
-login is spawned with TERM_SESSION_TYPE=fb even though the terminal
-ends up on a KMS display a few hundred milliseconds later.
-
-Session managers such as uwsm rely on that variable to decide whether
-they have to ask kmscon to release the display before starting a
-compositor. With the wrong type the request is never sent, kmscon
-keeps DRM master, and the compositor fails to open the device until it
-gives up.
-
-Defer opening the pty until the first display has been added to the
-terminal, and open it from terminal_add_display() when the terminal is
-already awake at that point.
-
-Upstream-Status: Pending
-
-AI-Generated: Uses Claude Code (Claude Opus 5)
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
----
- src/kmscon_terminal.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/kmscon_terminal.c b/src/kmscon_terminal.c
-index 15b00b4..42b6cd9 100644
---- a/src/kmscon_terminal.c
-+++ b/src/kmscon_terminal.c
-@@ -107,6 +107,7 @@ struct kmscon_terminal {
- #define BLINK_TIMER_NS (500 * 1000 * 1000)
- 
- static int font_set(struct kmscon_terminal *term);
-+static int terminal_open(struct kmscon_terminal *term);
- 
- static void coord_to_cell(struct kmscon_terminal *term, int32_t x, int32_t y, unsigned int *posx,
- 			  unsigned int *posy)
-@@ -726,6 +727,9 @@ int terminal_add_display(struct kmscon_terminal *term, struct display *disp)
- 	update_pointer_max_all(term);
- 	display_ref(scr-&gt;disp);
- 	do_redraw_screen(scr);
-+
-+	if (term-&gt;awake &amp;&amp; !term-&gt;opened)
-+		terminal_open(term);
- 	return 0;
- 
- err_text:
-@@ -1124,7 +1128,7 @@ void terminal_activate(struct kmscon_terminal *term)
- {
- 	term-&gt;awake = true;
- 	ev_timer_enable(term-&gt;blink_timer);
--	if (!term-&gt;opened)
-+	if (!term-&gt;opened &amp;&amp; !shl_dlist_empty(&amp;term-&gt;screens))
- 		terminal_open(term);
- 	if (term-&gt;pointer.visible)
- 		hw_cursor_show(term, term-&gt;pointer.x, term-&gt;pointer.y);
--- 
-2.55.0
-
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
new file mode 100644
index 0000000000..af0f829ebb
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch
@@ -0,0 +1,53 @@
+From 92b87c18f67ba9c01b23b50d014c5c5cfa72717e Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Wed, 7 Oct 2026 13:09:58 +0200
+Subject: [PATCH] uterm: treat platform display controllers as primary GPUs
+
+A GPU only counted as primary when its PCI parent had boot_vga set.
+SoC display controllers such as vc4 on the Raspberry Pi are platform
+devices without a PCI parent, so with gpus=primary kmscon ignored the
+only display in the system and never showed a terminal.
+
+Treat DRM devices on the platform bus as primary. USB displays are
+excluded: on these systems the USB controller is a platform device too,
+so they would otherwise be taken as primary.
+
+Tested on a Raspberry Pi 4 with --gpus=primary: before, card0 (vc4)
+was ignored as "no primary GPU"; now the terminal comes up on HDMI-A
+with the drm2d backend. The USB exclusion is not tested on hardware.
+
+Assisted-By: Claude Opus 5.5
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Upstream-Status: Backport [<a href="https://github.com/kmscon/kmscon/pull/551/changes/e8d5af950b1046f060604932440306dd16c9039e">https://github.com/kmscon/kmscon/pull/551/changes/e8d5af950b1046f060604932440306dd16c9039e</a>]
+---
+ src/uterm/monitor.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/uterm/monitor.c b/src/uterm/monitor.c
+index f2141969..ccb5e422 100644
+--- a/src/uterm/monitor.c
++++ b/src/uterm/monitor.c
+@@ -244,9 +244,21 @@ static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, c
+ 			log_debug("DRM device %s is primary PCI GPU", node);
+ 			return true;
+ 		}
++		return false;
+ 	}
+ 
+-	return false;
++	/*
++	 * SoC display controllers are platform devices without a boot_vga
++	 * attribute. Treat them as primary. USB displays sit below a platform
++	 * USB controller on such systems, but are never primary.
++	 */
++	if (udev_device_get_parent_with_subsystem_devtype(dev, "usb", NULL))
++		return false;
++	if (!udev_device_get_parent_with_subsystem_devtype(dev, "platform", NULL))
++		return false;
++
++	log_debug("DRM device %s is primary platform GPU", node);
++	return true;
+ }
+ 
+ /*
\ No newline at end of file
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
deleted file mode 100644
index c85607783c..0000000000
--- a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Sat, 26 Sep 2026 10:00:57 +0200
-Subject: [PATCH] uterm_monitor: treat platform display controllers as primary
- GPUs
-
-A GPU only counted as primary when its PCI parent had boot_vga set.
-SoC display controllers such as vc4 on the Raspberry Pi are platform
-devices without a PCI parent, so with gpus=primary kmscon ignored the
-only display in the system and never showed a terminal.
-
-Treat DRM devices on the platform bus as primary, except for the
-simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only
-stand in until the native driver has loaded.
-
-Upstream-Status: Pending
-
-AI-Generated: Uses Claude Code (Claude Opus 5.5)
----
- src/uterm_monitor.c | 29 ++++++++++++++++++++++++++---
- 1 file changed, 26 insertions(+), 3 deletions(-)
-
-diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c
-index d89bfa1..25ec91f 100644
---- a/src/uterm_monitor.c
-+++ b/src/uterm_monitor.c
-@@ -234,10 +234,15 @@ out_close:
- 	return flags;
- }
- 
--static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, const char *node)
-+static char *get_drm_name(int fd);
-+
-+static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, const char *node,
-+			   int fd)
- {
- 	struct udev_device *pci;
- 	const char *id;
-+	char *name;
-+	bool res;
- 
- 	pci = udev_device_get_parent_with_subsystem_devtype(dev, "pci", NULL);
- 	if (pci) {
-@@ -246,9 +251,27 @@ static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device *dev, c
- 			log_debug("DRM device %s is primary PCI GPU", node);
- 			return true;
- 		}
-+		return false;
- 	}
- 
--	return false;
-+	/*
-+	 * SoC display controllers are platform devices without a boot_vga
-+	 * attribute. Treat them as primary, except for the generic firmware
-+	 * framebuffer drivers that only stand in until the real driver loads.
-+	 */
-+	if (!udev_device_get_parent_with_subsystem_devtype(dev, "platform", NULL))
-+		return false;
-+
-+	name = get_drm_name(fd);
-+	if (!name)
-+		return false;
-+
-+	res = strcmp(name, "simpledrm") &amp;&amp; strcmp(name, "efidrm") &amp;&amp; strcmp(name, "vesadrm") &amp;&amp;
-+	      strcmp(name, "ofdrm");
-+	if (res)
-+		log_debug("DRM device %s is primary platform GPU (%s)", node, name);
-+	free(name);
-+	return res;
- }
- 
- /*
-@@ -334,7 +357,7 @@ static unsigned int get_drm_flags(struct uterm_monitor *mon, struct udev_device
- 		return flags;
- 	}
- 
--	if (is_drm_primary(mon, dev, node))
-+	if (is_drm_primary(mon, dev, node, fd))
- 		flags |= UTERM_MONITOR_PRIMARY;
- 	if (is_drm_usb(mon, node, fd))
- 		flags |= UTERM_MONITOR_AUX;
--- 
-2.55.0
-
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch b/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
new file mode 100644
index 0000000000..63db2e5297
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch
@@ -0,0 +1,32 @@
+From 153db63d679df719a99dd36505f9c2f55d9c59f6 Mon Sep 17 00:00:00 2001
+From: Jocelyn Falempe &lt;<a href="mailto:jfalempe@redhat.com">jfalempe@redhat.com</a>&gt;
+Date: Mon, 28 Sep 2026 11:46:21 +0200
+Subject: [PATCH] vt_libseat: Fix build error due to logging changes
+
+Commit "efda2b5 log: Simplify logging, remove timestamp, and level for notice and info."
+changed the log_submit() arguments, and this was not updated in
+vt_libseat.c
+
+Upstream-Status: Backport [<a href="https://github.com/kmscon/kmscon/commit/153db63d679df719a99dd36505f9c2f55d9c59f6">https://github.com/kmscon/kmscon/commit/153db63d679df719a99dd36505f9c2f55d9c59f6</a>]
+
+Signed-off-by: Jocelyn Falempe &lt;<a href="mailto:jfalempe@redhat.com">jfalempe@redhat.com</a>&gt;
+---
+ src/uterm/vt_libseat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/uterm/vt_libseat.c b/src/uterm/vt_libseat.c
+index 4f65c84..2097628 100644
+--- a/src/uterm/vt_libseat.c
++++ b/src/uterm/vt_libseat.c
+@@ -260,7 +260,7 @@ static enum log_severity log_level(enum libseat_log_level level)
+ 
+ static void log_libseat(enum libseat_log_level level, const char *fmt, va_list args)
+ {
+-	log_submit(LOG_DEFAULT, log_level(level), fmt, args);
++	log_submit(log_level(level), "libseat", fmt, args);
+ }
+ 
+ static void vt_libseat_input(struct input *input, struct input_key_event *ev, void *data)
+-- 
+2.55.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
similarity index 89%
rename from meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
index 0336649551..400d9b5f59 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.4.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "kmscon"
 SECTION = "graphics"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=6d4602d249f8a3401040238e98367d9e" "="">file://COPYING;md5=6d4602d249f8a3401040238e98367d9e"</a>
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=e88b340bd6389ec41d4cf634a770a771" "="">file://COPYING;md5=e88b340bd6389ec41d4cf634a770a771"</a>
 
 DEPENDS = "\
     libtsm \
@@ -21,11 +21,11 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
+SRCREV = "68fc8e1b2601e816e3a4ef95e3d8e700677509b9"
 
 SRC_URI += " \
-    <a href="file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch">file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch</a> \
-    <a href="file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch">file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-GPUs.patch</a> \
+    <a href="file://0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch">file://0001-uterm-treat-platform-display-controllers-as-primary-GPUs.patch</a> \
+    <a href="file://0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch">file://0002-vt_libseat-Fix-build-error-due-to-logging-changes.patch</a> \
 "
 
 inherit meson pkgconfig systemd
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130661): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130661">https://lists.openembedded.org/g/openembedded-devel/message/130661</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121635504/3618223">https://lists.openembedded.org/mt/121635504/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-7wyqq6qfEKloM0EXoZ5h--


