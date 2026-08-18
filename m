Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30ABC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:09 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2572.1787030814786717912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l4hxI7Wh;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ericyunlinchiang@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836c8bde2dcso53587027b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787030814; x=1787635614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SLimiQwNw5hP2dVxB38JKDklWMHgCdFoMFGDM9Nuos=;
        b=l4hxI7WhmRz2Y2wennYmew3ryilYs0nmtXdqMp+1RNlKyYeqvMBg7Dhh3o+SEMdcgk
         /z3ajaldr86/iw6dh5SoLUw85LpKsqbrtnOrIK2CFbA66rH1NveymgCbw+dpoBcCvnZb
         SNQt93lL8zji9tWOJdSTW2RrKODyPCTM8UbbfjAGgVOfP/o8OZSWER0UM0K9QVMp4w+x
         RSP7yjcOgTqemOUP1tFwT/Inf0GqbR5R8WakgsOsdJtzHccUyYJASbLvgURggbEvlxlk
         odj6U0LNfleU0Isht6ghKbkEDOTJ5fz0bfUiEL/7jbQoJT3WAHEmA5DhOgVTyWNYchCN
         180g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787030814; x=1787635614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SLimiQwNw5hP2dVxB38JKDklWMHgCdFoMFGDM9Nuos=;
        b=H+Pko4s11VwiBsT19s8+qnCFww5m/U6V1e+IXohk9E7w9RQc05hIJ6UZFMaQfAJpyO
         eLc5+LyvXP3rYflPWu4ErP7Ykn9IDZlMgOVnL4uk8MkPiR+ukxRAhoGd1OvlIEEuJU24
         +kiQkH/TQXf3447pvPTSWGahOCTzpTyIVvzjQD3xxFjDkrVBHLFR+zhga1hwgxGWp7z0
         gn+iSw3cQcV3sRVQvupRhu+Nq/ZqHC1eP/ceIRq2OT53adX0icWt5vHaADoInjyZBBGO
         UWB2ZO1U13jMo1skEXCWQIMYKzpvtmqzeU8wwgO1qmwr17uBG1oiR4KmLNc+//Z8Z0K9
         pjwA==
X-Gm-Message-State: AOJu0Yzjkl+2Vb8h/ubkX4Y/rqjFiGClr6hQvDzaWXjJPWrVMajfJuED
	YiURbetRh41LCMyzgYSQAc5KXDuLJLb8Vm8C0R4hs1W6EaGkgWsXKU0hkcApAAxX
X-Gm-Gg: AR+sD11U2RqOoxh+lbSFUZJdi+jFcjDxIF5sGAWJpUZ+wIDeX/WO0bWR5AqLO6XtIup
	8Q800DA1hjY8TypxLInc/AR97Lqb0lexf7stOmzBJscVjVtKt3LbrNaXAqcuo2tEXpJXRE17gj3
	tJ2b0QHQNx7T6pXt62FLtx2U3VIPGCwKogCMEi1SrquGV40yurVi1LTafc8hl36cMZs1JMPyHFo
	KUXDZXSyCoO8/nEkiw52D8+tr2TjJNYaNOhjX3WyElRs1QzwHSfAhc4b36QP+vKTmlThXijzVG0
	cR9nltF60478OHoPgrbR8SEhS1wK9MP+U2C6Q9UNqlAFhKfE8YjUc3xV9NkU85RjjyoYaZq3+yV
	deEXv3/Zv7oKQMyLvdKU1QEUGCPizQMB/0nOmdZezE4/8uLudT3B6iz5SiEHTul4GtBIBfb6Fab
	AX8CG+OBRKgd/jM6hGoAmjWUtypZX7wkmnzDhGw63DtaAhFWbdNz8FwnC03HGD9w79WPzW0UDm6
	aHqwzJi1CgB0fVnR8v6sTmQVWJ+/g==
X-Received: by 2002:a17:902:e80f:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2d3b0d31815mr315028085ad.9.1787030347693;
        Mon, 17 Aug 2026 22:19:07 -0700 (PDT)
Received: from eric-N-A (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499ec7sm12986565ad.13.2026.08.17.22.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:19:07 -0700 (PDT)
From: Eric Chiang <ericyunlinchiang@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	khem.raj@oss.qualcomm.com,
	potin.lai.pt@gmail.com,
	Eric Chiang <ericyunlinchiang@gmail.com>
Subject: [meta-oe][PATCH] usbmuxd: create the usbmux user the udev rule requires
Date: Tue, 18 Aug 2026 13:17:53 +0800
Message-ID: <20260818051753.772159-1-ericyunlinchiang@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129227

usbmuxd ships 39-usbmuxd.rules, which starts the daemon when an Apple
device appears:

  ACTION=="add", ..., OWNER="usbmux", ENV{SYSTEMD_WANTS}="usbmuxd.service"

The recipe never creates that account. Up to systemd v257 udev only
logged a warning and the rest of the line still ran. systemd a1ee55e3c9
("udev-rules: ignore OWNER=/GROUP= with unknown user/group", first
released in v258) makes udev drop the whole rule line instead, so
SYSTEMD_WANTS is never applied and usbmuxd is never started when a
device is plugged in.

Creating the account is what the rule already expects, and it preserves
the intent of the systemd change: that change guards against a rule
naming a nonexistent user silently clearing a valid earlier ownership
assignment, and with the account present there is no nonexistent user.
Removing OWNER= from the rule would evade that check instead of
satisfying it. The daemon still runs as root, so nothing else changes.

Also ship a sysusers.d fragment. Systems that modified a user or
password at runtime carry a copied-up /etc/passwd in a writable /etc,
which masks an account added at image build time even after an update;
systemd-sysusers recreates it there. The uid may then differ, but the
udev rule resolves the account by name and the daemon runs as root, so
only the name matters.

Distros that keep /etc on persistent storage may also need
systemd-sysusers to actually run on boot; that is outside the scope of
this recipe.

Signed-off-by: Eric Chiang <ericyunlinchiang@gmail.com>
---
 .../recipes-connectivity/usbmuxd/usbmuxd_git.bb   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index c5e0fbee1a..6258bc5134 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 
-inherit autotools pkgconfig gitpkgv systemd
+inherit autotools pkgconfig gitpkgv systemd useradd
 
 PKGV = "${GITPKGVTAG}"
 PV = "1.1.2+git"
@@ -22,5 +22,18 @@ UPSTREAM_CHECK_COMMITS = "1"
 EXTRA_OECONF += "--without-preflight"
 
 FILES:${PN} += "${base_libdir}/udev/rules.d/"
+FILES:${PN} += "${nonarch_libdir}/sysusers.d"
 
 SYSTEMD_SERVICE:${PN} = "usbmuxd.service"
+
+# 39-usbmuxd.rules carries OWNER="usbmux"; from systemd v258 udev drops the
+# whole rule line when the user does not exist, so the daemon is never
+# started. Create the account, and ship a sysusers.d fragment so it is also
+# recreated on systems whose /etc predates this recipe.
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --shell /bin/false --user-group usbmux"
+
+do_install:append() {
+    install -d ${D}${nonarch_libdir}/sysusers.d
+    printf 'u usbmux - "usbmux daemon"\n' > ${D}${nonarch_libdir}/sysusers.d/usbmuxd.conf
+}
-- 
2.53.0


