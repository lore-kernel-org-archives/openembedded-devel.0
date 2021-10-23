Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F98AC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.11209.1635021398710363324
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=mNfcpwhV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id i24so1771592lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwRjJCyFFlH94K0uVh+NayFaZvh3wCxsHDRvwrMgxzo=;
        b=mNfcpwhVX+95Q3Y9vOaoWkCngILb5f6gE16fw2H2+OkPm0YZfFnKC7ZyGII81WKTFX
         swBWgWRratmGyDJccqQDWtIcOl4zjpmJsBAka2QSDMli6IXqEsnf6I5MekLBC0CmU/5D
         zlU1eUI+RIrXwLNXZQ/GW5iqSTGBgFlMG5sqos3/qlmvcy6qIyallElQ0/kpEp+WcAGU
         OaCLzEkFQCYcdZB2/zOJx2HVedNeK+SUOnc5eTeHyRl1W1w6qcqs5UqKbb3/ULQ+y3TC
         JN5B73q328ShEgo+uyGUj7k40kqkvNsrRErHRMhcxipp8WLw3gqEzPHI30Z+DZXNNJw3
         2rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwRjJCyFFlH94K0uVh+NayFaZvh3wCxsHDRvwrMgxzo=;
        b=3NAYUrGoG1/JufomGZP7RSgIytcWZ1HGZCWAp/fiX7OxSO6ZECILV3bUF9M1b+dojG
         k6Try17uvuST/EDCGsci1MPHOxbNsld9Gq39BOjMv2MSveuLPCQDiHp4NjnR02mURBHQ
         VAWR6dEZWByhZBtbwh7QZVDLvVsiV2JGep5JPEnhmNe45aAz6cuYfX/DwmaOowukofG1
         dr0rCDyYmeRe4I3Uh029pa8gcY5ZRA77RLt3/ArQPxSLp0TqFwUtv9A4/+L1ijJOZv6I
         A0MVxMn/b6DChioXgsD/LTKrHFHqaU0U6g6qkHkNmNq0T6vkHQKgwF1zTABCHsrNQvyG
         B+rg==
X-Gm-Message-State: AOAM5334yvMj6agq0jvd2psw9dDAp9SbDDnzEFNQRfqNEECkB6oh6Uqz
	yxPAonJLqwyAIJIr9LMFdZ/Mkql3bETxK/PR
X-Google-Smtp-Source: 
 ABdhPJxEgWJH/CFCn73+AEyRUBKLmk9ToeGAfO1BzIpmYMeCzs6e0tJrE4niQaILOTjd2k7pK9Ws/Q==
X-Received: by 2002:a05:6512:4004:: with SMTP id
 br4mr7499974lfb.467.1635021396525;
        Sat, 23 Oct 2021 13:36:36 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 r3sm1134990lfc.131.2021.10.23.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-h5py: update to 3.5.0
Date: Sat, 23 Oct 2021 22:36:32 +0200
Message-Id: <20211023203632.1657161-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93551

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-h5py_3.4.0.bb => python3-h5py_3.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.4.0.bb => python3-h5py_3.5.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
index 89000b793..aad2f9177 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "ee1c683d91ab010d5e85cb61e8f9e7ee0d8eab545bf3dd50a9618f1d0e8f615e"
+SRC_URI[sha256sum] = "77c7be4001ac7d3ed80477de5b6942501d782de1bbe4886597bdfec2a7ab821f"
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
-- 
2.25.1


