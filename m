Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11805.1795762976188394680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PyGP5kBG;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4424031a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762975; x=1796367775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=leNfDQN4I4XXsZO8aOHsCDu/dhrmjCT3lh5jH8S9h2M=;
        b=PyGP5kBG4bxrkIKcm3n3gxPH81fyvqd6JDLRvNm/OmX0nbOFJB8oTdfwZHfkVhB8lT
         iIX2c7ikCGxcdIivXTig4nxYFhnMUwUvsi0wtu9WpfaiBj4qnPzkbE7xi2l7E+swFxuK
         m65zqqGHAtVUZSUIB07Fc3uNlNs58bv9EmI0AJe+G72zRemujaeRGKBXrRoTFsBy2vM2
         RGClLAyhcQnGgOk16Z1XSk98CVkQe+ttkocuuM5R+tkB4LPA249VFkCZdNF/BaBDBL5z
         kVv+ocnvg8QKaArccQA4fJEUsaMiKunHt6slFl4BvfdHJh31GNVqXTZlQxvTWPvwEwim
         TrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762975; x=1796367775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leNfDQN4I4XXsZO8aOHsCDu/dhrmjCT3lh5jH8S9h2M=;
        b=d15S31Tfnv5oUaL62O02BBW4BkJ4xg7JA7GrtD2Qn8zbsQT0T+IiwGeCBVReNVZ6SR
         KAHn9R2V/dhneEEyIoJhEZqjv4cSAx7H3eRTh4vS+sqHXnznsd15hGdY3aF8iDPIjHsL
         qtsrMwV5hyyGMjp73GOU31f6iO5nNOSvpwq1toznqum6To8HjVfC1cM3Jn1i49qZ+IMo
         6LuXL6+uSwO3mWm2gCQ9sjYQGDnHqoQ44GluzFOyfbnbqXtafRkpylkLZW1a+Z4VqJ+7
         Gh81oz1081EIxZIW+p19iZ7abiaS7Zqm/KH0YwzgCjjV4zDDC/V+CcC7e6hzdvycuNx4
         s2qw==
X-Gm-Message-State: APuU4Z8Tv2TGgUYuGD9RCTZy/gmm3mmvLQDRAYHC54bJ86C7JZ/XvGLc
	Trw1BQuj1+sYFHa/xF4CLJCh0/C+yranR8v/kh1xrTO1tj0MwdVNjVENNN+tnD0/
X-Gm-Gg: AZFdTZcW1Z6Ai1pudiXVDMmfF/hfTtyWKMBQ5xtj/9I4H1Aik0+1jK4+7zHpeHJHFSI
	5agcDo7nNqUsg68gNzCfEk+8sgxswyVIwn0DSFojtF7jb5moOL5FrF4sfSdiAbYMv2m27R1iy8H
	o/WXgemNiFvm2cd8vQQg8i0tJpILU5sXwSz4qR5V4A4zjNcte0Fi2qqUWPW4WqBXijJRbPNdZBn
	L2KsdGpYwmj17oIfXqBzbiyoffd6CEJ5+1C9Ng0oO09yNZnni2toJ0lhK5/PUieAlq/cnIJyWty
	tv2iV/HYNdS0T+GuRVLG/9yfJzmPFal4pVf+o2ERC95rUlzigc73y+7LJypv4mfK7PXlxLeCVdR
	RNytu5BEP1J1Nd90+MmFyW/+4TNOURGg0KsNsxCEuyj91/3pjaIz4LreZ6zDR7bYKzs3Mp6Uh1m
	KQmrZs3tdJlJMv7cIkOX2HW9ne79m8FirDFz0dWYY9jx2hVEtvxS/IPCPxrhwlcjLG7VcANB3Xs
	lJ2aEWWRHzbGIElDiUkwDYazuTR1f8sS8hIi/IZqY5CVThHn2ertKzMWUB6WX+/x1lopAVmUK1K
	t6x4vb4axX5dVyfCJy021ANu4iZIur7jcmJC6uOsYpig9NM55Sl1YFR++QWiXL7MTU1xS4tMF+i
	JUMSvaGVCxBqF4zx51K7m7DsJE9P8SUr3A49XdkWGXNAE2OxECaQ0FdOTkRoVyGy2UUTZTxlo+h
	tLxkPwXu24+xzKRlJESMoiSE3WuPyApD7JLRyYoQda/1wyEdzOnCfKy4g9aHahZ3lvO3hjQ0JxC
	R7M+8+h//27utakteBkcVq5FPp6rQzpa/ehzTZacSOmYGUIURBbTUwmoVrhnPcS4Dbm8sJzRDo4
	619J
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr16559763a91.37.1795762975537;
        Thu, 26 Nov 2026 23:02:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 0/5] Upstream version check fixes
Date: Thu, 26 Nov 2026 23:02:47 -0800
Message-ID: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133349
Content-Type: text/plain; charset="utf-8"

Fix the upstream version checks of five recipes.

Khem Raj (5):
  libisoburn: Fix upstream version check
  libisofs: Fix upstream version check
  httpfs2: Fix upstream version check
  zfs: Fix upstream version check
  fuse: Fix upstream version check

 .../recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb      | 2 ++
 .../recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb        | 2 ++
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb        | 3 +++
 meta-filesystems/recipes-filesystems/zfs/zfs_2.4.4.bb        | 2 ++
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb          | 5 +++--
 5 files changed, 12 insertions(+), 2 deletions(-)

