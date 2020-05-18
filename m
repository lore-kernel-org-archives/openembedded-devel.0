Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.43715.1589813420508311261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XCIfUq1z;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id r10so4941157pgv.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vLIR/+pusgKyagKyMPifapbWiB6C+YvjtOy4E5/1nq4=;
        b=XCIfUq1zKh5LLN0gvNVEnCOrsh31+Q0Vu6osi6MrARZKk5qf8x7MGl2yTyjaE6p6kk
         /4I/6SbMRLIeM6PyZyAqcbx0MTk/uMY7kalOyoIWPh64vOMwAMXMF9G5TW1t62BTMYVF
         d7ceAgtdWlx/hcSxDSP3abD0vAA/KpKeDsbJAX2wLFd6qHPfvwIl/LRzvAQT9c5vV+oB
         QTxScUa26cqSMLKtD53UoC4wFHDifOKFLTpIsaTMyrMD1a632q9fBLnW3Qx31ZwTPQOL
         rGiKREStZHvulHzikjeCrs7MY8EBRW4g89eOO0dDvfVzUM3+ZHCQGuSZPo71CAhiQNxI
         oQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vLIR/+pusgKyagKyMPifapbWiB6C+YvjtOy4E5/1nq4=;
        b=LPk+io5ZIObgxoBJy88oG7IffurR/bhP7PdPBwyG115jIRcmzGHIwq4VlCrIkYtpDp
         cBgI8vImoSzpF5V2MH81XxSysNGzitskYLvZsybZh1MLsyoql7bU4SXAGlnZ0PmoTrZx
         mhx5jtDAGksbTX8X1Kg0uixYZPT2+zd3a1w05QJ3IUWqM2Pw6Eyf9/Z173THzbHWgTfC
         J0uM1JJUaZEcrGC3w+s1negDdVU/JZlt6zhZ6ztzjweH5zYMfbZIGlhmyCzz8vFCknmj
         Yv4QoZ7zq9ojSp2PComvIQ8DjR1Vog4v7B84N/kv+K/iuqNafTee6WgQMYNLyTDGLQeZ
         rKCQ==
X-Gm-Message-State: AOAM531XJdzulFZLrirK9CJA82v0DBkU24xvUQCC3HrW9zwYxpDWnCHC
	vG4ZswNaNzyYdsQUbl9lrsWHwUgR
X-Google-Smtp-Source: ABdhPJzpp2DzqOXGODPTOl3uAg55S31lZhv6DCScgWDDIrLmWdUbzFYaFA5hO4cQjJRiYWE+ywxohQ==
X-Received: by 2002:a62:1957:: with SMTP id 84mr14315280pfz.54.1589813419751;
        Mon, 18 May 2020 07:50:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/57] python3-ptyprocess: add the missing rdepends
Date: Mon, 18 May 2020 07:49:18 -0700
Message-Id: <4cee153f598f4bc5fd2e1982a99b8c8937131e4e.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import ptyprocess
 [snip]
 ModuleNotFoundError: No module named 'fcntl'
 ModuleNotFoundError: No module named 'pty'
 ModuleNotFoundError: No module named 'resource'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 07c7bacd997e9f593602acf840c10e9585cf5657)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-ptyprocess.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
index 0cc9114754..a6dc21cf11 100644
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
+++ b/meta-python/recipes-devtools/python/python-ptyprocess.inc
@@ -15,6 +15,9 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-resource \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

