Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E385C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.23287.1668873519364497487
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NTaviOyH;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id v8so5406445qkg.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHa0bmLIF5qhk/VQ3a+fWrTciLs89emaGTd/xXnbv2k=;
        b=NTaviOyHrImpMc9vEq8RtfItRUH6yMU2BHd71H78ImzFsKVWrgTDIpTm7oiqbpTuQO
         GC9zWHuXO6TDl44JsiyR6uY6NTFRbRP1Wf4fafYok3pfrn3ZGvsu6+9ieBmocai5p4dU
         wMJkImpHwx9rXNGEC1FBur9q8CWWuEPnrfmvqfOT36X94vgSeNyddGbBiCflskli2vhQ
         a/s2GDuL+LfI59V2vjYx1ol2KLavGrQxOs3qV9OyzwJoEIkcsyd76316BvYvfqLoXWKE
         Y45MWMMVdSpmRFjygWmRROg7YO4bxw68QrGTtBoLeRfyvygTwEgF1wlybynaODRUUzLZ
         QRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHa0bmLIF5qhk/VQ3a+fWrTciLs89emaGTd/xXnbv2k=;
        b=3xVN7mkjn0R062tMAeGfLY/UKrdhyg1cwPMyuqR08IUQ8zJdly+4yJYtDEueRCz9l8
         ND2PDZwnpPh8Xr/hJmQ2CDNuIZn8vB7t6HUmNOb+fouZUBMOk8EaMrkxepsgZgpn3VdQ
         CfnDVlf1dWdvyoeBHdjxZQ9V/Pu4oU3rP+lDHWDqELIXUaGzyUF+3Mx26SILlziy+vcP
         HQ0hhvSsVAEtXw5jf/2Qnm63OxzJsWXCMD0o7hB5chE9QBlckpC0rk3oKQveo4xWcp0c
         oGtIBTVn6XSddM88pDPcnfHPNOzmP546PBbeYQ1hNhZjw8tBF95/kgx9GfhqGajVb9Cs
         NxcQ==
X-Gm-Message-State: ANoB5pnom/iDGWVXFUkkI7KgMRffR9Rz6A0bTjemckscMqICgBDdbN5a
	QMHM+SOscHUxhxbc+WCBBcPmhPOZ/yANOg==
X-Google-Smtp-Source: AA0mqf4Du6hTieF72mHuKoDL82bI5fLnI7wKHvuLikVHf5m+4cqa93pQXY8qO3pwLSdI6zZmQMvmdQ==
X-Received: by 2002:ae9:e507:0:b0:6fa:5778:8e with SMTP id w7-20020ae9e507000000b006fa5778008emr10393560qkf.71.1668873518066;
        Sat, 19 Nov 2022 07:58:38 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 23/35] python3-pythonping: Upgrade 1.1.3 -> 1.1.4
Date: Sat, 19 Nov 2022 10:57:47 -0500
Message-Id: <34e92233b2a221745d98f70573b29575f10c2032.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99662

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.1.4:

- count parameter can now go beyond 16-bit
- README.md is updated to describe how the module works in detail
- Linting issues have been fixed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6b4f2590d82d542a975fe50ef42f3d7c2dfa4db0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-pythonping_1.1.3.bb => python3-pythonping_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.3.bb => python3-pythonping_1.1.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
index 5e016fb928..62f5c0caad 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[sha256sum] = "3555a03439eb48d5e0e8c201f7c334c1e13b997d744f93453d4d601c0fc8330f"
+SRC_URI[sha256sum] = "acef84640fee6f20b725f2a1d2392771f2845554cfabcef30b1fdea5030161af"
 
 inherit pypi setuptools3
 
-- 
2.25.1


