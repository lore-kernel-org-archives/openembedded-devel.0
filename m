Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F4EC369C9
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 07:33:41 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3109.1745048012989943726
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 00:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eF5Wg67m;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2407972b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048012; x=1745652812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXxRir+GbzUt+8UfzXtXMbkgis3HJySPd1228N1Lksk=;
        b=eF5Wg67mHmnlSR29vWtZLsp/VTrmKgeUIUu7E7tNcjpOwBWgHKeSxi12K8i8GwqtPU
         0mZWNjdJE4c1iO1hyIWEG7p2MPTEglKZRnYwYIh6OKU2XeYzbtagbs7KX+uNFmV33nwL
         ykZnLcYhZNhb0byp7wxTHqQFFm+AQiHCS/PUX+beevwY+ikbb1K2RSFe4awGMHRoLs6D
         qtSXcr7m5JYzAQJTsFAq/5ulNrrrebi6bvkcjkEkK47bcw/SFu4TV0qK1mWR3HJ/Nacu
         KqZpKfrm/oMuUceKyRMkBE0kR8lLeinjUkr3EHsgxV8mTTPQ9tNVtUir5wAiiv4WQozE
         sMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048012; x=1745652812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXxRir+GbzUt+8UfzXtXMbkgis3HJySPd1228N1Lksk=;
        b=MpWok0PAL9kFHOiLnu4d1fgttXjc4tuQ44hRHThzQAdYJ1aHVAG40iqHnsIwbjBLyP
         sG9W+6r1yU25A8Z1DIVGkJkRZhmQeAOgMW9r0LHsw3SkzVF8LHtrfBqcqEjp+j8LdH7f
         XC9FvxW+6DXgmvU/z7VATj0UnLwkvUk/eSU72bsRNKZJSdtgeRXn2uAHVdUhQQNFpgTu
         HVZ0A2YXycDChcQ3MtetO7E7mli3vhjZaQ6CHA1PvXUt0e82IWnp6R26SJlkw48qgLV8
         bKT4IzfQoDLGQpDkGZAln+bS9Toa38YwoycOXYAD+BHCm11qpgGXdD39JzFC3yzUndbm
         F2DQ==
X-Gm-Message-State: AOJu0YyKJDBp1byMkrfWTKPkMYRPzCM26S/o+qHiOJ8ns05kwFhyuu1p
	awb6g9VCmxFV5aGYB/eY4ynwMWUBPJpbKyxsL+3U5D221hGR43iRoOzI2vZP
X-Gm-Gg: ASbGncs1i/G9I1jleEBAHR807yl+9U8oIfVdqxj1MN8l991yPKONP/B/0DfRR3A5YsD
	L4sLhex8WfD5GX5PauPT+rzGL+prT97Om9KTLi2pOohZdoyI3spk7VPEe+C+CC+AgX6BIczJuXm
	sRHNENYa39OeuXa2SQLikffqcP16/9l4bCSqMlJdX6NIkMr2hSNTzliFePR4nB5K9yAVzAfNW6B
	bkhDeMMYPPkMacjxcbFhcm2DzkFtx0ubWl65IYGUPsWfnncvxOnTVz6mZf6lGmJYRtObIkHjJtJ
	xLX9BaqdN0ZVK9E7SSgbCE99PudXq6EU
X-Google-Smtp-Source: AGHT+IG1WJGhN/qbCYnH0i0BTlkXxpwuFt3CcEzZ2B7H2QeG2sZp+mMzjzT3z7JaJfZ/HikE1rqbwA==
X-Received: by 2002:a05:6a21:339d:b0:1f5:81bc:c72e with SMTP id adf61e73a8af0-203cbd0bc53mr7988420637.33.1745048012006;
        Sat, 19 Apr 2025 00:33:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13ad7d5sm2429763a12.31.2025.04.19.00.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:33:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-pydantic: Enable riscv32 builds
Date: Sat, 19 Apr 2025 00:33:26 -0700
Message-ID: <20250419073327.2468160-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419073327.2468160-1-raj.khem@gmail.com>
References: <20250419073327.2468160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116978

python3-pydantic-core has been fixed to work with riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
index 03a9483f5b..704d4ad98b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
@@ -70,6 +70,3 @@ do_install_ptest:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-# Needs pydantic-core to be buildable
-COMPATIBLE_HOST:riscv32 = "null"

