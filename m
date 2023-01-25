Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAC2C61DA7
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44972.1674653497692269247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LY6BD1S7;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id u13-20020a4aa34d000000b004f5219f9424so3140866ool.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIrO8dXi0YvjaaHj7pDx/Q63MkWKZ1UeEP/WhElRuXs=;
        b=LY6BD1S7yaE//T7GvNPeZuqOaqwqH5W62GW+blU4SJCKqLb3/Iguy5+dUVI6RYWdpO
         h4QdgIgx0Sf+rI+Qt7TjIXS/zT0ylXjIBQrawknziZDP7ia3eRCfhx+JP2602KTqupmb
         3RKS/9ge7Of2mDO+BjrZpu0aerJyJmUUUv3LncIbRKkxv0vxz/xuIZXComj636IVXTQT
         p6fJLjwmzTw0/Jq8g1XWFkK3FAyra9eogOKoIeAN4VO+Tdr3cedzbkcDiujo+V3xjmPG
         Nc2S5gYLjbmi8E02H7Tl0f7nCMSIebrWALI0seOdoNgVB4XE0kRBRrkWAtqhy2IrovSy
         Uopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIrO8dXi0YvjaaHj7pDx/Q63MkWKZ1UeEP/WhElRuXs=;
        b=TZYPfANn4x+wXrPoxhba1m7RtkwOSFMs04F0OGdAclkVSJ0xaN6cy7c8KFq/asYYHo
         ftM3JuKLaamC1wDb10Muyf38WFdJ+P9cGZRUzmPzIIkRWXrtyBpDhzOFkKDj3JG2KkWA
         xs1PH5cFrIwfSQpKqmipQufqE+ptbUgu5b3LFrMsOO3Kevyn75Ko15+04zk/wHU/eSV8
         529UKj7fM14Jg4yJ5WVLesbTvaqkefrnRiVQckbJzywmRg9IwqzF/mYnuYbJP/1MdsCy
         qrhjNcIBOp2iO7j4qVEKhpPYkTMb/BntIs08zJUqW6F+QEdrfL7cAYOu4rhFthXG4zU/
         wjAg==
X-Gm-Message-State: AFqh2koaXZlfBIlbBZYqvpJoe0uYtWb9t4eofQHA9gctVGYz8HWq9B9W
	GBOd5v8a3fnC0ULYl5rU62lzpRvultE=
X-Google-Smtp-Source: AMrXdXuD6v7pvLOBWej7AEp85ENw8s8pT20QUlZfMrep80y795NO9U3AQ1XYCztQ9Ip3BGmq3ojLrA==
X-Received: by 2002:a4a:d081:0:b0:4a3:bcce:5b56 with SMTP id i1-20020a4ad081000000b004a3bcce5b56mr16083737oor.3.1674653500109;
        Wed, 25 Jan 2023 05:31:40 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 14/41] colord: upgrade 1.4.5 -> 1.4.6
Date: Wed, 25 Jan 2023 08:30:56 -0500
Message-Id: <232db5370795342f9b103013f4219c4a3a1ceeab.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100749

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugfixes:
 - Add missing copyright notices
 - Add Spyder X entry
 - Document where to send patches
 - Don't use exact floating point comparisons
 - Drop option for removed reverse engineering tools
 - Drop references to hughski.com
 - Fix a small memory leak in sqlite3_exec()
 - Fix typo in device-removed signal documentation
 - Make introspection optional in meson

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 706cfeb2504ebec37872e6ee051a5b07385412b7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/colord/colord.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 41962cd63c..0ae1a30fe6 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.5"
+PV = "1.4.6"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b774ea443d239f4a2ee1853bd678426e669ddeda413dcb71cea1638c4d6c5e17"
+SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
 
-- 
2.25.1


