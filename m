Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37A9C531CC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11437.1784859292880857429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D9y4to5f;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1237249a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859292; x=1785464092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbcuvFFKu8MSRBiJ4QlUoPCWAZEIhFxojSlKf8coiKA=;
        b=D9y4to5fgPSc+CQ7BddnFIsfyGM7y7QjpjO1TJyMXnas9gC71NKHpWlIBLNRc4NdMX
         ihxb66+5bBgLUnUoONxGHRKyNAp8NesOcOvDqU5FyFfPKVuZHB2Q29ws/+xCyHNIOIjM
         QKe8LZpUDqVI5bSHQag/wziN6UHRJwH9H0eyHRUa3idHfG5OS3YBeAGMM/pwuEbP7qHo
         rKKSBMjwHfC8g9WQc+g3MruRfZ8zsDGeRmV6Cx4U4AjI0dgqn3896jSm8RFC+pf0ejym
         3LfjMgPyEbz/z8XiET10PveCrdYlfql9P4zUOtQv2LYQt5cGwD+awpqSVwXXDpsrhA26
         w8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859292; x=1785464092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbcuvFFKu8MSRBiJ4QlUoPCWAZEIhFxojSlKf8coiKA=;
        b=Jpf/kDS3bdVwfgpRhkeacfxPx6rkTUbnUk3R6lEUA8k3uJkxzpNYsDhnlWHr/pRf/N
         9ithwqLsNxlK0BHpgYvgt3ceM6TxCxZtCpmevLPcwRTB9j4SOiZLFnF59NYSDVQBGVSX
         SpWQ0EZqT5SHAn22hJfrUFDuSEGHlla20fUOyzBX2Eao9TN5p3HsNACbffjd+UVzMtrt
         wgH0uuwqHDEHz0u4gpPU5Xr4UXFqAFkKfj5awxYYPvvZU97Xvt64bhXupmB+es7qwQ+i
         QRQkRUpriFdBw16QIaR0NuzQ7OjNr1cAHIGQvLwWOB1cRgDjmBP6tgTY0edqU1wJNlez
         tLGg==
X-Gm-Message-State: AOJu0YxHLLng+oGuSjyQf4yK9TJ1lPFuFxc1aTmNwujUT6Hf76w3Vhy+
	Nbe/7wuQeueFhqFzTZ4Iz578l1bvZj8qrRfvy0F4GHSXAefbUh92Bv5bzdBdrRwy
X-Gm-Gg: AR+sD121oQ/I3Ea1m4du8mG+frXKXsBJMtCwg2E6eeaKdE1HIe2pR4t21v0SykVFMN5
	kdrw9omk3Qz3pMcvt10BAyhlPftpJNvozal6Od12DrkQFItx5qX0CmSB/KIGx2dTrjyuf7e8wXl
	vV2HhB0PBFhwLKyjWfl76lOCx0kDgxhPsQgdyKbw6NgWc4LRqKIQt5HnNHtmkj6FnFtfuIsncRS
	W2rWT1nYHgkS1ukVAOCxgtwcblpQcYPcDR79uL4Ir0pINUJXX5aWadHiyY2MCRh1MuD4ETXJL30
	atq2qbIkqvP3m1pbTEpwJSm/NaMvePGLfsTjGGbgsyhkF+/Zpiy8EFfYKfP3TSuVendK0dKygYS
	DBFmfKFYORT7mp+GDxPO5B96GwRlHK7iI1NUVVY3sI13EVr2SsmKiYFEw80yRZ6mpXE4UZijiWW
	zbp/fJi6vMWM43C2U=
X-Received: by 2002:a17:90b:3b4a:b0:38e:6c37:d95a with SMTP id 98e67ed59e1d1-38ec65ae446mr5286634a91.19.1784859292303;
        Thu, 23 Jul 2026 19:14:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/13] libp11: upgrade 0.4.18 -> 0.4.19
Date: Fri, 24 Jul 2026 14:14:06 +1200
Message-ID: <20260724021407.2840261-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128434

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.19

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libp11/{libp11_0.4.18.bb => libp11_0.4.19.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.18.bb => libp11_0.4.19.bb} (95%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.18.bb b/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
similarity index 95%
rename from meta-oe/recipes-support/libp11/libp11_0.4.18.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.19.bb
index 950880c1f2..237256e551 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.18.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "52a437cd51fcfbaaa8b27d2c6f562e88fd015c0d"
+SRCREV = "ae5756ccf5cb7929bb8edc986a9e6a65584406bd"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 

