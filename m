Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527D5F99C86
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 13:52:17 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66811.1776520334351094653
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 06:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tNLJhUpy;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1279eced0b9so2269488c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776520333; x=1777125133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDQnXnGw6cLn9s6ukteWBtYPLibLzgfU0fUorK3Q6gw=;
        b=tNLJhUpyMWEMefxSueJb3rfDVDRS/g79nzrzQOjjJy+9e2y9a7PWz2JvtsWg5d+U9X
         Gr89QKu2t6N897sVj/cFPHPR3AAPRP5sDlubTCfS+gN7ka8txCu16lSBXX6GewqAl+Sr
         jUGM+UcuK9lOYCIq74TzwwsEWR4hcPwzLz2VPf2874yW4bh5Ttxw/2deDrBhDY/BiWDn
         OhvkmJh+hdReTz0MyxhLLtWLJM7Tx1qU1kTE4ErqfIMPTEAN7uHGD7T9ScsTJyTyC5tc
         7adWymj+h1sRnkhFywS3JXzOVwKE913mH4/aijacPqWDPN2bu8/mR3R/WrLH1/zNxmit
         LxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776520333; x=1777125133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDQnXnGw6cLn9s6ukteWBtYPLibLzgfU0fUorK3Q6gw=;
        b=WkJw5sL2glDegV7p3VhhQXgGd3JIFBjx+sCnAKqhI2Hn3ULoVAYBcDEzxeRw8GWacl
         h8g1Lio/2bxBe+RMf9oeTK3sVDNlaclVZlv+OkF7ZAQKqlo8u5l3QazR/shV5wPQ+uVS
         0ozsRAGtnohVbAa6ckIIq0XHWDrJP/fCZHN2TSMzWQXTpNRoDBOs9odD1rLbst895g2K
         462gb+ykKUJfjP9pkjHm+21J8e2I1aSOUV5B9VSsP9MHkmCsio5f8kvWKhdgIAiiz6LZ
         ONvJwKta7CTn382VewSdb6kzxUOOqd3W9DOtM1i6QFGhdWj1K42pJyg9HHRHdymQQs34
         dScQ==
X-Gm-Message-State: AOJu0Yzh0lo+IFFgRKHXYHxgubX5kaJEXo+J3ABXqNJHk1lapb440ZXP
	iLntBXaNoA3iGu3R0r9oDUPlIRuZP9HMt8CArV43hY4jcIfFQw5qNdoOtZ/DKF/g
X-Gm-Gg: AeBDiesJx5rV4wstWIMm0lZ6gC/eidcJMWr3gAxjfUL1X9qu/kCFhhiVYDwiTC1Ltxn
	QZlRMAjQQ1tyZsuOgEFF/aoBTM1dOT/kv4iZRhmTKajQ0rKUVWgeUBolI5KZ/G8eCeEV0zrnv/M
	qwc/Yr1JQHntoV0z4NX/9E6Ttov1k+KlHiqvzmNz3FEGAaT4EMatF0fZWJy+vG+hlGaUv9Q+uo0
	ZnBC5XnQ2yJFFJkosyfWiyTCgZcqGxbRjxxal3dJDtms3Mfk+eO/GYn9nUao6sCCJRpa+OWbMGA
	tlmZiDwFLipFSbSgeALXqIb26tK0OvEFqk312F2MuYP1iyZFX4R+EPxXlLZc5cw3l9tgt9HXZXg
	XxnxlQfgnTfPaGQ6FwgezNiCfIEDKTZu/sjT7MIyDBnuvDOMT2mxCdkoViZ2LSSrQ/xpLkB8u2N
	ucw5A4NBo+FT1MaHqoTkC9TWuSj33TNCxAmPdGnhpUmIhUiUmSkMetoiP7l4Vmi9rZzaB6uNZvP
	kyzCIinTgZRuRN5bBfp0pRwErY9yhRrIPJukMrBYsa+m5g168Xl+lxNK4ubHog3sStSl/eCxTbe
	cvc2qfkk0ji3J8OUapWRw5ZeJqMJ9s0KfWVh7Db8Qh0wzWLlUfVTQ8+1Rx/P0g==
X-Received: by 2002:a05:7022:1282:b0:11b:e21e:5653 with SMTP id a92af1059eb24-12c73f995b5mr3042194c88.19.1776520333257;
        Sat, 18 Apr 2026 06:52:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm6642041c88.15.2026.04.18.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 06:52:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/4] highway: Update to latest tip of trunk
Date: Sat, 18 Apr 2026 06:52:07 -0700
Message-ID: <20260418135209.1635971-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
References: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 13:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126453

This brings fixes to build with clang-22 and C23 support

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/highway/highway_1.3.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/highway/highway_1.3.0.bb b/meta-oe/recipes-extended/highway/highway_1.3.0.bb
index d279994301..ddd684bb45 100644
--- a/meta-oe/recipes-extended/highway/highway_1.3.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.3.0.bb
@@ -2,14 +2,15 @@ SUMMARY = "Highway is a C++ library for SIMD (Single Instruction, Multiple Data)
 HOMEPAGE = "https://github.com/google/highway/"

 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b42edef8fa55315f34f2370b4715ca9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e583f1fc1c22da0f388b23a31df5b591"

 inherit cmake

 SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master \
            file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch"

-SRCREV = "ac0d5d297b13ab1b89f48484fc7911082d76a93f"
+SRCREV = "c34a36fb145de0a922a6e719b217033e1ff2eece"
+PV .= "+git"

 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"


