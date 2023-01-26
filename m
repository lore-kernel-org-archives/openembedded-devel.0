Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A75C61DA3
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:05:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.86299.1674767133021574248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b77zudlb;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso6576738pjj.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cI6oXlwIMdSehI6qmDkbeo2EOxhwaHhuU0ZFDXmEvic=;
        b=b77zudlb7BioIqeLkgFOX3/2hnb7740vQVyJZ7aZq5q+50ih75e+TyloQfMrsWnGdq
         TcVKBJSHnk4tPXk0VkufugJ36PSW6297emH1Rjtsid3tJhLapCp62MqE8PjWyVhj+hBN
         XVNylxYL9eFVbXuxhFnVPk9OXkPxxchHFPkjcwGgPjZBttMJisyYCrRbRA3d+5zftZ9o
         f5/I0833c6hHmJ3iRYjzBRqZ+2CRl4FGveukHPeodpyB+HyXmiaqzKqDpGPaueQJUAsz
         PrdYfd0hgz60/cQla2aRl0p7VhM4VQSfcGxFemmYJStAWaaNm9gHFJuNBEnbNsxag3kk
         SBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cI6oXlwIMdSehI6qmDkbeo2EOxhwaHhuU0ZFDXmEvic=;
        b=4cYJRzzPrcbp8PfpHpPO9I8+xJpbvHtUs7Js0G72+Ihp+PGHAGttHxaSPPHqnhyek3
         q4hBRyzvTObSyvGEsO8XAivWlYGUu1EKc1YiqLYuhDQaApueWOTCqCd6yTkxmRlW0JAJ
         YeL9F6sK7hM+Q+Dpa7QrjmAhp/PVw12JyVOdoNkpMoxiJfiGAKb1mq+pQ8z4RsWE9wvq
         D2krsgGKK6YR6tyHbrUEivg5vjUMs78ADO9RYPhiPoebrkJzM6ERbFRkOWSjUtZPplyr
         2Qv1LlCesko87VA8SGLDhSYWpKUHqMt0zqlhIr+0Q98zbnDMkzw981NxbnR+hjAE9Eiu
         vonQ==
X-Gm-Message-State: AO0yUKWe+3B2nWc9lq3I8suD/okf3QHCRkkbcoqFB70iJSjvtERlXbXg
	BqjvDYskEB9RBlqXALiZBWypVOPkQ13XyQ==
X-Google-Smtp-Source: AK7set+nxjCfTuBLloc57Rpywxm9Gf/FZ2EuIRlWCMlL54A9dxiwho5Z0FWtxUg6bJEVgACAnXvLTg==
X-Received: by 2002:a17:90b:4b52:b0:226:e662:84f0 with SMTP id mi18-20020a17090b4b5200b00226e66284f0mr3832971pjb.19.1674767132158;
        Thu, 26 Jan 2023 13:05:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a94c800b0022bee398e09sm1503847pjw.4.2023.01.26.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:05:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] htop: fix Upstream-Status format
Date: Thu, 26 Jan 2023 13:05:26 -0800
Message-Id: <20230126210527.2815542-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126210527.2815542-1-raj.khem@gmail.com>
References: <20230126210527.2815542-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100802

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index 2760162acf..d85aa15637 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -9,8 +9,7 @@ ncurses*-config applications.
 Signed-off-by: Paul Barker <pbarker@toganlabs.com>
 Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 
-Upstream-status: Inappropriate
-    (`ncurses*-config` can be used outside of OpenEmbedded)
+Upstream-Status: Inappropriate [`ncurses*-config` can be used outside of OpenEmbedded]
 
 ---
  configure.ac | 12 ++++++------
-- 
2.39.1


