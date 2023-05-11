Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B4DC7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 14:05:56 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.60156.1683813955751539132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 07:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sbPMSZlA;
 spf=pass (domain: linaro.org, ip: 209.85.210.180, mailfrom: jun.nie@linaro.org)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6434e263962so6454183b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813955; x=1686405955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey4Rs5oJOJ5WEU0MB5E9oJPAc2ylUwJ7oIBcShwootg=;
        b=sbPMSZlAudRR5AaMIAu2PAwIFSQ1wRq8JFoarlMAC4dBiftqA8z1z+UnPh+PoA0ucc
         08wAMJ9L7jrmK/MC+gOKUvclscyBvBfo+58f/+E9hD/xd+3W9jifCSdoILIS/aoPySgp
         9oXDmK5L6iyWhXiMx2q5KamVneneVpSwCwwGt/H818Y0bQ/np0D7m+iPacG7Z+xHeSTK
         vMkoUNKeETgFk7smbc6Z+OEM1dRtMQaxBWNIuISdj69z+Gzl/2RvZeznqgzFVz8OaRVf
         ayeITib+5wOplmmGknQWYqsufKlHj3QPqI1xgkHVYX9iqXPLCAiSrccXXuhfVZzWJYzK
         HVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813955; x=1686405955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey4Rs5oJOJ5WEU0MB5E9oJPAc2ylUwJ7oIBcShwootg=;
        b=HW3kYyu1yXBA493ftUgjAMdtSMhsD9kSHheMlTA3GEaCes1ccAeQJDGHm2CUuFj/im
         u9k14FiqtTvPPFWuAJVmHu80ZrOXj4PUg8qAL38v9MUoj7/Gz1G4AHCKjcj1fUy2vzDX
         Fw1ojd7zVDu2QYFunYpoxMxybFa8M53ndKZE1V5W38RJtTNZQdgVXYgjv6lw2bed/wck
         59HDq18/nqNzJfXzmrykn/MFf1QYj/g9z/4rXDt70gbtFQ9mTzOmnLG+jhLQTwVjzJJ2
         cdWMMITeiiv0gG0ECwiBbOuq1ZhwW0VrgucIxDFBonprWY7pHG9QLJdnkL3J2DpZPb4V
         OWZg==
X-Gm-Message-State: AC+VfDwcgq+lM01FjwEdNsU+wK2316zPi6Lu5AyObTFr9ELpDXr5gXrg
	WA70GUOlQSKyl81hb7135wgtLw==
X-Google-Smtp-Source: ACHHUZ4l/ylmCjZjgFwMcB+zxl+xCB4a/y0bMsvZhKZdhlFKb1FpRlBh6wJbWZTwCYtxdv2CWBc8Cg==
X-Received: by 2002:a05:6a21:900c:b0:103:d538:5e94 with SMTP id tq12-20020a056a21900c00b00103d5385e94mr2351876pzb.12.1683813954128;
        Thu, 11 May 2023 07:05:54 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m3-20020a63fd43000000b0051b36aee4f6sm5033731pgj.83.2023.05.11.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 07:05:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe][PATCH v2 1/3] libcbor: Add initial support
Date: Thu, 11 May 2023 22:07:42 +0800
Message-Id: <20230511140744.2918627-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511140744.2918627-1-jun.nie@linaro.org>
References: <20230511140744.2918627-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 14:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102542

To handle the general-purpose schema-less binary data format

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb
new file mode 100755
index 0000000000..3ac270e5e0
--- /dev/null
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.10.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "library for CBOR"
+DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose schema-less binary data format."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
+
+SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master"
+SRCREV = "efa6c0886bae46bdaef9b679f61f4b9d8bc296ae"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
-- 
2.34.1


