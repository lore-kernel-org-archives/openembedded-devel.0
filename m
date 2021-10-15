Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE848C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.4358.1634339062473250006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Ys6tEuiA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id z11so46440393lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/vq0FJ1dnAUDBJE4J5sIle0tbcyzDSk6WTFW81NMg1E=;
        b=Ys6tEuiAVyLaTUhL0rOxkbhagyHoaI7DuDSxp2c9cFWgbSXypdBdZqMSS0HosC5isr
         9fSRrmoqYNi/EPXYuvB4DMDuRBzCXJ3D8dD/irunP10Okazts4OspM0temZwnWPJ4p2/
         hcKvDuXZw51RbBFkCihV+g/yjwawVI4LUSXSJHr+VHPmkP3vAIjV2JcW61NkQuL6SVAN
         nywxUmOH4bZC1fcEUGcPOJ9wCzlHlDxsqYTqzgU7JLwp6yJ5E/xnMh8Fw4Fiz4wEL7z7
         xxRdPryVXZLADx3ZFr5V3YGVjD7WVIBV6aw1DsWeU/wJYYB3ovof3tG7/IP0vAk2i0DQ
         rOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/vq0FJ1dnAUDBJE4J5sIle0tbcyzDSk6WTFW81NMg1E=;
        b=y6Ul1qUez8WNGerVs+1+7RPrr9EuIwLqdKra3wOgpryodzw2M/A5VsAQHn6H0TO43+
         mypGs1SLKSH63F3pv0a3+nqPdGXRaU/L7Kf+AXMkdZ7BbiseIYAr5c+3syGb19lCNaCA
         pt6VaA/1WRYy5TqxixufzWDvLPqnrneKD1R5T5s6PDjyIGDoy5RWxkleDUEEccBzcubW
         bXUXVjNcuCqV7lWPS6GfDN7AzBh3mTXzho0Y5EPgIGKYW0dVXNK/Pg1PKaGv13E+wdyx
         20sKXtf+9oHCCcufdYMG+oJi4KygtthY87qjFSeW4/vCGxpB0KsuniJ7gnEiKvbWBvvx
         TWIg==
X-Gm-Message-State: AOAM533pQcdjyHWCCPk0Mayyn1l24g+KSALETyEpxlFeEyHAmbHbXwx+
	H5SPabqaxdl+Co4crKJO2J8aAYjtaCOWpnuz
X-Google-Smtp-Source: 
 ABdhPJzIDEgu2SvLS8eSkT5Q8JOUn7KVAD3FTKiugUqgj9V2wgIm5pDlUkCC56qnkZJC8E8y9DtplA==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr15588760ljj.4.1634339060594;
        Fri, 15 Oct 2021 16:04:20 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id v4sm682965ljc.65.2021.10.15.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-h2: update to 4.1.0
Date: Sat, 16 Oct 2021 01:04:18 +0200
Message-Id: <20211015230418.4166906-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93388

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python-h2/{python3-h2_4.0.0.bb => python3-h2_4.1.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_4.0.0.bb => python3-h2_4.1.0.bb} (68%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
similarity index 68%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
index 8c488fe2c..c2d58846d 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.1.0.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[md5sum] = "d086f6a9746a5f4eeb63bb3d0a482e1f"
-SRC_URI[sha256sum] = "bb7ac7099dd67a857ed52c815a6192b6b1f5ba6b516237fc24a085341340593d"
+SRC_URI[sha256sum] = "a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb"
 
 inherit pypi setuptools3
 
-- 
2.25.1


