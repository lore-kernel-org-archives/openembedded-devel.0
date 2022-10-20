Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29331C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:55:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6418.1666245304953911444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Oct 2022 22:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVvnuT8C;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id a6-20020a17090abe0600b0020d7c0c6650so2424145pjs.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Oct 2022 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGM95NiaIY9pnmNCgcFPTlm7JZbuiHI41gcvO6Z2PlI=;
        b=KVvnuT8CVwz3KMqWv4naf3c10bd6vfwwaUxNZ1VyR4l94a1E9YLPUbhRg4gpFFGlRx
         ip76jrijRRqqogHblolFhzBHARPwMD4P72Ayf8UUXLdEDbS+zXvoDv2ljFb5NVzMr9A+
         mnGPHOWhOb9bxmoYczo+XiCC7/VG0/AofKXaYh5Bnla1Qf8EALaQjZqcugXM04vqsphT
         EtWbeGtPHp/57uC36anYZGEwpD2yyCpniMNpfFcM/Mfjsi5de0KqHauI2Ixngl72ZJ7t
         z1Z2JTcwvCHvXDU4PJHWTN3ZSIeipJUowuNBTNblaZzn6uHjjYAVjOpu4Q8QaYhZceYu
         6wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGM95NiaIY9pnmNCgcFPTlm7JZbuiHI41gcvO6Z2PlI=;
        b=YC3Mo6Fgst+GaSyQjlxOcaPDm1gyzSmfvS+Q9H84UHTIahJR6wh39y+H4SPvVZu1Y0
         AUM0iWxitICEAkS93aXYSBu1bfB/9C3dABGgK3+e9G/6viBenjPDJzf7QeEEvb9sMu/M
         2wVQkKoT60uisJ3Q6cr8L8rgrWZO84rmcEwwjMJZhnmQ5CrPG9q6SepfcGvpRczWhorJ
         6A8baUoHi8In4G4Xn8bF0ibhLbcMkGkDmJlqnAxcK2WFazNxylUAQnLHKvg0NP3LqTIE
         DaAb3ELeHh8etxhT9OFMWDtZ27LuwMCa16vgFqucjMXDB0iqcpOMd/z1by9U5MmJndA9
         KnWg==
X-Gm-Message-State: ACrzQf31e/ebM+4HQW7dSy00SiU2pKJgFIQHMfJ3NGrgnhmXWH14sQmF
	LRSrO3e0pbM4LOchlwGcTNg2hDDvBFQ=
X-Google-Smtp-Source: AMsMyM5VOlAoBSpiLbhuYs+I1clxqCVLQ1E0hpFtRiEF304dSCMLGdBydonb7LZVPLcRFpnlhxotTA==
X-Received: by 2002:a17:90a:8c97:b0:20d:a1a2:bfda with SMTP id b23-20020a17090a8c9700b0020da1a2bfdamr14054418pjo.234.1666245304058;
        Wed, 19 Oct 2022 22:55:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b0017f73caf588sm5776842plg.218.2022.10.19.22.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 22:55:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] msktutil: Add recipe
Date: Wed, 19 Oct 2022 22:55:01 -0700
Message-Id: <20221020055501.1498899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Oct 2022 05:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99248

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/msktutil/msktutil_1.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/msktutil/msktutil_1.2.bb

diff --git a/meta-oe/recipes-support/msktutil/msktutil_1.2.bb b/meta-oe/recipes-support/msktutil/msktutil_1.2.bb
new file mode 100644
index 0000000000..1b9a04ef29
--- /dev/null
+++ b/meta-oe/recipes-support/msktutil/msktutil_1.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Program for interoperability with Active Directory"
+DESCRIPTION = "Msktutil creates user or computer accounts in Active Directory, \
+               creates Kerberos keytabs on Unix/Linux systems, adds and removes \
+               principals to and from keytabs and changes the user or computer \
+               account's password."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
+
+SRC_URI = "https://github.com/msktutil/msktutil/releases/download/v${PV}/msktutil-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "27dc078cbac3186540d8ea845fc0ced6b1d9f844e586ccd9eaa2d9f4650c2ce6"
+
+DEPENDS += "krb5 cyrus-sasl openldap"
+
+inherit autotools
-- 
2.38.1


