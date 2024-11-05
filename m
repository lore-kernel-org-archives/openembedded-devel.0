Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBB6D2B933
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.19506.1730817407824743884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNFzX1l1;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e34339d41bso47427797b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817407; x=1731422207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPnB7/XXW3S+HIPMtvLntnxAvH6VHqsO7YOX7d5DxpE=;
        b=JNFzX1l1PnDuVe/K+GfdI30ew8HzUSDmg4QF8e+tyf+XVGsQF4dOfEf/ql0yp3SNaa
         PZJwpiIj0yd/jawIyMf79OkcIQbUqqDlCbPxvuerCb7+1694ViieaFaVUqCLCb5qT1cw
         bDn1SbelpnqqfBb3GlsilZCgI2JhFT12Ec4ZBr8eSK3ni68Y0t2+p5qdi1ie7g7rdRUm
         7VJZ2f8GmlH1Z1Je6EYqLN/q1RFC1GgzVQWTTYl9poXMQhFluhWzkJEEwrb6m0r1bRwg
         9rikvjguT2chgsUal6wMXdThzgS4c81lwAvu2Z93vAQIWL7NXnmdpJtGGRsnriHu3rg0
         whzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817407; x=1731422207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPnB7/XXW3S+HIPMtvLntnxAvH6VHqsO7YOX7d5DxpE=;
        b=m5q4Ax0rR7N6hH4m0rBC5T/hA5GNzHXtvpwHWe+edCKgmvJ75J/R18PeIeXZhfvMuh
         NlPNpMd4skH9PHWQ7YYKDYkE9YiK6w6AYuIyj5WuBXuHomnE+MEI7ONOM5cOsfHrlXvH
         HEWkT7wM7kJFyQRT4mrC0rJ70og2ttdCPo2mgjj0VOhbRrzdyNS9Z7SRD5iGUitABueq
         ZDaBH83cISSe1pxcHov1kh84cADwR7RuI+8314hIjfBk1Otgv0H5wf7+dGBJvOPXf9Q2
         yLf6V0aQWuiRPdAUX3JhXPxfnxc7k60tPFEoH18sf5FYHhqPpP9HjFAZDoZDbrdoi+z1
         bCXA==
X-Gm-Message-State: AOJu0YyMuTvi0a8eeHeu/DdA4xfEiGpy4F5rGjt8H5+VLdR9fz9lzuXV
	GGAHPTnHTN8SSwlhAcv3/6eZPvcc1Ycad8uadE9IgTuyfs53lmtV7yjaMg==
X-Google-Smtp-Source: AGHT+IFyWKh/Dgb5VmnRrvQHzUhjmq3u2b49zk5DLSrGP8MeNnstkmf1lsZvLYdxdsUvWbI+Ai5hpQ==
X-Received: by 2002:a05:690c:460e:b0:6e2:c13e:20e9 with SMTP id 00721157ae682-6e9d8b056ddmr253162877b3.38.1730817406948;
        Tue, 05 Nov 2024 06:36:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 17/90] python3-pymisp: upgrade 2.4.197 -> 2.4.198
Date: Tue,  5 Nov 2024 09:34:42 -0500
Message-ID: <20241105143638.2301245-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113435

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump changelog.
- Bump deps, version.
- Only include the changelog in the sdist package.
- [data] describeTypes.json updated.
- Openioc.py is not a script, but had exec bit.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pymisp_2.4.197.bb => python3-pymisp_2.4.198.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.197.bb => python3-pymisp_2.4.198.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
index f20716026a..b902061c05 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "840881779d1762803e9329ae5129a88abb0e6110afb43c9e3e6e3877e5931a6c"
+SRC_URI[sha256sum] = "f5583263c2fcd380570c084b21c4e4812a01c32daa7baafcdc3f87153edc9303"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


