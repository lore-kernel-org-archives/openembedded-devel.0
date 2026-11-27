Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11783.1795762910380191985
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c/Xalnhq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso4822037a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762910; x=1796367710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxweYqQleW+BvGAsLfCE6VGAMr6X23wFUrdstFB97vQ=;
        b=c/Xalnhq7MOXFmHxKnCQFUVTeRMVZqdTWJ6xACcBMtiTF9eO5jw/niozS/a1U8BCDj
         o/0kV7L+BfWyah31U1io2FUxWGKXleDTGTpQOj/XAVbIr+X8W2+2dSPJcM2ZHJUNelFL
         pqw1/zEsO3UpvMCgavxzkIXuP2OIe4RYitf/AcuohfoAVXAGdFTz3qr2K/qBsvlE1G8D
         MJUGmwIAttZD9pJVGGUbnwEJhtUXMX/1NcWClpBkAt/J1WO3FWK2GRLRmj9AA4DARtZm
         7WxJVOjfvwQwc4z2HE7gnCcLzHmmDR3WmnRe7JZnBhs0h+c6N9lh5Pp1cN+r+pDuw+gd
         Syfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762910; x=1796367710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxweYqQleW+BvGAsLfCE6VGAMr6X23wFUrdstFB97vQ=;
        b=UAcmdmr1J4KHbEelDNTQgtYxdaKMR/08snJrP+sf3LfBcmfYnc21J22xxH5cqF69Ao
         pkaXwCNQv8x77TVUwcoz9CG+2cAg/oVE0/foNjbHFwAlx5G0Na1bq3m9Y2LJnTGBNXBG
         8npxXH3jcmaKl8tT5hM0Uaz6WOd4yuNbQuccve8F7oFXICHKei9DqeLJ7ow6wkbTCMr2
         NrUT4J881S+wFmEzWXxHaWB+wEhKq9fZZOtUZVRL0LljPYB2/1Ysi4hdsDAmtNDzqz2W
         ytgg+0TwhbK93HmWlB4z5HhED9Fo7wZ6ygO7pM0ftf+44VmarvrtFsKb+Oil2gP/ev0i
         Q8hw==
X-Gm-Message-State: APuU4Z8K2XyOSPeb62Z8Z9VrkeiiiwvzBLxhTewdCvwVRjNri4jgpBBp
	vWJlfRPoiHCYAYExAmFFxK1orEtfzHenaiNucTBOuTg0wMpBAUMYpZMvgXKXFmie
X-Gm-Gg: AZFdTZddt3Hm+eUkL+QvPg0u7wbDOXvmO3v/l/hcirjT6c568NowdeOY40RScV4PwMP
	ZWeCqcobxqC3H2LU/jLNwhhtBU1K/sPcgQ8gxFxyLIneqZ/yENyAy6pF8IOSdgiTc8+fOplB96p
	Ckab6pC2A6S+ji7vjf5nFD82w+/gOL/7c+hw2Ldq3dAULNYRJoOzzdmwOzxPidWY6sxCo/HNk5z
	olaM/4bkNLbYh6+xjhooUyWWgaQYSbntfVmIqzcXgy0uxOjzzwXMZuakIRFrBCWIxpEYyfjX9Em
	ML5xCJ2z5hq5caFU0cbn8ASMf04qV3awagOD3LI0K0x2HME4yJWmC3RY0/DxA36rNxrByz7XwOP
	PyHzJoZcukLdSWTokNGkqzQI7aJL2JlgQ5HWj3qoSWttLNf+eTt14OepgJQO+Q60GIABD4KtUKw
	ejVMSsGUCjZR4XtcNSoh5pJrsJxHBxRcS/YCYkx0lxRYQNZMBczxXcwosHd4kjURub/XEd+XFJf
	37GPwL0FbWKcDCmCZU9F/99H/GyuDM2kBXJnZBO4571IpXLHAF0Zl6NR1Ww3FyXZHUU5/LSXp+8
	XaGAmxGL0++a7XGHgUga3yRAVGo9xYDILRvRAhgsod7prBzmjP8PzVzzmzY/U2fn0VST0Bx+Kyt
	EeVaX0PPj4s2LXPyc1WQTjpDe1cjMDrgWhvb/sOzA69Rf2yKp1xOdbMe2AiM5rpXNk3YoTU1CDm
	w0CeZTVOOibFzEAwPkY9EGH1hcAjSI7Mut1E7bIOXS7voyZrgzND93IpEzwFDLkW7XrSdOixDi9
	mxukwdezUExoPeoESpoY6LoDdiGhHpSKviAPj0EdmomW20Ldz4OcMPdLJMWDPRxPjNKLtSbK/I3
	jXuZ
X-Received: by 2002:a17:90a:e705:b0:3b3:cfc5:60b3 with SMTP id 98e67ed59e1d1-3b41c9ba746mr20808481a91.63.1795762909468;
        Thu, 26 Nov 2026 23:01:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 0/6] Source fixes and upgrades
Date: Thu, 26 Nov 2026 23:01:39 -0800
Message-ID: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133320
Content-Type: text/plain; charset="utf-8"

fswebcam fetched from codeberg (the GitHub repository was emptied),
gstd versioned with PE instead of 1.0+really, and upgrades.

Security fixes: pjproject 2.18 includes the fixes for CVE-2026-57160 to
CVE-2026-57166, CVE-2026-77396 and CVE-2026-84975, so those backports
are dropped.

Khem Raj (6):
  fswebcam: Fetch from codeberg
  gstd: Use PE instead of 1.0+really in PV
  fluidsynth: upgrade 2.6.2 -> 2.6.3
  pjproject: upgrade 2.17 -> 2.18
  python3-pillow-heif: upgrade 1.8.1 -> 1.9.0
  pjproject: Fix build on musl

 ..._1.8.1.bb => python3-pillow-heif_1.9.0.bb} |   2 +-
 ...elaration-for-float-multithreaded-se.patch |  56 +++--
 ...luidsynth_2.6.2.bb => fluidsynth_2.6.3.bb} |   3 +-
 .../fswebcam/fswebcam_20200725.bb             |   4 +-
 .../gstreamer-1.0/gstd_git.bb                 |   9 +-
 ...y-use-backtrace-and-ucontext-with-gl.patch |  51 ++++
 ...k_ossl-fix-OpenSSL-4.0-compatibility.patch |  40 ---
 .../pjproject/pjproject/CVE-2026-57160.patch  |  42 ----
 .../pjproject/pjproject/CVE-2026-57161.patch  |  49 ----
 .../pjproject/pjproject/CVE-2026-57162.patch  |  43 ----
 .../pjproject/pjproject/CVE-2026-57163.patch  |  52 ----
 .../pjproject/pjproject/CVE-2026-57164.patch  |  66 -----
 .../pjproject/pjproject/CVE-2026-57165.patch  |  85 -------
 .../pjproject/pjproject/CVE-2026-57166.patch  | 228 ------------------
 .../pjproject/pjproject/CVE-2026-77396.patch  |  74 ------
 .../pjproject/pjproject/CVE-2026-84975.patch  |  87 -------
 .../{pjproject_2.17.bb => pjproject_2.18.bb}  |  14 +-
 17 files changed, 93 insertions(+), 812 deletions(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_1.8.1.bb => python3-pillow-heif_1.9.0.bb} (84%)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.6.2.bb => fluidsynth_2.6.3.bb} (96%)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
 rename meta-multimedia/recipes-multimedia/pjproject/{pjproject_2.17.bb => pjproject_2.18.bb} (91%)

