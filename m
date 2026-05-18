Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1924CCD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 13:45:02 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8668.1779111892180373251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 06:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Krr2qCsY;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67d1615d7faso545251a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779111890; x=1779716690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1aIi+Yip2q4jmjLSWVY11h2D5FsnLxm9vDUHdH91x8=;
        b=Krr2qCsYUCPRK7XuBT9mnGNmByJ1KG0v4DtdJE+vQeADUQGOY2ncTP4V+oTZ7GJWqx
         cyUNPCQy1jm1/6/rmsCZ5uR6dqm6VPmUucKYW3tQp0B7HCFkmnN0IoHHn8ZlPtrHkxEB
         BoANS4sVnAP0JiGqCowyajdphoqCIKHwWgzeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111890; x=1779716690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1aIi+Yip2q4jmjLSWVY11h2D5FsnLxm9vDUHdH91x8=;
        b=jmn1By6xB08UFbZmg7nioCverblxpZenVMg7i1V+GXLwKMZ/NR5Bj6bEh85YqErr2I
         kFaE4ZsUxH8NE6GMqfG7IV/8TlxPCkbnDF/CD4KiBVZqQ8CY+5pJsQBEeHCJt5UNflZS
         zdqcwYgJF0IWfuRR4sSOiwkrQnpvFjZnFictV+LiM8a18yE0qwkxs6pCkhocaFXwdgtK
         wKv7GWiGLOEHJTSzXt+3KlLbcb5l81GDPkViW/7xEmMr0BHCof/Ze1YAqXoUf73KrP55
         5mrEP56Pd0lEQa3RlNjIgpVSYoo2LYdZsIEeTKjFI/ASgw0Y6c6gGh6oqbABwCGEfV7i
         CH7g==
X-Gm-Message-State: AOJu0Yy8F0nL1/R4tBgCXIeuCqZsMYHOCQDHyP56WwBTS6JOr5T171R7
	7KxpVSOr2Mh4W+GSxJhVziEZtoaunFkEnVWceaf5J5EB3QsEYMvM3Z8AIzKtESxWXlsxSmNQ99S
	ku7K0
X-Gm-Gg: Acq92OH4fw4CZa77Xwpiii/ZIm+znX1Dga+o4+y5PXC0LjbM6whUxrdDot1KmAPh/58
	SyRlq5PUhZ3MDMOhjqBrGgUzgR2FHD7YX6pyExcLgjMZ0dXLcTsP3UAx3UEWQn0DcHuIJ2ai5h0
	Tym3dAWtHJe6wRy+qKcsvmQixg3UwWQDUXe8xPv5T8CFKGrkAIv9kCoPfWLrGYkurWdFGZhXG9B
	cli2ZbV+TyC1YMoqQC73KnaimvBbwrScEqfn0I3Zui9e9tFpN0zZNyezlVb8fbo21xZzFzxJi2d
	OA61Pb04qc8aAEaqyKOO/wR4Z3OenWO5DrtWEsKHR2nGciBymU3/HprU8HmTTOesYmbXJ8suQtp
	Oz/uN59H6jRQ2L1S853K7fX/Nck/kRZMwYs0tiHpmoEUnZNbTC5M+gkEMjUEILIMtoDOv4t7oHf
	uMouRXShiIYelxQ11koLAbbzzo89VvnSL/F23waH1PnS//lQIeZD+/yFF/Jl5TXQbxpgVgkCotq
	1tl8xb5nQi+W0+6SZpKqRSjJcA0GU0+o0OqESdBKoIrqHHWV3IvWij4d4j4wEfAxXaILLsfw11R
	qW1I
X-Received: by 2002:a17:906:9c84:b0:bd8:d85d:7f5c with SMTP id a640c23a62f3a-bd8d85d81damr38641466b.7.1779111890295;
        Mon, 18 May 2026 06:44:50 -0700 (PDT)
Received: from adam.amarulasolutions.com (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21b1esm569033066b.44.2026.05.18.06.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:44:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] [meta-oe] plymouth: upgrade 24.004.60 -> 26.124.222
Date: Mon, 18 May 2026 15:44:47 +0200
Message-ID: <20260518134447.1145338-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 13:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127050

Changelog:
https://gitlab.freedesktop.org/plymouth/plymouth/-/tags/26.134.222
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../plymouth/{plymouth_24.004.60.bb => plymouth_26.134.222.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/plymouth/{plymouth_24.004.60.bb => plymouth_26.134.222.bb} (97%)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb b/meta-oe/recipes-core/plymouth/plymouth_26.134.222.bb
similarity index 97%
rename from meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
rename to meta-oe/recipes-core/plymouth/plymouth_26.134.222.bb
index 05fe5c51e7..42ad983df1 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_26.134.222.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://0001-Make-themes-build-optional.patch \
 "
 
-SRC_URI[sha256sum] = "f3f7841358c98f5e7b06a9eedbdd5e6882fd9f38bbd14a767fb083e3b55b1c34"
+SRC_URI[sha256sum] = "6ee1068216c5047923fabf0f6aa583e9d77cab383077358df3fc22f2ee398bb0"
 
 PLYMOUTH_RUNSTATEDIR ??= "${base_prefix}/run"
 PLYMOUTH_RELEASE_FILE ??= "${sysconfdir}/system-release"
-- 
2.54.0


