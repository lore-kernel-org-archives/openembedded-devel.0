Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45339D3E78F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 04:39:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1355.1765427949383680280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 20:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oa8iuozM;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298456bb53aso6992495ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 20:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765427948; x=1766032748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmnnqXM0TPruntF3D69HEguwk+P3eEldn3iGxiRyWS4=;
        b=Oa8iuozMQZlgjs08ugsvgNzO5efjJl7pHlDNo7//5mzZCy9mVA7NyVv/Aln9nCyU+f
         XDFUQE3DuHd4/6INk6IvnxLqkXtkYb4BKMJN6VG/qtjUuUdXR8Y71iq4gQjUMgt7/X7O
         vNsViFU6lZmC5mwSgpYgU1azBEUT49fAiC+gc+0xFnLBMz84GkmPWnH/er2M4/ytmuzz
         YbuG25ENnyeMcAFoi5IJHFrvxjT05xnt5bpVMPC3Y+unJUQGooECBHTWIwc2/dl7maIA
         LGWknLe1lMxT7xyzngRRnvG7NW8GYPk23GOma4mjXJEKjQQtFVJrSaepK6ix7puQfrJH
         BWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765427948; x=1766032748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmnnqXM0TPruntF3D69HEguwk+P3eEldn3iGxiRyWS4=;
        b=Go1sA0BEiosn57fulB3w/xo3WxtIaEA/OUvUqn4EzBzZuY+B9s7IAzhw+/OxsoUQF8
         vHZFg5IJLfz1kP0J7yTPTlb4VnkuW1+meoVFxcllVqsdtXVh+8SAcLqP33skUtyzJxs2
         ozyL2Je8M5daeVFp/P7tyEBAymR3XvdgQ+bNBXmgmug+JIkj2WTHXna6vhu1jEeTkP/+
         GRjaUqCjYjb4NEGTrv45WtXT7B1OU+2yvwGc8QpidiRADBPyZyJUIrbyETpno0pbIKYI
         VBntdN1BUVyaG+7yLz40w5o/w/mqpKrjo45Pbey4qnHEObAQf6iydP7jeEG5Pi4hqxlN
         8iOg==
X-Gm-Message-State: AOJu0YwRcv05s73V1iVbK9z5oc2xiiXLb3NSoD6o78/FCmPre0Usyhh/
	AzIV0baVsdXJOXGDNgpseoW5iT72NDofAoGbVCitr5psRI1GdfQkR3e3pQjjL++3
X-Gm-Gg: AY/fxX6DyhMDNTd98CzJMzdpR7FbenCcY3u3H4N9oZNKyp8O8Rt5vfx9DUw4pd+uqA0
	OVyoBwFubvPiLZGYfSX+dNYlYyRZB6Ia1yd4xpdbWwx8t5qyLr+uEmwUnLvEfogrg01T72GBh2G
	L2mEUghZZWtE/v8cbU+65Kt3P88YQxMYZi/SfdaCrjqn/6DxxSCLCo7qHaumTN1DkwXWghb+3IH
	KZ5QWTpj3AaVTbw3suKBkWUbcfTWwEv2R5EJk/KjQv1BttFYrNytPVvdad1uvsj2tvIU8rtiUYw
	YS/9/BGOtSqYB1YnieG9D3RPGhB3tbj0ZF/u393WX/CnmWurOo4kBz21+8LHACIwoFiNFeDqMuL
	4vcABmh/oa2I5KxR0W4HjjcLrQ3ALbVGJ+x04rCPysO+68/iS2/Ldpf3x5QaRG6GxG2zvW4alCZ
	NSsZpaVKIJiRoRci4fi69vKCwNxCxoQKqV9KZOftJ86oZWQCJDTLDFSoD051Jm1s7zkCGN1ry87
	BZe3fhWCwUXs3wGfzPEpfjmjsYC1DyN
X-Google-Smtp-Source: AGHT+IGkJhx+lBJtl1HsQTvix7wpApHw7QqhS3LIIgtSIY0X2hYvCRyQuXb0S14Rpq/79pclr9J21w==
X-Received: by 2002:a05:7022:30a:b0:119:e569:f622 with SMTP id a92af1059eb24-11f296898ffmr3336052c88.27.1765427948116;
        Wed, 10 Dec 2025 20:39:08 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff110sm4823307c88.10.2025.12.10.20.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 20:39:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] freediameter: Add 600s timeout via ctest driver
Date: Wed, 10 Dec 2025 20:39:05 -0800
Message-ID: <20251211043905.1280643-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 04:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122580

This helps tests not hitting timeout (120s default)
especially testmesg_stress test can timeout on slower machines
e.g. fully emulated ( non-kvm ) qemu machines e.g.
qemuarm64 on x86_64 machine.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.6.0.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
index 887ca5c4a3..44be5044b1 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
@@ -50,6 +50,7 @@ EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH:BOOL=ON \
     -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
     -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
+    -DTEST_TIMEOUT=600 \
 "
 # INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
 # specify it on cmd line will fix the SET bug in CMakeList.txt
@@ -125,7 +126,7 @@ FILES:${PN} += "${libdir}/${fd_pkgname}/*"

 RDEPENDS:${PN}  = "glib-2.0 gnutls libidn"
 RDEPENDS:${PN} += "openssl openssl-conf openssl-engines"
-RRECOMMENDS:${PN} += "kernel-module-tipc kernel-module-sctp"
+RRECOMMENDS:${PN} += "kernel-module-tipc kernel-module-sctp"
 RRECOMMENDS:${PN} += "kernel-module-udp-tunnel kernel-module-ipip"
 RDEPENDS:${PN}-ptest = "cmake"

@@ -137,4 +138,3 @@ SYSTEMD_SERVICE:${PN} = "freediameter.service"
 SYSTEMD_AUTO_ENABLE = "disable"

 CONFFILES:${PN} = "${sysconfdir}/freediameter.conf"
-

