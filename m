Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20746.1793560454280540713
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 11:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Xs9FliHo;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1136841c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 11:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793560454; x=1794165254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J29NEVJzPYgDzgRNxrQOqumUBn8HiNRyeT9SApOPLfY=;
        b=Xs9FliHomUrgmM56Vz8QRFqUVD4MvtJfNNRQwje+3bEZNtMtxigJLljdCVy4+xL+sW
         B4ScCerTsp4rHjJLHWaud9s271QkrTZUvWgzUn29HeGLldaYfUiawgCu8fjIwkrvfYkL
         iPKOImvori8gEWENFzYMOJ+TTBYlnsjpdqBsTcsOKMmIilI4/xwpBW9Wbwu9eC5kAuQJ
         V7tFUM+j9TvRsqmlBcXguoU4gAIpJi7+Y8Xkjtg9kc2Z0OzP6wG3gVkuo4dBIAei1IgG
         Q4PL5aeXeaWpsCo4mD64T7dbkf30oI9w6wwaa36+jvQB6AuVMe6736g1OAc8eO2TgQ/i
         0Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793560454; x=1794165254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J29NEVJzPYgDzgRNxrQOqumUBn8HiNRyeT9SApOPLfY=;
        b=jM0muzRQqIBzZRDsi/IQXJuNLqiv6S5tGn7GHv1iE2bx6qZSkzykNMPta9Lr2bYlVG
         OBld4k43Df++gkRg96gm5Csfkp/epaL89RzX/jpVgKFHA2Zchx6oMCQ0k94p4FUh3p1E
         ZnR7kMv0YYHAgBsWxHn45Jr8zFNJ4goJnMrcqB77x6MSAdO4NqcuycpdZpqrLSQjnRzv
         u7b0xk/C9pnD1gtsX70try/vDOnjZ1/H/pl2sRHcB7FLN16FNLCDEyrQvDnw3h5CGTRb
         VaLHQ5OxRD5O+/o+mjSfsJZ2FTcruxu4aq1f9/zR+oKGYJkhPG/J6/5A8sKOHRMwCxyP
         CacQ==
X-Gm-Message-State: AFq9FYKaafX/qKjqm6Z2eTJ+g3Uvemfx7M63wKVk7jpEP8CJrg4rv/k0
	XBuErF9M7NvM9+vWXrkIFHXHqHEl/Nxfy5XjQZQ9ePlE8rAAQpfxjTMqX+1rKFbAZwM=
X-Gm-Gg: AYBFou1jVXfyvdQt8NBo9TCv3McR/UhX/pPYV+p1gMLKNQIPRNkQH5Krcnoso/dTXG9
	518u+fmaggp1DuWf0jn7V0P1B/7sfeWXc/houIYXLOMrVau9B4DyKxd1omK9yfJd3z132uMa+bD
	1cLZ0UqRB9zH/t5KdC74I+eymoVufTTQKHYssKrf+zY9miOgEWE6bTp1wHS2r6JKvhZn4H7RR1G
	ZZCyliROpmzpPFQsFauoof9chOf2tCcddJx1KjhbhEr0C4KQ1E8QSIKklE9W2r6if4ynMgQnqcg
	9cYJ4VZW4P8evEqd89f31M3sRq8XzftVgBuWj6IjrXOfy77w1hThxLWBXg2wPzSIJ3QU6mC1Mas
	UPqpdvb8o7cv3n4Q1D3XlVii34nMag17/W5S68r9wgKKK8+mMN1mQOpf/MfYf5qaXkBJHwb4Ffh
	qv5ZRrhKgJh4wHrH2RiC7ehUzYEcI1zTjSKc3dbpl70bvVohg9e2C7TRhnhtsAvIs3glrIND89c
	+eeKcgxgMVivbtthHjjhvr5JIaGQdGkhCWlIbH0iYFnZgE40JcthuKjjW7Crb+iP+OtnUN51rmi
	TXiDqXk1tyoHAux5InwZaevtQ6vQjYdLj1p6cOa8Dpkrgaw9/seUvNfqMbiB1tErb0knWEVzugX
	Pht4+PLWiUlfQAYVrYO71Xox3FQ8u54zr5Xtxk0FABY6dUf0KMiK3R4z8GknTumeiQVg+kxZz8I
	cagvvse9vUL2VpFyas8ONk9eQ8kJDZp7lq0zggXmFb4affg9Fs7vQIZghTHMK28DFvrd0Un+PUZ
	Vrsq4vUieUTeIk9919F3Hqjn5U0saNVcBEw/QQfOgEZb/Dui6SYBR/WAHpG4l0gOdUKHz0DPynl
	3lKs
X-Received: by 2002:a05:7022:b0c6:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1ac599f50b1mr11742034c88.5.1793560453490;
        Sun, 01 Nov 2026 11:14:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm27600735c88.0.2026.11.01.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:14:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH] malcontent: Require the systemd distro feature
Date: Sun,  1 Nov 2026 11:14:09 -0800
Message-ID: <20261101191409.1470402-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131732
Content-Type: text/plain; charset="utf-8"

malcontent and malcontent-ui depend on accountsservice, which needs
systemd now, so they can not be built on sysvinit distros. Declare it so
the skip message names the actual requirement.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/malcontent/malcontent-ui.bb | 2 +-
 meta-oe/recipes-gnome/malcontent/malcontent.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
index d0a975a457..4cce5213d8 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
@@ -27,7 +27,7 @@ GIR_MESON_OPTION = ""
 GTKIC_VERSION = "4"
 inherit  meson pkgconfig gtk-icon-cache gobject-introspection gettext features_check

-REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
+REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection systemd"

 EXTRA_OEMESON = "-Dui=enabled"

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/recipes-gnome/malcontent/malcontent.bb
index 0bb258e2b0..91df15745b 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -19,7 +19,7 @@ GIR_MESON_OPTION = ""

 inherit  meson pkgconfig gobject-introspection gettext features_check useradd

-REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
+REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection systemd"

 PACKAGECONFIG ?= "ui"
 PACKAGECONFIG[ui] = ",,,malcontent-ui"
