Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD3BCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32834.1792043072852048021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gYIllsDT;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e940d5d2beso5642715ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043072; x=1792647872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vk/rKU84FJ4vvlVRH7vePD/7VmeXZxXasKrtWafR0Ro=;
        b=gYIllsDTBMDTci3eySKTarMWsUHYUfsSJKfe9juPaX4WPnCa+nHXQdciwrTNZqG4W2
         UUs7kwBaOqDHwa96RLHNjgA78cDu2pn5kcX2CQ57NN9xdx4BCoLb09aU131Wriinalo8
         JxX7FHf6SreMeUE/UrkxXvc8FbOyc0XPh9TTF/wZKBIEUGXP9fluCmk2mQesiLs7f53E
         l1ovzK4jhsNbfbODZcslzFUV0OTiaLIwmkSQYA/Vp23BurHN8E30zerQnlWtR7gEwHr9
         dY9o3RzYMXjbBEPr2UrL9ck4n02KP1a1/5KAy5edWMZ7EZQLiN9vlY7VtcPBsp4IHR8V
         BoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043072; x=1792647872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vk/rKU84FJ4vvlVRH7vePD/7VmeXZxXasKrtWafR0Ro=;
        b=j0XYqTGetiQuSemHPMcsvtDl5/41m5beeV9Q1qmZgGTpeApidAxmL6FOx/1sBJjcDN
         GWr5IL9dH8YkgD7WeLP3jdngyc0jEKhpnFGvvzeMbmHJ62quAeRyRyrQs1b7OxGbcwXv
         tdCK2Tcpxa13YoTQ1iXKM8riu8x827SKFtFqDpy1NL8PPwoSIOVnzGHjugi955nn7Mh6
         MsGQDxhPMrHfxsn2ipcfBxkelZhjeK2mqSCc+AZIpppA+VVHUyV28qUPDsxhJyBEI4aS
         Y524Jb1hG0vJJRoLD3nq2nn6UBPRa/fwdiJqssCuuWH8N/HLdQ5SFny59xqQwWaeVgXG
         FjcA==
X-Gm-Message-State: AFq9FYKkTMGm6HdYqx4QasWAwPa5ZhbOSu+I0ST4dYW5e5WFlgP2XuUs
	i4+RrVWW9p5LWFDVEKbfC27DcElD5hbuo3RXe2RwmGhqBTF41rTzZOkGWwXYJA==
X-Gm-Gg: AYBFou1Ql/bkhcC4i8PL3I2ESGMBrZGmo0+c0cLZ5cmQ1tcGrp3EIPzUekrcrtv8JlG
	GoKfqtv7iAvT1Vnm9SlDw+5YjEjMsOQim13s/2DhH2Vmk/UOJ0YWukdRO5JjfsjfpMdueaPN2xJ
	5/k0oFQ5Vm7/SoQdLv3537WhQi9yiNhJXybO0giSDfoefLWKLc7pb7zNxZnpa37jKbdrn4Nvy6s
	PphSsEXJxmQELAmX2n74MB58kbjV9IBYyyNsxN6pqlqoxpgn4gbBwK4HGZyzznzhMzdgPOTxOHQ
	lDm5AnvaW7+HVBkwucUqQWgiOg/whAvycYDCqk+MZc/ooxgPCm8oM29zMp23SMbyC9W9tiYXOB5
	uE9Hh9EwUzFIDFhh/s/n/dRtGzNPppyGLY4a3b8IPelc7spqDYJR6OKjGy7HpqnK5JPay/JhRgx
	IcpFh4zZOzwfJUoVfU6ihJ3eurdFSvufz0E5ShKGI7qsx92UNdPyRVl/zKuTcI50UiuOsXMX5Wh
	jc0sw9ICW4UMuWNy0jfnP4=
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr99116215ad.11.1792043072244;
        Wed, 14 Oct 2026 22:44:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 47/82] python3-django: upgrade 6.0.8 -> 6.0.9
Date: Thu, 15 Oct 2026 18:41:35 +1300
Message-ID: <e987e0bfde523d207bebfa2c5d394754e960e476.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130967

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.9/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c39562d398bdde11ba32c9144a8189f87ef922d7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.8.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.9.bb
index 0c7fb2197d..acdd2c21d0 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
+SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

