Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493B0C5AC9E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:47:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.516.1771602476824405445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Lz29XEgP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so23900505e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 07:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771602475; x=1772207275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS7MEZ/jQFVjfz4nEOmdwBaMPt4VoUbyzRNgduc7LuU=;
        b=Lz29XEgPa7zo/miKzb4n6Jlv3CO45DTwta4RdAU63RJ+SsZjkuz3juck3ApRyDvzxj
         XX9WR9HlkOGtflutqsM3AtYl8OkG+Lzbs3endSzPQdShtCkf4o0leDYqEJkYxtfx54X3
         I+Oxi/V2RCJKCPMgZhGdAHbhgb+w0i4bDgmaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602475; x=1772207275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS7MEZ/jQFVjfz4nEOmdwBaMPt4VoUbyzRNgduc7LuU=;
        b=QDlh974UIV8RKsOMwGeASKWJlin3ze3qH5efvsAL4tNwpWRtcwNllYC7S0oXdeyK2B
         WNLQwJVBip9TKoKKcvqEu1WiN6bzeb40WHQw2i/PZXuRs+O2QyH9p0rAUaLR2cAYfjFH
         Gos55LYr82eyRHS6x7S6PtmPlthlODbCvx2oehj66rM7H7O87EPmSTBZ0CmklUSwXxsf
         4246L/LkwwBCnSLRzF9fWMeYZkn2N2rv9DlI7peVgC/TkIq2q8dL/RjLkZxieWgLlUY4
         ETKdyjp6wIm41dXv+VBmo9Ip/Dwt4nT4g8PvC4uFfnBHLrTK0/JLHWxNx1VKYcHGnYI4
         LNhA==
X-Gm-Message-State: AOJu0YwAtiVnkfNoXaxnv0IGHdhea0PoPgz3GY6wvm70hnYoHe9zoxOS
	iKOBNeVtG8um+rceGLdJaI4DnDKboc57mbQaUvm4yBJ4E9eS/SuJY9I33DOr7hF5ncUUOcQyoe4
	ucWcs
X-Gm-Gg: AZuq6aLqKZjrcHx1mAEUQqAiqj+q9lmVVWZywbJRCw3j+zpOLksC5ff4aiM5OrkSW9G
	mG9U4B/Sz3YeRVHN6vsMFd74wBNwfI1kHzwagRUbTmMtOAGlaRwkH1aGtkB9muyaF2ExQLJx9px
	yGhGYv7Bo4x1xpzPuPROoa0C/tJh3fRINY0d5x3x7IX9Bz1aMmeXJ+zDrpQOExA8yrEHjJDAdGf
	ykjDi+M0+6VGNMpNZlOvGquYMhht6ljm8WZ5BkzzLxkX3vqw/SaSA8PlTf2g6Ky6042x5W8Oaeu
	xT2w9hzBYqRS6eUzol3Fq24hyyZ18MOwNp8HePSFYtvewpdjnZeGax8jUV4qP9dTwv07QMGBYzI
	64V/4RUBhIzy9GSydqR1M7CzBTgDWS2v+7XQDtfnb4e0w5LM2FBiadV3i0KQI8M7UpuGjSCHCsZ
	E26LwJfveSSnuqSGStjRuiGSjuzF9Bq9l8jzK3
X-Received: by 2002:a7b:ce95:0:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-483a00b1063mr57641865e9.18.1771602474590;
        Fri, 20 Feb 2026 07:47:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm48783375e9.2.2026.02.20.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:47:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-evdev: Upgrade 1.9.2 -> 1.9.3
Date: Fri, 20 Feb 2026 17:47:49 +0200
Message-ID: <20260220154749.1422136-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220154749.1422136-1-leon.anavi@konsulko.com>
References: <20260220154749.1422136-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 15:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124525

Upgrade to release 1.9.3:

- Drop support for Python 3.8 and raise setuptools version to 77.0
- Use an SPDX license
- Fix memory leaks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-evdev_1.9.2.bb => python3-evdev_1.9.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.9.2.bb => python3-evdev_1.9.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb
index 993dfca1e6..ac687afbb4 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
+SRC_URI[sha256sum] = "2c140e01ac8437758fa23fe5c871397412461f42d421aa20241dc8fe8cfccbc9"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


