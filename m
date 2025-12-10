Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490E9D3C55F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15363.1765373272197602727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UF/y9i85;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7805952b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373271; x=1765978071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=imuFr1gkAuGVwWlvTO5rGr+vRYTiVzbDzJBqB/wvpGI=;
        b=UF/y9i859JYif6+mQX8vjeVUPnuy5bf/szYK3EeZwITX0yn+Ae3aeY3KgbEk9lSe/J
         BXDHSfkJLYX0Npvxk9imvL8mCulFBRujty5SSRQRuTt7l1QzZKaJ5cnC56ydLxULE+NI
         xTyJ1GXnon10K43vk/JTsvNkTGP7id6GbnSnrwC3DDYg+dRHRC509UTZBhZxgV7EKr/V
         0slowXBvPCPBpQUlKJzofi8wQyY3wk6A1XCGsRx9dyzFPODHr0/xj1Gox4LjU8c+Xv1B
         m1vGT8cj0UlLKkp6/ZKWTsLzQanPxLb1RZ2Nf5qvcyrfI7CafMNh1+p7HRNTT9wY2rC3
         tOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373271; x=1765978071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imuFr1gkAuGVwWlvTO5rGr+vRYTiVzbDzJBqB/wvpGI=;
        b=o3laZzbf8l2p6m1NYRDpOREjsGp5i/rTBA6aL0Yzv0shEEDUOvjNEyOzS0mO6VRXPw
         d0TNY46I43sLEAPLx39Me/ygb74VUm61dpH88yXExnsMQ54dnbG00i1khI8IGoCy0S2m
         2Xxxq5CNftyuLsgUW8yNmVWXq7MPntm3baPAChNLEYUDjTe/Yxfcbk9EEHGbJ4/0Q1jQ
         LOd7KBpvu9/snE+EI6qWXi0cbc4mk8sJLtkhe5+gGBUq1iXfRa2riaNIUIb9JApOcJ+a
         6KM6/HMqY4q85rFszwgzhO5Io5xCSTHRflLGkuiQjNwQIi6KP+u8qV01SqkwqwIGDLoV
         eRSA==
X-Gm-Message-State: AOJu0Yx/95kChIOcb5bun0i7OXRfJb8UJ2yt+2ZT5DkUwqd7wqeg5ob6
	MXQdxNVbpQ0a7j+0gye2x+fVXt3HnIm90glTdOEp0hCt22AlGN2/Ms9Qi/AXGw==
X-Gm-Gg: AY/fxX6mnOAC4y54+n1zpkoVB4DoLcUDYmHJzhuB7hvJrWlebXbVetdyVVnsAwCHCNC
	iP7FnLIvp2cmqmeSNSHRaeJ5MeOo0cROKd3ycSh6lk2dDpWR/s1abFf+JPHBw9TXRV9ZhDmPuiR
	/c+mlNHf354T/mQz2WRcQ1g0tSsoHJgNT0lFOCHkcXlUuN/dwHaShv0jERaIQEP0r9rxlIuVUU+
	wZ47vLZmDprlmwJc0g9+Wkeh/NbIeNfOaq9T3gAMzEOI8jkJGDW1JAr+7j69mEHu68KhhqB//Ol
	zM59it9m3FIxB9QxOiZsvLWnRZfnAZlaRB+ZuWVDScWp/CpzWhH3h9JLvUpDkUbO3hY8l42mjo+
	AUjV9/VgdxgMNRbtDeL5LTOx4rYySszQNd2ZL1Iqs52EvgKWGomo4Tszn2QQsI2K4jCxAoOzISC
	WrgytfuLpJacpytMP5j7JF7Ns=
X-Google-Smtp-Source: AGHT+IEGEktLPQppGpBhigZJNE3bd0cqcHgZJA8Wn+P1oDfvoEfCcXu4/W4435BfSiq+X41tHOLTgQ==
X-Received: by 2002:a05:6a00:2ea8:b0:7b2:1fb0:6da3 with SMTP id d2e1a72fcca58-7f22d20a6c0mr2266304b3a.24.1765373271418;
        Wed, 10 Dec 2025 05:27:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fa824sm19163006b3a.47.2025.12.10.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 36/43] parallel: upgrade 20251022 -> 20251122
Date: Wed, 10 Dec 2025 18:57:37 +0530
Message-ID: <20251210132744.336180-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122540

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c9c4b5a88718822697ad41d86b8b89961fb23c10)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20251022.bb => parallel_20251122.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20251022.bb => parallel_20251122.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20251022.bb b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20251022.bb
rename to meta-oe/recipes-extended/parallel/parallel_20251122.bb
index 9fa1b6052d..c2775472d7 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20251022.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "474326d59688d2fc078cf89a7b0b4a11cc9684229b3fa0158fe8bc03f1b69ee1"
+SRC_URI[sha256sum] = "368d1982cfd9dbebb8cd0e444de6199559df94ac2dd1edf95f74350f0af1e84d"
 
 inherit autotools bash-completion
 

