Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED078C021AA
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:28:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.15727.1739366879645974776
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 05:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bhcIqzP5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so4571021f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 05:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739366878; x=1739971678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBrQP5OoI7CaYTMkbUvwDte5/jKcmnd7/Gf2nLeurtE=;
        b=bhcIqzP5Uu1bGVvxs1vXjDX5QiFfco+dhdHWpnpXmFWZj+yT2PyJ5CJqSaMNXySBui
         k2GVl6u3bWrGJgFC8AQnJjkthEf3Ua0G9szpXybZINWANz/Z665oxHaQsqofckb28NaW
         GDw2J/iyS0buPF8K35cC1Lii9eI30yRHTr7nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739366878; x=1739971678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBrQP5OoI7CaYTMkbUvwDte5/jKcmnd7/Gf2nLeurtE=;
        b=LiViKuqSa9OL7sTQ2MZtwblRdL9w63yLKePphd8fPmLB5I3XLMaNQsMQ3up0H048e8
         HJ/OiF8F6nTgcz4s1hoUNASm3QEp6NSKg2ZuJfOJSBV7M+GtJuSPqxEBlcu9GcT9Atan
         M4bRE80MSIZpA0mRr24chAEluy98ihM2O9oBMk7Iye6yQs7tUciuUFjBO7bsktxc8OLA
         Uu9CRF4IPpS3vjTPjEy7mjZuYsUJ6oxTRysfcBtSEzzZvhqUMtvkcpMTyGAWnnCErWDr
         OBLGzRwK5I0HOsFChW/z/EISqCwSYy74XxVP1yzXd6o057j15pMEEvtO2cGnbzJnaYJW
         Knqw==
X-Gm-Message-State: AOJu0YwmCGHMIFkiO2Lv6h8hL3+PM7NVkyPoQ67v6KUOtcjO5LhgTGMb
	R33Sx6Dgca7RgZV8qGbac3rhb3kuVpykXxc2QHTQiQWuo9MiSuEBtfY1s6w5D4C8ef8f+TU8dxB
	w
X-Gm-Gg: ASbGnct17H6LWtsUxicRB4Bx4rG6Hsi/XjY6x/7e7eurOcQyDzBEB4CoKwAK5hHGHjq
	sHcxWa/sczDe25x1KlnvCoQgCQ8dvk4xU2ATLB+uDOBbQIb6VHHlnFXGo4yMmY+M/ajFwOaqfqJ
	P75HxBXsuGo8+rIDg2Zw5reY8R6HUWUWS3vcacydgvV0frkcntX9A+F9+gqTyAKDjcCSDKGFurd
	1RJVWL2wY0n5ImPoGHWQEnkAu8bsHfsD8pnV8sDr4y0PP5aoqUnq21TUvd8/+jus0r/rbB5Njtq
	HJbww7flua3SQWuVhornHo6H/aXnuQ==
X-Google-Smtp-Source: AGHT+IFr/nGUBakQkfEmyzhsFerMAwYa528AkAUkYmbjc2/0dIC++pButZZHza1rVD7U4I+bkMpgZA==
X-Received: by 2002:a5d:6d02:0:b0:38d:e092:3d18 with SMTP id ffacd0b85a97d-38dea2fa0bemr2756294f8f.50.1739366877737;
        Wed, 12 Feb 2025 05:27:57 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm14781835f8f.5.2025.02.12.05.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:27:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-git-pw: Upgrade 2.7.0 -> 2.7.1
Date: Wed, 12 Feb 2025 15:27:51 +0200
Message-Id: <20250212132753.957846-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250212132753.957846-1-leon.anavi@konsulko.com>
References: <20250212132753.957846-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115445

Upgrade to release 2.7.1:

- Don't decode error response bodies

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-git-pw_2.7.0.bb => python3-git-pw_2.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.7.0.bb => python3-git-pw_2.7.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb
index 07fd98ddd8..6308732f49 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "99cb0b4a603386127c8205358d9780428a0468f8b1cb73ace804a5a466a28ef4"
+SRC_URI[sha256sum] = "f69c57aafd13d21d6fa604dff680c4f9113a8f31bf3f65dd663bad0e1839b0e1"
 PYPI_PACKAGE = "git_pw"
 
 inherit pypi python_setuptools_build_meta
-- 
2.39.5


