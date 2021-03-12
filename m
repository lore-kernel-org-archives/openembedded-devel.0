Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5346.1615535224203498645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YMjS1Gmc;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x7so1279712pfi.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 23:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TNcV6+IJ2BfdOfpfuEetYGRa3AzxcKNiGM0O2N7olh4=;
        b=YMjS1Gmcnk/tIFf+HgbobsJob8O9AFMN/WeDzVlGd6fvFXt9Cb1f7X9HHXqux6vkbV
         GmXBYazfMjlObvD8BmaLu4pqSnxgIB1vzihpXpWIRstRhd/T7oJt9CqiE2LRy62cz0Qq
         HJjX5V/rdSWnCnJ+gPBSK+Y68h7+Nv1GJtUzkJ/4ouMyqUArl+eMj/+XvxgPLlcEl1qV
         Xao5VcPdH/CTDghkoEDbOTdQSSeiBnUT0ehPvRhTmLHIeAcFTnOwRdYYOAm3HY/6Kvt1
         JBFANNCiQ5tSJ3j2Bt2MRDRMiFvYh1B5B/t/Cgk7MPRdVF+0reXe9lxDzfyc3iVaz2QK
         K6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TNcV6+IJ2BfdOfpfuEetYGRa3AzxcKNiGM0O2N7olh4=;
        b=ueeM6Ay2n4CDjhNerp1tOEnoB9wIBPB0XGr44TknO4CJnPjoDUjzNKc43jJ6ZKF2Sy
         AoPg3i00dBfZjGRj2E6kO6Gw2NMegRDNLLqVBUihdJhrMBix9sP5MHHge/paj71CBsBx
         XwMzCk+vMn+E1aURT5Xhi6XxQcY+wjvi/fJ3Mm1JQbBfRxbO4MC9dhDUM5b1RAnm+rVd
         gZ6eQw9/j+F503bZi+XOgqOkAiLbkHvaK33QbZQ2pTMWRMjw0ClMegPh0GF5j4j2ZoLV
         Rqv0KiGvVFXzp6uM97M9kRLaeJSRxnQ1SKdsuVyDvlpHOBsvtckv0YwrT1It9rpQH4Hu
         O4Yw==
X-Gm-Message-State: AOAM531ywWgkJlo/ZFkk2OLxYwBWpUshAnffM/pW4xWvhU9Hl7WFJmHS
	pjMJuhZ7VgJI1GTslyIKFrX3Hcgz61kE3A==
X-Google-Smtp-Source: ABdhPJwi6kD2h+HJt6U/rj7Mhl6Wzp7Bid9ydwjJpfxvrEexBRUpA5KH4PJKQmVgPzpaNESpN7pJYw==
X-Received: by 2002:a62:e805:0:b029:1f8:16ba:4518 with SMTP id c5-20020a62e8050000b02901f816ba4518mr10947097pfi.37.1615535223420;
        Thu, 11 Mar 2021 23:47:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id l20sm4810716pfd.82.2021.03.11.23.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 23:47:03 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-grpcio,python3-grpcio-tools: Disable for ppc64le
Date: Thu, 11 Mar 2021 23:47:00 -0800
Message-Id: <20210312074700.1984018-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210312074700.1984018-1-raj.khem@gmail.com>
References: <20210312074700.1984018-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

abseil-cpp does not have support for ppc64le yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
 .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++++
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4512f839f4..df4fcc8826 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -449,6 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-zopeinterface \
     telepathy-python3 \
 "
+RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = "python3-grpcio python3-grpcio-tools"
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-cryptography-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 12b00cfa3f..475b4e6063 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -16,3 +16,7 @@ SRC_URI[sha256sum] = "9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec1
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Needs python3-grpcio which does not build for ppc64le
+COMPATIBLE_HOST_powerpc64le = "null"
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 3d875bf4ba..fa030b99e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -43,3 +43,7 @@ CLEANBROKEN = "1"
 BBCLASSEXTEND = "native nativesdk"
 
 CCACHE_DISABLE = "1"
+
+# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
+COMPATIBLE_HOST_powerpc64le = "null"
+
-- 
2.30.2

