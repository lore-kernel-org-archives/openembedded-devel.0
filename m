Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B895AC54E94
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.20191.1674401688136954331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BgfME0iG;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-15ff0a1f735so3307533fac.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUcJr4VUKXZsQWLpcMd0/XJNx76hx8vfTLr8H29kOs0=;
        b=BgfME0iGswj/D5jrLzEvALfcxvOHP/il8m9SYCR4c4FqvIPGXufkMeAJgaGGkmSvom
         P70983bAYbTyK/NjDk27aULF4yyLp96FHgC0d8MmyShMuDkTtmUpDVD+ZZfAszDSYRwW
         aAYguJzcDRYQDlfogFBAOl8ZFO85tE7+bx+4Ew6Q0Sl7HIhUC2UWxt2nPonhp4KyfB2W
         p0ewUar/dVys7XUOpvEKhyXM+eU0bvwQ2R6igW8w5cmNh9ExZYrtIjtI+VZgcXB2rzI/
         bNJ9NdfGiMtvhQmMEwEwfUW5nRE9rJ1arDP2SQSvQxga+7uEThJwq+t+HHfBOp8o+2ZN
         asUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUcJr4VUKXZsQWLpcMd0/XJNx76hx8vfTLr8H29kOs0=;
        b=TNoXyfuPKRTbPDzX5cxoh6YCUQBG29fRqIb2nmD/lHI0RZ+emk9Q3qeFCyQlY9k+Hy
         v4Xld2TsGEGVZ3GDGdnKdqH0CsqSaLceSA1rliPIxP54U6eTHGP4sA6OFXnKL8/QgQss
         2G9Yj+7RyM7M0LItDZWpYuf8LIT0rtMtyD3UTf1qvkBcU5NwB/stya2lIJjTweZZSw/X
         B+ihUtPLYmagEroRWA9BvGdTXpNzHF8jY7pTGfflKRax2PstS3z+yxCE/vYO3gW40YRp
         IOvBpOQ2MkXqBZrhpRSwe7oRa9edZPjSIsbMTFEtM3yIWSD5SvcrHoVvR/epJzGz8pkM
         OsBA==
X-Gm-Message-State: AFqh2kp/YLPe3UMB7n89m+NAJMXZ+KI3sHst7+sHT3Lkl0FvcbPVqtvq
	OoDUDFW1pQWimSyozpvAQBCD/xyPR9w=
X-Google-Smtp-Source: AMrXdXtosbICyNhu3y1g2wSlrQ9/MyZ0ph0yzW5aiCpHjrS2XnQLDalsfSv1dhJFllUyqSDQaEgR1w==
X-Received: by 2002:a05:6870:3b11:b0:15f:b40c:638d with SMTP id gh17-20020a0568703b1100b0015fb40c638dmr5821161oab.2.1674401687343;
        Sun, 22 Jan 2023 07:34:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 5/6] sshpass: Use SPDX identified string for GPLv2
Date: Sun, 22 Jan 2023 10:34:41 -0500
Message-Id: <20230122153442.213094-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122153442.213094-1-akuster808@gmail.com>
References: <20230122153442.213094-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100706

From: Khem Raj <raj.khem@gmail.com>

Fixes
QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 [obsolete-license]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb9672b8c5a8df645f420bd0ce8092800fa61e73)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
index 5c52437af8..ad7b083100 100644
--- a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Non-interactive ssh password auth"
 HOMEPAGE = "http://sshpass.sourceforge.net/"
 SECTION = "console/network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-- 
2.25.1


