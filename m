Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743CEC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.16040.1647763707738165889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aM14Hor2;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t22so10330880plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JKGN5yaM4jN1dfMvoCeN+b9gwo+W6bEPmyHE2aEuHyQ=;
        b=aM14Hor2rvb76hbvp2xgT95BuQ+dlCx/dyG1DV2TUKCpNyLuujgPCu7GLSkdIMZ0Zh
         CMXtd0a7/U1OdwO83c6opMytf5r1vOcyJMchJGT7rj6mzlpilz/lk7MLmXubmFP3fUhe
         ZjtdaeuPgeGTlq+0kpHecUFR8zXA5lqHzD0CVVOF/hEXGV2FmwNaT42EJMCiIi/Ap0Y9
         6YP1m03K0CgY5PJ6I9bgnwNIFqm1x/kl8sMWE5SqAjOj5XjQRePfrxRJ2ulyUrheOnBR
         X6K8WaGb7Xab4jcLLG0jYQH3WsoYpUq3N8JEaIC768I/yUTQxaqKfHQpQeN1WPeeFInn
         fQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JKGN5yaM4jN1dfMvoCeN+b9gwo+W6bEPmyHE2aEuHyQ=;
        b=0O6eciKz5kZ36SsBp72VhLuLN0dWUCq2jEEqP7xlqd2rSzjY5nhZO9JZWzTWUA3TQo
         upeEwZpZW1Z2hyYOVaQ1p3FJw3LXWgz/TmRsU1Tgpa2NigsFR5vnPpDPqfTHVeSjs/Ql
         CD3uzxL+rOiBcIkFgyDsHp88Hr8CaXygZElCrR8fXe8ZGQIavCMGbWzGsWpLia5s1yek
         A87crhOQmbzqwqY1w7d1QXDZoOBq97VLsr/VOww0gmKH0WJsvtlBGfWLTnEz44yIYRxg
         IaFiv24n5m86d6HuVf3qK/MYZbz7gsf2/9vNnCLniwPJdcmPo9XXRNr4EABqvzM78vFM
         mcJQ==
X-Gm-Message-State: AOAM531DNlmtXS1SYPoPezv5qfz62otcubt4vs9txORuV5xNhBo1CjW7
	Ez1sfPcOPb5C3pjFLXEabIVnK/Ddczr+Uw==
X-Google-Smtp-Source: 
 ABdhPJzXAxAyYH3SwGr9XL6N0DNje/GYpNfIyugS3so8n9gFa+yt9O79jsitRy8F9aszg64z0iWBsA==
X-Received: by 2002:a17:902:f606:b0:14b:4c2d:e1fa with SMTP id
 n6-20020a170902f60600b0014b4c2de1famr7448087plg.24.1647763707052;
        Sun, 20 Mar 2022 01:08:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 13/17] cockpit: Package missing nonarch_libdir
Date: Sun, 20 Mar 2022 01:08:11 -0700
Message-Id: <20220320080815.825928-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96077

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
index 58dbad31b1..c08de89316 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
@@ -166,6 +166,8 @@ FILES:${PN} += " \
     ${datadir}/cockpit \
     ${datadir}/metainfo/cockpit.appdata.xml \
     ${datadir}/pixmaps/cockpit.png \
+    ${nonarch_libdir}/tmpfiles.d \
+    ${nonarch_libdir}/firewalld \
 "
 RDEPENDS:${PN} += "${PN}-bridge"
 
-- 
2.35.1


