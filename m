Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B131AC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:03:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47291.1789992183515289427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vE9UTs7f;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout06.t-online.de (Postfix) with SMTP id A38471E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 14:03:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cjb-43SOqu0; Mon, 21 Sep 2026 14:02:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] kmscon: open the pty only once a display is attached
Date: Mon, 21 Sep 2026 14:02:52 +0200
Message-ID: <20260921120252.56179-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789992179-BDFF8950-55794487/0/0 CLEAN NORMAL
X-TOI-MSGID: ae75cdbc-456f-4327-b456-b18d9d1bdcd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789992181; i=f_l_k@t-online.de;
	bh=uuA1TQxGBylpAcwjLmnBOaF4Pqg2aV9v0rDmpNnxYas=;
	h=From:To:Subject:Date;
	b=vE9UTs7fou7BV2v74BRfikmMXvn2oCHRdKwMeb66Qwk5cJXKPGRFn0mg2/ekBzPav
	 Ivn98BG6P5sAvSUHtSK00nbgH6QIucM0MuO5eYbQqYFYYE3TWJUJz1giMdlM3m1OpM
	 0aAZ5OhwN4TSAJ2bymV0ryAC6TdAuEhtHu7Pau1bgwuMwS6Yk4vbvQ8msyShED06hm
	 0K5jtM55St4j9719uSIbmNitQXC3PfxbxN2rGBJ0wwi95KWvAYHLNM8+sy7p23Cdhz
	 03a5gTfBESBFMTY/BmlQ0ILBJ3NtZGSsLWk+pRVDf+g0VvepbiEhUF4wVq31GT/Sgr
	 yr4YUT4gSlIcA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130157

kmscon opened the pty as soon as the seat came up, so the shell started
and drew its prompt before any display was attached; on a system that
boots into a graphical session that left a stray prompt with a white
cursor in the top left corner until the compositor took over. Defer the
pty until a display is there.

AI-Generated: Uses Claude Code (Claude Opus 5)
---
 ...-pty-only-once-a-display-is-attached.patch | 64 +++++++++++++++++++
 .../recipes-graphics/kmscon/kmscon_10.0.1.bb  |  2 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-=
open-the-pty-only-once-a-display-is-attached.patch

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-th=
e-pty-only-once-a-display-is-attached.patch b/meta-oe/recipes-graphics/km=
scon/kmscon/0001-terminal-open-the-pty-only-once-a-display-is-attached.pa=
tch
new file mode 100644
index 0000000000..68f2ccc157
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0001-terminal-open-the-pty-o=
nly-once-a-display-is-attached.patch
@@ -0,0 +1,64 @@
+From c63a880187db708b50d25c37b6fc1e24ed68492a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 18 Sep 2026 21:52:35 +0200
+Subject: [PATCH] terminal: open the pty only once a display is attached
+
+The session type handed to the child (TERM_SESSION_TYPE=3Dkms or fb) is
+decided in terminal_open() from the displays attached at that moment.
+On a real VT the first session is activated as soon as the seat wakes
+up, which happens before the DRM display has finished probing, so the
+login is spawned with TERM_SESSION_TYPE=3Dfb even though the terminal
+ends up on a KMS display a few hundred milliseconds later.
+
+Session managers such as uwsm rely on that variable to decide whether
+they have to ask kmscon to release the display before starting a
+compositor. With the wrong type the request is never sent, kmscon
+keeps DRM master, and the compositor fails to open the device until it
+gives up.
+
+Defer opening the pty until the first display has been added to the
+terminal, and open it from terminal_add_display() when the terminal is
+already awake at that point.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/kmscon_terminal.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/kmscon_terminal.c b/src/kmscon_terminal.c
+index 15b00b4..42b6cd9 100644
+--- a/src/kmscon_terminal.c
++++ b/src/kmscon_terminal.c
+@@ -107,6 +107,7 @@ struct kmscon_terminal {
+ #define BLINK_TIMER_NS (500 * 1000 * 1000)
+=20
+ static int font_set(struct kmscon_terminal *term);
++static int terminal_open(struct kmscon_terminal *term);
+=20
+ static void coord_to_cell(struct kmscon_terminal *term, int32_t x, int3=
2_t y, unsigned int *posx,
+ 			  unsigned int *posy)
+@@ -726,6 +727,9 @@ int terminal_add_display(struct kmscon_terminal *ter=
m, struct display *disp)
+ 	update_pointer_max_all(term);
+ 	display_ref(scr->disp);
+ 	do_redraw_screen(scr);
++
++	if (term->awake && !term->opened)
++		terminal_open(term);
+ 	return 0;
+=20
+ err_text:
+@@ -1124,7 +1128,7 @@ void terminal_activate(struct kmscon_terminal *ter=
m)
+ {
+ 	term->awake =3D true;
+ 	ev_timer_enable(term->blink_timer);
+-	if (!term->opened)
++	if (!term->opened && !shl_dlist_empty(&term->screens))
+ 		terminal_open(term);
+ 	if (term->pointer.visible)
+ 		hw_cursor_show(term, term->pointer.x, term->pointer.y);
+--=20
+2.55.0
+
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb b/meta-oe/r=
ecipes-graphics/kmscon/kmscon_10.0.1.bb
index d02ea24612..c5cfd527d5 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
@@ -23,6 +23,8 @@ DEPENDS =3D "\
 SRC_URI =3D "git://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dma=
in;tag=3Dv${PV}"
 SRCREV =3D "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
=20
+SRC_URI +=3D "file://0001-terminal-open-the-pty-only-once-a-display-is-a=
ttached.patch"
+
 inherit meson pkgconfig systemd
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}=
"
--=20
2.55.0


