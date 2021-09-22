Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.953.1632338549247030641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TFsCnIH+;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q68so3762122pga.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSFGgd/CkLhzVZ0FskD/hTSNK6+5d82wFNetUm/UFRo=;
        b=TFsCnIH+o29qCoUpbNftS0/CuETUn44JrCE47CerW21FpvnXO1Ug78XM6cCeKUfbP3
         kiSUQd7Wuyw9u33s14q3SXbAzKAffqf386m7IPd5E61W0udnDsS8RJoIbIxzKpRSaIqV
         my1c/ezo1/gFEw0zjay/vmHjl6rMUhMZnum7xEDPBUrMmWAPt/SnD4jBqR7Q69VV8Fhj
         f2NP+dLETpo2ujBrhecKk+J+FJoMuUi41LIorCKbIcO5nnO+ZCAVfY9tMreU+GvJPj+j
         D3PVeEn4+lrfpVvd2rG8vVwaVbn6w90DR6H7AEzKfUlemioGqGhnLyc60wLPyFfvi0m+
         xzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSFGgd/CkLhzVZ0FskD/hTSNK6+5d82wFNetUm/UFRo=;
        b=r60iwb6Uzkwksk7Nxb7volM/6VjBXjhH4RlfV+uwYbDd1jhICvN6MkdxASK/ZvSlcU
         +l3n2LGNoiaXNI6VZrpHNMJaM7kB+5U3waz5iF7UMhhm1B4rz/tnj2F9lkQzgF8/3Hq9
         kFJpkV6N1f8sOfvpbcgDPYvr7EdGYeK8y5KfaTjLe0y6bZjr6QwDmmNQIpxDUE9uflpR
         EPkXhDze3xpj9rxdb7XSdCze4LacA9NyKO3++PMKM/2rw9as6IZOQpOo14svjZTYnxzX
         uwN6V3edsXb4sUvRvc1p4E6pOREhmk4kYxTENF4BO3NQQ9Ki591ieaZ9Im7oTrBD385g
         r66A==
X-Gm-Message-State: AOAM532b7OBatPPYbejRabHAnnyMwQALDif0ZOskPfNEum4dD6N/LnoG
	9ZPdGA7U4wtnycCvomYZlSJZkrDT1w+07Q==
X-Google-Smtp-Source: ABdhPJyFbjyiuOUiXx3783i6fH5phkKYI2UQqzK3yZj3+te1pNGDcyh9+4U08lbpDilSBA920TbbUA==
X-Received: by 2002:a63:7c5e:: with SMTP id l30mr465872pgn.235.1632338548621;
        Wed, 22 Sep 2021 12:22:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 15/39] python3-icu: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:49 -0700
Message-Id: <20210922192213.3062719-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
RuntimeError:
Please install pkg-config on your system or set the PYICU_CFLAGS environment
variable to the flags required by the C++ compiler to find the header files
for ICU, and possibly -std=c++11 if using ICU version >= 60

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-icu_2.7.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
index 4c064c3d4c..2433a8c9d3 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
@@ -3,11 +3,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=244;endline=252;md5=3e00c41c6d04310707992b93307a224f"
 
-DEPENDS += "pkgconfig icu"
+DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
 SRC_URI[sha256sum] = "1382869b22d91cc99274f9b525fa7d9199b44d9007ff0036a09747839a01e9dc"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-inherit pypi setuptools3
+inherit pkgconfig pypi setuptools3
-- 
2.33.0

