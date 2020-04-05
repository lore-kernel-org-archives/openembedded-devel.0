Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.23414.1586111993653653208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id q204so11089965oia.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sQsq9feo6+HXksX8H8FVDIvw51m8z8nxxpiSN6BCMc0=;
        b=p1pW1Bz9aDr8NPSxAd0nK8wVxZpMS1X/4At+dWB6KX66UMdvxNy+PytaoWvLlamZ2n
         5PqGacA2kr+PMfnJi9xu4edEVfRoW62HG5I/k6gszHbqdCsnOawvZGjN5QIZxHUvFsWZ
         6Ek9WhE0FUHJXssIF7Z4b5AfUi2yBDmbcd813ik/w+tZSZPYS6Gq+GKiqlD896SBN0yl
         9d/4GdeDoVhrRs+6kHY4iyQBF+Nlnehygig6Ht7i+jS2/dGIQtHWEZ/fv6pChztF8Sz7
         WkvJpqFwc88ZqDUWQLM3efquSEA+QUHjsSBB4FAfk9ZN/FqRXQ2UhmHS9LzMszLcxu7+
         uipg==
X-Gm-Message-State: AGi0PuapG/ENw2I8SNKf25Re9IIx0LdOVScBnKQpCg55R0Xk8YFnylo1
	gG+1UDbp3dgJFNHxDYALlP9+Esic1bA=
X-Google-Smtp-Source: APiQypIDqVwRbGesSCn0objFNpLrXHaeTYV4n9ax9hRoJzUJsfSZAaWm0LR6GGXoUI/GTCRD+ZhlrA==
X-Received: by 2002:aca:aa0a:: with SMTP id t10mr9742190oie.38.1586111992782;
        Sun, 05 Apr 2020 11:39:52 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:52 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 11/15] python-pyflame: remove unused inc file
Date: Sun,  5 Apr 2020 14:39:25 -0400
Message-Id: <20200405183929.28266-11-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyflame.inc | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
deleted file mode 100644
index d8d8349df1..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Pyflame: A Ptracing Profiler For Python"
-HOMEPAGE = "https://github.com/uber/pyflame"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-DEPENDS = "python"
-
-SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;nobranch=1"
-S = "${WORKDIR}/git"
-
-inherit pkgconfig autotools
-
-COMPATIBLE_HOST_libc-musl_class-target = "null"
-COMPATIBLE_HOST_mipsarch_class-target = "null"
-COMPATIBLE_HOST_aarch64_class-target = "null"
-COMPATIBLE_HOST_powerpc_class-target = "null"
-COMPATIBLE_HOST_riscv64_class-target = "null"
-COMPATIBLE_HOST_riscv32_class-target = "null"
-- 
2.17.1

