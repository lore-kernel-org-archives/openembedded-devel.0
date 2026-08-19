Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B0C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:17 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4903.1787138769364205968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dTvSXxwP;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f620399a0so820179a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138769; x=1787743569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFtC/K/EKiSrhZ0sHv33k/UlAUMOMWGzDHkeJV1EfzM=;
        b=dTvSXxwPnz3xziCrXp4PW0CxkyD0f5gh1WAH4SOqgU0vsW7BfSA8irClpJAMed+3C2
         sbScT6pwNIiP1S4I0Vk7bYvxBUMh03Xm+/PnLVH3zvvy/xk488oWufgn7MVSW937669y
         cumiOQLJOYwFJk8bB4809UlXan8Ch/AXG9c9WYrRfLqmiwt3mN2U+R6qTOD7ewfKPDos
         KLr2UW0W7VvLd3X/aPMNFu/A20OWrfww5bALrEd+9GC6GcOtUHcxcPZ8n9BPM3DO6bek
         s5pB1vN4EXo5WcvBHFoFySgxmhli+ILPBt7DRiNHkwCxg/b10gHyAJYXutPnW5usGzzk
         32hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138769; x=1787743569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFtC/K/EKiSrhZ0sHv33k/UlAUMOMWGzDHkeJV1EfzM=;
        b=FfnzgmE9F+R8RiYgGI1Iz4LLmq7+Y1/4WuHx3JvnUzShV/sfLPE5q7KDxONfgg0Sey
         8wbws3d+w4ndaJAOmWF4F/QIwKN5t/FgO6mhJs9V796Rt6HUyamOdyj+Xg2jBfP3vKeo
         IKx21oeHoacPDqtNkrRHhJ5DQjqPoa9qK2NAucQ8BifSOsdvLU2fzn2+u2AOkeSxRD1m
         d69x1EZ7AiksEOPatjgmCzXU2Cu6Cw4+/qz6FkA+plSx9JH0FjRJHTFg8ma3yO2Sxigh
         iwxLRrcfjD1tUk1VeDUkZAF4yhI3xlcQaeiWjgJJpTVTVdOSC1fpTLWISuWhRJf99MaW
         08rg==
X-Gm-Message-State: AFuF++kfWUEB3S/d8on/bfzPmTcELawSSMbacnXYDUAAH6dZ6tjwMyal
	Nat1AY0sG8oy3CnmMYzhCkREnMhrq9iJCrjx8EBhIBIZ+/rgiqPPfkPlj3yCKut8
X-Gm-Gg: AR+sD10mrIDaH6dUfERtD8JOU9vb+K9dI7Ay4h5nPmnMmXvJNxorzOhkY1CbXH6iL1N
	XiKKd2S9AHNSNFuH/esHguhFqgtNZ4ccqFuxzhRAJbCfcyghoCrMGhnmFB0yUKrPhsOLTCqba3f
	Hp/8b1TMquqh+Bh7eyDyXU/HbGA7EO8tLSmqbr65HOqzbBSFtoZB/RcQ+MtbzFf34i5nZy1rErp
	TUTllG8Zk23phSlJH2rTYRRR0cXLpUCamArDGC5An8olzUx4Y1bWV5xq1Px3tmZweCvkYCvFLuS
	Pfd02TW836evUaVyz6Tw5Z2p7zoTx+St5/WQFcSd0tLa2bxp9lwIl8BPXkElclT8PY9LlSCPK8d
	hf1hZoLapd47X9KMAuQ2ugTrkEKLwHyetE1Cvd31dlEp4lUn181OOroEFdDNV6TnoP9gaiuj+dE
	ZqYRp9s4f9kbvTQllCOzB9BDKcrpdIlFC215JyeX6WEbbfMfJwN8POmwcmDv8ByrXNThgeV7vlL
	Wtq/1fu7A5n
X-Received: by 2002:a17:90b:3bcd:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39580accbebmr7962990a91.5.1787138768605;
        Wed, 19 Aug 2026 04:26:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/7] libyui: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 19 Aug 2026 23:25:50 +1200
Message-ID: <20260819112553.971109-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129357

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add tag in the SRC_URI

Fixes:
$ devtool latest-version libyui
...
INFO: Current version: 4.6.2
INFO: Latest version: 43018
INFO: Latest version's commit: 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
index d86aa4da91..19b53a3e00 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.6.2.bb
@@ -5,13 +5,15 @@ LIC_FILES_CHKSUM = "file://../COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504
                     file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https;tag=${PV} \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
 SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/${BP}/libyui"
 
 inherit cmake gettext pkgconfig

