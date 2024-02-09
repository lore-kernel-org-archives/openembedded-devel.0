Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B39AC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 06:07:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5877.1707458866505055251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 22:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DCpkZF+0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d3907ff128so416375a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 22:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707458865; x=1708063665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TksUIW715cw27pTRHsI0BaaYVc+1xIIQTqTdiH3XITs=;
        b=DCpkZF+0qoMc0PuUnF9Y9ZJn1Fu0jcJbr89cHy9EpXQuC3ByV0pKXdl14moRM31fGc
         Ojknqapp4ZPFU95TtuSfMA2k+gppiM3wUoyxSQ97xXCTKWTWWqCYuHgiwA1igCJHcUDM
         nDSZXFZCM9lxjPwsMUopwv94IShN1UsMGt8isKvdnGHI2+VP4KRWbad0JR7NDa1KExdC
         haff3Hynnw1rBDdV31y7t4Vy0h0TNZridsHKcIGaEQDbFsjWXOUIG678VmW3/lNodlS7
         zvaans+q/UwM5TiTKeMDsUVxUdLfiRT7ILB7iqnTRP+iJ8FQ2CnTKQKIlQ5y4WbEaYrB
         SmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707458865; x=1708063665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TksUIW715cw27pTRHsI0BaaYVc+1xIIQTqTdiH3XITs=;
        b=UuRRjC6DypXu4ikH/e6ZMzamRcciiwcJH3lg8gDIasf/W9Xe26slTezh8MNLovjG1l
         a6Y2RuHXtX8MAGjeH3Qw4EtAQNemZ6f0ZVm/3Nk0CRUSI1+9sJo7gbRRGzJEY+dmNvKa
         IseInf1Q/CHGqfEz893NF0YJKfV9iKf9+jvEiZRe1tBnTN57Jy1+WldVzah8yxtabiwY
         XOi4D7t624GAZeDsCxM2MUQgih9zo3h5HYbrJa3HeglzJk7kTVwIwyuh4FAcJW3X2Bpo
         Z2fWDSYYJ/YphbS3jz7w+FLNDdrdAKLPUEYFU8pCu3UExIPrFOzr+oALXlscZgn0Z+1G
         kToA==
X-Gm-Message-State: AOJu0Ywn7E/fzoTW3eFVZRW6R8YAaYlfHlcT54FN16AVKWO1YTjWmU5X
	zIPxnt0osgInCAsRsHEemwqdGYwKvZ+yVS8AFlVkrnThVlIN2J8MeMEIqqXW
X-Google-Smtp-Source: AGHT+IEHNRQa0QB7gkMta2SK1THkQjKOfIntwGjxzpNvY9GPoQQqlrb42feAFjFThuZbzYqRdGkB3g==
X-Received: by 2002:a05:6a20:9f99:b0:19c:96e4:3671 with SMTP id mm25-20020a056a209f9900b0019c96e43671mr796321pzb.30.1707458864919;
        Thu, 08 Feb 2024 22:07:44 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c45:770c:9b88:c7f8:8927:6fa9])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090a740400b002926be9cebcsm819271pjg.51.2024.02.08.22.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:07:44 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-oe][dunfell][PATCH] nodejs: Set CVE_PRODUCT to "node.js"
Date: Fri,  9 Feb 2024 11:37:19 +0530
Message-Id: <20240209060719.163924-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 06:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108677

Set CVE_PRODUCT to 'node.js' for nodjs recipe

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb | 2 ++
 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index facc39908..f004671a6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -36,6 +36,8 @@ SRC_URI[sha256sum] = "bc42b7f8495b9bfc7f7850dd180bb02a5bdf139cc232b8c6f02a6967e2
 
 S = "${WORKDIR}/node-v${PV}"
 
+CVE_PRODUCT += "node.js"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
index 1d95e369d..b64a57f94 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
@@ -44,6 +44,8 @@ SRC_URI[sha256sum] = "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437af
 
 S = "${WORKDIR}/node-v${PV}"
 
+CVE_PRODUCT += "node.js"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
-- 
2.25.1


