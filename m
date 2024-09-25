Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FFFCF9C7A
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 14:46:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.18007.1727275562145395180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 07:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aF5+tlFO;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365aa568ceso8216941e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727275560; x=1727880360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pas6F3vsZvg3TEnjCsKftq7m0AlX8hQI74JRA1jojY=;
        b=aF5+tlFOUfhexgcjWljYil4eqqtPqzlFq9vZ294osR+aBYClKajmhs630sLzh1kjAK
         Z9tzlxdKY7MAUjZmj1N5GykIzuYuDC298J97LQoU7oLMdTIGP9c62rE/tF4aHNkChmf7
         79/laGYSDeODmlr4Jbqm/87u+mAyy19ZJDACIwgUyOFfR1AXoJJOto7vB046qsWBUOhQ
         iui5JcwDskAWs0kDQcJHLZbDsIMlVC3X2TDPhI6Itst/Ietot2zxR0qQozHyra1jW8v+
         E9G8cv0+8j6o71KhMMXGx7Lhlq+1UD/n1CgM0w60hEuEbZqBGRMUhOqrpTwe2Dlgts2S
         Zf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275560; x=1727880360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pas6F3vsZvg3TEnjCsKftq7m0AlX8hQI74JRA1jojY=;
        b=jSTkY4yvV5VQt51QPqB+KQ1+PL8y+9VwEHIPiS/ieGHSLiqkihesy/ZwCYQfixqUUB
         0Le0cQp83xudxsM7OSHCCHyVgUG5Dz0bjM+CenL8lIUUL/4sol04aTrHsnZ+QAxyGfkb
         7dN9aBw38D4ILltz0zeKfMCpRn4bm0L2OFHFZe2WZWfFdMAHOaRzZdb8jPpG30CTGFEn
         Ec4o+CmHurvt5PKC7mcsj2oFSMGbhANqvirakjVd5QT31kTYftKdYFp9rPcjavFgnaZD
         HC9FQy0AwPmWaqdxP0s95f3zK/Vcq4AQPRC8d1NIx9mMCOSQbCrmVR6wP8SAwkRlKfMA
         5nJw==
X-Gm-Message-State: AOJu0YxGQWKGOl6BZ9rk93VUMifC4Poxf8dM3if42oidLnC+En8hijHk
	sZkf9VRpkxf/hfIe7Cg1o6eDnQlRL0Tr0YxUILUJ70m7scuMayCzPChTgHwuI6jXHgmpUXBG/LM
	5DoE=
X-Google-Smtp-Source: AGHT+IGHbvXEzRwGSlmHw8ub+Diy5IhT6qqJmGkPA/dmepsxgau4t6M+CHolU0zZaFlQrWNHz2SXmA==
X-Received: by 2002:a05:6512:118d:b0:533:324a:9df6 with SMTP id 2adb3069b0e04-53877530f3fmr3080836e87.29.1727275559913;
        Wed, 25 Sep 2024 07:45:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640772sm540363e87.153.2024.09.25.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:45:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
Date: Wed, 25 Sep 2024 17:45:56 +0300
Message-Id: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 14:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112496

From: Peter Kjellerstedt <pkj@axis.com>

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify intercept
call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
scarthgap branch. Backport the fix for libdevmapper too.

---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
index be558ce1d218..3b4439c3ae06 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
@@ -5,6 +5,8 @@ require lvm2.inc
 
 DEPENDS += "autoconf-archive-native"
 
+inherit nopackages
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
2.39.5


