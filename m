Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.10183.1592494090652774633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NmADYDUj;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id q22so201725pgk.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NrkHeAIsuE0UTjXHpAPQo80ABjqjYI7ClIaZX3ea9QA=;
        b=NmADYDUjcGHv/LEUp9Gw6gUms3W0LU2PqJ0x4lpnLzn3Fv6uA2QBYwGehGRR47cfwp
         xme9hZrCYnyj4NY/4CzTnIeDd+q/f3pxK4AGuSTyqfXb7iey++eba56guVpkgbtJ5X1U
         66lahwkVJfO7iKhqHzEbe+gaUCBW75FQ59ROAgS+Y6fiS+Frb/9a3y7XT53ZYA2FRB2a
         xy8tWQs4W83rtZoYHRwWUiwx6XuNeEkyDCDAtpxHV2QsuiJZkiO6hOHNedu4dOgGC6po
         2maeyv1LLLB042Ij/KBCa+/HUwbLswzuRJ4/Kp9QHABz2WQHVMMAGKn7awl1XV8NzkKg
         ykYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NrkHeAIsuE0UTjXHpAPQo80ABjqjYI7ClIaZX3ea9QA=;
        b=I8sjDv+BDUrw/MT47De8vR+F1SE3omCXSt5icQK8s8fCIf3hZr7dy0WCG6dSCRc2hr
         BKUG+Lr7JYSTdJqK4Y5mJYvmg61QfzjMnhaldcHecbcFWQXeQARR2ug2oORt/mNxH24n
         AOjU8DVql3LM3v72WO+C91/pECCND9n/dJHvBGvPaLLk3LdQuBBgtc044r5awBz5awk5
         GBeNphvvoaancM8lHNrvVTBQrcIspqc8s6erEVnqy/gVc8yiMkFI0fDHGw6A9SzpyRTk
         LBBWspILHhHjavUwePCIDdzir10nWWAezZ6wjoUlDj71+9WpcJgsIx2KAkuK94gpyTvm
         q03Q==
X-Gm-Message-State: AOAM533sldltc2ov3fm1eYfrdbTPEvT2dywP6rnMuH8WDlglW2Lcp+rq
	hXVAeMFD6imOvcR6mOy9J4JA/itz
X-Google-Smtp-Source: ABdhPJw97rXt7QxBNehdPSVdtNyHIXnudhUpegD6PEm5fWnMnlUdRdY44Y4F1ycGdztkRZTQS0kUyw==
X-Received: by 2002:a63:5014:: with SMTP id e20mr3623380pgb.91.1592494089839;
        Thu, 18 Jun 2020 08:28:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/7] python3-croniter: add package
Date: Thu, 18 Jun 2020 08:28:00 -0700
Message-Id: <20200618152805.13075-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-croniter_0.3.33.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
new file mode 100644
index 0000000000..4dd53a67bc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
+
+PYPI_PACKAGE = "croniter"
+SRC_URI[sha256sum] = "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " python3-dateutil"
-- 
2.17.1

