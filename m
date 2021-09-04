Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.4476.1630799323769227411
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 16:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNvjcrGw;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 17so2858670pgp.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBAdQfclsnC1mjlcutPgsusBMRhSiNnVTZXHNUceH+k=;
        b=WNvjcrGwTno5jAxAcetbMP95SEUAsRNayqKhUX5zw5UKLY/6nFfTjjXNyO4DtmIEwZ
         CyBZmNBFOHSNnW2bqgrfXAM2eGRsRX8EwkK10NPjs7MNkVkFmLNG+DBM06Yq+Dzda9jz
         yFDDwPinlv11RwBEOGOa487pcToGnoCZWbjflXEMWPL5WdvMwy5J+/Jrk0iKtHy+UqIO
         IB7Chliks2Yd19/HoVdMtLsAioO8mVz9BbfpayawN+QmN1UprC/85Z7GuGv7rQjVi+fr
         SjHzHDPowVbjFDvauPXsBinxGZvyyWX+GgtxaN8TQD/+Q+21YPO6dmPfG1if1B6W3JKL
         0ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBAdQfclsnC1mjlcutPgsusBMRhSiNnVTZXHNUceH+k=;
        b=QtfcQF9Kpwzko3TXF1oH3f2GMm7VwHeU+Nyt6O67X3Y2Ky4dvV8OmkvaPztq92zVve
         wI9FDUSFdNxtlZm8OxLlWGCpiTM4H2FG0FIDEh5dZJ0vyxU1Hf7bxycYssbbNBzj2qJg
         iIcSYXK5YRms0oGiRiArxtstVxUFE9nRV4VKqVDdR8nPHiggGCYsHflQ3u6XfDksGsJQ
         wlpI6P+BMpCJFinoBx5KzIIXlQbsnyEcv6juHFYkGXW7azbMGfrgRWyWI9a/720uBFfO
         aK0+f1nLsfl7ETfScAglHc6cFg2lthPF0jSMq7c686KC7Bhep6rrIrqoSBF6YxpgesU4
         Kv7A==
X-Gm-Message-State: AOAM530wUYCkbDycEf6vk3Na6hlqg94GLI6lUmsBb5Q0V6K8Wcze+uvT
	iVfP4gtMllBPGuTOB9CBaHHtFpWcrki8fw==
X-Google-Smtp-Source: ABdhPJxt2eHlPVGcF/MmStHlF9hGsoENIkciVhgtkkztTtl2uwEbDTAhd3cbjg2/hkMk5gXfx7a2PQ==
X-Received: by 2002:aa7:83d8:0:b0:3ef:990f:5525 with SMTP id j24-20020aa783d8000000b003ef990f5525mr5201510pfn.29.1630799322709;
        Sat, 04 Sep 2021 16:48:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id 11sm3197733pfm.208.2021.09.04.16.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 16:48:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
Date: Sat,  4 Sep 2021 16:48:39 -0700
Message-Id: <20210904234839.2689048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BSD-0-Clause has been deleted from common licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
index b91a1d864e..21d4dcc19f 100644
--- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Toybox Inittab Configuration"
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-0-Clause;md5=81eeb0083e31f11ab1e33ded846d521c"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/0BSD;md5=f667a3c3830a55a17ec3067709f4526c"
 
 # Unpack to ${S}/orig
 #
-- 
2.33.0

