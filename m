Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E585CD37A9
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 20:16:58 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.31207.1694809008669330157
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 13:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kC4yEzd1;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76e09202322so170761485a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694809007; x=1695413807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpyW5D/hONdD3WxYWTuVF5szlX9XNlIWsm1KttCMhkQ=;
        b=kC4yEzd1utG7FKbbQqpsp2fdSU/nLybNuK2a3JI1ujCS3ONhnLRa6ldWF4N7UTNe9T
         pO4XtiRWi9pQDoRdeWBpWAzzrTFWy9GKJnC0wTSibrU0Jq73Lqaa+Vy6SjOdF9OyK582
         aeg0CmAPeUTaH6GA1hHZ+WzfSkLX2Q9C6J3kJ28GICU6PQRlgNiZeHxUA8L9sruFt7sN
         OQvNtW2RfBvf4AdqYvC7Ba5AMpnaJRpb8scoBivwovwO+BQAfdC9rau7lvRve2/A6jfl
         z4WWwUoKi46F5avM5EbdSw2B+3kCTZ/J+rgS6zgSTGcXwiQVBphdbue6s1CMIKPQV+jz
         xdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694809007; x=1695413807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpyW5D/hONdD3WxYWTuVF5szlX9XNlIWsm1KttCMhkQ=;
        b=iAJkZlIO3KMiUuaGUHqKtiX5kdm1UPT/wwhox8Ia0yPyDf0z/RCtTp5Y5bdHpxVGYN
         ak/CiekxZ/3cA/y9nl+y1BVPQYFV3SmPS4yHWe0GikKBghVCfi39eStLfZcg0ajRw/xR
         PyUQNEGHgCKQzFc7dz5KUov6bkzbfN+n3W6TnUT7t29Xl/DD4YkSD8IqyD9nY16K8BtX
         W3qpmZXSIQX3CjRTDLzMUbyKfb4QKXqWQooDPZnF1abKQLJh8fPSZd7JJnD+hDTIHcTx
         IyroUlR0rIbjWPmX7ldAvkm4i4hFP48E1zhbT8IQNyMQVYq1JF+PjhgZnql+O94U5Mgo
         14nA==
X-Gm-Message-State: AOJu0YzL8T9flOYbbPreRkCVKVMhMabmEgnR93cEQ72UbridYIAbdYd8
	Bg2F7WshTJVi52W68iFsRUdRwTfD4KlU0TIleqdAHQ==
X-Google-Smtp-Source: AGHT+IG1SVqtKTGHu4SoYyyFh924wJrpRB75vHEn+Pta2eDSlMgCefODOzG9TId+2W6uzJ2tC9EPSQ==
X-Received: by 2002:a05:620a:1996:b0:76f:5b9:3f32 with SMTP id bm22-20020a05620a199600b0076f05b93f32mr3110833qkb.19.1694809007126;
        Fri, 15 Sep 2023 13:16:47 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id w12-20020ae9e50c000000b00767e2668536sm1456227qkf.17.2023.09.15.13.16.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:16:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-aiofiles: upgrade 23.1.0 -> 23.2.1
Date: Fri, 15 Sep 2023 16:16:45 -0400
Message-ID: <20230915201645.191422-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 20:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104895

The new version requires hatchling to build, so add that and remove
poetry (which isn't actually needed). Note that the changelog says it
switched to PDM from poetry.

Changelog: https://github.com/Tinche/aiofiles#history

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-aiofiles_23.1.0.bb => python3-aiofiles_23.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_23.1.0.bb => python3-aiofiles_23.2.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
index c06f09fb6a..7992b00f3e 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_23.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635"
+SRC_URI[sha256sum] = "84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a"
 
 PYPI_PACKAGE = "aiofiles"
 
-inherit pypi python_poetry_core
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-asyncio \
-- 
2.41.0


