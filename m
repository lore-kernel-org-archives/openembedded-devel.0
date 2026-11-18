Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5743.1794975203741791325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U2d+fQv6;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b24f4b15c4so500323c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975203; x=1795580003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3u3/c7H5YR5dFV8iDZv+n6YaosSXiReLtSdKGFvKtY=;
        b=U2d+fQv6Nd/6ib82DDAz+2rJLOgbRZggxP9OQfKcJboqH64fCMVuK+V64qdgRt4nc5
         JNqGeSfgltdJLEzrk5ki8lbgr453cX9vBwYUvebxW7iGTmyEfb/Lm2gTxUN5C91z5ign
         lpaycBreJfA+GSdDuecfT/3+asrGl0KceBZm4aGn0o9Yvb6I58xxVT4Vq24bP9RNyMKU
         7WGHcX8YgGKveFLbP+wmZmjnvg9XjG9y40XeXbRhp5sV714b5v1AuSLNDxgS+ePelRWX
         n1Q8bHoCx8j69v43s+3CCPRGanAHg4fflc78ia9c3jjpMzVRPRQm7SDawoT7AY/yv4OE
         3j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975203; x=1795580003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3u3/c7H5YR5dFV8iDZv+n6YaosSXiReLtSdKGFvKtY=;
        b=vkl08FCTxzCQWvfBdmKbVk4dNZcvd37nbQY+vMV0opbehpiBOzhB9D1d+fQHV2X1ER
         j9y2hP0Ok13IM4JGoAsi5GHh3bqi3Z4eNxZ4+SWmB41LomdA6uRwZXZ7ZbguqCjom9k4
         q2YSj/8Z/2n/wspzdLlCJClNhmTsrZ03N4wsNafxYM3qVrt/uhuGOJJPUcOkrQEA3m0Q
         oSAMIQte04QZuQX8/23jYmYHBmP75xGLJghuvrEHQmSGiSQ9MWAZmuhZrq1c76Vt2abu
         BMlsWtGFSDGWVRDb9SA1yAQE3aJ0dndHFkx7lg45eFsmqBDoadONZMFXpxvTe+VCdH2y
         4BYg==
X-Gm-Message-State: APuU4Z8t5bpk9cEMp8uYkdyrXjsElxvOlw7cpwafiH8PtV8PxBCjCEE4
	NAbiLawYdIrXT0yOOJBu/6OWuXfYU2EMb/nXWotk+DGYfD9mB03e00bwe/t/BdWe
X-Gm-Gg: AYBFou0x3GZho+LCvIO4NVznAie8YLbT6Ur8Z5oUFXfwcRCmsvYSnsEiXNEIzNQTtYI
	rsfws5/VwAWa9mI2+C8gySiuAZB5AH1YMmIq6qSy5s0yEyk09VZfRd/qwYTXJRyPaL1B+PYx1qO
	3FOWj+ukkoMwfl6dwnePolg551fl/azgc34t4baOMCJVGCiTVErOnwTDA4cnAjw9nXp2KggGBXf
	PoAG4PZ9iQShqryxxuFyGf3J04T/zbHTQ2X/e2lHWPiaAUGMlOLF3gxycTTtkTNemPRDPQp/0xA
	XzmkhnXJ/M+/9TUB0Jsq1ZvLgEQjUmUjA8ZPQX4rYpuyXNG92KsLuT5Ys+hbCjKPvhUeWCxuHFu
	cDoTAgT8S7eZHQErRUTPxEYelnhu6ZMjiSvTjIFO4t2l/WtzGdXPX2mJ/o8M24/pVHDN6wo6/x7
	YXjR+hKvT2Y4TLvq1Y1FUCsHGaIFy4630ow6kc9HCS60BTA7X2ZkiRXyogaUC018IwZ34oW6mSA
	DEL0BicP3X9aPi1FxPNwNEeXDTKzsIq0PvrSJxxq8Sf2/V8o3cc5BVs3zmaQ8yVBBXNy2Xs5mja
	88S7wW64hOoASBL5Q9/AWebn8hS1OdHswHrrxQKmznMQvvMJyP/1rcKw4PfmXYTlOC6pJ7jLdRw
	0dxtdS18hC6oDjZoT2BzruYU0Tp2Ks6G8+2wNKJA/6+pvNaqz/OptNfIAYBtDYuAelVhIzKV4a9
	STy3UCgnaC2vzZSxZYeQoulf8Qj07ABdHJ2rRBjl3CnpQYVbJ3poRmI/p2L9W5MYYZla5IuBTww
	6gXwZqRy1UA/yZ6amvZM7sGqmpw/FTwitqnMKPUDNXUxYg+Tg3h1AvSixiRtSNt79eTvpl0vTe0
	Al4TeKGcDTpYspFlNngfhK0u9g==
X-Received: by 2002:a05:701b:451b:20b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b53a3ae04cmr3843782c88.2.1794975202961;
        Tue, 17 Nov 2026 20:13:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 03/12] libpanel: Fix LICENSE
Date: Tue, 17 Nov 2026 20:13:08 -0800
Message-ID: <20261118041317.2287415-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132626
Content-Type: text/plain; charset="utf-8"

Upstream declares LGPL-3.0-or-later in meson.build and COPYING is the
LGPL-3.0 text; a few sources (e.g. panel-settings.c) are SPDX-tagged
GPL-3.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
index 68cff85f9e..6344048164 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.4.bb
@@ -1,5 +1,5 @@
 # your responsibility to verify that the values are complete and correct.
-LICENSE = "LGPL-2.1-only"
+LICENSE = "GPL-3.0-or-later AND LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 GNOMEBASEBUILDCLASS = "meson"
