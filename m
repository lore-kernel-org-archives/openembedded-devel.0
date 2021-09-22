Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.967.1632338559231622633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWkUAXCz;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id q68so3762674pga.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HhNzF2Ud+Qhytr+NvYYkJxwy98BXm/aMCrUzUHQkJZk=;
        b=oWkUAXCz5oaNCoWKMrflhLM0P8K4QBynTHFlQEc24oXrMLyblAYZxXwqbH6PnpqQkH
         +sFsPsPX0BR/hCD1W6+2VSFQ5YTFtsaSkYAQbjT69iltgmvJOtWudbFK6PD54EePwIcm
         XpaRGmbyYd5p8Y9wuN6KDMjG11rdotWW8uj15U3nw9TfQTJn872Mf8euS1IPUlROcgpL
         3swOB/cIrXqSA+yhXiwDa8DDmuSVP0uObImRwnw0HuUyUMh1jG/AGS5vIG+OjyZTEHlA
         XRtQnV3AFY3Ufpjj2Pz62pxP8xCPkDDoY8/bXTHY0XQnFndDINMCICUoUOgJECd9dlK1
         vhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HhNzF2Ud+Qhytr+NvYYkJxwy98BXm/aMCrUzUHQkJZk=;
        b=TICgAPyh8YxXA4mYOMv+pn5rcWGXqWZrZeA/zaQFBy3APY62UTmkcTFmg3WQA2cd95
         /mV5A6/sMiSjcRQtNebxwMKXDlMdAhB+G/9Yg53Y2bZ+gpsiH+rIobTwo2B9qb8UOxF9
         SIJO1WHGGtRZaP/kmll1LnMlHrFnZhmpIRQrQadGnecSRpCDenuTqtSJXrmJL5jQDFNB
         iJksgINYzDVQyJ2kqokclbrBJssHOsl9t3TNBhZCjFvK3pENhU5cv3Aqowo+IHgUrCi7
         z68MSjYpJwgcAD7ssziRy39qzkQe7kaT5VF8A/MTDyUARe4tNj8fgQAnJ8b0JgDE9RiA
         CCTw==
X-Gm-Message-State: AOAM530yjnpU3I5fn7NezAXpe9VixIMW1XceZkxzw4HGvFjlqXbLcCWE
	+5T7gJhQ8iyJZMWLzmHx8g7MmYOZeH/nnQ==
X-Google-Smtp-Source: ABdhPJx1U1KFu8xSCGIoCd6KD07cFdmLOUKjcz14DiW6DQ2/jX7ZL0Whevaa1QpiMHy8Ly8a02Td9A==
X-Received: by 2002:a63:ea58:: with SMTP id l24mr505037pgk.334.1632338558587;
        Wed, 22 Sep 2021 12:22:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 26/39] udevil: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:00 -0700
Message-Id: <20210922192213.3062719-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure.ac:97: error: possibly undefined macro: AC_MSG_ERROR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
index 1e88ced90e..3591a4f6d6 100644
--- a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} = "udev bash"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-inherit autotools systemd
+inherit autotools pkgconfig systemd
 
 SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
     file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
-- 
2.33.0

