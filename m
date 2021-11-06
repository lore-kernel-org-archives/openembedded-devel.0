Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EFDC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:17:54 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.22164.1636222673426540692
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WDgBaxvG;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id f8so13030346plo.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f51HeSM540M1QIDhwKNnJUqw05wzi37SIcyUWWiS/5o=;
        b=WDgBaxvGHM3TknL52g4IjrwqgM9ZsNrprRy0ZU75Hsukn0SPWh68aBwSi57mQiAZNi
         +tNKRGDp2NjJMfWxF6+3CGI8JNrAyQwKEWpkoQvdm/u4269S3pYpJ3EjcZQd0BfqCMrM
         sZp7ny8AK0HvToUOBwCpcxxNZZ9XOj0pDTbJARVW351HwA2z+uwJZji0kQuiWM/bkRD4
         gFTAdhf8qZkwd9IOyt3vU70rNu+1nVD5K3Cc5PMEazeOzUqddSXn6Wnex15CM1J19W6N
         HqAEHOWqvDdbq/ayMnwpGIxvcGK0F71e8PjPfIJT31mgExe79anBMsPKTukrj5v3JcRR
         gaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f51HeSM540M1QIDhwKNnJUqw05wzi37SIcyUWWiS/5o=;
        b=bMBWc4Zd97r2LjaHpbT5Rs9KmANGKhSNAs2rSgnO2G7altpeD7xA5uKKy3hGC7ewmp
         e7oBOl6ieZGC5/6Jw2rs9IJEQJl2jXyQ2MWZE6E+VUAt6/VSqUUvzSJ8euuJCbCeHp2n
         SDkPqG8P2OKV3q4eoYM4zYKUnuDfNnEITY7GRmU4xVP8OUtGw92eb+DwtbUEsVREvZOI
         0+l7RA0CqaYRHH1Cp1GWq526oI1ipUeNeBi1uXjKBeEkfDuTabfzSbt2CJdVxIXDEDzT
         /iZhWiux0796CUNA9UCxP5fHonn2wbRQB5GE9DLq0PYJOwQQpZ6BWr0f/SYRl8BiEcxZ
         uGhg==
X-Gm-Message-State: AOAM530DCalcr5kA+lxkLGjMEBO3HhbCMaer622pYAx/6GTMH2jXpWZm
	EpjjgxHMv0FncfFEsrEAwd+jXmV+tfM=
X-Google-Smtp-Source: 
 ABdhPJza65WKgUP21yW7NPGdRqFCUOwpCmUgwQyW/vIbUI8qKfCfG6zLM44R1n89Spvllhuu/2l8hw==
X-Received: by 2002:a17:90b:4a92:: with SMTP id
 lp18mr18610719pjb.55.1636222672777;
        Sat, 06 Nov 2021 11:17:52 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:68d9:b431:d568:20cb])
        by smtp.gmail.com with ESMTPSA id
 p23sm12186820pjg.55.2021.11.06.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:17:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 2/4] libssh: use https instead of git in
 SRC_URI
Date: Sat,  6 Nov 2021 11:17:48 -0700
Message-Id: <20211106181750.869596-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106181750.869596-1-akuster808@gmail.com>
References: <20211106181750.869596-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 18:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93857

From: Yi Zhao <yi.zhao@windriver.com>

Set protocol to https as the git protocol doesn't work for this repo:

$ git clone git://git.libssh.org/projects/libssh.git
Cloning into 'libssh'...
fatal: unable to connect to git.libssh.org:
git.libssh.org[0: 78.46.21.5]: errno=Connection timed out
git.libssh.org[1: 2a01:4f8:201:2294::2]: errno=Network is unreachable

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2f9851fffbc0a8ba10f9c9d7e4e5d5cee7825697)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index cbda8b7be3..67d3d226fe 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8"
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


