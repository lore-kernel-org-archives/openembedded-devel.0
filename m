Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.4649.1610730231331646736
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhzoQcdf;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id e9so847833plh.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Jan 2021 09:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tsWCTKMlOW2iqw4EohKjojw28SmQNPNObEU/aM7dzA=;
        b=jhzoQcdffCwUwHGQsmjusI7PYnDmGuEU5PKJyboU8iJHvDYA5ubZ5hih4ZU8pfNw+N
         /G1Lzq6XsG4asKFw5A4KuwzxLPShhuOIv8F6pGbbhOob/TB3VPoQ6NApHGCeubC6iC/K
         PJGfeK5UV8hjl3SLO+LdaEOwjn4mJqQ6OUcUd49oUFBm1ozimFnrCtnH/04+QdrRUsg7
         l2OEroS9Zzfgrd4xzLVANcFoyP653NFg07gcEqj0mnyX3uxV+GFAVutLt8JUjxr8D9b0
         szRr+saKltQtZd5qDEm8tlBIXOE5EHZg56zxMM/iQi0/oYeyo6BSQCLZFqV5JoCigH5X
         NU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tsWCTKMlOW2iqw4EohKjojw28SmQNPNObEU/aM7dzA=;
        b=HM599CU7i0CwezB1OF6WDXC58s7f5/hwWJZsD9+cJ8b2LsWqix5QGjA1P7yAZcdCVP
         WyBArV5+C1F8pJACSdSIK8RO4WbJauYUXdLuePaSy9TNaiE/l47/AATngN4O+AlhCu5f
         8tfPXYREFi7FfdrC1Qx630UwuUCI3A7hiRr10Yduj5BxTCfZjCzSv3gCJhNNJNUZJ+T1
         QBKGkF1lsN2K6SndC+Fs+buHbO0Uw0KGXkRik6ESFlq9XP6OzkWHkdHSKAYIvhwqtTFD
         /UiSiPUB0IWrMDHyETXteqCwPRpmA3WdCQXz09bxDncwquRVm0OpVry1eZ3+Ka2tFQ0n
         A5Ew==
X-Gm-Message-State: AOAM530OkYQTt4I7jwBlZSRARQy+jrUgoXUMCln/kg76S6Y5ydyFT/vk
	RmhZF0m+nf3Iu3DkLsfif5j2Jrl29CfpxQ==
X-Google-Smtp-Source: ABdhPJxyWpIHMkHWBPRLAmYNgm78jBCsnXKI6W/AmGnrSAEPpQHzT6uCYxmzppMPIHbG7RLQaaGS9Q==
X-Received: by 2002:a17:90a:bd12:: with SMTP id y18mr11672550pjr.146.1610730230266;
        Fri, 15 Jan 2021 09:03:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f3c9])
        by smtp.gmail.com with ESMTPSA id w8sm4788318pjc.24.2021.01.15.09.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:03:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-sh: remove python3-tests from RDEPENDS
Date: Fri, 15 Jan 2021 09:03:46 -0800
Message-Id: <20210115170346.117081-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

python3-tests installs the unit tests of python
as well as stuff that no one should care about
in its rootfs. Thus, it is not a runtime dependency
of python3-sh.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sh_1.14.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
index c7b50c21a4..89d5008e98 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
@@ -18,7 +18,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-resource \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-tests \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
 "
-- 
2.30.0

