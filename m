Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59668C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:23:45 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.15579.1702531420513646002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b72d574399so353866439f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531419; x=1703136219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Orv2ywDFyEDXZ5Dq1DdM14xXQxPKdldPH+H6WTBbU/8=;
        b=sVgRSK66PIvIBJpn2+Rdl8THqk91Oms98OoSa18wSAJJ06srAUVsnm0oVCO3P+u97Z
         6CBS1QksybqZIhmtniKoKpQvmF2hNSUJILe5bk34lKsoHK7a1VqulUn0TGpAEr2HtuZV
         wGJBY/3bzgrlcqT6TRhKgnXopUBboYF/IdAn4nhIxIM7TLXfGDjCicy7L/bb3tMSV+sv
         EtZlwzD1iHjM7G80BJ/COMoBBOS7Z+5cukyKZ2z7z0nTG+jVpbJt4BxmRCffljZ64GXm
         Gqf0gx7hREVJDNZM5sItfbb2+X+YKOFO04pUISDjScp/nfRYPf5Qp35Z2nIYPGfbWgTq
         uaSg==
X-Gm-Message-State: AOJu0YwDMZD1jCVHENCjRquitR/ulsMQBP3ZwHRPShm4jlHI4+UhARMK
	JaAAj84fWA5i0X6cVyJi3Ge67qievCA4Gw==
X-Google-Smtp-Source: AGHT+IGyO4eRp+BNzhukmWhqMCErC0JTuW6i4fXDn4SEEElVe7ed7P0NdmKsJIPx+8PPqck2E5ACrQ==
X-Received: by 2002:a05:6602:2bd4:b0:7b6:fb93:89a8 with SMTP id s20-20020a0566022bd400b007b6fb9389a8mr8318540iov.31.1702531419037;
        Wed, 13 Dec 2023 21:23:39 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m18-20020a056638271200b00466593d380fsm3257222jav.53.2023.12.13.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:23:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-portion: update to version 2.4.2
Date: Thu, 14 Dec 2023 05:23:30 +0000
Message-Id: <20231214052330.1209724-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107417

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-portion_2.4.1.bb => python3-portion_2.4.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.4.1.bb => python3-portion_2.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
index a340ba7fc..b4bbfc6c6 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9dcbf1808898f440aed304a5e9f0742a2859eca3b0ac7f1f58e50502852a8ef9"
+SRC_URI[sha256sum] = "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d7778e5e04dd9a065"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-sortedcontainers \
-- 
2.34.1


