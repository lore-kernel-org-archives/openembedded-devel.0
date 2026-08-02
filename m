Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D574C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 08:15:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19960.1785658511861921563
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 01:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F7RD7A9X;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso23122505ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658511; x=1786263311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m99xyHAZ7D/tW4WthdduyHwfWOychOU0Gj4XX6Prcec=;
        b=F7RD7A9XFfLi9kYqPK7KeddxVLUtFWWLamz/agwEFi5/IzQNDE6G7NzQFl9QK7ki7J
         DXmzGLfxQ90dprCSRmtsYeNq09gWj4WhpPRLqK34Kbwn9NHcNRxN8IlTtyLjfoJd9wv3
         90OAUrMKKUKE1UZOZWGPs0kK3WCqUGq8ElrH8UHxpPipZwUmw5a8CLfkHlLE/MnYcr2v
         CJDJHuYzACx2OF7S1hoe1rfSiiJU4DwFcJES5ABeb4xE/uKp2wz30NHOaKIXoz0NYtKS
         iSDQQ0xgvRNK/WKlFEMnavhgBIbD3ih+n6BNLegAYlb07jTw+duRUxkIKmgzhzzz8Zkj
         878A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658511; x=1786263311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m99xyHAZ7D/tW4WthdduyHwfWOychOU0Gj4XX6Prcec=;
        b=ruzSeRiQGHb7sbuJ2j1WdxrngFVGZfb+YUWsfzB79LUpMo3XvekyvdSetwTE44mxvU
         bKTImMBlFVyYijCKvox+o06BPvpd38mEm1QPZPxEuVp7UkspUffHUx3gbA7nfkn6GwET
         naSzeA21Yv09ESFnEEubgdxxavTx3pAuzqIJKzJnMDMNgZe5iusPrlb2zYX0jO6IQ8Rt
         Rmla4RaDN+EqnJRJ5dCQ5ADtbFkSYAw66ZDHkXcWjlgmrBlwIWIPvjwKlBGRu4x8Hrb1
         81VHGNCbW2gir/IJAv46EjamGwaTdBahEAGpZJ/knv5CgQwZo8+cHsbBdNddjrns4uFh
         AbWw==
X-Gm-Message-State: AOJu0YzTu5zK8OEL/xH9L0HehGnIPcrWolPHy/j3EIbIK3ciuiR97WNi
	Wi4JvJp4sz8afNZGcpb1SwW/3Lzgymcd3WB5q4tmTnvQYVb4BtSsWZ05mQU/hA==
X-Gm-Gg: AR+sD11mpIj6DWKG83uHWwLv7UoIxUzekiUe+WVscWCw9a4s5VLaLcPZw9KHIQ8HiE7
	NUut/BumJti3QzLnNSwiqaRpXdHxkDUj4SSTJoj32jx8BZn9Fi68z0msNQSDaCBclPiJ2VXp6UM
	FpjUa6jLj/QCXpK5U4jI/czePlxpSMNrrPgRvxCFRiyuD8mkILyu2yMgBbNkKrdx2LFH5oo5mia
	N4PGsZCpFKcEvXZGehApXxdyqatCXNbYig6UcdvwVqyQ8/aKNosC8xB93SJAVJatgl9NCDb43m8
	/Ow1EnqL7J8GOQa7XaPc4pYZ0kAvNzM6xM0bMx171IvHHFbgt5Fwm85TZ+zjUG0lvK8+fm39kBa
	U1ar6MG/DLnxWZ/R7tYU5c9Dzdglyb+GTCVxZ1fj0tKLcz6zgKLlQOjedIlqJ7FZjmGfc1B4/o2
	Sre1uTsy5UI9pSmd3veJ5X8LV448hTwuRrwXdR4QstzKB83zUpGLB7ALhXC68SAkgvz+K8Tf299
	KeMKROMMwDf
X-Received: by 2002:a17:902:ccc7:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2d053552de6mr53590125ad.4.1785658511188;
        Sun, 02 Aug 2026 01:15:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19fb5sm24371085ad.9.2026.08.02.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:15:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][master-next][PATCH 3/4] openal-soft: include tag in the SRC_URI
Date: Sun,  2 Aug 2026 20:14:57 +1200
Message-ID: <20260802081458.525763-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
References: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128654

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
index e2da0b1b9f..15cc83b7cc 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.25.2.bb
@@ -8,7 +8,7 @@ inherit cmake pkgconfig
 DEPENDS = "zlib libsndfile1"
 
 SRCREV = "b2c48f7718ef3fcf67921a8b6534c4914e328970"
-SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master;tag=${PV}"
 
 # openal-soft 1.25.x annotates realtime-critical mixer functions with
 # [[clang::nonblocking]] and, even with ALSOFT_WERROR=OFF, hardcodes

