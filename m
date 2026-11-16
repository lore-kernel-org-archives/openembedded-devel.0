Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17935.1794787844853337060
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QCgV5xVC;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so3804320c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787844; x=1795392644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hR6U8lmJjzod0Jh8n7ydbV8415w5jVu/PaotLTeGx5E=;
        b=QCgV5xVCyq/7+BYrmh0nwXeGKaigdQXFBsF+y1TbAFKtZia5h7MHIze1mhEpVWvFqU
         s/SR+XwVLAU+H2109WBBP0HiYHtiPtnPW6p/UN/cBnWSO0q1YOehAzTIwVVGGyIX+mHy
         dLIy4hjgjRthmAdqHNpWDz/SpnLAieZWJ+RZgWvLYCLQLfbMGTWoH9ETpBsvH99hOa7J
         Dr87lcGT4HL1UwnMbDMv0jc9gDmLeiiZhmPmEEL3dvCqq7lCA5ujyp80MrsV/7yxk/mB
         eh8mltYVfeBF+Ot3Vff3JtcYpFW/H0WTXOIFlQrvXpdQJ+dmCEUMQT1uM3lZ5ZN39A91
         4N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787844; x=1795392644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hR6U8lmJjzod0Jh8n7ydbV8415w5jVu/PaotLTeGx5E=;
        b=QUBr4KjPwbRfLMBqXg2UhUkOtDlrcE1d05Y76rXSCvV7KkY/zkQuYrYsA2c0qOwSXU
         TdOw0yv+xnSwumtVcWEZZalQTuY6F/cYw68N7rK/gZY6KOdbNCYvttydqFlvvKFQJr5N
         L+f2cuaAnvWiOk/+iVVZXubqJ1eoA3sPsb2ihmwkngOkRBu3o238JdKHG2H+SKiQ4opW
         rgzK7nnx/ZA8uw765mZhHJWTsgvjW918070Dtu/e7me2zhjEZnu73xUTKw/fxfKXGYjw
         LvoRLN1TizTjSfJLvq02dyu2V3QgaGOqXyEzTBiSfEdxa2tws0yTbhhqAgDSu0Ut/MhN
         dgfw==
X-Gm-Message-State: APuU4Z/uFxRyPZv56nIOj7yerra0imMGtUKwlgd82xPwrSTvilJBiG0f
	H35SM/AceVMrQ1+sIwDUykXE9uHaFmNrArtVQ7y52YC4Zab6WbCG7GUewQW9CqS8
X-Gm-Gg: AYBFou3qAaQoRSnO0qYjmpaAa1hZBFnAlpQ7Pc0StHTYkWpnhloYUInNWIVwWRJ6W2/
	7q35bT26hbOs7kDyYQAZeTyxQ5WDWTt1HvtYfKM+97izYkL1MNkrgKqmDk8nrZgacOXkbvD/4lw
	c+08nI8aXViKQR7Kc9znibM2HCp+OCVHgCG3sL/Gnc125SBsPQmWKdYAXYP6P1vPf+J9rRV0j/V
	X/zQrmGO5JKR0GKE1gw7+sbkKgp8xAfcfaDxRBjKlJX6vEMdIA11HEmwIGLodC3qHAIg92OCgNc
	yiM4n0iyY0SwDBBXo4+VwI0oAawte68AWpI+WfEkjt4Werr1CvnvCFWcSlEYAueW2seh62UB+C9
	ugH5PbhURqj71eV5CuDe7ROhpDPo1HuuvH5dkwdn52MchtKv8kIVdmaCxpxkzipX6LA3XiCGQ+9
	xRFLjz/l6YxXZaiIJ62OhbsEzn6ejWnxDPRwHWP/qtCdHMJQgN4xGQJ/Uvx5bX6FwjJF00qbh8o
	Q/fo0RBHTQfxIIAheLUgHGB/3MfaVkl0wzeo3aUG2ur+tvYorOpm64en1XvYr1ODvJs6tnxQaqt
	rY9Vactzp9FXcjvn03gzRT+s6SZClmeVJxaRu6xw4SljIfPLF3UPwqhLHyB//uvYk4BzIPcziUk
	MLxriXhF5lc9c98OnL6CdJDVY4b339mDHRDFrQpX+1TtQZOTMIaukYbl1NJ/z5WVnzr94MlzHGR
	e9OHAEnnL/4xxoYKmYbtQjsjKZYqVtLyUK6jWjGCtDh039o75tHyIn153oVUB2iN+8xhFyvdehA
	pY0huA3w4HK5W/FxEAtNZemMMMkSwoEoqVPPJg67gJwVAft8hpUWRNq7A1dRWomKEhp+Xxpyekd
	D1ky
X-Received: by 2002:a05:701b:465f:20b0:1b5:22d1:1eb5 with SMTP id a92af1059eb24-1b522d11f7fmr3621661c88.37.1794787844100;
        Sun, 15 Nov 2026 16:10:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/16] khronos-cts: Add leading space to SRC_URI appends
Date: Sun, 15 Nov 2026 16:10:25 -0800
Message-ID: <20261116001038.440763-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132384
Content-Type: text/plain; charset="utf-8"

The libc-musl and toolchain-clang appends have no leading space. They
work alone only because SRC_URI ends in whitespace, but with musl and
clang together both apply and the two URIs run into each other:

  file://fix-musl.patchfile://fix-clang-private-operator.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 02f777926e..bfaaf294bc 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl
            file://generate-srcuri.py \
            "

-SRC_URI:append:libc-musl = "file://fix-musl.patch"
-SRC_URI:append:toolchain-clang = "file://fix-clang-private-operator.patch"
+SRC_URI:append:libc-musl = " file://fix-musl.patch"
+SRC_URI:append:toolchain-clang = " file://fix-clang-private-operator.patch"

 SRCREV_FORMAT = "vk-gl-cts"

