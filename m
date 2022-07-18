Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C62DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 12:57:22 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.26863.1658149036232386205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 05:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JUOlKW90;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id m13so4971986edc.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 05:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6kNQWFfsa6DLwbL0PsK+KABgHWOHug1FXCkmaLUdWvs=;
        b=JUOlKW90dv7oDUFIdiP/C1JVhKA86LafCHNxOAM9g3qhAQDDT4OOBR1dejIhvdHe6p
         xsRARxSFQUZ2LWvmvKWaUD7XuTsu3jAi+wLrP+UufuzkRTuJs2c/kTATeHAQVPcVYdhJ
         bX8m/smc7KdPOwwv8obEqarR004lqdiUoFWJ9UyZIy2/o1s+GQCiAk/XDD2GMS2zFEWs
         gxxwuChh5di1ew7hKZfYooC5hEjx7L/QN7r2+EX3JFKAOWoYBAyBiSp+Yf4g7jCtgfKS
         jjpnpuPgsNu1vvOD6O//yCm9WPJH7Ve8gKSvmNcnvyxngsLeeh/O1ng8Hy4VRSYQs/T/
         00gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6kNQWFfsa6DLwbL0PsK+KABgHWOHug1FXCkmaLUdWvs=;
        b=T20ZkgChrWSIYmXY904xp6femegH+N9UbBohsO8L2p/OmH8STUHVLRStEkgw67dTcU
         vsG+0vKeenFKXOrFJ/tYRYqLUmWfPzeR1IAZfbZrk5YzsSFUGVCkwg+odJiolfCGR2ul
         EWWmZtuDp06JXR0YyjjXwXkEi07p0YievI2v7Y897EUsxyPZxbJzJPRa8FmOAOIcXYdR
         m4mp9cc5bSkcclG57SIzvpiJyRWqPMqnITXZL4mX4LsZ9EpjHvzhlkXUNLWqBgSCvzgo
         +P7zzq9SfpYVBSxFlhFdKlRnFPUkKOU5uUaxvJW3+LaGQPrVwOUECmMZ3m7cJq95oDq2
         0sDg==
X-Gm-Message-State: AJIora9kKO3JtIhIuiwLXdYduYqVCDMhUqjgZUQ0NM8ZB2J/3GoWTfIZ
	lguBFO3ZX4SjLCm/0ZbavOfHrUhhZPw=
X-Google-Smtp-Source: 
 AGRyM1v0OPH81OWBxPHEB4+9FU1FvE5Jer8KqiYU95nwXH6gTphZY1sVXgFYQrdVXsikspytY/d2RA==
X-Received: by 2002:aa7:c0c4:0:b0:43a:20cf:3c68 with SMTP id
 j4-20020aa7c0c4000000b0043a20cf3c68mr37262735edp.172.1658149034414;
        Mon, 18 Jul 2022 05:57:14 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a1709064d8c00b006feec47dae9sm5488576eju.157.2022.07.18.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 05:57:13 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] mongodb: ignore unrelated CVEs
Date: Mon, 18 Jul 2022 14:56:56 +0200
Message-Id: <20220718125656.309944-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 12:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97876

CVE-2014-8180, CVE-2017-18381 and CVE-2017-2665 are not affecting our
configuration so they can be safely ignored.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 7ea728aad..ff4a16e9f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -45,6 +45,12 @@ SRC_URI:append:toolchain-clang = "\
 
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2014-8180 \
+    CVE-2017-18381 \
+    CVE-2017-2665 \
+"
+
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
 
 PACKAGECONFIG ??= "tcmalloc system-pcre"
-- 
2.34.1


