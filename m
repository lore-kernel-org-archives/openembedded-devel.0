Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5788FC83F21
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:41:18 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.14213.1752241270639187235
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MqSWVQHl;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so4068831a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752241269; x=1752846069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJrY3kkZ9gWj0Ar7+dhPO6gF3cFwqBBpFjkzMf42JlE=;
        b=MqSWVQHlnGEEq6J4/4YJN21yrhWHu53LgnYt85JbVJd+0iiJGITmyLZg+0u57uaM/W
         sOyF3mHTeccxf3Fz9Y/5MyLGPDfutReg2+0crIaV6R6ri2gv8BpGSVI65I5aX1r7KMCi
         +XcvGQsTxaqalPv15jnWGImBSb9hFbilcxuxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241269; x=1752846069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJrY3kkZ9gWj0Ar7+dhPO6gF3cFwqBBpFjkzMf42JlE=;
        b=AoiZbNM2KPabsn9v/E0N4s9uk/w8S4rh3lJK70Y6vizYmn+pPqh88EH7N3KTHUbc80
         LHKGKOnqao06QyTTBi5136vPeXexVI/caw9ZkeJe/gFDSMEDftMPHdebKzcDnvnpVxHY
         UkCGKzrQh32GCffS/KQFez3vJmGcUQY0i+gN2WT3evyF3eiuDPlmKSwTT8P4WA+oOpd1
         XDKnMkqxG2SOR4DblOG5hFFwB9rK3v1teB9Tg9etCD2a7277A6r/JOUmzjHjAV88vmKY
         BHm8LdlhS8giGIcLfVFJGIfsRBjJQYdp98l3TJTa52+le3fi0g8aOPIAV9VgPT3IC96a
         gPEA==
X-Gm-Message-State: AOJu0YyqMKu9OaZE5uugE3jjeb+kjlh0gUtnS9nZdyegzlpXJhvEPcMD
	0IHz2ZLE3pUAd1vs50bA31XwUaf7UTbsSaA4tNR0YE7uF55+FzxatWCGEnC35NEOOiT82V5N822
	RuQml
X-Gm-Gg: ASbGncuzi5gz639DPLjNzj8+46IrYSch9grYI1jy3Y6cz59CQeJ9750vu/DXFT8cw+S
	4u2vcnq8y4DKAMSLOzI6zg5ufAyaMwhWF3BJf9UcGZuUEoackJ/uwZdOm/O/usash2jSc03V+8Z
	+8DaBMltPTvV+McwEmlcSklfSbJs+++T6DNWwEWxbR40G1B8JgPolxJZ5CQrBKAFoq9kcxcRpVr
	0LUYeJhSHjCKV3j6tXNaKIuwwABM9cLZrxMQbrTrSwo7X60cOfm9a7suGYum7zXXyuefReNC8TY
	km4F2zEsr3xXw6/S/HuEAcNOht8xQjJrosVzc6lMu8pIhNop0jErd46N8KiCFtYtKTzorB0ANfD
	Et0LDSsKJieSxbzQxZubKZiPX/dAPsMfSf5CPCkKdsxPty38=
X-Google-Smtp-Source: AGHT+IGsmrz14hHiwEq7jjjqj5Wbu2Fat3tYZg7BaQMB3SMbgFwgYJN0OwRbJ4fUM0iUzGUqLbYa9w==
X-Received: by 2002:a05:6402:24c9:b0:608:176c:f139 with SMTP id 4fb4d7f45d1cf-611e760e496mr2500085a12.5.1752241268551;
        Fri, 11 Jul 2025 06:41:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9528ae0sm2209793a12.29.2025.07.11.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:41:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-aiohttp: Upgrade 3.11.18 -> 3.12.14
Date: Fri, 11 Jul 2025 16:41:05 +0300
Message-Id: <20250711134106.4117273-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118453

Upgrade to release 3.12.14:

- Fixed file uploads failing with HTTP 422 errors when encountering
  307/308 redirects, and 301/302 redirects for non-POST methods, by
  preserving the request body when appropriate per
  :rfc:9110#section-15.4.3-3.1
- Fixed :py:meth:ClientSession.close() <aiohttp.ClientSession.close>
  hanging indefinitely when using HTTPS requests through HTTP
  proxies
- Bumped minimum version of aiosignal to 1.4+ to resolve typing
  issues
- Added initial trailer parsing logic to Python HTTP parser

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-aiohttp_3.11.18.bb => python3-aiohttp_3.12.14.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.18.bb => python3-aiohttp_3.12.14.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
index 898871fe00..642fc6784a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
@@ -4,10 +4,12 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "ae856e1138612b7e412db63b7708735cff4d38d0399f6a5435d3dac2669f558a"
+SRC_URI[sha256sum] = "6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2"
 
 inherit python_setuptools_build_meta pypi
 
+DEPENDS = "python3-pkgconfig-native"
+
 RDEPENDS:${PN} = "\
     python3-aiohappyeyeballs \
     python3-aiosignal \
-- 
2.39.5


