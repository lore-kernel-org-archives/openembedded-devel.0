Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.5246.1587597504102914153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 16:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d81Yd/V4;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id h11so1557038plr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 16:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BlWydyJEI8pwr2+8XM9Dc9luBB6XTRKvlggww+ZprLQ=;
        b=d81Yd/V49wD+U/8GnVXf8iVXPiUpmni3U2fSq0qM6k8kfy5VsSEHH/UfQnb+fAF401
         TKAEcGVsvj3KRyPMdBYdWHj9Xi2u+unsQVf9SrIkEzuJx8n4X96DExlXcVYxNQF9tKKz
         O7qLnsW2nz+SI6swl2NlzZX1WMM/8ZMxry9QQwVX9nFnzFFjBkj23MtOr5KJG3gRZJSF
         I0l0t+a2xbbwD8zWeIZsyYs/ncI/Te+EcTL5meag9/P3qrjx0TOO/1Mm2f7QVIVnc1hm
         g/BdXemKNFAzezENo6fu9HKwJ1vb0/dE4EMDB3YF4yBxIv9sVYVB2i1FU4BxBlUuZ6lF
         srEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BlWydyJEI8pwr2+8XM9Dc9luBB6XTRKvlggww+ZprLQ=;
        b=fMU5Mdeyv/Thmyvo3oNvGbp4n8EmAGBX5YB0DraMBmbuzIE2EsJzZS98hYrxh+pzRV
         Ey6c1mddTM5SB6ydn8LEIO8ZV4uH782CaMGDAQVMbt7LJ9FzhD8JySl95HiFjlpTVQMu
         u61aTmjnpzpswODb6yrbXEL3wXtC9OaVC/K2U47VvywBUQ3OfV85P2JeFFkQ4NRwed8u
         9yTZSq9ouC5WPdjjQUUlomnMibOUzsjddGkQrVPmnyt908Mj+NP1dzEUu4zFs3ngCrMr
         vh1ShxmmFeejkM5b+A78KQ27vpq3Y4R9qz8dOvY79xOudAakEDVAV4XYP4LQu/aQdZ5+
         SoFA==
X-Gm-Message-State: AGi0PubzDh4RbGaRMJkPnePjwFURinOyx2sdcKHadiUrVnYtCfMB0AOT
	Q0loQehbbtQ5b2k65P4HkfQPKYatRpA=
X-Google-Smtp-Source: APiQypKMl6eH3ypi2ue49NNlcVTiuQd/nQwE4bDc84A6IfiBIcJbP6y+NlXXgkTvCSQFf7KBMTAu2w==
X-Received: by 2002:a17:90a:7e4:: with SMTP id m91mr1173528pjm.155.1587597503326;
        Wed, 22 Apr 2020 16:18:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g1sm311213pjt.25.2020.04.22.16.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:18:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] breakpad: Disable build on riscv
Date: Wed, 22 Apr 2020 16:18:17 -0700
Message-Id: <20200422231819.1029522-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422231819.1029522-1-raj.khem@gmail.com>
References: <20200422231819.1029522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unsupported arch as of now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index ff5acbeac2..daf262ed66 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -49,6 +49,8 @@ S = "${WORKDIR}/git"
 CXXFLAGS += "-D_GNU_SOURCE"
 
 COMPATIBLE_HOST_powerpc = "null"
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
 
 do_install_append() {
         install -d ${D}${includedir}
-- 
2.26.2

