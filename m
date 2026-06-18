Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DA9CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:46:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27643.1781812003138013885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iMspVoU+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so12594615e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781812001; x=1782416801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LI5MroH/wfTEmkD/LtDdxrsWpSqacruHLbwZJac9XIA=;
        b=iMspVoU+JNO4cvktOp2P3Ufeb5CSyBQW+nww24M4VM0aAZJiHYpnsQt82Le8cft4RR
         dfbo3dianp/XOzwNP65z1OM73aZ0CsA9DIJxt4bz3pFOvoPSxLuDL3Kap6mJ1gHgRcHE
         MgvrD0HuCsPv8GqrFNLEXlI1fN+MHb4NG0u0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812001; x=1782416801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI5MroH/wfTEmkD/LtDdxrsWpSqacruHLbwZJac9XIA=;
        b=gGG48zXS2ndZRRV+++oYEM25oQqV3gCTmbMdHSq9GRNPDc+oXUhiBYK6p9P1s9L/1B
         rlqxjpe5Sl502BYZ9Cf5ix5XHsdhSE5Pj/7qD22BnDMVvwh4QRBVby2DGtriQcuGBG0r
         ++WMQHlWybpHsZAGwRujEcLbhw3kp1Ef1DaU0mv+OT82pryxJLTm7l1I5GAgkdP29c5E
         6vJ9+PXM+HUl9zjtW+zzN4tu3MpAT0g3ffae/aey6AE7K6gB+vUvd+ekBiIq+SUCQzWR
         zuELDu0QeHPMLvdixMYceveBe1yHiWkkFcIoI8s+ctL1HUgMT7Val/zWl91slQlwMHO+
         gSrw==
X-Gm-Message-State: AOJu0YwDLUtDycZoiRdsjwk4vGQwFRA3n8lMmeMMVzwCxJf6ehT1FKkf
	dQjv5Yv8H/bVcTO27IUeyDLwWV5FP/qf2Zz3NK/OT4cMApYJdecocZchcmX5x56pWCpzeVgeCY/
	ShSqm
X-Gm-Gg: AfdE7cnED6uXSaIC+u6M2oc1HhEQXe0A84lCASBQstpfAtsXp+i78w5w+kvKl3nFQCr
	DbInbj8zzLX5p7CMWLTDfqiVW1QinUgfRcdGlR58kVkVoOxp7ef5VYWLeVosA8dI8o8oH9VBA/A
	sGZ+KyCKxo7NvZDxNToEfX0G65Gj9uaJKmKKq1mBRFeShbSa4sh9bMT1pjxFc33RWce0+MePLPm
	aUx3kxFIyn2ggyZ+QxKedVnnhs46uxwmYFWWCdwezUbicFOm81YnUHPKjEvC32YBHE73fV+pLMc
	j4zkemvNqBotvpE+peMD6sj++2cI9AvThA7bGGdxR0MP3Cv8+W1SGZt+g0mUcAi2csWpc81xfSy
	Fg8RQrciTsuA/M5fThWRUwdnObvqPiTRpXmRdbhNkOkqdSykE3Mc0kGjPcCasdgG28WAOe6ozi/
	sSnyAQ3VHCB2oNHbvuL12zYtasPA==
X-Received: by 2002:a05:600c:8010:b0:490:e170:b80b with SMTP id 5b1f17b1804b1-49240e7a4bfmr4839765e9.32.1781812000869;
        Thu, 18 Jun 2026 12:46:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fce9561sm11889395e9.5.2026.06.18.12.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:46:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-tzlocal: Upgrade 5.3.1 -> 5.4.3
Date: Thu, 18 Jun 2026 22:46:36 +0300
Message-ID: <20260618194638.1802073-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 19:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127667

Upgrade to release 5.4.3:

- Moved the tests back, removed the ones that check for symlinks.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tzlocal_5.3.1.bb => python3-tzlocal_5.4.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.3.1.bb => python3-tzlocal_5.4.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb
index 3d27588cd1..4520b84a77 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "cceffc7edecefea1f595541dbd6e990cb1ea3d19bf01b2809f362a03dd7921fd"
+SRC_URI[sha256sum] = "3a8c9bc18cf47e1dcde252ea0e6a72a6cde320a400b6ac6db1f1f8cccd553c00"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


