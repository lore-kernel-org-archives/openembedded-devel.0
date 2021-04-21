Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13906.1619018630158920303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 08:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gpjuzTpp;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u7so20022571plr.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUE7O55Zx8NlW3TDRfGZoRoHtU7iiH27FdkRGUcGhB8=;
        b=gpjuzTpp/ruXAnuWZWIBRces8LctsP+Mpk2Jvh7X/XBxttlYLM4YyinD8tCyZ2lCj7
         VLI1JNfixruEG45IHQPUxS8NuxWfWx0Zg7etJ42IE4HJbJrpX4O5XU7p5MdpE3EFDFPK
         vp36Vazme31QG3MAsuUhgCOMJ0SZsEhUG/rMLXRZS0CSYFKITbKUiLfoWNUOf+5sHwmt
         p/Oxx8i4gRXez+9nX0tihaigyDtASAaQ3hG/Pvdqai6fKom92WKsz7WEZA4qpNWVFOYD
         2GBYUaqhZJG1Ln7ZgEm3u6pm4pNlmOpQ8vmHGlxRIFdbyXYtWbYOnlOwMVDBgS0bKn/V
         cmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUE7O55Zx8NlW3TDRfGZoRoHtU7iiH27FdkRGUcGhB8=;
        b=G36tooHZwfyqybn6m63V8ZmvWGrAulg5fQIeYLpRWP7t9RtxGdnqb3Ann9TosevbOE
         AIDf/gX/rICTaNSGE5JHauEhgKcexLpRmNXOObcovHqPZK1LwiixAqMoWQGZimnw++Mt
         3CS/IozA4IES5zzfn8WaSbQNzh+jgs523UvXJler4hbJRR9sbYRgbCTnbl5Wa6NOJvTf
         xEtpx8g1dknO/Fy3loL2CxUnibmeKmCcRvCtZABfSktDZJmMItUlUDLwCRIUUfEAEB3Q
         NLYvQWDqQGdsxiWzgFRAhlyHWASoRbMDIUPgvEt2mWm53dBg7XErp66x0x+EuKUvh1BT
         Vl+g==
X-Gm-Message-State: AOAM531JsDQDBWKhmakI9VjZPLzHWqr2pfuQFor4wwPfONVEX+zE8ln7
	/U+9ASNwM+Fg3kPZ5hTy0u9rqi6u1ocU7Q==
X-Google-Smtp-Source: ABdhPJyh12Cquxc1ZH+oJjiYc+XyuLXWAOJR7KgApqWyx4J2AmGcZBfXcCzPuwTKzM1mhkuujVb+Ag==
X-Received: by 2002:a17:902:a9c7:b029:e8:de49:6a76 with SMTP id b7-20020a170902a9c7b02900e8de496a76mr35460239plr.63.1619018629591;
        Wed, 21 Apr 2021 08:23:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id a11sm2165257pfg.124.2021.04.21.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 08:23:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Subject: [meta-oe][PATCH] tbb: Re-introduce PE
Date: Wed, 21 Apr 2021 08:23:47 -0700
Message-Id: <20210421152347.176368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was accidentally dropped in last upgrade for this recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index b05a59dc70..7e57ebf555 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS_append_libc-musl = " libucontext"
 
+PE = "1"
+
 BRANCH = "onetbb_2021"
 SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-- 
2.31.1

