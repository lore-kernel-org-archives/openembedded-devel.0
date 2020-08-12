Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.191.1597273706852641406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 16:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ORgNsai7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so1781283plo.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQSSPAnh96kjOsSEjAVDIABoQKucNAVEHihg7bUa1+o=;
        b=ORgNsai7xf9cvZcQ6qFCa7ArbzB4TFfmxXKLRR3XYwL3MalvVpWjiM7BTZ9yJsBDv8
         hI42TFNmXDxe4CAC9kPviI0K4W1eCwbbR6v2FklawK9sBdr/dERCicW+VBQwf5b0H2xF
         Sy1QzTyRz5oGdxX9ENZ1qoDWnEgT9hGXKECVtr9aj22u90z+D7XvXy4zrgVfing6AYl4
         MNYM3Xzyh8eQD2kEhpxV79KLrxX0UjduZ5XXfGkMokVXZ61tY8eqL0mAo8S4wXbToUqg
         430NRTI4NhAvcLk+DXe0TMo+wKJxAYQgL830syna4BNnPj1YUYrOM7r3YrQd58caAE6j
         ZgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RQSSPAnh96kjOsSEjAVDIABoQKucNAVEHihg7bUa1+o=;
        b=H78wXPoIVSNvr3hSi2eFJyeU2eKLBExRskCtAbHZyRB2mH1aPS/cgtF8dA9sdEb8/x
         Szdp9kYSZ6coVyKho+u/5gnfteuEr8DIeD0q9RX/GoiWRuHB9DGNTsJVQINrnWODo5X7
         M9DbJbwhpouWMqgOHn5DHm677hBdAXKhcAs8gy6s/+BvYSZH/59KPzAFNUjMAiiE1iEY
         99GoihftBxSrVfJEOWgbvhtcoRMojIYsA3KXfJIdKDfHat7Bzcyz//orUR7b3FIUHC96
         2oiTp5GhjrZzOuXJ90Ome/4DyDiCn/WboXHra9SXk6Q0aKtwQcJ/mzjbyeI7o+UtX72m
         3Ryg==
X-Gm-Message-State: AOAM5331PWZ3p5Wk9+pD8gkB/BXYX9JUSig2XM/sxKESQB8HTHxnn5+U
	BlXhmPpNeyEbuuvzt/LN57FdSd6nnLY=
X-Google-Smtp-Source: ABdhPJxGBRlXrsedJrelYvsjJqZB2oU2w/EXtKFJwHteG5BdyPWgGvnroExQpkc0TYzrgW4ftVuHoQ==
X-Received: by 2002:a17:902:7291:: with SMTP id d17mr1428483pll.141.1597273705963;
        Wed, 12 Aug 2020 16:08:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h19sm3112146pjv.41.2020.08.12.16.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 16:08:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-pandas: Add workaround to fix build with clang
Date: Wed, 12 Aug 2020 16:08:21 -0700
Message-Id: <20200812230821.1802729-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812230821.1802729-1-raj.khem@gmail.com>
References: <20200812230821.1802729-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a bug introduced by cython [1]
the workaround suppressed the additional warnings seen with clang [2]

[1] https://github.com/cython/cython/issues/3474
[2] https://github.com/pandas-dev/pandas/issues/33239

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
index f100677caa..7d65287cb0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
@@ -15,6 +15,8 @@ DEPENDS += " \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
 "
 
+CFLAGS_append_toolchain-clang = " -Wno-error=deprecated-declarations"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-numpy \
-- 
2.28.0

