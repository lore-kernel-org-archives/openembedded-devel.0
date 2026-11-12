Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2983.1794442801057307411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 16:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sGcC+LRd;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so3314444eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 16:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442800; x=1795047600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zEHPs42eYpHBmM8PWs0UOiVyT9vZoXhZgExg0SJrmA=;
        b=sGcC+LRdFBcOgYMi/SEklW5Y91yheCyFIeXkiw1xLIzOSMV/zzWrXYBhgShtUhOvzz
         WJLCyBdE+A7Hr3+bKgxvQHZ+aTBK1bLQZyHNy/JZfJi7A6W0tsisxE+P/Fyi/VupaxZG
         J3/e7jviqPET3wiZmQv9aExj9lHiY/53JbGmeD7JGhDl2HDCt9BHjhOfDtQYCUSuyzeT
         5uMGjk3HbVlMZcevWEipIZZgFGjqIBlsvRdfyxUXVEsYwQCOUUSn3MIcwRiTOvdC9HnZ
         nKs9awdnsPq/tlxFYEyVaQ0HtoY9V9qrT+nn4eZoadJMnVd308Mm4VSSEvO0q/sYzCUh
         LM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442800; x=1795047600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zEHPs42eYpHBmM8PWs0UOiVyT9vZoXhZgExg0SJrmA=;
        b=iJ/FYRl3NomAlQz/t1NYfOalQUAGYetdSsJaHPLVGjBuVltA1HnsCbPxYeygbZesHl
         2cbB+qIWSZPg0gytatFqix2/P78xn5Af1DXF9g3PfvLxrxbhyeTrF5QBqB2Rtzj7vlPn
         xJ7hsX0Ov8gBO+bj1H4kaFtVOKLOmKybBz6p6/SDUoxAnNpRPRDmfe8REjoGX8ytSJ/N
         TP+BbKYc1uVRLWJdY5foqye88qaMhdC1zEk2A2PbsMHPkR1vgzWmgvbmKBY7DEeGKcE4
         WS8WZ64adhQc0gFO9loBoPqMUYMjyFLHzYMPbSdvfPM79eA9ZetdlVXMTz2maYyWOYK7
         lffw==
X-Gm-Message-State: APuU4Z+xolUxaAaHxtr9H8qgqIDpo8ysz9a9PGsfOtOSJzE2njQdu5Du
	udsBpyc3c81JC19QheOj4e4IfywrDj0+nF9fjW5NOHXRkGaBtR11EIft9gFLhsgX76M=
X-Gm-Gg: AYBFou0s18P3s6FOdq6tWvvuVoH2AAamfD4bj4j5tWTACMfz5m9EhdQ/6/FWz3NyxGG
	kZNwxC/fmU96OrjBh2lmso7jry5jTLCrO3phxyHRs9KJUgb5o2l9TpGZGbyeHr3Zndx9Rn8+vCa
	i0X5zTK/u9SSTg1bNBt+TrsnBjJThfdm8jID1ICIgG0Ve3HlpzkXwBK9j1vfMaOaN6HX8aRg9ec
	28VskP1rjOaOTweTXb8yZ8+TnBKYldR+87TiX6YUxkCePgaBXrBeZKQdZw+QkaDAcOFBW0Uyhdi
	ZzNU9M31gioeXJvCIuc4tmfh7j90W/a+vzW0cZujXWkBlttOegu520PwAxDnkFthuuq8kB6HdSe
	i29/IzlsOriZHz2BWheynY61U2G0d7qZ5mUZOHkwfyuHoRf1MjUfZ/R4nPOSlTw+fcTgT6qCI4p
	GwZiUAHL4OuDbDjM9z/B0MH57bqps0Jjr5FjhcwwyDwZzmyGbwmUmXCBNRISYIjzj2htTwL+lnt
	0S8yzxBQ4qbSJ7X3AD0LItDgYpaQprPxdPItk7zTpwkHSGNlQjgIrTMtCztTsSCA6GYi9cOFWdI
	JTg46NPyJrIZdJSihGg3gpz+gNaVPYfGt2+cvs3fJ0UmH0Jkhr22HClgUPuPJVL9ZEOBDG9i3+5
	XHC2lYOKO1Gbx8CqJcX+CB/cvByLSxRyo30Ge7q4f4cdmlbyA4UIgykz01Cw1lT7Jh2DIUI0XET
	WWw1Lpd2rEqMDPpfmC8mRgjxeu77uy6L2W4td1ksmwW/lMXz3DxhOYEq3sbBLIMpbY+MrTD2gSR
	+YUDV5ak2aPUHCYeGzlmiHVJl2EqDogpJELdXsBNkUMfLjVygl5EFm59YuDqJbP+u5ImdSWmx8e
	l8Pf
X-Received: by 2002:a05:7022:7f0d:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3c02f3a1fmr2933199c88.10.1794442800051;
        Wed, 11 Nov 2026 16:20:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm19357327c88.12.2026.11.11.16.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:19:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] cpupower: Install systemd unit into systemd_system_unitdir
Date: Wed, 11 Nov 2026 16:19:56 -0800
Message-ID: <20261112001956.1124296-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 00:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132141
Content-Type: text/plain; charset="utf-8"

The kernel cpupower Makefile installs cpupower.service into a hardcoded
/usr/lib/systemd/system, while the systemd package ships
${systemd_unitdir}. On distros without usrmerge (e.g. poky) these
differ, and on sysvinit distros the unit is not wanted at all, causing
installed-vs-shipped QA errors.

Pass unitdir=${systemd_system_unitdir} so the unit lands where OE
expects, and set SYSTEMD=false when systemd is not in DISTRO_FEATURES
so the unit is not installed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index b453308770..a8cdf1bf0a 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -11,7 +11,9 @@ inherit kernelsrc kernel-arch bash-completion

 do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"

-EXTRA_OEMAKE = "-C ${S}/tools/power/cpupower O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+EXTRA_OEMAKE = "-C ${S}/tools/power/cpupower O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH} \
+                unitdir=${systemd_system_unitdir} \
+                SYSTEMD=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"

 do_configure[depends] += "virtual/kernel:do_shared_workdir"

@@ -27,7 +29,7 @@ do_install() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-systemd"

-FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_unitdir}"
+FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_system_unitdir}"

 RDEPENDS:${PN} = "bash"

