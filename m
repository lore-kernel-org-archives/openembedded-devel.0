Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D9DC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 00:59:39 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.1727.1648688378493902699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 17:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BzkXHpuX;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b15so20463514pfm.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=839KyhxpiTi2HApOraB61QG4tjXmS3ez1Z/9IHFQ/7w=;
        b=BzkXHpuXZ+cSIi7BNQsPinJJ0noI2HdshR3BA3puv71jKGmh05FvOG7cfvKUBhtDz0
         7o9yGd6Mwbo2wIBAe8DlgoxG8wcOU37PGes96+pHuDmbN7gvfyVq0Tqb2WH5o85nclFe
         UE0e4WmdYGboShpgnD9lqBV33VRZ3Uwsxi27KLZHbgbH6KRUAwNnTxQM9icqOerbPZt1
         boR+jvK6Yd0ObWfv9STOzBhqiuH/byR6KNN8QO0YgZ+kMc93bZXdfmEZUXsyKpg+14V0
         UFZ9dCVn9noizpM49gABdL+eyuM8c9n0L5gnGTYpyI6mnu07dHkYIOfpclThshkPBeRt
         Em7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=839KyhxpiTi2HApOraB61QG4tjXmS3ez1Z/9IHFQ/7w=;
        b=UQu2VOFCb1fjTkWvJbLNosfMTsY5Wh19yFZmZKWrDnexw1tkHe/mH+hZo2U1PaYgI/
         KNTgWURS2IpQGBKuNwt35GU0+WF7rYdqV342KbKxEMOVgEcptsBLmTFSyXugFlMsmdpH
         f2Hh3maPA6w7Xa0DDrMZD6QBe1Qs+ygfxaGtWGYNxgkRMj6hkzf3xw3Mx9d56xLl2H9s
         GTvbBqEJ/zXcqN99I+kt90dwaDe7Y0xXcQgaTrjLX/LLuNUUyDVYfvEqT2deYREPSJg9
         SJWrX7okNIDcE8Md02mhY4kkalROOHdBeFl5WTcCTIX7n08urUxnu4bHFUZIidEagCmY
         vpDQ==
X-Gm-Message-State: AOAM532TjIpU2M24+owiK6cyxx51P6ZxlVaIZGCGBgpjF0BqO/1HrZGO
	/m2zrVxBiA3KCn1dL8caEJTKCE0kJ+Q=
X-Google-Smtp-Source: 
 ABdhPJzxeqbWubQuaxrk33zxKOAPRr3Thg8sLHkvlOEVlOOiOAsF731yUSIeE7s8Md4qBypHvkhTVw==
X-Received: by 2002:a05:6a00:130c:b0:4bd:118:8071 with SMTP id
 j12-20020a056a00130c00b004bd01188071mr2438116pfu.28.1648688377718;
        Wed, 30 Mar 2022 17:59:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 k3-20020a056a00168300b004f7e60da26csm25832599pfc.182.2022.03.30.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 17:59:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kai Kang <kai.kang@windriver.com>
Subject: [meta-python][PATCH] python3-wxgtk4: Use cross prefix with native
 wx-config
Date: Wed, 30 Mar 2022 17:59:35 -0700
Message-Id: <20220331005935.3921128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 00:59:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96272

This ensures that it relocates the returns of queries w.r.t. target
sysroot and not based on native sysroot where this tool itself resides
and uses that by default. Fixes build issues seen on mips architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
index af7b51d83b..e61b00efa4 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/wxPython-${PV}"
 
 inherit pypi setuptools3 pkgconfig
 
-export WX_CONFIG = "${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config"
+export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR}'"
 
 RDEPENDS:${PN} = "\
     python3-difflib \
-- 
2.35.1


