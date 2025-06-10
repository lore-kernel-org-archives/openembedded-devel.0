Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43967C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:11:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.83798.1749553891031405924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EDHA0ugP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1641045f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749553889; x=1750158689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d6qXaaaIQaFM39h42NOlhvg+yX6H21IKYqi3U1tHzE=;
        b=EDHA0ugPz0tDQUE9ylUI8S74Va4BeAFVMj1NR2F2SdVHXqvyHeH/M+d1dEyBAEji+M
         a4CZ7KJ/mVf7/Dmvd5uEJVa7FLiaBfp8cZPAeaKzl6B5/M+uYDA769da0bqOZmUTdF1O
         n1lFaMUaffUJva8QS1Fg302ZuaTXaYweYfNUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553889; x=1750158689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7d6qXaaaIQaFM39h42NOlhvg+yX6H21IKYqi3U1tHzE=;
        b=Z9KwZrkU3qpz6qcHi+ILbPVy92kVnjpF2TVIdfP6aEuaQdM5nwfZwxBfsi3Y+jJASM
         jUpTLYMl8m4eElIb1HqywY5Mm54Xcee9KeO0YJnvdR3bKARKwRP37WirdhD5kl1TM5+X
         IH2YRHuuvt9VgNhEPN6p5JcT3QY9HbLwFlt0JOP/pc7iPZCDm9QIi/ClT1EaNNjwpwh1
         u5lMTccSTcDhPmFqT5MddMJi4nry9cWY8vGNp8s1XcpT8edunhw3uY4TaVNzai7k+ctY
         zzQ1nbb+hKt/nU3FJaWEUSifYmzdtAHKNJ+7JeV+x9CFZhZvlTR8Wp3vjs1cH6TwdhQz
         vckQ==
X-Gm-Message-State: AOJu0YzFqZtQtsH+F26JaZVpRkcq569AuJGS8NyMcBpwbdnHOGIWHVej
	h2ydqHxfE4BDApFivjfu9UnSD0k+qR0upS9ryEKMa8bntI7/NAf3I7gUP9O8ucnu84jFoo+AV3T
	+SV/0
X-Gm-Gg: ASbGncuaj0FPlxspFNX8dV3dRMIZ70eB2E65b+kIJ6oBmkKQRcz1aOzBCQFu8uetRb4
	2f5gu486+aJzpKpO3tpNvL49XaWvsblvqT0OaORr+6slmF88MOKRHAMYMYesNFY0DhrNKmiEOzX
	d64yEmL4mNfVLUA8pR1UJVzWOu+3YFkqQNxe+fg6UxOwALaG9BpqgeBN841TLawnC16nvfb9A5A
	vDBXHV4G+VfQibzpNejgGheL5zhvWKeVo1w8B4DnU1otY0OwHu/Ir6uP2WIUkSdVeQ9bve5xwKd
	b8HoqWUWGX3nmBcdmyZ8E6YnZMxgq6HIgXPkoUViUZ/zSWdpqSXciIT4SnNZQ4J8Rsk4J43bX3f
	b
X-Google-Smtp-Source: AGHT+IEL+VoKWkg+V+NM9uRev0vZ9eM3CLvBed5lN03vf7+zPInJeTBtTc6AtxzmS7KsHUi7BNzc9g==
X-Received: by 2002:a05:6000:18ab:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a531ce1809mr14420959f8f.46.1749553889299;
        Tue, 10 Jun 2025 04:11:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dea7sm12267343f8f.12.2025.06.10.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:11:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-prompt-toolkit: Upgrade 3.0.50 -> 3.0.51
Date: Tue, 10 Jun 2025 14:11:26 +0300
Message-Id: <20250610111126.2530443-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610111126.2530443-1-leon.anavi@konsulko.com>
References: <20250610111126.2530443-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117864

Upgrade to release 3.0.51:

- Use pyproject.toml instead of setup.py.
- Fix edge case in formatted_text.split_lines when the input starts
  with a line ending.

Fixes:

WARNING: python3-prompt-toolkit-3.0.51-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mpt-toolkit_3.0.50.bb => python3-prompt-toolkit_3.0.51.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.50.bb => python3-prompt-toolkit_3.0.51.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb
index f59b6a6ae7..77b05f7f90 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.51.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "544748f3860a2623ca5cd6d2795e7a14f3d0e1c3c9728359013f79877fc89bab"
+SRC_URI[sha256sum] = "931a162e3b27fc90c86f1b48bb1fb2c528c2761475e57c9c06de13311c7b54ed"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "prompt_toolkit"
 UPSTREAM_CHECK_PYPI_PACKAGE = "prompt_toolkit"
-- 
2.39.5


