Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.5663.1616050137244529341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JNOMtlip;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id q11so796901pld.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8eOPKoPu7QCNF6+p7yYNvsO9DNMOtYcYgn6K8G7x014=;
        b=JNOMtlipV07oCspsJ3bi4o/bZ2U4tKDHEmkw1q6V2iEkgCYs4mrnP4/WfvONBMjYIg
         eDojIY4qY6W2OEIRPFA4jIVpDBKtwoHObk2vZ0adk+yPrVM74XGdU2ZEeBzyqLEr+puV
         7SlxtPmSMgcWjpir+qyobd5WLC3YYblFU63IAXN+S4Gv2g7MOAxCIxdP4pr4sLWOu0U8
         E5snXqoE7p8mKlzvFj1yhuWcc0mbs1cNOAoaJ/DKyMu+m9qXKPQWv3xuo+zI1AUup8eI
         9RFVDx0tl5Uk5KHg/3Lj89cfV31ccxfA3cmUtkfAoZdAzADu+NmPWoyI0wmXWVbB/H+C
         RdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eOPKoPu7QCNF6+p7yYNvsO9DNMOtYcYgn6K8G7x014=;
        b=XObZX+2EZxYNlVxmlVHO0Y2Ixd/LPd8uBJ2UPZNVWLDKWEkt9lpDfWiR3ccDstk7+z
         Y85cAfUgQXAt0p+DGTW81jE2HIISs/Bgw2r8655tz/dhErNOyv7xJRBMdXZq1E75iKA3
         j7O37tAi8yCpYWB6dYQdpH+LuzKjXSy/lW/BMm77VL2b+SsZ5Hs7FNGiJwXFrDpfHGf6
         wiAyQ8U+Q+Gk/iNch9ADX/vPbxwZjELELOjpsDOkSj1Ee1CEA2SqQtMucNAZX7alqE+n
         vRbIE1P83ermKQjAe/m4eYXSk3wV8JR+SkBYMEz+xpuWzSP5VcfHTGBaKdCuHG4j1nAB
         ehIw==
X-Gm-Message-State: AOAM532yWwNHDvLhaMTj93vs3V2YBrK88ncEWN0ell/PldfvqO3+RfaX
	E0/c+9wdNzV7hr0OkvQHw2sOfnOtEEaeMA==
X-Google-Smtp-Source: ABdhPJwZzKJ+b2mYfB0y4D3o5g925BhYGsN17Z2eNh7SNYc4y5HXDQT1fpuQak+tEVpAQmgNhyWEOw==
X-Received: by 2002:a17:902:e806:b029:e5:cb85:dc4d with SMTP id u6-20020a170902e806b02900e5cb85dc4dmr8333569plg.11.1616050136589;
        Wed, 17 Mar 2021 23:48:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 76sm1135867pfw.156.2021.03.17.23.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:48:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-werkzeug: Clarify BSD license type
Date: Wed, 17 Mar 2021 23:48:52 -0700
Message-Id: <20210318064853.1268-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210318064853.1268-1-raj.khem@gmail.com>
References: <20210318064853.1268-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
index 58735c1c02..8af0fef60c 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
@@ -7,7 +7,7 @@ HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
 cookie handling, file uploads, a powerful URL routing system and a bunch \
 of community contributed addon modules."
 HOMEPAGE = "http://werkzeug.pocoo.org/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
-- 
2.31.0

