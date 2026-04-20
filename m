Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E591F557FC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15576.1776677609915746814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p4wFiRC5;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488c2690057so27404795e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677608; x=1777282408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF2J7ismD70kKVx5e6IErCQNi+RPzQ0hiNSuRSR84fo=;
        b=p4wFiRC5Sxq1ahzzNQ3r6tdHiFjezqWz/Ojqsa0Zc4Hl3wQn0dAI9ztLnGhl5lEns1
         cbVp+nFMa1GXM12fXw9oGi9aObmROuXxXNRfjpz1pTmcKNE76SN7rxAlADbOeSLUYHB3
         2QSRV+1oYgmCgAIawCkTWFmE6eZ3qrVvSjhOXTi3cAmFeoCqsd0WLBVA1cshjAeW6h7V
         3kVx4/eCwe6dKLea4mJPA7pJvFQ2kAO3k8Mr5nSjdPSI2k912bkTPD/M3AD+WNgXr+ka
         vje8z981S5SCOjmYwkEBdir5fZPOQ9N6hHGEQZC5glAzm/pcdE8SPs4rbuq9Hehs2oaK
         1D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677608; x=1777282408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BF2J7ismD70kKVx5e6IErCQNi+RPzQ0hiNSuRSR84fo=;
        b=NDyxNbMjaBYPNfwoUX5pWbM2GGPSJvCUzMGm6uMKs1MWZmTsNHmqape6EXnEyWy5+R
         QNSooDXjZX+y368oryD4dlo7qqTXxDFjUxsz8hLKzFZXHlHI6EMxbcVhTPGqYETLzoCz
         /rvtgTMuc/uCToqsLUrbTwVIWdWBoGwiHjrPOATRKhXRC2JQmgHIz874H2TTIiVxbFKq
         KXZo6vx5dB5Qa44XF8z23yEPZaZr5eeXD0ReM+4aCT/YxpE5KNnwrSZZ2R4FcHkcAhLx
         Qc3BCeh9wpWYROAln0cJTVufYqoQf4E9Sr8fFcDMk+biDZLYRHxH49HGeomtll4gI9uM
         qNdA==
X-Gm-Message-State: AOJu0YyPdAIkTxfjDclHIslFFmbSOMjMPdNI7qpG+0I9nC+GSd9XiB+w
	xwjrCnTot4fECiC+voQapmlD6qsblyCFxdO4/5xBPHurE87jehs3m1y+1yERZQ==
X-Gm-Gg: AeBDieuFEMAy4jsjJMBmyWugEvvDPfdFGRAOrUalFZ2Gn0Cu4d5XBy1sxpJydUm20Jv
	1O7yfRmCKbUEUFp22EauOmIkcOmjR2qgCwq9PRyf1eOKI7tP+TgReWFUeI4WQS7QVKPwC0I4d3V
	f9AOINCsgXTE2EUo5OOAl0Y9nU9N7MfB+JIwQ6WyiTnMqaMGwWtMDOQqMDSrv4S+lyXjOpvcV+i
	Mx5Lk23n/ZKDUlHlP5SI7/MmzdJo/+DlYXW2IJ//U4DvzwMYExTEJ/tq4Ps5Q3Zebes+Ft3ZtQR
	KQoiqiDyNaT7/AQ9K47qXe+QEfTciDY4PTwnu30Ru3wokvH/oiK7Ikzrc2ZlhjZKHPXzoeK+BEj
	aMyEvH56yjEGIXXoX+VP+mB1BTlr7q2v4QUGGVJAAUK0F+PI9Cm1/iI3MIoK7BxL7rU9uQ18lx2
	MwIPm9kz/ccuCrqPsgPGgYBrRNzbbKMJo=
X-Received: by 2002:a5d:5889:0:b0:43b:93af:e124 with SMTP id ffacd0b85a97d-43fe3e0968cmr19988206f8f.26.1776677608078;
        Mon, 20 Apr 2026 02:33:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/8] python3-pillow: upgrade 12.1.1 -> 12.2.0
Date: Mon, 20 Apr 2026 11:33:20 +0200
Message-ID: <20260420093323.357053-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126491

Contains fix for CVE-2026-40192

License-update: Copyright holder's name is spelled out fully instead of using abbreviation.

Changelog: https://pillow.readthedocs.io/en/stable/releasenotes/12.2.0.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-pillow_12.1.1.bb => python3-pillow_12.2.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_12.1.1.bb => python3-pillow_12.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index 2b3660fc56..f3fcb2d3c1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -3,12 +3,12 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT-CMU"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=12.1.x;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "5158d98c807e719c5938aa3886913ef0ea6814e9"
+SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

