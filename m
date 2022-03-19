Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E675C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 08:44:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5240.1647679485687842602
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m84D4i18;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so9888830pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYBDsIY3qqQtouY1T+OnZzdCxIOgFEzMHupamBYw2O8=;
        b=m84D4i18ugdrlsFsCfDki4ZdSrPrvhfH7oYqH61GZS7wkyyklrPzIF6hk9YZDdRM16
         b2xgNIlMR60GJUOvx3MneGNE8hLuVBtZXYAK/+A/tsOZRo1sdMiYgx/m+/Q9SYNU+9HB
         qLO0qEW2oVH7ZmLk8h4+3kBbByHouPknU6hFqpySFJX++lDspgFHsqFAFUgMarpE5o8T
         7gtQ1nRTHboBpb/UvC2JCxa/xKkmpbKgiNwFiCctT/BZpRMeeK58JcoWg4NWcy8zK8z6
         eLeB+t29IY2xYidoBuAWAoYk1TPg04/htxzF6pzcEWvl29rxfAvA64jwZxC7N+l10gNa
         V62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYBDsIY3qqQtouY1T+OnZzdCxIOgFEzMHupamBYw2O8=;
        b=URr1iu6a6/SnIkPPUx0x7f8r2Q4cQBlj3zPM7fLrVQfQMSpSvIKB1G6uTchygt9p0u
         JPIgNq1rTxMzRLTAejBHxEzIMLbUUI1rvgI/vHiAd8J4TVjTj6zzs8F0Ky6BnI0Jrxgr
         F2tll5vhvAZcAVrBlSxy4EjCqQUy55wtLhZRP8beAR8k7iOj2y8Jj+HtliUZOYakrkVy
         tGBE0cTj24z+5Wg1Qn0mYR0f9p7VWo75XsaaywfM2z2V5/8Jgvz+yxjY44PFiNHuzvf4
         2kvBra7UAquB+5MpoGqCma/muKdZEz+zfmhInk4s43jd+xCZ0wdAmjEgFmeZDZluDTau
         gndQ==
X-Gm-Message-State: AOAM532b2Q7hFx0Ud45A+5cE0KG/Ddb7kjYA6SHyhpjhqRy2i8CSzoJ3
	1Z4tqQwLK72M8nL+JOnISTXpHvPs9wJRpw==
X-Google-Smtp-Source: 
 ABdhPJzJh6UQFHJ2OPSL+RpCuSo5pQITg9quE4OMq9/FjdBB8jYheek/IgNxU88FTNQ9+BJor8SaLw==
X-Received: by 2002:a17:902:7141:b0:154:28e0:9720 with SMTP id
 u1-20020a170902714100b0015428e09720mr2765207plm.116.1647679484828;
        Sat, 19 Mar 2022 01:44:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 ip13-20020a17090b314d00b001bfaa1f060bsm15113107pjb.5.2022.03.19.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 01:44:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] monit: Fix build with libtool 2.4.7
Date: Sat, 19 Mar 2022 01:44:41 -0700
Message-Id: <20220319084442.425475-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319084442.425475-1-raj.khem@gmail.com>
References: <20220319084442.425475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Mar 2022 08:44:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96061

Delete old m4 macros, so autoreconf can repopulate it.

Fixes
libtool: Version mismatch error.  This is libtool 2.4.7, but the
libtool: definition of this LT_INIT comes from libtool 2.4.6.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.7
libtool: and run autoconf again.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/monit/monit_5.31.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/monit/monit_5.31.0.bb b/meta-oe/recipes-support/monit/monit_5.31.0.bb
index fa51e05418..2b5e89420c 100644
--- a/meta-oe/recipes-support/monit/monit_5.31.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.31.0.bb
@@ -38,6 +38,10 @@ INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "monit"
 INITSCRIPT_PARAMS:${PN} = "defaults 89"
 
+do_configure:prepend() {
+    rm -rf ${S}/m4/*
+}
+
 do_install:append() {
 
     # Configuration file
-- 
2.35.1


