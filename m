Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.3646.1615708032140700924
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 23:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FIEXpWE2;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso10518022pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 23:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qI50tKqbUesxEhZ+TjDsG6fQh63T9gccvc7RpUS8A6o=;
        b=FIEXpWE2RyDiE6Tqckqrxm9s+HqzmW+5CVVQYye/qo1HMpuWiZ+ijYwW4qGw5M7ROR
         +CAAw1C5YG8D69N/w6IUbFVVC3Zyrw/Hx0I/qfUHiQoL3+DiLbmRC8/u1BPsjBmCaCvl
         dbIpQWhkOySuZiIY85zS+0ukOEVvQOzRTR35YNvSaybDaGZ5Q5VKV5UI/Jojj4bEfdze
         80x+H5/rm0aQanhsP0wOBabcKZl/zoLKs8mRMaXeLb1+rZV90yhLHlB2wzFJHNniksMy
         dsMjrscuUtcVwsOi+keboXmIji3CiQ4yC/G3FFd68WCN4JuogSw8x+6P3DGMvzlk/84d
         Tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qI50tKqbUesxEhZ+TjDsG6fQh63T9gccvc7RpUS8A6o=;
        b=tCvFE7Ci+bVt8gLdKH04Z/Eb8mrLqlaX/B8Y05aUbnFPSTtj2H9DwvE+6OTDFvAbUI
         LewjsKyUXhKC/L4x+SPDkWipG0XNYINo/vDw1tjsimM8q/69R7AHyfbAlN+gGeL5YiS4
         sflqfHb52w1pxvyJbAgeJbWc4XLJ+O6qzKV4LrmETqfJaZt/AwnYOZ+QL6XIWYoxlT1g
         qhG0Lsk3QH68aUqNHK92XQ5WFjp/ahYqBMrtmdRmujo0L0I8RQM9SAj7i5rB1kI38YpV
         glaNsElCwJMMQXZnHcPPOAH2sUaD+1Ib5UY8K8Tb+9H4EMvAF79Tyzz8XSYjAg3NDh3S
         /tRg==
X-Gm-Message-State: AOAM532OZjjTz/2hNFa2Mhk/k5ocI03UFVSw7UDsyl2Ib4YCIXkpxaT+
	2GFo5NlprS4Fwotl6Bgi5EHLejqoZG+nRQ==
X-Google-Smtp-Source: ABdhPJwshqe4s5+T8jVnWGy6IhyuGjDddlm+6jZr6z+WRojk6IK1BYjrcyfVjs1hqf0/6oyf7x283A==
X-Received: by 2002:a17:90a:31cc:: with SMTP id j12mr6793136pjf.203.1615708030749;
        Sat, 13 Mar 2021 23:47:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id mz11sm7100630pjb.6.2021.03.13.23.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 23:47:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] ssiapi: Disable for ppc64
Date: Sat, 13 Mar 2021 23:47:06 -0800
Message-Id: <20210314074707.302060-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314074707.302060-1-raj.khem@gmail.com>
References: <20210314074707.302060-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal boost headers are missing ppc64 support
ssiapi.1.3.0/lib/boost/smart_ptr/detail/sp_counted_base.hpp:66:11: fatal error: boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index b5f50f2c4c..34f3c8c898 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -905,6 +905,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
+RDEPENDS_packagegroup-meta-oe-support_remove_powerpc64le = "ssiapi"
 
 RDEPENDS_packagegroup-meta-oe-test ="\
     bats \
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index ce46cf5892..9a0da831b2 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -36,3 +36,4 @@ do_configure_prepend(){
 RDEPENDS_${PN} += "mdadm"
 
 COMPATIBLE_HOST_powerpc = 'null'
+COMPATIBLE_HOST_powerpc64le = 'null'
-- 
2.30.2

