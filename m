Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.44682.1606175662256515149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 15:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e2K6EDaa;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id w187so2069319pfd.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 15:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twTe8+D0DlkpI9VvWlbHYZ/au+lrYVgLk9ymXoZ0nrg=;
        b=e2K6EDaay6Mm3ufnQJnrmCHBit0TsoK7jPc7lRETzVwy0rIPMwgmr1WJcIqjpJDzPp
         jjSPt6XSM+aj3vwR8wlVAj0ZuVcfRTWVsvipIv8rwoR/wTiHjmAnJWZPbce4cF1SpeAZ
         r6o0y5F45S2GqRZBZZZEq7dywTsqaTwZJ1nPAMZSbH6krGS5NUAmjRqE0IU912XYKzZO
         Zk210XhVkwb6UVTD841EIhVGal+G0eA1B60y2XvBxG5QxN/qrTLLAXrn5jL3npysOinO
         xy7BbsapBg0WqOAWMPpAdbl8+JKX92K83FaGvGILoOgDCHN+awXN7GbJck1Kk5X22KZR
         mNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twTe8+D0DlkpI9VvWlbHYZ/au+lrYVgLk9ymXoZ0nrg=;
        b=ng1ajzHACVVC1rJ1pmiMp2JUEEiRQ4A9lC07Eu3ftZ4qt1JtBuvy/XIsKQzzddUlyj
         HLQhu9YizAez3INTYrZ47Y3RObqVSoPQuwM9ZzmkPghc4pXbu2Ici1o3G2rxBPY/eQsw
         6+2dkFevnuvWIPOPVEFr6XUQxWOo8wtLSEUvDbeHJdXFBpD6UhBEVqJGfyBR3P5PeBjJ
         vU0UqusPuGcg1HjFhIE0LujH+4SPMhgkXWUzf6hkA3UqYmQq72FeCQtNXqMxts3JchD9
         hHkVlTV/j6n4RP68bxDtbQ36O22Cb2bgPraK4K06LO+U9kxYDoBN2uxYA123gg2C+P5s
         3d+w==
X-Gm-Message-State: AOAM530uutEiNN3QIu2C4HZtd4JTh3r85PkSjG677kJXcy0a+l4vWJP2
	dUN3X2GWsoXztoNmQcuc56xS5Fx64afIFw==
X-Google-Smtp-Source: ABdhPJwJloqitWGYaCPQ9HuTjQSYD41Dqxd/cVYJYIL7Cs5e3yOpGl6uA0oA+P18LuRathxj8Beq9Q==
X-Received: by 2002:a63:d50a:: with SMTP id c10mr1505458pgg.217.1606175661288;
        Mon, 23 Nov 2020 15:54:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id i2sm3185743pgj.41.2020.11.23.15.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:54:20 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] heaptrack: Mark RISCV host incompatible
Date: Mon, 23 Nov 2020 15:54:17 -0800
Message-Id: <20201123235417.2012834-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depends on libunwind, which is not yet supported on riscv architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 14d3983ca6..80b560e301 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -24,4 +24,8 @@ inherit cmake
 
 EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
 
+# libiunwind is not yet ported to RISCV
+COMPATIBLE_HOST_riscv32 = ""
+COMPATIBLE_HOST_riscv64 = ""
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

