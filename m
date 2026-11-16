Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4801.1794866446108098003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EixB9xnl;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3149557c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 14:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866445; x=1795471245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KcAEJ/d//yNkNn25R3m5JPPTPab3qI1ELoNHffGJTw=;
        b=EixB9xnlut/UMUAXX901/1UF07/HYAWrbdT64UMLDwTy1dRJUgoWNL11wpsfFrxXXT
         mvqQvrf1CPc5CnlewdI8lKpvoC61dSe5kyawXFANRj9RXAglvdygibayGDgA6RGyOOuM
         ZJx2VfrV/pA12Y4WxrJiGVrCKzXYkpoqrfDCQBqwM4g6Wq6rw/Ciaad/5RUw1ycn4vhr
         vKWBCBkmQp8uYKK1BdLOlFWEWB+fBSv7m2w3zuAh36rxz7bsuCy8cQAmEO5CA6KYbuKP
         2wr6dR7dMpNMbVt3djZiQKWXbL9v3SqwM5mif0K+6zMXzlqRc//w4TMkWZe/f3tTo15F
         y69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866445; x=1795471245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KcAEJ/d//yNkNn25R3m5JPPTPab3qI1ELoNHffGJTw=;
        b=Y5x4MNqr3DzZXkhX80uFZe5TgRfGhSSRNQpCmjLZJPuCAo9F8i7TjqrZo2u/Ft+IX2
         S+1FYwiVU7kzCfiHkoE1zOLFRSfrVPiJoCdelJ3oO5WIybUmMYvnS5izLcj18KCrPZTn
         0ucAmBGcuLep51nggBWU7Hz8ODJx0oJtzhoTLq4+rL1SaWu1J9nSqhYneOR1JnNegLDC
         B301PVP/WR2hWW0YeswkiB+QcE1b0nV0Qz7GtDmS30zjuRlJ7uXYTclibtcmW1b2AUv9
         hNC9jFB0B3S8/92KTj61JuK90EA2DRIaK0iEWIOiJuuocR9TBRMTcFKJUMh3Pvj6PSBx
         xZjw==
X-Gm-Message-State: APuU4Z/tdFyEqQgAiWMmEZyJgMth01j82Hxs97UrcUTwkdi4oB4/8r6w
	loKvaxgxnkYH6Z5tNs6SRD1vRyNvg5K+B7u1MNvROWiFBKLclkRMDAAwk+aQGhUV
X-Gm-Gg: AYBFou0a0we1ddKTZ9mfpexUNJmsqbHFOBStaLhr+4nZoADLE8RieGJEDCPUJ0y/Wjo
	OWtxlPvzezMQqF1JIJOy+leeVoJIoE4Uxc1LEVC+rG2We9tCFjtteP5sAIjsYli/toEFwDgUuFk
	r8yK1vkaB9gI0IBEXVCv64/VpE5ImKfYUCpe3xq1ZZ8v+uy9WOFjMehdzoAJAZO3nWWUrzXZC1N
	Er389a9HBNa9zHgxNymOqsvAY5NOwZz3/nfXOiZr4hFCRLHROZzEnz90h4NtKSLPTkdSNoUAayA
	WnQquFQQhwAF1ajMvlwje1x9GShHV7OeTzVBR7aLCb343+L2SLLymgDqMArvYTREzQGw8Swv6+2
	B8RGdxRBQpMpnNKV9iEaCZaLkHd8WZgW7ameK4gsveAx2+D42ZlxA6q5x7+uwkHg5d7yCyjcK/r
	ijkdFU202JlKNQfTmxsPET/PKTqozW0qn3eezMK0nsqraS9RViUm5whlUAAaNjGtumg9FjHp1/8
	g+Bv0gxAa9Maj7D/fgcWrq+Hr27QNje7Y2CpTHN3R15PGUO3hViao/vBjygFkdCz8IKw0Q2xUUU
	vrelhuWh3BtotxgyKdto7aCwd82ELLnQ0VvBJ3b6UT2lJ5kCs2ojJA+679PUsqXDY9q68Omq681
	kt+6keX+qpx+YGJeCdM3EU5eFcCtHUo1JFbD8kBaEjigrOXylqVjlfGdeUPlt5ku5aUTTHDixnT
	Ml2iL/b6rucC/ZZbS+p0h8+WFJJzsXEotbKKpXKynpONM/XJZ+0de+vQzG0Ddb86dYx7PhAh/Bn
	h0BEMs32C0DfgMCNNzb+XNu1CemI1ShTLAJSUsj259bvS4gVZAR9JGJlYUTKXHoKEo/X3fEDCeP
	U+V4jg==
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr12630681c88.21.1794866445094;
        Mon, 16 Nov 2026 14:00:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm1221905eec.5.2026.11.16.14.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/5] kernel-selftest: Add the modules and tools the tests need
Date: Mon, 16 Nov 2026 14:00:37 -0800
Message-ID: <20261116220039.1807391-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
References: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132567
Content-Type: text/plain; charset="utf-8"

Many selftests modprobe what they need (gpio-mockup, netdevsim, vrf,
the tc qdiscs, classifiers and actions, ...), but the image only had a
couple of kernel modules, so recommend all of them.

The net tests also need real iproute2, iputils ping and ping6, ethtool,
iperf3, socat, jq, bc and taskset; busybox ip and ping lack most of the
options they use, and busybox's ping6 has no -M, which pmtu.sh picks up
over ping when it exists.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 4254eccfd6..b1266fe553 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -241,6 +241,14 @@ FILES:${PN} += "/usr/kernel-selftest"
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle bash libcap libgcc coreutils e2fsprogs-mke2fs"
 # The net python tests load netlink specs with the YNL library.
 RDEPENDS:${PN} += "python3-pyyaml"
+# Tools the net selftests use; busybox ip and ping lack most of the options
+# they need.
+RDEPENDS:${PN}-ptest += "bc ethtool iperf3 iproute2 iproute2-bridge iproute2-nstat \
+                         iproute2-ss iproute2-tc iptables iputils-arping iputils-ping iputils-ping6 jq socat \
+                         util-linux-taskset"
+# Many selftests modprobe the modules they need (gpio-mockup, netdevsim, vrf,
+# the tc qdiscs, classifiers and actions, ...) and fail without them.
+RRECOMMENDS:${PN} += "kernel-modules"
 
 INSANE_SKIP:${PN} += "libdir"
 
