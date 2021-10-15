Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6D7C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.4396.1634339056029560039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=8SosB7YC;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id z11so46439605lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jiUED82XJMYQLC1HJQbLOBI4Uuk/u3TekefNlozKT98=;
        b=8SosB7YC7TKzDbq9em1Arg1Ay68/hh8RUoSG8G/TBHNiW2AoOZqNUFJ2+1ye4X86xX
         cs4OBzNezBJJ96PJmx84aXhZsY4umtvlKzJsG6SROx1vXNUBoRKFtkuhUUgb7+DOZRwi
         6o3VRtjCtattmwfWHQVlHnJ6pDLq0obF4cvsrRO9AxYGjdIlzsbacYalhipYwlO93CrX
         PRxze33gu5Q8r68XlowZ5BV0hD1Yw7asLt9Z6R2L8kkfQMxO1flgCT4SUMYdkan2ofSx
         zOPubVbsboqFeqgebGaXHOzhMgJad+yMxG/qGk/w2C7rHNQUgFxvRWtPLb/skdQpY+GD
         MTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jiUED82XJMYQLC1HJQbLOBI4Uuk/u3TekefNlozKT98=;
        b=Z4m3FWhmiB+i4MUV4IXKxu/R4qxmFlVnL6AhogC3tJHYpPgHhav7ZU9WjR1Buid/xi
         fmxo1moTfXJi3+phF3vr9v4aG7/MWmbLVxVX7Dwa/Q4ff97Kg2cSvVfDeLBcAmwiRU1r
         BOO+Ffbshb7e8aAHjXJHt5ij/oVLO01zLKKTEeAxpB7taCu1bYX3Cw9wNji2FtYuh9Y+
         LnOuhHpzF+TajAMuZr7HXGvDyK0Ua2ZzhTVa8lFImJhttTJdF5M31tKjkPNj5sywsGxp
         BC9IoDts2790+CGrTOQamMfstd/FWshEQbdlGrHeTeqQpyNM/A+BF07LDC/flVorcJU+
         Q1Lw==
X-Gm-Message-State: AOAM530NcN2g64cqfkSxDYxY7IIlO/zSNzmFq+LL8kKeMBfqbDhARugX
	QPomePoes/2EuY3SQnsWpTwsFMnd/jubU9wl
X-Google-Smtp-Source: 
 ABdhPJyGtszq0bNFT44uC17fZESU+BUNlk/n0e7cetVpiBMIUcCp2FU15Q4+9sF4OnBmvL1tVrQHfg==
X-Received: by 2002:a2e:9346:: with SMTP id m6mr8831884ljh.369.1634339054094;
        Fri, 15 Oct 2021 16:04:14 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 z12sm656072lfd.283.2021.10.15.16.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-astroid: update to 2.8.2
Date: Sat, 16 Oct 2021 01:04:12 +0200
Message-Id: <20211015230412.4166736-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93385

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-astroid_2.7.1.bb => python3-astroid_2.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.7.1.bb => python3-astroid_2.8.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb b/meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb
index 4ed051d22..f465ba992 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "f3083366b7bb8b3a72c0e12841ab07f14b0d7ff5cc1c89676b84d8f5832e4b61"
+SRC_URI[sha256sum] = "304e99c129794f2cfda584a12b71fde85205da950e2f330f4be09150525ae949"
 
 inherit pypi setuptools3
 
-- 
2.25.1


