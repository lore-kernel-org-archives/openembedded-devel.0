Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F36C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.70.1649865172700938633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oSKOqx/Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y6so2336558plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=541EQ1uyisjZJzgZ51zmZm96FsPEuD34lBvHmNUYlnk=;
        b=oSKOqx/ZdbjwajXIUDy8VZ7uP+f5TwWwjQHt/Xso5XjQ7pLpGe0Ox8NvMi1+Fn6H4f
         JNXlaf4WStsGfQ42vM4rsb1srgpk0QBFwStLOI6PqHu7cqITLMRDkcBX5nYJAt2TzVKW
         70SQohuX+YqXuZRHeYEiIVFfmTU2jaWWgkNByn0LTryeNqGk+WphZY/lJwHaSv1bdH+R
         brPklNwR/bUPYdurjeJQTFPTQFNmlQ21MA4KF6L3m/3mCSppcGhrSzeRBoc3wpddI444
         jhEk7dNkvOFaSkBCSqPKHMmTAgu4i/vPZlOhvJE12awOuasdHdrGmsjGrrXfNPsZC6Iw
         AsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=541EQ1uyisjZJzgZ51zmZm96FsPEuD34lBvHmNUYlnk=;
        b=LEZlVyb7tP8rRyq3nIIymMJE0hWA51EazwsRY91Aw4Fdf70pDEe4rb96GHe2WcN6ig
         VgGE1JiKCioZwvEbzo+VtE+bQkTGlAYy/jA9vXgX0Bwj3Eeozt58noGhW/9z4TNTb1SO
         zLhuGVRv/7nSwQq+ppPin2oDPA0AWzGjAVhuI6gCcj8+r2BqfHpoQZTlncmPSbG2Dlyp
         LLcFUl3qzsqQ36NGX5+elAQoE6iGm2jMXhRe1CoFRxj5BlVZnqp3Xk4gF6CaTBP/jzgo
         4VdiyESXGkfao7at4i2f1f/3Fmj8cDMeZfTnVgnDDvZxU8istnilPbOcKeq//O64GWHB
         lCCA==
X-Gm-Message-State: AOAM530fDnknMYJT2fNdDc0s9fQJdLkKAL96z2MTBFZ7Neb+nk3r3Vst
	9CNf5BkhmE6lift2TxaUW1WS4mDZSu1uYw==
X-Google-Smtp-Source: 
 ABdhPJwJnlfN7PlU1GulCQ+y4DnWe0VXq5lpyZsLSy3jhyJ/MpVmYu3t3aQkToC5SohCrOODtGJgpQ==
X-Received: by 2002:a17:90b:804:b0:1cb:be2d:e28f with SMTP id
 bk4-20020a17090b080400b001cbbe2de28fmr11320073pjb.21.1649865171933;
        Wed, 13 Apr 2022 08:52:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm3412813pja.44.2022.04.13.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 08:52:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] mpich: Add new directory modules/hwloc/config to
 search path
Date: Wed, 13 Apr 2022 08:52:47 -0700
Message-Id: <20220413155249.3458236-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96617

This ensures that config.guess and config.sub are installed in for all
directories where its needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
index 42adcc2089..d277f7e71c 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.0.2.bb
@@ -40,8 +40,8 @@ inherit autotools gettext pkgconfig
 do_configure() {
     for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
         src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
-        modules/yaksa/m4 modules/json-c modules/ucx test/mpi/dtpools/confdb \
-        src/mpl/confdb src/mpi/romio/confdb;  do
+        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
+        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
     done
-- 
2.35.2


