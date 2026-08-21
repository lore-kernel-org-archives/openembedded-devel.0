Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C382C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:36:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.671.1787286966493260199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mdzpp6IG;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso7438395ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286966; x=1787891766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rYSqwwpi9QDR+9SiR9lqk5F7ooflVPHJbmtFTcfHPc=;
        b=Mdzpp6IGVr62V+FgOaUiqkGO7B/vcvSflCZ/z5bxKEELPORdqYT6b0ruU0Xp46w752
         So9lnkQ0Lcuxvh5VVjXlEjdBaMF11GgDVFrd+ZSjeIM0BZPd/PyKDhHALipzoqBhzdPE
         ArayVRN76XWTCWEB0r8cF0HPlJpVqU7EIQYO8Ta/9Fh2AEIN4yMHeHTebqgLXAS9gHSr
         HVC6Xqfez2PXHqR/pb8QXsZ4kyMUxcaflmgbL2bp/Ns6bzqQIAjYs+hMvbUngslwVTGu
         MjYn/AuvJxiCYI/B9pIbhD8qScvAbbfsCg5jmDK2YKS/Mpam6KhgsetLDdeK/3j+jbn9
         UXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286966; x=1787891766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rYSqwwpi9QDR+9SiR9lqk5F7ooflVPHJbmtFTcfHPc=;
        b=qtsFpZ+RXHi9PgScbVGM6dfHPY7KrXw+EDGLo34Uzqc34SMMuCWN2n/ygoYXqtcts2
         jhjUrN07wHLG0CJejmMIndX+Mcb0yvyE6PNoqMJJU81zZ3/5YMY0VZ3TGg9XqkKfwYHM
         crAvnNeMg2w9uOCjenoy8Swvs+jmWlzgV1jutoIvj/PCdQIUUB0UShOhqdELxM83eKlE
         /J8PbLA2UJv8Fi8HUO8IGGHK6zgzQ3xJmpnfY3RCCEqcmv4oQvOXGD7KJ9c17mG2E8HL
         3PsFVWaAXsXTAcsXdbLqDxWN9UgIWfQSDlfChBnfJ2ARmbWkhzCKv7Qp3Xy/o3xZjN6O
         3k+Q==
X-Gm-Message-State: AFuF++nvThKBc0WRmVmdeyB45jAJLJHBor/46hyu5ESIpgAUUR54lCs5
	1wdjUnlqX+GmL90Q69XjsPqC9SNULx/kABaE8JvpU8flsiJcosXtWBUZ9baf0Q==
X-Gm-Gg: AR+sD12DqDpUOCbaX8m5sL/DpF7FcJz7rwFMzJHFc8Q6izseTwfQ1qXQEjEoS5ZhyBB
	DnpmWAMRC5AgcfyRiNQZ211EA/Fy+4G+rKH6o4laES97hMjVy8X2Uwb+N+EH7xJ1tvw/YnriVNW
	ux2q3linRIBG/6iQ5x4yl7jNDdATj0t1JgjwETuSYYT1WaFonZj+sKGEIpoPqyNEn24hzzSZ/p/
	8LUTJsUNz9keUT4RKa0igaKd4vwsFIw/N1SpkrC05tP4k+DuhSTE3ofGilwnP1nZrG9gFCjGt4c
	2hbeb3o4AIEH4oGS+n13UavGUXz8zilzeMsW28Ate2W/7tTAzZqjwUk8AIAGHqAp9BmugZxzDiT
	co/HrPvf+C5+vCgyrVDIRpVt/JotdKm/mUrOKAqVOi3cmGt8l2pWAW37byAOaFIS5hKDA/HMl60
	JVTao08zEci+/trpw5W022H+X1T/1sqLj+lyNUbMCOfuUTuhgWyeD9sfGptQG/+hNxUXhLBWbu/
	jhlrjd3YhZcAphIr74=
X-Received: by 2002:a17:90b:2c87:b0:392:7f74:58c9 with SMTP id 98e67ed59e1d1-395c3a43766mr7001756a91.15.1787286965833;
        Thu, 20 Aug 2026 21:36:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:36:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/15] uim: fix UPSTREAM_CHECK_REGEX
Date: Fri, 21 Aug 2026 16:35:22 +1200
Message-ID: <20260821043525.448011-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129408

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version uim
...
INFO: Current version: 1.9.6
INFO: Latest version: 11.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.9.6.bb b/meta-oe/recipes-support/uim/uim_1.9.6.bb
index 1ea0f488ed..a14a122d6a 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.6.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-target = "\
 SRC_URI[sha256sum] = "67f0e5fa4292a533edc6f98b842df60c531a89cf82d0336a4e1ab72202ab8c83"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "anthy-unicode fontconfig libxft libxt glib-2.0 ncurses intltool libedit autoconf-archive-native"
 DEPENDS:append:class-target = " intltool-native gtk+ gtk+3 uim-native"

