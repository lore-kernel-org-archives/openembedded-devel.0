Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04A1C3ABA9
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 08:43:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.13692.1745916231121704224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 01:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5luwBlL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3929939f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745916229; x=1746521029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=na1I0go7FDE1R0/LJ0D0mQQx/GyQgncBn6LBjBJvqDY=;
        b=L5luwBlLLIlnIOmkmQuhrfH/USQyoEfTlKLd5Rk6Qa1cZs/kSIgrSSm77ohSUkP6Sl
         eDOIRFEjkiSTYPNpzq6VDjXpEsD2DzLffXlQapleT3FgS0ZoGDaW9IWZ4RAOtzWF9uJl
         qEGPWKr6kHadyTaVxLnDlZxJ4IoW5PkTZkkpnI9yi9l2iUDbZiTgdDrL3BBsqczITOPs
         LKAMXS12JktHGF7npl8oH/3JnXvyDnLk8lBiraYotMXHL8QpxPddgULOWFGMymQw6P8H
         q0ifgPBzpkejySwcgrSPIpzWV20AyTRIkR0UMKKiTxMLddfFzbNIAIlaj1lBut507jr0
         GU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916229; x=1746521029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=na1I0go7FDE1R0/LJ0D0mQQx/GyQgncBn6LBjBJvqDY=;
        b=G+cLpSLzlND3eW8mP8eFdbzrJkT3ENpgvZggFW9B1LmfrTfRC0TaPqwnCAt8NEpqLD
         A4ytFgPLE1N6uul4GiY8bUYybpPnIQx1Az3UvRw0L0lTpFLroG0Kvwrne/vnIdSMrJj3
         0XAzYXbYTWwZr4tXd8Th0sNro4x2cL+m0YEcBNTrzPHtpqYeRHcNVHxTY0/N1H3S2e/h
         IMh+iiYkzUTyUIrwYMCJBuvEBlvZzX+jurImPE2p6tEo8rC/B5xJMNPNrj9CKt1bSwVA
         7vd7wVVIZa+48OzdnMc77l+C+wRNEURNtQDayKhe4Ai/uiqPEoXuyfHr5w3W1hk11Fe3
         38Lg==
X-Gm-Message-State: AOJu0YwU+NZJF86iHnHvqB+1rFoYt0uxp1RdDt5zF6NUBBjqKaiM5xox
	momAp4g2cd39507gm/H0dFr0ni9YzqBexDx7gpjyoog4PI4CVC1Z9CnZ/plS
X-Gm-Gg: ASbGnctjWsEiT7eVZtsM1GkBwvatSLLB8fnWHRfl8mJ1gPn3Zjgf/zXCyPpyN+dvnSe
	HsP8xNEMfcgxlveIAaCBoIxd7VEfAXiiYYpYJghc37JBCb2370BqlnuKDgUNmBXZgY2UypnN4kD
	JWX0yH75vhrRrEoMIYfk6HCEY292x3jg2sZt7lY+/tWKBjnJde6IaklcHZV/MhFKOXUsbfoa/jl
	/iaSXc49UXPP5GtAOdw0jxpk+P/avr6XGoT+tFfNoaQh6xb96Pk5TrTpTo9x+41YhuPe9xH9fO/
	TYrLis+0Zp0Lk7InLf0859JpSOdbakunqHf6wdKNauE=
X-Google-Smtp-Source: AGHT+IEoLOeQZyZp2S6PSyt2OW4h/w1eBLcbf+ploygPvnS0LN3qCYROwmY8ylo1yhjQ7Drpt5z6gQ==
X-Received: by 2002:adf:ee51:0:b0:399:71d4:a2 with SMTP id ffacd0b85a97d-3a07aa6da7dmr8344026f8f.14.1745916229273;
        Tue, 29 Apr 2025 01:43:49 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5d479sm13691037f8f.92.2025.04.29.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:43:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libnftnl: fix tag name
Date: Tue, 29 Apr 2025 10:43:41 +0200
Message-ID: <20250429084341.236473-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 08:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117231

From: Martin Jansa <martin.jansa@gmail.com>

* ${P} doesn't work e.g. with multilib

* fixes:
  git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin rev-list -n 1 lib32-libnftnl-1.2.9 failed with exit code 128, output:
  fatal: ambiguous argument \'lib32-libnftnl-1.2.9\': unknown revision or path not in the working tree.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
index 8368c9cc29..4a5435a743 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 
-SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${P} \
+SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "

