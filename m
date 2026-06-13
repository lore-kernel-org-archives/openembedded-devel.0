Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86465CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87391.1781338729852163686
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sRFwk5Wv;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf2247e38eso16337745ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338729; x=1781943529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWmt9hm4RBPFcV8oaJO/+kTBgXex/ab1qLyyBSduhik=;
        b=sRFwk5WvRX8eSpwvrXh4f7+cmTbVl1hFtE0Ijzzr8mkLkPobYmuTFPQOufBIWK84OG
         x0HfLq4r/vDqmdK5yfLu3aJGJIDft2ucEo6q3cIMcSosC71ntm5rNrMIZTR3JYrO59ud
         zKJQzT8JYkTefD64q0CCFl9vauU/xFhUn01sUqKmKMdb6F+Md52s9mxzEXICHIEyqWge
         g9NKibpp4kAhhsPYoY6Rz49SKF3CgtVtWaoUJz4sxhDZqN/KtkSKqxL+dSwQfU6MZjUM
         o+vGmGXeXMBUuLFCYiLTA/A+jMhjqZ9Xzcm9L5DlKDsS7qPTjyHUtXjPS1/dRu2JdF4y
         Qyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338729; x=1781943529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWmt9hm4RBPFcV8oaJO/+kTBgXex/ab1qLyyBSduhik=;
        b=LZH5NzDK3Vdhj0h8U0+y7a7dNHfJHppp7uAThqtlwO30Ir7A6gHE86vDtDoVuhZsoU
         RrIK5gLIfeDFGq2Frk/LvMAOJmhQkLLJdU9zkc4tv3pim4A8B+0VwCoPCGboHbe1+avr
         gcjd8yUvzNmMwN8wp1WKbnbrz6hxhPwpMIhrC8vPxBs7qh3hkRbZbVDY4Zkzu53JhYMr
         Lwhq5oHlPUNtUDEM+bEjx/3gqzOtW6N6o4GO204wcurOvDBUPZliz+VrWw4Ah0kuM/9j
         wY4NeipcG6tgA3GgjTLNPn13l850EPko5QdWXiNUc5EOwxHN6pSl51bwk14oYsJmRoHo
         pDjw==
X-Gm-Message-State: AOJu0YzwSkqcSsBuydwGkIA3n3Y+cneIJ+fvHYwiQJL7ZT/AJy2i23x3
	SFJzawkax5rwp5IidSsVxFDuM6qeKQ7gkJq2AJ0xFZGxNcVJJt3j3h+KqGpmlcJZ
X-Gm-Gg: Acq92OHAyKhN69pHzstgNIV1DwzxqX9n+KM7m8L9jHujEyq37Cgx6Wq5undsv896EgQ
	1ZB/o4GEcyl7AbYgCXHZZzziCHSc0txkWKXQI6ZcefqENhTjo8H7GElGqoHcX5Dp3hxSO/8tw2x
	+JBMcFMaf+ktBdUF6WuYyiDApqbsr2CkKWoagQI14GvRO/eqr5r78gxjQQ2BvkfgsGKTRbOf97s
	Qjrl8dhQUbBgJ6ZUVyjgCPzatuN+o8porkKKUblznUl5a05sEcyljIcQjiKPF45Lxvy4vaoTa/J
	raX8wZyVKKHdF/DjRDAxUQquf9w9edr39bPZ3m6nwYRcnDWfeyQ8+3Ha9Pk1YU5LUZu5nemxKol
	X12qYKR+VHoSUwZz7/HYaL3DH97JwylJkEnznhssNrcfjeNzSBCMnVBQ+ckZ29MRYIj1BqsG3O5
	qacOEoNt//RyxicNSV6ALaIyEraXugKCuTudVu
X-Received: by 2002:a17:903:4587:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c41284101amr74008305ad.27.1781338729249;
        Sat, 13 Jun 2026 01:18:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/16] imagemagick: upgrade 7.1.2-23 -> 7.1.2-24
Date: Sat, 13 Jun 2026 20:18:14 +1200
Message-ID: <20260613081824.1223609-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127558

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2f84b8c1f1cc293be1d458d223f8c61212ac0133)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-23.bb => imagemagick_7.1.2-24.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-23.bb => imagemagick_7.1.2-24.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
index 480f9d9a06..98e1ccdc6e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-24.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "6a10c829fb645e0de1408030e6e0f67e820b0c98"
+SRCREV = "271b6bc4cbbd3e52e6768c5daeac9e9ed7a139f8"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

