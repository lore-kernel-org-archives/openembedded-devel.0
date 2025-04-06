Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF181C369A3
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:23:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.20944.1743924195912277913
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e9fJrXAT;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30549dacd53so2664189a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924195; x=1744528995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXYwXnadfJ2hCYyUltSifrmExCET5FRtS2hptTy8Fp8=;
        b=e9fJrXAT69EOp5B1KORDeVIUIClVaaHGss4Gh0lD+BY31P3VT6IzUEefnvuqfKAaWC
         dUg8YRTZbfMx6e2HI4+8lmbgs7RkyFfBFUq9McSmb/Zkmk6N/aj115lryQo9hoPJwJai
         9Qd2XxcvC6qlz+6IweJvTyNNXVTi8poxDGhhflqKGdJZ54mNqeHinEsNZO4HAyuhTP8i
         vHLNDN1hNSoE+z3fjE6gPS2f3kfO41ZpRfRHkqDJU7xkJ8u4rgy1drRDGjjOpAdGBK4O
         gLc7vVMKSgsClZ20f8j7ez/02gHWqzlh1Iv7sYuwztNkkggsxKSRn+wEWAfgauLLF1Sq
         2XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924195; x=1744528995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXYwXnadfJ2hCYyUltSifrmExCET5FRtS2hptTy8Fp8=;
        b=mddw3e5kqfGd1V8tQ03dbph85ooxyNbVcekeqfzCo5MUIVLi6RMuyoFI8Ls5bO5xgN
         xgRXn3JeLcCdgRKdf86XsBwSohcLX8dj2a1tQdc4KHN0+nhyfgWpZvjpNcl7JcsjiEbQ
         Av0U8lE3FmngIQYQTnQU4yw4j39QgCnpSFyAyE4cGm4VurkrZzZ025hvMzGqna1ZlW4P
         RfWCEudHwLq42WqFGRKpK57uUzjNTwrQiK3k88JioCfeCPNPXSnAQ2KKsqWJTCkagrxH
         /2kmMo4fy2DptQVkCw5zvT8nKvxrtCXM3Gg4wzFQgayCZb4JvqfDCXyE7a/9VCEnr7DV
         4oyQ==
X-Gm-Message-State: AOJu0YyxMSYLLI41Jw4dtsCa/fo1pqv2LJjOXMP6/mUcnpomrFsoIRRh
	hAb/RaPDv1TTf2dN3fzghVblnzztZZBsyJ5jXT5LnfLKC3bmc1xRXvCfiai3
X-Gm-Gg: ASbGncvGe6yINEdfM04LrYtLwONQMr1n+qIwfDawWTQtX/YyqMnyaZhdI86e8gaMxVK
	SZXunRDtQ2W0DopvZG/SId8pv5/Ti1pFHB8rDsq866ySpV4hqu2Ce/U94RbMMxuDLVlobnBUPYn
	DIX+tCOengTyOe/VDmL8VWTLQNhsdMKg3ychpk1mTIwDzHl1JKnnHzgdwehGHUDs7wg8bvRAdRU
	5hLhwR4VJWVztGoTw7BkGb3hiW/rlk/akyHxXqBFGgs+D3q8BLoaD3pHOhlgJFcsivv8e0pIdgc
	73jVjZEFXt2R/7MrIVPYrL87Thtb9igkcvXJ
X-Google-Smtp-Source: AGHT+IGCyUYIC/NNupm7UzatmCE5fmxoq3lX/fbniOBqwkKx4ne2PTA6GX7/urRXUpKhg16KjfXYhw==
X-Received: by 2002:a17:90b:5387:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-3057a68c61amr17625728a91.16.1743924194774;
        Sun, 06 Apr 2025 00:23:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561c98496sm11373673a91.0.2025.04.06.00.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:23:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/5] ssmping: Use debian mirror for SRC_URI
Date: Sun,  6 Apr 2025 00:23:08 -0700
Message-ID: <20250406072310.862374-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406072310.862374-1-raj.khem@gmail.com>
References: <20250406072310.862374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 07:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116607

Original URI is not accessible anymore
Drop md5sum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 2d63119750..9b1413df2e 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -4,10 +4,9 @@ SECTION = "net"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
 
-SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
     file://0001-Makefile-tweak-install-dir.patch \
 "
-SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
 
 CFLAGS += "-D_GNU_SOURCE "

