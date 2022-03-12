Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AD2C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:44:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.3066.1647074675050738302
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VyYnk95p;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so13055493pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2GkitOncEarjRPR2no+lX5QGKI6tkAKceHO8tsv44I=;
        b=VyYnk95pnVNsmVE/vqJk0xyVAXBy4iEC2j8XOymkTmEYFFHru9zVb3+tOLTVpajLDP
         r64mnbVgb2kgQ81rcI1vsGHmf3jUzKAmrRBqSqyftyNaVhtL+WX9qX+tZmR5JD4YKDS/
         FAnJBzIFWfF7tqo8f79mHGJITSToOcvbzIfjXwVWy815MFcanrC+PZVqwV1h+57iyrIv
         5xReXObl7ks4ffEtgxHv4tqmLtHUSt6yS51DTFlQcfoZYKry+86FELpr/spPnELKKqop
         2TFJ9nznD+vK5/u2C0LRu8swr8dQDsnuooqtT5u5ABmNiTva8d7BY2czWd/3VzHiN5eu
         phmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2GkitOncEarjRPR2no+lX5QGKI6tkAKceHO8tsv44I=;
        b=WthacD1XCjpvMKjsgfBkZySJ2fbKdHrwCuX6XmtRFSqHl4nOt+6GEqpD2vfBdryExr
         mEsCnIjnGQiNXSO3615xFeRyvl1/N/r0D+ddi7chwFiuJB+Py1hVeGieKK2RmPuHNox3
         RogXw3UcI2kzjkywyIAWhDCjuvxQqOkXZgtAG4YRTFhCeJFSsCBgAhuydIM8ybgbFO/f
         GPMWKTXrH7iu3GV9fkCo8otZQ6fcPHLDi6A42dgHFSgL7sySLwPfO21gencXDvYARqwm
         sThoFjMsi14DfQhvQqOHctnEJ4XqAmkSCEDUPPN2TKZj/n6tz/jzz5LH7TSEUPwRmETy
         3/xQ==
X-Gm-Message-State: AOAM532UZ/cBDyxl4oxaxw8z6w+MjWrdOSmP78+YHZu7SW/3S2EzQah8
	JbrOnvxWLAsBW3WAxWsJeNJ2WfayhiaWSw==
X-Google-Smtp-Source: 
 ABdhPJw5bqOWJgh3bY/+iO15LZKWmQVvQMPzTMKAwjXx7l5zv91NYFxo1tqjzNbYxUfxIo/MIUh08Q==
X-Received: by 2002:a17:90a:4e8f:b0:1bf:3fee:5362 with SMTP id
 o15-20020a17090a4e8f00b001bf3fee5362mr25741703pjh.164.1647074674252;
        Sat, 12 Mar 2022 00:44:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm12803499pfa.77.2022.03.12.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 00:44:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/4] gimp: Disable vector icons on ppc
Date: Sat, 12 Mar 2022 00:44:29 -0800
Message-Id: <20220312084431.1123151-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312084431.1123151-1-raj.khem@gmail.com>
References: <20220312084431.1123151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 08:44:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95959

qemuppc segfaults building them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 36448b8f76..1155e0eec3 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -55,6 +55,7 @@ EXTRA_OECONF:append:toolchain-clang:arm = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:riscv32 = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:mips = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:x86 = " --disable-vector-icons"
+EXTRA_OECONF:append:powerpc = " --disable-vector-icons"
 
 do_configure:append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.35.1


