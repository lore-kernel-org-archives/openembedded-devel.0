Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11947CCD185
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:58 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.18456.1759326771735768846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=au0e1+hc;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso13206448a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326770; x=1759931570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsMHO7VvuKQFwOtXZxksl6AEJGCbyXTo9VFKzhXcnB4=;
        b=au0e1+hcLW4ycdV9zv/7ekycj32TxJ7hO/3IIgLCpRMghAWmzlvUy7yqvtakhXMLu+
         mldnHa5AHVw2KWUNAzu2U1BJ+B+dRPveQQi7tmU84qkIAlPLwo7tVAnNboV6+GeiJAes
         gHUH6g9lXvkety6Q8xvgRk7+eUpdrCTYlUt1svltiESaod0vSNTFv72EnKxWcWKMRFfP
         HpErqA7e3o34mkquvTZJFSiaZIDZA5iUptTFlJmOcEKNHjbaczdEI5kLsFEPhNQUuTpy
         rkNNwfojV4QWjS4t1JF/IzSD93q4llhSDhUVjSodV+HSagKPcwwohIHrLAKkgp1LnSEF
         AhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326770; x=1759931570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsMHO7VvuKQFwOtXZxksl6AEJGCbyXTo9VFKzhXcnB4=;
        b=vay5cXys5YTAOCGNH69EKmmuK5Z21l4sWOCwEY4ux0Y6r4XxqjUY2Th8DtOl9Hvile
         E/+FPTPWG/nSm4+THbBDv4h6ZWwQyCpOVI2JFSNXfVLqx9++ky1RbtHyk7Z98P+7PP79
         16YizMDY4XaRm3cok+TTqVxuwle+rEy2TnKilXUjmp7eCX5gyb11vetUDk9eaIE7gm9w
         /8UwFt0NVk4TrSmIqrcIvcZuapGT6EgMOI+IlAI+w1x/nCM8kaEQwmIG71CC5mIbmGSc
         bQuASVGjb4IBiEkzOPe0u+6W4YA8wmJ2DDWiBrnoR6v+FaX6Xpb33xV9o9WmdnRh2OF3
         dVDQ==
X-Gm-Message-State: AOJu0YyuqGYJJmuQyUECQQiaTK2enbYWR1e+7kd9bREGn1NT3RFyPVwW
	miUgleJGm7GxXR7GAYje9HOAV/vHREKThRx94TTM0UgfycHk1EeJJBNJGsBs3g==
X-Gm-Gg: ASbGncu5KHEcwLFeKONRWPKCGDg/K8gt4vojcqXlzfXn9e95Or/Md4pnCmrb8jT9KLg
	AR4N6OCUsdnd+ty1zB7/c9ODPx50DSqpuJt3ufUJ4PCooe+KORdYMs9Nyg1CttzLMl/w+I1t3GU
	njXNnMlxx4CtABUyb6SFnPESLqnELae+6Su3epPSdkq5Hi3ICO0EYoXvFYFh9KHtwjLys3dMTXb
	u7AReCj5IPFlG597kccLbRZFJtygHIlylEjyOu3g3TPEbDxqjGdSt9v7OjDEiUaRPdgMsCNfhiT
	iIegNJfLrrimYfoKUuUdZmG1W6O9C7BcpCtCbRY7YA9HM5uLVHzEXFoDZnTAS0GH3nTvsW6umhF
	BNxEGjSGSosIBiZ9aWsGNjfzXVQbJjb+bwz7SXbSuCCJS
X-Google-Smtp-Source: AGHT+IFRDKAXdw/LGNXNgc+Oo2K0a/Q/YDrNoH5EtAH5g8jHBBv3iPvnQ108jpzLi/UxhGIoDmc1GQ==
X-Received: by 2002:a05:6402:12d1:b0:62f:9cfb:7d34 with SMTP id 4fb4d7f45d1cf-63678e34184mr2829456a12.38.1759326770007;
        Wed, 01 Oct 2025 06:52:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/25] vlock: fix do_fetch error
Date: Wed,  1 Oct 2025 15:52:25 +0200
Message-ID: <20251001135243.1490753-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120122

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: vlock-2.2.3-r0.vr2401 do_fetch: Failed to fetch URL http://distfiles.gentoo.org/distfiles/vlock-2.2.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 784942b68ef0a9533defee6c6f3d695e1c02cd3f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index a374041934..87f3e1bc49 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -9,7 +9,7 @@ SECTION = "utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-SRC_URI = "${GENTOO_MIRROR}/${BP}.tar.gz \
+SRC_URI = "${GENTOO_MIRROR}/37/${BP}.tar.gz \
        file://disable_vlockrc.patch \
        file://vlock_pam_tally2_reset.patch \
        file://vlock-no_tally.patch \

