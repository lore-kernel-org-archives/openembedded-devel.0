Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.18130.1590941801662419795
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAsrH/Qe;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id y18so1457618plr.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+a5KddHqnvavv8d4NetvPN/q4KbJXf5hCyu/GoNkZrA=;
        b=IAsrH/Qeap32pZS1ezRgJvmgeo4BNP1BXZYb6E08dHdAKMZl80t03SKHM18Jonm09z
         jYtK3HGTZlgbgynlbJ1n3TmrmPfyyIUEXVpSdoALjOyZQZzXz9NziNwawRhYodw2sh8D
         1swWSiFyTzmIyBWHC+CBDsXh3st1lfgxEwiB0Fq0JdjA1SRrw2iW5OzXYbpQ7unLXgm+
         L8b9x+lnwhAvbcQCsSsJ86XPJyX+um89MJM/INGPzg1v3e1eYi9I8GitmCwLFyGqKjg6
         HIbqRtgICkWmp51KwlmhkpuybAXMMIgHy55qTwm7bqEeq7e1yVEhtiQ46WRQ7nrZzIxG
         VK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+a5KddHqnvavv8d4NetvPN/q4KbJXf5hCyu/GoNkZrA=;
        b=Jkljs/Y/QoAM/aHRUB8C9Cvueq2puwICxxcqXHVpyazfZalAqaC5wlLrG8dgTcQmqH
         VyIYR93j+A5dF2qmeU50MmYrSumqDw2qitBelLK7KyeoyZ6gsAtLAcxtMW+ayr89XX5S
         Cgfr7Crxv5P2RULlVWIBO1UYCPazLUDzdzjxFJ1eZ0WFdR8uDTDPNS/sex3OKERzMjDp
         VPjX6MYHXSdoNWcV8xu9z+7JDqSfnEXJt9uOhRv98y0NWegTdBsqDPvE2pQd5PMcrQAQ
         RrR/yRx3HthnADLEKLGIUz6vciz42NLiuP7wxEjkA3o4NFoTJdJUvyUFffjLqn5pE386
         fQjw==
X-Gm-Message-State: AOAM530Rs2PxD34qpScOtEA/px2fo+NayVw3gWWaS/fWXEuxc45nSQE3
	kha/7tPHU5e5V6kYKfdfoIxV69AI
X-Google-Smtp-Source: ABdhPJz3tFsT4xhlMo3hVYeogV3E0MH0SG+jXgI4SeeHyc8YfCdZgntBMs6qV80AP1y/Yr6NzOUdnQ==
X-Received: by 2002:a17:902:8494:: with SMTP id c20mr16930246plo.305.1590941801006;
        Sun, 31 May 2020 09:16:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/35] python3-iso8601: add python3-numbers to RDEPENDS
Date: Sun, 31 May 2020 09:16:00 -0700
Message-Id: <464737760b7dee8017b0f11df189a9e51d3cdff2.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python3-iso8601 relies on the decimal module from the standard
library, but it is not in iso8601's RDEPENDS:

|root@qemux86-64:~# python3
|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import iso8601
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/iso8601/_init_.py", line 1, in <module>
|from .iso8601 import *
|File "/usr/lib64/python3.8/site-packages/iso8601/iso8601.py", line 12, in <module>
|from decimal import Decimal
|ModuleNotFoundError: No module named 'decimal'

Add it to RDEPENDS to fix the import error.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e60abcabd33940ab7454eddcb92b74426ba3003)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-iso8601.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
index 61e9abbac6..a70843eadd 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

