Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0B9ECAAD1
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:32 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.32541.1661479890785364781
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QtfTjPyn;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so6746328pjn.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gXjNYPBTya3Q7RRYG/e5a+RJxkiAFFfTVqLyip6Bzhw=;
        b=QtfTjPynJEXhSqUksI1hBCrB0akJYqWyr3WYe8Pd9TAXwGDRbO6YsV4IYTwlB4hUdE
         a7iFvYcgwFmBQNzVJ60nj5Zxq1fy2nBss6ownGX49hb2NBvb3SuZmkzZTI8U9UrMUYi3
         vM1JhBqLwjMIyLVQSgXVytzfBHO5tKIPfgWAgp+pKsmCHgXvXoG3qkIysmJ0VsKkKZKE
         8UrcrQEtaxjmckUxQlOT3hLubjWZvzAruHaD2/2Aurf5o2mPyL0bpWEi2j92dGucmnFK
         quDh/ahVAbu9XvnOWrKFFiPQwupXXtHa36kS46xUbf4DJ5jN8iIV3l11o5YpDjDKg0qJ
         NJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gXjNYPBTya3Q7RRYG/e5a+RJxkiAFFfTVqLyip6Bzhw=;
        b=o4qSZ5LIRLffooaGY9gpG+qxSJaAeCBqTuUm5CUByfpfugfeccYtgxL91PZiy3JrWE
         q2SblgRi5zRlunWlxMvdAt3uG0p1No32zJqE3RvJ5Ac0MJcVSRijR4aHTzt2yMEoC/Ad
         Lww0pwxmXgYcj5mKv32MiW3Nd3R57UNn54YpKf8WmJ5xTtENJSu3s3eQbXYtsBtxbyIJ
         Jfdr8z8oZRRW89KrO/lxMwugUd5p4lRTvruzmp96oJrbf8vA2KX1riYLsd4bXGRVQUcm
         ALNpvMQP2JyT3LupIuhi0xyC5z8FBVrU4IAGWjTHewWn8HAtsIhRUFHLm38cvtR2Md0S
         Se1A==
X-Gm-Message-State: ACgBeo10Vfw25z7OYgvsnegD3k2U7z2JwlqOAj9GA0LqX3BnHrtni6R0
	r7YtyZo3HdObGjvU4bFNQVB6PgDi6H58eA==
X-Google-Smtp-Source: 
 AA6agR42qsfXuPu2wtCvu3aroBJYPQlCaJzLsM1a0Z2p9xhxZ4yxR5+RgHd2hFwa1LWXc0b+l4uErQ==
X-Received: by 2002:a17:90a:181:b0:1fb:824:d33f with SMTP id
 1-20020a17090a018100b001fb0824d33fmr1910356pjc.225.1661479889582;
        Thu, 25 Aug 2022 19:11:29 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:29 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 4/7] libirecovery: SRCREV bump e190945..ab5b4d8
Date: Fri, 26 Aug 2022 01:32:24 +0000
Message-Id: <20220826013227.181910-5-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98445

Changelogs:
==========
ab5b4d8 Introduce non-persistent setenvnp command
17c02be Updated .gitignore
6e68ca7 Add device ID for macOS 12 Apple Silicon VMs
82d2357 Updated README with pkg-config requirement
c42442a Add Studio Display (device lookup)
ae49507 Use MACH_PORT_NULL to deal with kIOMasterPortDefault/kIOMainPortDefault rename

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
index c36837aca..e3da1819b 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libimobiledevice-glue libusb1"
 
 PV = "1.0.1+git${SRCPV}"
 
-SRCREV = "e19094594552b7bed60418ffe6f46f455e6bb78f"
+SRCREV = "ab5b4d8d4c0e90c05d80f80c7e99a6516de9b5c6"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


