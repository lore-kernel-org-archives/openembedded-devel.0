Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE88C4167D
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.23290.1668873520575573146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q7/s/c1y;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id z1so5419358qkl.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQYXUGO0pPK65qQN9lZlzIwPShhdDEu7VqLEnHZSLbs=;
        b=Q7/s/c1yx8MhknLjZLA2Vt7XZzs5ngoWY9qwpnlZhCJh9mvedL6rknC9FR2tMiZjnq
         K17cAQpbrUMXNU4yh7VwZFghbXzMXW0pp3zjzUI5Kij0/1xqqY5Eb0QhNs1GcSNexPH0
         uqAy2XcbAr99lkE6PGLM0dJJJaDLCdxwmRweD+Wo+pXdwpzK5+mv4/c68IpKjftVBvu6
         8A/BUnQfzNXC0Gu7o067stPaeM+Qs25TO/BHz+J4FdZlGjw5YCn9y3yJ6Hi6BZvQqMA5
         0NrLITH3YHKAasHUrrWI38bS608DjFdmL664KlG1p56MFlpOVVfftlY6w2kQJkqgqJMy
         cgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQYXUGO0pPK65qQN9lZlzIwPShhdDEu7VqLEnHZSLbs=;
        b=AGKBgbokNy2L1IJd1IowYhNFgmFfWO0cFpicxAUJEB5YdprMHAGIXRlLzC4h8ujRAX
         jve6FuogsCCW7q89f/KbmCntQcJTmNc0rb37HTBeCK47HSVhnKQk25D4b4hmJJhH/ZHc
         zlfYrPO6R3lDHTj56gJakVU6P73dTlSCCcxAEoLetwb/itiWQMsFIV21ZP8eMEXMmIqm
         3AkrQXjSHj3TvMENnLp/5IAI2i9ONZRZ5WB679h061wjX2MEuKr/uVUKj+wzsiRuJYkp
         CeWsw5IPb261daJS64NnRCRr1aLhiqeb5kQ2Nah2llFYp3V7EYs8e//zbg4RFE6KFtGX
         KaDA==
X-Gm-Message-State: ANoB5pn1rRutJNiQP23HipRM3NDB4uq/SR/s+Z83YmFSPdQ/RRry9qE+
	6kC2SMfw3gAkiZ/1LKJ2vMLQLyY9woXELg==
X-Google-Smtp-Source: AA0mqf4ZqL4YybUJ+KVYX+2D5iQM5fUWDeUUdX0J0fp5uGPcFKlLGbbLBAlIBsG4n3bE4iR305wGPQ==
X-Received: by 2002:a05:620a:a07:b0:6fa:438d:c86f with SMTP id i7-20020a05620a0a0700b006fa438dc86fmr9996235qka.712.1668873519237;
        Sat, 19 Nov 2022 07:58:39 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 24/35] cpputest: remove dev package dependency
Date: Sat, 19 Nov 2022 10:57:48 -0500
Message-Id: <eb9ab09c1f1b44b6394cb113364759b3250458ab.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99663

From: Peter Marko <peter.marko@siemens.com>

The main package is empty so it was not possible to install
  dev package to sdk as it depends on main package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8210e5904c7c69fc1a352fdb1fb4cf4cb50e06ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 921143a74c..d923e7ac9b 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -18,4 +18,6 @@ EXTRA_OECMAKE = "-DLONGLONG=ON \
                  -DEXTENSIONS=OFF \
                  "
 
+DEV_PKG_DEPENDENCY = ""
+
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
-- 
2.25.1


