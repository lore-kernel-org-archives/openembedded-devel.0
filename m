Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D49CC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:55 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.4185.1634338554756138560
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=QaUTOrk4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id j21so48213707lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfrEvCPfPe+PLvt+B+LL4xo8DOHBGrL7UJ8EpYMlmn4=;
        b=QaUTOrk4XtNhHCKj3AK5GexmUpHN11ZzehF6g9oqX86bkrxEqGcNPYCh3XtbpW4hzn
         2ICOO+LSMzOrFdahhsoPbplQdNDXm/FYh3nbiWfN4d7knplyHDax76LzIlWDV1dl0Lj6
         Y6Wuuc7nxM6WMLV+uLSRu5Cak5hPPjcX0PF/3DBYae9WHyAq39wRVyttWI9OiJq1E3jw
         Yhu+VObS4Hqe0nmDwwajFqlBr3sgBK59CCI/JOesAfSx+1M0+zsZ+dEHJ6CtOlhmDjdR
         VBui5XzEfQr3VDzcAX6ha9Kh+e/NDk5/0uAEyJOOlTgqFH/R0hlGmiybs6Cufschsb+v
         RVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfrEvCPfPe+PLvt+B+LL4xo8DOHBGrL7UJ8EpYMlmn4=;
        b=4++fm5h9ffQluWR7hzsm456BZfrp4e/wuccqdo0xXROjv4OLwScmr+xkZui/+SfxHN
         4ifIVsscZCLwuPbHL4FSZRv8D+iJeRoc/L9QtkhhmWjS0CyUtzgfu6u5hnAKGeZQtwMw
         Ge+gBsHapTiGFQ+hoxnm4SOiCCrpjN7HSTiHHjFwMmeym3vP2aBE2vVkdgCQyFdsjUyh
         zHlzo3k17owjbNPcK5K/ysk5Z4mJ87YZV3KuLTt4WBaryXh85PXVJMz+Wyeq9wnVhD8Y
         l2+uKFfjxsYUNjARrZ0dyidcn59HkFpBCJnE4gMFq/HM5FLHjK0j92oe9MU70zWl5S1/
         mP0w==
X-Gm-Message-State: AOAM533lPIeP8gNgmWBfyrZgjWST3R9+x1lVyEXNXGDeCKwa6fTujBtU
	PEj6vEj0ov2YWx84n0+Kf93xK6DntnKIjBUL
X-Google-Smtp-Source: 
 ABdhPJzf3sZhUT2fXJZW1U4rNrlkuAL9eACIcgBx8BEgrMORu6xAWXNXziNsywvGHt2QvizfWQshRA==
X-Received: by 2002:a05:651c:113b:: with SMTP id
 e27mr16052640ljo.137.1634338552813;
        Fri, 15 Oct 2021 15:55:52 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 c23sm706461ljr.85.2021.10.15.15.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-uritemplate: update to 4.1.1
Date: Sat, 16 Oct 2021 00:55:50 +0200
Message-Id: <20211015225550.4161910-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93341

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...thon3-uritemplate_3.0.1.bb => python3-uritemplate_4.1.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uritemplate_3.0.1.bb => python3-uritemplate_4.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
index 0d63803bb..eaf8bda84 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
@@ -6,8 +6,7 @@ AUTHOR = "Ian Cordasco"
 LICENSE = "Apache-2.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"
 
-SRC_URI[md5sum] = "869fb44fbd56713490db7272eb36c8ae"
-SRC_URI[sha256sum] = "5af8ad10cec94f215e3f48112de2022e1d5a37ed427fbd88652fa908f2ab7cae"
+SRC_URI[sha256sum] = "4346edfc5c3b79f694bccd6d6099a322bbeb628dbf2cd86eea55a456ce5124f0"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


