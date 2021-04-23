Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3546.1619140248092944440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 18:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OAbuJPlz;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso382478pjn.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T7L2QWtMG8y6YZLP4p3twRJlhquCdDS8JNSpCw5nBpE=;
        b=OAbuJPlzObjwb+DuU78KpA2ACtggbsA4vbP7EmPGD/3iboBTHBHUcZSIt+EsGZxlGe
         0gbL/AvEsKBguZE/z4a3f+JKS0CChjhZ/lclZfkDX29vpumgcq3iiU9EC1p1YFuXp7WX
         YMDSwGJGjuUdmB2zqNnNScymNvnINCs+d+nlES0QIlOu7EYBmQdB4Lt5NKRhd69PzBCk
         gWq9yvH3CeCIXTFIcrOOJAUDxqgnkGS1PYQzEuH3DKS5tu8Ei2RobOcd0dpyoUEX3Tuu
         h5nFk58Q3gfgbskuqx4aMBTjW4ijsv0fG4+p9qINVvZcvgQkl4DFo2OH3IUDZgW4/IjO
         ybkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7L2QWtMG8y6YZLP4p3twRJlhquCdDS8JNSpCw5nBpE=;
        b=BijbdT+MkljrTrDZfX9pm2QMFuBepU8s9sgltlbAfcLmjY0ny4yBRaZVy+oYhS+R3o
         /rTreS1hW+r/my+i89uluRJTvOH47MYeJICvz+VxgYqoRpxAPHvEPY6VRN0Wj4vwVV3z
         cnXNEiact5FkWzbZLHmSs0DyT+whtAsKk4AuS7TZ/47Bc0aXeF5o6X7l4hfVyWPmsJIQ
         RmUYHk7a1xpDY0O7znBWr908qgzx0IICFMyC7urq28noaoRDz3YUXVJTwtt0mu2nAGtE
         ITXrlQTJys5c5ReZoR+gxRd5IntrfbVfFBjl0SphKjksnQJg/7jpdfY62HWWhdtleXKw
         h03A==
X-Gm-Message-State: AOAM530IC8nD7XsI6Bmc2+43o9kMThmQmLxNvCy8NqgZyZ++RI833lhn
	vvAJreLPkVeptcp2x0Vb3nU2QEM9ujZAEw==
X-Google-Smtp-Source: ABdhPJySpnK3ctQlmL77mSfJ48wwGYV2XQIBb7OKvdk+afqwIGmNGefozvFPEYfdHVnrZy8qn7P+Tg==
X-Received: by 2002:a17:902:6a87:b029:e6:6a3d:29e8 with SMTP id n7-20020a1709026a87b02900e66a3d29e8mr1279161plk.10.1619140247497;
        Thu, 22 Apr 2021 18:10:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id 187sm2939200pff.139.2021.04.22.18.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:10:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] aom: Match the name for AOM-Patent-License-1.0
Date: Thu, 22 Apr 2021 18:10:43 -0700
Message-Id: <20210423011044.3627373-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423011044.3627373-1-raj.khem@gmail.com>
References: <20210423011044.3627373-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
index 7ea9b199bf..f5a42fb860 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Alliance for Open Media - AV1 Codec Library"
 DESCRIPTION = "Alliance for Open Media AV1 codec library"
 
-LICENSE = "BSD-2-Clause & AOM-Patent-1.0"
+LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
                    "
-- 
2.31.1

