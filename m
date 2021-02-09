Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.7005.1612853280798338150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 22:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O8CdrU9A;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id g3so9216370plp.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbBgk5Vy40NMLyV4hb9650v/wfs6OLXZHAsrCgCAVAc=;
        b=O8CdrU9APxs+OTELDSxHO4zmyqxg3yZ1nt96AE5i9H39UXxXjIWDwxqt5/2mcfpYHa
         K9HLASmOpgQT5Hb6kPWNg4EWNGMbpnQ4oQ6123ki1HEdoCEqsrt2IjIjCTOVTV/9jWHl
         Nm58ktTKDxuXmvqkqWApohHoC3culrMrU0OeL0h2vpZ+DgPKg11KNJMIVM4OaI3wdG9K
         5wHZVE5KaM1NCVMPDH8fTbBpY9QlkpvhWv5vaUG2PFf5ywS23naY0qBuVrFA6M3Y8e6N
         51KvPll/oYigqwxtqboxIxCvLn1JH5V+KNVfRjBjyInSt0iDBa4zfMCqjuvL4HuCNaz7
         fMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbBgk5Vy40NMLyV4hb9650v/wfs6OLXZHAsrCgCAVAc=;
        b=VJVtmMnKdHwCoQovre0wLBTl75O0SkIsSWrDQcyYLNd2Y9DiBnP2S9eFNuNq4QUbbo
         keOXmArbb43cFmm/oCAKCkVJMHDkFtWFRsaMKplRo39tzvKhWJg1i3pXTtCN8mo5iwYn
         Ow+q6d31ygYXEOA9VaAYaMbEVFlIjkzbjhPhro4ANxUnu5k9NBUgH3LJMDnoilc60kxq
         8QPOsujsBq3DUMo7zkYrahvReKTWZiH2oDsqi2GEVSQVjn1uOWJgdxH3e8KtjY385VAX
         JfB8+Vhrayt7n4Na4Kxmy9rG9bAzOlujeXk4NHBbg8NZCrvUIe8uuQBBapuycFDcrG+R
         ShyQ==
X-Gm-Message-State: AOAM533osYvUEiFzi4sMlZVzEV0kIy1j9rtqxs5A5IVDnlW9O6AA5l1I
	OG9vpVMBTfL1qLvnOv1mYTsno9JYanSRqg==
X-Google-Smtp-Source: ABdhPJyfpvRcVk6kvaaCXNmVeZCeSJtDCL4kU8q0b/Kxq/uzrxUzoF81fNSOOv1b/aZzCsETvORsnw==
X-Received: by 2002:a17:90a:da02:: with SMTP id e2mr2601962pjv.173.1612853279964;
        Mon, 08 Feb 2021 22:47:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ca6])
        by smtp.gmail.com with ESMTPSA id 123sm22026600pge.88.2021.02.08.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 22:47:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Disable building bpf
Date: Mon,  8 Feb 2021 22:47:55 -0800
Message-Id: <20210209064755.1961880-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with 5.10 it builds bpf-bootstrap tool and then tries to run it as well
which wont work in cross builds. Disable it until it can be make cross
compile friendly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 7c36dfc605..4caf217c24 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
-PACKAGECONFIG ??= "bpf firmware vm"
+PACKAGECONFIG ??= "firmware vm"
 PACKAGECONFIG_remove_x86 = "bpf"
 PACKAGECONFIG_remove_arm = "bpf vm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
-- 
2.30.0

