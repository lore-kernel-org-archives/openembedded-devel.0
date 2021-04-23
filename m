Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.47.1619208273587676375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPntT7uI;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id j14-20020a17090a694eb0290152d92c205dso1808510pjm.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87ibogzRAexj/22ykhHTd8rEUEjrC0UYMMfr9qYyZa8=;
        b=EPntT7uIG/qZI2LRUDMgRL4ns7x3OSKIaoXl1ZmPpkWPVn4rJpxzrhQ2LzSA4l/EL6
         Z9UCX0/ntp96Heb3TXFtZR0y//FeQMVZuFKuf6LmnBmTnzglCMYRMUCsOMpW6LTDEv4W
         nJCwfGC6KdHetP9rDLoEOOLdr/2VX3IGCadThoLlZo1PemDCXPcW1WP+5k4YWnnLZ4N3
         MsZQIcDCFOUtLMSoGzZuNrKe+sX3jHGp6c5p2+2GujXni8OrRmwB44LmluFWm3/iWZRf
         mo9kjVzcNyQlbCEPRaNMXEgJq/laT9+MyzxQgjm4I8uJdN+cdktO1AASDrr4e+rJ+J87
         KIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87ibogzRAexj/22ykhHTd8rEUEjrC0UYMMfr9qYyZa8=;
        b=c9V7GwW12uMBf4eGxk+CDuO+xpdW8FmbL/Z2SyB6qaK/jy3ETQ/jNry+ZKay5QdRcQ
         3/F20Sy1SdDOIzhiMvWBDUMy5LD7weY9tglhzy7psKfli/bD0CYx20KPrd5ppAaHHrj+
         he83FKkSZyt2xTlyjQ20hWULhT4zWvdbj5FrdMkWL7W8gv5uZDytAONgZIPKIPRcbEoO
         Pi67RX34rK19Prvcq5fGcy0TjyTtyx1XqOOu06XMNDU3SBPsig9RYm2z5lLnvBBc4kn0
         vItYfKAwxXu02T+1Xdp1r+UFBUFHAXOnE5Lgi8OZD5LAgnXFVs4ggHFHrFRDouBAOelO
         KT3Q==
X-Gm-Message-State: AOAM5301dPz2tXIIl/v90Urd4bVPOdULQlITn5qLgS6NoW/PFnjLjjfB
	E6kJwKbVJoqQ1hJ1JmaJrSfIkM5DgV21zA==
X-Google-Smtp-Source: ABdhPJwEKsNLuubmi71GMHmoLJ9cy0RXACPCe6HlZd5eExvAUoHQnVFTPgWaGl3tDDiSYm4Zr8d67w==
X-Received: by 2002:a17:90b:34c:: with SMTP id fh12mr6132285pjb.114.1619208272964;
        Fri, 23 Apr 2021 13:04:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s22sm5653008pjs.42.2021.04.23.13.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 3/4] python3-pyyaml: Delete
Date: Fri, 23 Apr 2021 13:04:28 -0700
Message-Id: <20210423200429.1109991-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200429.1109991-1-raj.khem@gmail.com>
References: <20210423200429.1109991-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyyaml_5.4.1.bb             | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
deleted file mode 100644
index c3025fdc66..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python support for YAML"
-DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
-
-PYPI_PACKAGE = "PyYAML"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

