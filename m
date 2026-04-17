Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F37F436AE
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:25:15 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46330.1776435909622687125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Up7kWnjh;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c63e942f3so2069670c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776435909; x=1777040709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrObCS5POdEXH5Tgtp9DvdVhBG7zrfunOOgBUFphF2A=;
        b=Up7kWnjh0TzzSCgr1/E+5GSXu+A50mir/TZknCH0HmYhKG1pEII3vV04OXNwT/+X68
         lJnzdE0SNDhHz5fhM+A4TZ78cIwCbR87EEVeztHt3lKOQZMI0gg8MzmEdxonbBYMl3Jz
         kZFawY38GAAv1J1Q5rQzFKfaaE7Ay17MYauFckh8tGIZmVQwObG/6gnPx6rGAMOXcENc
         rK4z2W2vLAqcjoVsAqNSnKlS8iLky828q9pXFUT8l/6gKHDgH69UYLjcuJNcvO0nIJyp
         W4wHvjYdNAoNKzpfpEjONKevKlGr57nI8+yzAoJ63Vzp6oTIHodm5zL1rPKwZJlN+kcY
         Nndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435909; x=1777040709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrObCS5POdEXH5Tgtp9DvdVhBG7zrfunOOgBUFphF2A=;
        b=QD18tWH2imwvjLv5MoephqWC2wwSUN/Xn1u/G7AzRk2XDWmHiqgKq9PvZgnRwU9WBT
         Ydo5spyE+Xp1HzE/D50w//Ssgpa6gmbsctAxzHzMINAgtyb9HlXNd+I1pTpApepSx7OE
         1GXgm/Q4vcOh8kHXMgJ7Cu+kzyCsmxVsyviZoX/oxs64qeHohz5GTRGT+7737uRFj2zl
         Pn4e9NCNg4tlJCY8T9n+E5hTwMy5fav2IkS0q5yDgvflgTqjblV/ZwszwQiIOl2HAylX
         yu5Zj5RmzLiACcCOYLdin8ejNKcYWA4bQNkREcOnDghpdySiDJOCXLoYs0Rt+LTtnRcH
         PV3Q==
X-Gm-Message-State: AOJu0YxPw9ImtUhZMdKwJ4kKdMc2+Vvl1Ob2XTF+7b7xbS2waIxB/YSt
	K6oLxmMHmeoVxLQ3PidSYcuCk3Gu4TKO7jfcufJ9XM1hHD7MWukVn+N5Ns5TRvK/
X-Gm-Gg: AeBDieu7cRF8sXiowJVNlFEUnJUoiGKgaM+wk3HLg5xNwIE9ajqatJwjsXilbcmwUv8
	f+nA4KHJdTvvuzZzVV13HL5heKFn4Qa4th0aCP+OZyb91iROO8TJHX+L+EQGKpoBpBOHx1ltBGh
	nqP2+nMUmGitN+TsNyCD++e1xCn4aPxn050Wz7V9VsCDlMQVZuaarXnaygZMM5p5EDLNY9BGleG
	E/AJDPhe5RvpKN3oWyLkuS1bC/WJd+BJwx2BdZ8C5aomYzvgWO71jm3qw3tDcxBPxtWxPZFPGeP
	mzp26Ll8Uo9VnssqBHtmbaKLYkSH3B6oomRRDPOwdl+3Mbai0p2SxkKxBURcG4/K82yDJNb9ucr
	5SFkck9QseT+VdL1n4stxMfgUA2ysiqHh1REWccpffjAjvZ3RGIb8VcFARD4cQRx8Xn1UfQyAA0
	fvr0eITRM/oKs0HeLFTv11r8qRNT93aNBZwqvZzmQTVP0h1RtzXc8kVqVV5nhp2l+bwJRpnHFla
	TlexGzCh0h+ZHuR5JoOXskm0Z61O15q+069L/OdAe/w3Tvvor2D4qqJ/MbswLTs3o1XFyV+jOc+
	jxeikPdcra44bPh+Y+TVy5FgOlHGp4fmPPM1u1vX6wQJWUIL6Zs=
X-Received: by 2002:a05:7022:e1f:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12c73f97391mr1329924c88.22.1776435908341;
        Fri, 17 Apr 2026 07:25:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm2307062c88.15.2026.04.17.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:25:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] libcppconnman: Upgrade to 1.0.0
Date: Fri, 17 Apr 2026 07:24:57 -0700
Message-ID: <20260417142503.966582-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126441

It has one change over last release
https://github.com/amarula/libcppconnman/commit/84fa99d3ba0908ff9debd9191c4eddabf08079d4

Fixes build errors e.g.
| CMake Error at cmake/VersionFromGit.cmake:59 (message):
|   [VersionFromGit] Failed to execute Git: fatal: No names found, cannot
|   describe anything.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libcppconnman_git.bb => libcppconnman_1.0.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libcppconnman/{libcppconnman_git.bb => libcppconnman_1.0.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
rename to meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb
index daa32a8d48..bd1686e9a9 100644
--- a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
+++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"

 SECTION = "libs"

-SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main"
-SRCREV = "d89262c2cd7336da8ba9eb06228d422847fe4b20"
+SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "84fa99d3ba0908ff9debd9191c4eddabf08079d4"

 inherit cmake pkgconfig


