Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.6768.1606922926019702889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 07:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eRyRtziv;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id r3so4450550wrt.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Dec 2020 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2r1srud6heBGkOayFpzGMkoM8G+o0Cq7AYk9aoPT9xQ=;
        b=eRyRtzivIHcbqg7sKu14Y+awddcVy2ORrb7s5HJCq96nCv1oj5VM7eCDUlT9KN7YTW
         evmhSXXwPFVxa/i4CU2C+AA4QoYLWev6geote1/xeGYqvv4S5Dp26i69GpikDIcLU8bp
         iT32cptWNWj+5deJ43ywqt5sb7gPK0TjGDWUPmD6rAEY8bFDNykri53FmEVGtI6l/bXd
         OF53VWufvuykm7/+CMTvShzsqq2YlUdudtqsk18BtqG4KY6OFoqD7L4ewoZU7eYIXgmg
         ygpeOyJSAL/9jBki3ujaDkcY8IdTp5yGLBKwpuLMbucoPGR+aThuUNDlEu3LeSJQaUSM
         SEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2r1srud6heBGkOayFpzGMkoM8G+o0Cq7AYk9aoPT9xQ=;
        b=WgJ6FA6uncXswku7a2hjmGFBGeAoXQv4BhtD0L3ocgqgU2TzGBzBJxmpl4Yic1pcBX
         eqP7LeEy9B1N5hK64XAbd/jW9cr63QF2E85z4YUh63T+o7Ji3nVlaInjy0x/NheJxPaF
         +K/8b5YLC7DaqzOchnJMbTXqnHrTFRQfFsSee/g1Fikrq3q9b3M4k4XDM1nkWBfPO5+B
         fvkY3CctdnfEZhC4Q4YnOoZc7V47t2akToonBx0/y+iUY8Tnk34BJiKIkvgycPzprOxb
         t/qZr/zgMSoRwwD0ySZ6Vy2/6Q70xGpaAS06iKqW6WXilR/uEU1A1jziIiZxB+d83ZVi
         iJ6w==
X-Gm-Message-State: AOAM530KyRtfs8oCjMyzF7xzWdUDE7bmlfZIaxuma4XJdgEQAwNkJBkf
	SHxJdzfTxHnZK4Qm1QBAykPLwX3I05U=
X-Google-Smtp-Source: ABdhPJymsLx0QhxVX6XB78zvMKnByZbnatZ0YQPjMmDew6AYz6o/Yf7Eqm2br5yK5GMtUykXzTbw2A==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr4151911wrt.150.1606922924106;
        Wed, 02 Dec 2020 07:28:44 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y2sm2571416wrn.31.2020.12.02.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 07:28:43 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nanopb: move to dynamic-layers
Date: Wed,  2 Dec 2020 16:28:41 +0100
Message-Id: <20201202152841.27649-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* depends on python3-protobuf from meta-python:
* fixes:
  ERROR: Nothing RPROVIDES 'python3-protobuf' (but meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python3-protobuf' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python3-protobuf']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'nanopb', 'python3-protobuf']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)

diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
-- 
2.27.0

