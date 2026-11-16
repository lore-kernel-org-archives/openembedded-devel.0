Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17940.1794787852862139708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=egx+JKH8;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4199784c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787852; x=1795392652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YQTw0YjfxwDkUM29oWOQOCrxvBtNMjdYkugOyrDV7E=;
        b=egx+JKH8Zubb+JWUwuig5myKLHQLQNX/gjFAzljT1cp3D1hfOT8Y5dm+b4hLAZ3zYu
         ZFZavnWGQmBqF4L4wjNlSetUAlq35Mip9V4EBiqpyVRokhW6ZV+PUEk191LrINg513ZZ
         v9A9iM+MkKjki/9Beu4PH6fiBiR/aiAVg37Og4SCa/GmddMcl+U1t2tqXE1z7YkGdUEP
         VN/bJdZi6Zx/KWElNf86OiNE7MlIAufr9FvwuPCSIewsIOqV918HzpEaxE79QA/zaz3V
         LZueWa4X1YVyovaWD0jd11IaWYaPT05t19bWOd04wSi/+xsm8xiQuFAvzwa1w6SxIlP/
         TzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787852; x=1795392652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YQTw0YjfxwDkUM29oWOQOCrxvBtNMjdYkugOyrDV7E=;
        b=Ow8Bljau1z1j/vh32R30imAqggfEq0mUhwPFSrxhD2T2rAnLgD/Y2H/qDXGiU/dJep
         3NZRJv4G91u/lIj05sf3B4TppUExdUHKoC1xNRIUYWdkcPAGsqTh+SDmUQxyeA+O6cni
         ASFbv3BhC1pyoRY0woTP9Y9rgxaiaEuQHgPgit0jYM/hi3NrftT+kZMNFqEox38VRFx8
         sI106nkrxFRHGvo6iu8+ddrqcY2rb3mzyiyb9wCBRClxR6MyvL6Hm+2JgFRE9v0HfFFp
         JXw5qUCzkBenUE84tif7US5SuM6Y4wVUN2N/bVeljfBzLzmMFyYyaX9Infn/2+/Y1ADB
         /z3w==
X-Gm-Message-State: APuU4Z+n82medXungpxIvBVuM2KiuU8DTxiO055SlD3BB2aSJ3MW45CK
	CuMPPCgDVen5hrwOGKiRN3orMkqbeuMGUtVI4uCIN/407O4AJ2gQ2l6/HUmjN6xL
X-Gm-Gg: AYBFou3BTOQo2dQZqMWv1/jPZHEBLEDH6TKXRznW0e/95xkU8TjJ0eJNrFReYmM+EOs
	v7/aqNJnaZzNlRes57MH+MpO6xvHBiLs0Y467Z9cKl0OXUncIQbytD52fhPpx60yBx2WsML9esj
	MnMu/0JhoQkcF0Uu7YeJK/GsEAKiTw2+cvPGvNRHrASAHiosD4Rk+Z2mL41T9JTduOkxwsGTQbx
	I6mfW0m6bu0JvSRZgxB5doMgg95zQ2NbxtS+qsAc3KdTm050nho/+aTzRyOOI3kfov9UyKL/Aj7
	FiflmWxQsNuAh4NUNoSRY0PjAnLZhCaeL2GNVxMrdHr1H4iU8xeXG6wod95E+EpwjXCnUwFKLjp
	4IUpoyMSp6idqoxV76EQn/0oUuh1ZYpJUvHfn+EEZRRLxJyjAodsmoLS9Gdx0aCH/CH2zrgjmNT
	NwVj3+/8VPdYA4V3uaJC7sSPvwHQyKaKHYTWUz8hyukEKncoDMTfX1TSH9SrtklzruBbm4sLh+/
	wqhr+kVESZ0kk0uRzD4Qyc/EXgpVXAfOgQgpRfswSWZm7x8KPgpk4PfJU7q98H89sHMp5GBh1F4
	PE4qfL5png0nt9SFmZbDkw98TCPWaRR7fwu5/wPp4kueJ296mP25fYJiItCGIz4aZp5iVWrYSIj
	pTCen8EV5SB6YCZbetvQoaReMPcuOS/JrAFxRWRf93HtVMdfuF4sbeUXg6Ke5pQzlwtazhuylmk
	zqBjmjWtVsfqSGgrDE8CnOTtMDM4bk0wjjQFEuJ61YYUoLB8OSarIQfofJ3pvly1xI/RvIKGhab
	gARWBdPPVhXunDqVif6sSZHSuw60GKTUhrwt2eMRtuRIG46bPo9ccV7x+KXorg9ECm4sa+7a0VK
	GgiT
X-Received: by 2002:a05:7022:3b84:b0:1b2:60ab:1e98 with SMTP id a92af1059eb24-1b5030f8824mr10195004c88.44.1794787852092;
        Sun, 15 Nov 2026 16:10:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/16] libgpiod: Drop FILES for nonexistent gpiosim-dev package
Date: Sun, 15 Nov 2026 16:10:32 -0800
Message-ID: <20261116001038.440763-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132391
Content-Type: text/plain; charset="utf-8"

${PN}-gpiosim-dev is not in PACKAGES, gpiosim.h is packaged in
${PN}-dev by the default FILES.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
index 4e9f56c35d..2cf1b0f563 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
@@ -61,7 +61,6 @@ PACKAGES =+ " \
 "
 FILES:${PN}-tools += "${bindir}/gpionotify"
 FILES:${PN}-gpiosim += "${libdir}/libgpiosim.so.*"
-FILES:${PN}-gpiosim-dev += "${includedir}/gpiosim.h"
 FILES:${PN}-glib += " \
     ${libdir}/libgpiod-glib.so.* \
     ${libdir}/girepository-1.0/* \
