Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF88CF07C4
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:39:58 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.38721.1728549593913824771
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UX7mkTSQ;
 spf=pass (domain: konsulko.com, ip: 209.85.167.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53995380bb3so794594e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728549592; x=1729154392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuoFnM7lELNdPCaJ7RCd7VQsUISFD7fSaJLSco7yTCM=;
        b=UX7mkTSQomZTOpYBrqmVFRfxTvq/l2nVgEoceq6fIlwRuyE7WhL0eH8hzoi4i+//PT
         MiVg7D4PEyWzk5C3S5TPOvPr0e11cInQmtqQEINwCe4Zl5d3OID4hO2LTTUOILP8mbZm
         xY8o4FxKNzS3HDOkHkMdFdFAhQdkZ2qJCADMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549592; x=1729154392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuoFnM7lELNdPCaJ7RCd7VQsUISFD7fSaJLSco7yTCM=;
        b=uA7OaR3DC4z74yBKcbSYF3dH9Udd3pCP0vhcoKFzUQYAKPqDBy/SgKr4TcV/qqhRVJ
         PpkskrJopQXmUvgurlE4uIboZxk11hugXHYKXLVgLiz5fYpngLRmkn7DnzhXZVPDhDPV
         A5ojGRPSbPiKs2I/qr9TVHjSIP1Jz18rkJDfWXPqtuZIzDf3XaBfieDcH4cmzIK+ETcV
         U0J3PTlYT7uEhbCQ3cQDLJqkjhczIFX3wFyZYLHoNWK3ebepJv8KW3MG0Yi5afJw11ax
         fH7ISFvKawM1TpkyQNYGaz21ZKM942AMdWSnMcbis+jYUkOjKOK/OH/61YoENOsBOEVZ
         Bf5Q==
X-Gm-Message-State: AOJu0YyrU755zPXpvHvt8BvVmWs4lUae7/+KAMDiEHOKRJeiSfhw3yJI
	NlFtGewpqgGS55zQuWmPLW+x5wtmYgXsC8g7jrsN0BzZl/WPi+WfTFWajgXmIp+vu1nsmkNeNKm
	p
X-Google-Smtp-Source: AGHT+IGEQ4wXNHPQShkHKKtzc4zAolPeEMoMlFdv4QFhLWmAxv2t6/CSh7Ega+9Fen9SO3Gtak2WSg==
X-Received: by 2002:a05:6512:1394:b0:533:43bf:565d with SMTP id 2adb3069b0e04-539c48df098mr2785386e87.27.1728549591555;
        Thu, 10 Oct 2024 01:39:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm476047a12.47.2024.10.10.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:39:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-aiohttp: Upgrade 3.10.8 -> 3.10.9
Date: Thu, 10 Oct 2024 11:39:46 +0300
Message-Id: <20241010083947.7303-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010083947.7303-1-leon.anavi@konsulko.com>
References: <20241010083947.7303-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112764

Upgrade to release 3.10.9:

- Fixed proxy headers being used in the ConnectionKey hash when a
  proxy was not being used
- Widened the type of the trace_request_ctx parameter of
  :meth:`ClientSession.request()
- Fixed failure to try next host after single-host connection
  timeout
- Improved performance of resolving hosts with Python 3.12+
- Reduced memory required for timer objects created during the
  client request lifecycle

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.10.8.bb => python3-aiohttp_3.10.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.8.bb => python3-aiohttp_3.10.9.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb
index e762eca52..cf39dd376 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "21f8225f7dc187018e8433c9326be01477fb2810721e048b33ac49091b19fb4a"
+SRC_URI[sha256sum] = "143b0026a9dab07a05ad2dd9e46aa859bffdd6348ddc5967b42161168c24f857"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.39.5


