Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D278C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 15:45:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.12879.1664293526258344532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpIABGBq;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so2563563plb.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7HiQLQe+pDEA3RVqGiShRN2c7rfpPxoO3qL93ACSKwg=;
        b=hpIABGBqPJrPLUjD309Qvqx9dgfE/BYSpVmWPPIMbiCL9d33KBHJRz6DML5nD4gAdO
         tgJBL137POZtDJx3GotjL9XEtYGQlDULnViL4cvwkv/xRpKbjn9YHYGVIeINHtPgpFEU
         S5d0h0F8A6EEnsw2E64ncD5GzTObVXFRNZVpo2LHKWK9Z/UmSjQ2HTnl11Pc6FiVwAZf
         chshR0N3LrQgVvnDibft8/RbfoFBBWGUNamvkTgVkYCN48kmoDM996Pv9VZJWgY/Y2Dn
         mj6GQGCXzIizO5br7sinZOry2LXolxl70XcQl+4NV6LXXR7BSihO/Fms3FbWr75LTDYM
         gSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7HiQLQe+pDEA3RVqGiShRN2c7rfpPxoO3qL93ACSKwg=;
        b=PNxlwVjLayEL7XxEiaV3neBSCfe1U7KmYchv7ae15zvbztTVDXqpHTXk+m4ocpL6Qh
         +cYwvUHvYcVNKk1GDerEogQvyhf+k9N5U/o7Lu0vyxyjdssZY6ftHBEluKJvNgG55WqN
         VYBE7QtKfN9IOvhc4YZKgsJe8chD/EC1mRb+I/5+dMuteGb233aSEL78nIp4RVjAqA8N
         VOsPge4VAwxpT1OiQTFBCo7JJT5DZGpw1V07CcCay6YvEFHiuuz0JZ5Zj71ynMSbWPIJ
         J2D0ASiH+x/dVekPiESxRajEjb6PiLm2Yi4ANYBd/O0HE9mFiTCZ7Sn4f0QvoyvqXRxc
         mEdg==
X-Gm-Message-State: ACrzQf2U6HorR/BnFAypgHR6o6l6HKMqR7HZuorVc0OgfbiM4hZ/li+9
	QjRhJX3PtQDvZd+rYjikVmVakHc9kPNdjA==
X-Google-Smtp-Source: 
 AMsMyM4x/+ZjjxC4S3kp/bfsLj8fft3t0gcEndjoGyaC4EBHAI4GR+1Eme8ZwnCA+eBlHGmlgfJK8w==
X-Received: by 2002:a17:902:e2d3:b0:179:fe90:55bf with SMTP id
 l19-20020a170902e2d300b00179fe9055bfmr317844plc.161.1664293525441;
        Tue, 27 Sep 2022 08:45:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 s3-20020a170902ea0300b001782977fbcdsm1723379plg.206.2022.09.27.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:45:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-requests-unixsocket: Fix override syntax
Date: Tue, 27 Sep 2022 08:45:23 -0700
Message-Id: <20220927154523.3897668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 15:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98993

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-requests-unixsocket_0.3.0.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
index 330ab7c066..94497b609b 100644
--- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
@@ -11,4 +11,4 @@ inherit pypi
 inherit setuptools3
 
 DEPENDS += "python3-pbr-native"
-RDEPENDS_${PN} = "python3-requests python3-urllib3"
+RDEPENDS:${PN} = "python3-requests python3-urllib3"
-- 
2.37.3


