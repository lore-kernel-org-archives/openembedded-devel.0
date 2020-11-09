Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.5426.1604885403021942718
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 17:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T2vsTKuk;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id c20so6440172pfr.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2020 17:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcZdA7juQSpdb3IXArqAUlFlOTAoVc82B/SmH+jcVZM=;
        b=T2vsTKukoM/dO0BejESOJifY44WswWwzsa3Mb3OHKYLRENXu7ecmoQG8vATdBP7hpr
         sL6sH9N02hOcC/g3e0J0Mt0Kq6G9AtgUib800LJvwZggYR9Pgj4yvFlcy838Vi0WcJ47
         nq/kZl6g0i9QzjlIMXmk9nwn7srMDqF04aqdqwI7lN5EA5U6355CIQG0AwnNFjW+km1F
         0jobnLfiidkA4F7DvbhSgKMa73yDUQZoaE1G+MLkXZ9gUlq3OTGlSYblUcNlfy62K46C
         /WjBsK+m2T3OUwtngB9iQD5eDzcpe+j2hFSTXub8gJ/GfEwyyBoB/fyZN62sKEcuDn0m
         e9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcZdA7juQSpdb3IXArqAUlFlOTAoVc82B/SmH+jcVZM=;
        b=fei8vKAH41KOHUdaDk4KGGMbZFeqYK1mM0fyHNQDpo3/M5a3b5rK5OqopCYgXpeAzO
         bbkK73IStD66if2v1Os5ylilhH5OpBCN4Cvk659Xg3mBV8jABW/tk5HcTVAuw0dqNdCA
         +egtztfUf2mQujLUGihIGPZImOPBQYuBbtbXwnKQRI6FPgRezGhMI4GupHWa6Yd2vLZn
         mPRQvh/7H8tkiMaw2dEIcs9JMT2r9silnwVfdmqcDjk6Z8y6G5ArFJIWddXqa89EGzYB
         BgwRpzSN/aPOm6n/sKPjpI6twceKyHGQR/1SgxrE0z6m8O1RGTVm9UoUYvK54rs0dWzq
         M5Gw==
X-Gm-Message-State: AOAM532lpAOjv1asv1tlqLVaQlF1y99+W/JA7pDAB1q80Y1L+sHoyDrf
	Caj/LHLSyta3QVOw+Y1D6RDOYK+fN/2X9A==
X-Google-Smtp-Source: ABdhPJyY4r1PD3odIPIzuuncFZ83J4ENxFNfWwdzJ1pOGq+UvqVsEv61+HgP3qpDa8FOmcYtQtNF6A==
X-Received: by 2002:a63:124a:: with SMTP id 10mr2756555pgs.180.1604885402074;
        Sun, 08 Nov 2020 17:30:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id w4sm7113969pfq.85.2020.11.08.17.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 17:30:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fmt: Upgrade to 7.1.2
Date: Sun,  8 Nov 2020 17:29:58 -0800
Message-Id: <20201109012958.3829429-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fmt/{fmt_7.1.0.bb => fmt_7.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_7.1.0.bb => fmt_7.1.2.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.0.bb b/meta-oe/recipes-support/fmt/fmt_7.1.2.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_7.1.0.bb
rename to meta-oe/recipes-support/fmt/fmt_7.1.2.bb
index 8add37aa6a..70b39bed92 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.1.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "4fe0b11195b7cd71f39253c44db2c9dddf6b82d4"
+SRCREV = "cc09f1a6798c085c325569ef466bcdcffdc266d4"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

