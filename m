Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.15230.1604943512469067672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwO66HRU;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id f27so4347463pgl.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zL9q3NporWnNSP2+kSrdn0zPO6o1AG82R7boRXy/cgc=;
        b=uwO66HRUrX98K2zuTD5oNq5UE76i1N8HscP64LyMsz+EUpvCnfVAVewDdLFx3ALEFl
         3CujUSVxO2wEP705ZDX4yBw+mONGdfm/6zJh8b7KiU/vD8pBZ0T2q2Ck4CIQzMwuytvZ
         cTIH9ibnyCnoFNgIPZJEVIU4DpnaGeo7S+/WZ0OkYTtNbLunW6E4SxwwPfIhnX8ZcRwS
         PVXdKixWkZtGCgJp+OftCC87rgSPUmJL0ttqzq/7XA2A0U4IBwQcN3PmwdW/SXE8YtC7
         2N02LDdTYaWTksIcmF1uEE3OmBCBEgyWxheSR+NIFhcIL/cHYuLUiFbZfG3ttc6x4p5p
         x0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zL9q3NporWnNSP2+kSrdn0zPO6o1AG82R7boRXy/cgc=;
        b=r4iq+mssSB61lpo9qAp0PfMjfhlbKPBOOfHAU1A2UN4YDQ9NRJuXl/SHFX2AqV60W0
         Hv6GcnaymbRhF/F76fEd1iQK1Q02nG0JLODjKrMN1+ughKK/oobUSGm2ywrXUpBhTwX+
         a6IxBScukPBfqwKuvJRD9FMDFjArm8M5a5rRT5a5HC14qsgsQqgrLEP/HwYs7Wy+x1/P
         N4b3tFVGKFr2nIYCOy5cOGKD9UEw+E0jE5orTpQUKRHZVFSB5FR5oBdpF82jceeMEebc
         pC+4ZZ0mtgXESECXpDIVAC94iRYPRmAcnBZFb70Sf7PfYMd7V7Tr1V+Iz9EKm0CocKKz
         hSjQ==
X-Gm-Message-State: AOAM532vwpXcY7/MMqnrNYtGrWHLdq5kxNMM+XSug8uoonbtCc9JQ8S2
	LQCSzg7PP1iEaXDnBmZ1RefD9g8ZihBZ/w==
X-Google-Smtp-Source: ABdhPJxTE1SR5GJ2adRhLrjmSrEGq4dF2soicPCBxF2UP9sHM6eTkbfAZgt2qqUdio/IpobiXYjUYw==
X-Received: by 2002:a17:90a:c257:: with SMTP id d23mr307190pjx.46.1604943511799;
        Mon, 09 Nov 2020 09:38:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] redis-plus-plus: Upgrade to 1.2.1
Date: Mon,  9 Nov 2020 09:38:20 -0800
Message-Id: <20201109173820.3545516-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{redis-plus-plus_1.1.2.bb => redis-plus-plus_1.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.1.2.bb => redis-plus-plus_1.2.1.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
index e23733b0f8..4059fd47e8 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "hiredis"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-SRCREV = "b08b36a9a91de00636e583307610f49af7876f50"
+SRCREV = "a9f9c301f8de1c181e6d45c573b5d1fe7b8200b1"
 SRC_URI = "git://github.com/sewenew/redis-plus-plus"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

