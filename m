Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2291C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 07:24:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.25925.1652685843241409311
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 00:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IvVx3gkF;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id bh5so1827385plb.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=9uEwitSzyhd7obPUXilPDHaJhRIHq972qHWgpo0O/DA=;
        b=IvVx3gkFRLeNpCIXOBwvn4QqJCbOaQ97VdiHvmDImMb2WfQaoan2RWpPdT5uUxaQ3G
         mKdRlwN5PbtOkcTpOZafpaimqeKTBow+dGjwJkVqcafQ+OW7Shu/VXgQsnoP3ZSdHDXW
         QLyq/lgtf9PT6/l00zC2sMGhD/ypDS9+SdCeM2JNTI/mrcjzZcYW3zhFC7I0oOLuPIhF
         /MiS+/VlPbaGMoXj7goyPfZSYIr8A0lAZDbgichR6SdVw9blPTthud7ygK+C01/wunEu
         db6L8ac/72aZpP6pN939T29YxqCN2vsvUMQkrzgGQ/L/gQc0vLMQM4d/8EoxF1SeRGua
         PLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=9uEwitSzyhd7obPUXilPDHaJhRIHq972qHWgpo0O/DA=;
        b=g+nFXiW7cOkzevKUzhCXfEpn9LczQ4w+5ANrMtaG6Ff9eUzxieKSQXcxk2D0WSgWZL
         4tY6HsRR2BiaumQ6/vo4QzT2AlkREJbxIC/T8QStInNgpK7n+kyCJXvER6vFvVfNIU4B
         Kho8CdwH8v8cPej3uAgImZMCMDGBNy63QMqTq8+mBY5tk8WO9b4uadUs8Ilo73bvL5El
         REJjO5DigM5zH2/yJ/jAXyxcbV4qKKD8b0RXtKnU08rYqZN6kGWmMv/DS8VVDWXs2KYD
         GyskT0I1YcPGhUEO/z2kWk8xNs0hV5eB1atDml5ZdAOcnDOXDJ4/unolht/KtEy3OxVg
         txjw==
X-Gm-Message-State: AOAM530NGg21rOHaXcoAm4EEL6lmiN7flIbRbNOVp8LSEQ4xsIHThCe6
	nHPS227iRvFDHzY2FU2vEUWIGa5JfTwONw==
X-Google-Smtp-Source: 
 ABdhPJzamCfOZAQKW4BFbIc8xxIFaR4p6ppaNYdLIQXAcwhTPnDst/ceKT24TxU87Ul8OMAf665spA==
X-Received: by 2002:a17:90b:2249:b0:1dc:7905:c4bf with SMTP id
 hk9-20020a17090b224900b001dc7905c4bfmr18084215pjb.62.1652685842228;
        Mon, 16 May 2022 00:24:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:5602:3dba:595:2587:c96a:ce3a])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a629111000000b0050dc7628186sm6255480pfe.96.2022.05.16.00.24.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 00:24:01 -0700 (PDT)
From: Sana <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] openjpeg: Whitelist CVE-2020-27844 and
 CVE-2015-1239
Date: Mon, 16 May 2022 12:53:23 +0530
Message-Id: <20220516072323.27316-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 07:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97122

From: Sana Kazi <Sana.Kazi@kpit.com>

Whitelist CVE-2020-27844 as it is introduced by
https://github.com/uclouvain/openjpeg/commit/4edb8c83374f52cd6a8f2c7c875e8ffacccb5fa5
but the contents of this patch is not present in openjpeg_2.3.1

Link: https://security-tracker.debian.org/tracker/CVE-2020-27844

Whitelist CVE-2015-1239 as the CVE description clearly states that
j2k_read_ppm_v3 function in openjpeg is affected due to CVE-2015-1239
but in openjpeg_2.3.1 this function is not present.
Hence, CVE-2015-1239 does not affect openjpeg_2.3.1.

Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../recipes-graphics/openjpeg/openjpeg_2.3.1.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index 218dc911fe..9cf513f3f7 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -33,3 +33,17 @@ inherit cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/', '')}"
 
 FILES_${PN} += "${libdir}/openjpeg*"
+
+# This flaw is introduced by
+# https://github.com/uclouvain/openjpeg/commit/4edb8c83374f52cd6a8f2c7c875e8ffacccb5fa5
+# but the contents of this patch is not present in openjpeg_2.3.1
+# Hence, it can be whitelisted.
+# https://security-tracker.debian.org/tracker/CVE-2020-27844
+
+CVE_CHECK_WHITELIST += "CVE-2020-27844"
+
+# The CVE description clearly states that j2k_read_ppm_v3 function in openjpeg
+# is affected due to CVE-2015-1239 but in openjpeg_2.3.1 this function is not present.
+# Hence, CVE-2015-1239 does not affect openjpeg_2.3.1
+
+CVE_CHECK_WHITELIST += "CVE-2015-1239"
-- 
2.17.1


