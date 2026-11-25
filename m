Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37933.1795594086493946521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cN2wbE4d;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38431138772so7038158eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594086; x=1796198886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUdCw026a5XCddpmKWhJRZ3sFktwSRVXVKUNWcLniAI=;
        b=cN2wbE4d+fuaZ/MApl8WVdpDkoJSgIq2V1k05XtE65vheKGwbqI/7b0xRw3vdnj4Eg
         s916MBNnwr9eT11JTlZFT3NeboC57iZpqaSX7Wm3OtzpSfomjNS2o+DNqfUeI4WgUXT2
         toQSSSe7tOW3tL/HVRHSMQg6XKwJ2xQNvlYkKtAF/EZVY9kVGKs3kK/PeoXzjE1Cuvs1
         /EGgf311qVBWjNIQAYDC2QAJ1ygx3rHE9g35TRZJeaQ1tWJvN3XoNDNW8z+98wb8u1S6
         OHTCn89EYuDzRM+UvtOxbXU7CRvHwLSqXcip7/YFW2Zo5EGapigFqB6DaMOp3TBSrjbI
         DXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594086; x=1796198886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUdCw026a5XCddpmKWhJRZ3sFktwSRVXVKUNWcLniAI=;
        b=cB1UW8fNEUCjapcOpD9kKx7KzoZOOlPqgtNeCnVJAOZyOR2coCYAhnpW2akJRLcinz
         UvD6ztX7i11iqqXM0bFlTjql+sd+eGP6lbYie3kB7TM1KpOiFuniVu2fsUcCGRLeRAEa
         Kow1dcVD4/7+6744Z0+zMfz6xm5/NWxlDqY7uMcKwjBHctUl0+4tgahkko9LuYgghMtx
         Yg6SSVUtmclcuQHILFyaHEdeSKAmQYPlCkFaiNzwfCPnmGBp7RiIry1kjAOIDIY6/EO5
         TCUv/Y3XjVt6nKGPwSynS9y8Y5N12WVux46mbk2BY9VAPdR1lfKY7QG/pQeb0jjKgOZ6
         oo+Q==
X-Gm-Message-State: APuU4Z/g/em4sL4wTgbwlBz1THYz2Hem/s6aNZCNnrtkNlc+qI4hN/im
	uys/9/aKnW0MIgcTtac/PEu48uqaAPwJk+ONtDQk6B9ugMgWnR3k3ech0gooyO/D
X-Gm-Gg: AZFdTZcIDeBE6dJ8LI66RrOXDPtQGOP9Wz/pV1nwmJT2BVJ4S8Nl3n23eervhonXz9N
	OT2kXZ9cz0eO4yh1c/zD05mI1ho4kwbc8tO9GZXecAqRFWjv4W3TZ7HKB/KRPX+GhRGgmRp5Yix
	fzwhg+SsHXwWbtN+aWGwKwULAE36vONMxe7vGnDHD8XNb6CBBKLyJ9vnDFO4WY/4pRST+/IPSVm
	6abYRQgdPUQ+ypWX63iDrLlQtSU0BredBC84TlbwuhpJ4LJWiXV69lG57dvtNK63wSLyOpq0WcY
	YxESNRrQj58HJCGfe/q+eOYrneaMy1PlySAjvpW1TrnNo5p6Q0ajN51YDJVFP7KQK3ubBxtKF2T
	GvYgPAQqSdQgpelIGbZCWoJshaiVaeAVWQv25nLoBcWcoq/HSR+HmRwO3PAySn4C9aWdtQQqBmd
	pUSwMdHqZE9ShBngRD5zVe4u6cPMnokoqew4G/SlrCdzHgaRSMNT1r9a7cdEzM+6u5Sv0cOiOxv
	rDiR59eauSSFL8EEKwSUerksHbdNM7yFPCZEPugsUNFvlwEuUmKROwWbi6cmjHOnxSgGuRLO1Et
	pisf9Dq339WDeVeGKT2CjWZc68D1X2b9FPMWgaHMR4R4VuBNToSEKgFsDhYu3o+/EOtPFVWAul7
	2eZ3nv0rCFW/QT7o5G3O56ITh2eLbc1YWYrYn5lUR4ySPBlKfk451b6UN/kuuCCuCNoTogbbRR4
	EBG8AlLNQq3K1y6x4PAvMDTtDXZCJKclb/avKvHYlKKX4mnslbveuY5/VdTRlPEEDaKLYgz3Ksj
	wVVTyEkSCo7WROGm8bh3lox/TccvA4fegWuXFZheZ7dL0uvzd7kwZHwp2HY8L7deZOswjqSzl1r
	5FsQ
X-Received: by 2002:a05:7300:8816:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38571b071d3mr17681632eec.39.1795594085872;
        Wed, 25 Nov 2026 00:08:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 19/55] freerdp: Restrict upstream check to the 2.x series
Date: Wed, 25 Nov 2026 00:06:35 -0800
Message-ID: <20261125080732.2419614-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133022
Content-Type: text/plain; charset="utf-8"

FreeRDP 3 is packaged separately as freerdp3, and the version check
reported 3.x releases as updates for this recipe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
index 4cb71e0fc1..f9bc82ab5f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.8.bb
@@ -15,6 +15,9 @@ RDEPENDS:${PN}-ptest += "coreutils pcsc-lite-lib"
 PE = "1"
 
 SRCREV = "9b678b6d5a40ce01607d8c3b1b1416437c8416c4"
+
+# 3.x is packaged as freerdp3
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>2(\.\d+)+)$"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://run-ptest \
            file://winpr-makecert-Build-with-install-RPATH.patch \
