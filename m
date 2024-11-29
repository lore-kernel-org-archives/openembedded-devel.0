Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25652D6EC1B
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.117146.1732891585130818719
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CwLeu72F;
 spf=pass (domain: konsulko.com, ip: 209.85.208.172, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so22045161fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732891583; x=1733496383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nkn8GXmo722vAQTFah1Jxg8gW3qQNVq2c+wZHRvhGc=;
        b=CwLeu72FEZA0n2nJBc2wQUOF1E53Ahxb1XFobHfZvDcPeuSNp/FWraDSha9BIelZnq
         1tZzHVgL9WMcjJbsDXxL+t04v9pWQ1S86FzMRj7kQgzfCis3rWdyitYPV3odBN2wik8X
         cSiU62GQ+MQ9mqUZVoQ2ap6dUemS12L2vyFSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891583; x=1733496383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nkn8GXmo722vAQTFah1Jxg8gW3qQNVq2c+wZHRvhGc=;
        b=HEvnsECG4JxRE1gbFhogD2PPkGFe4G0mK/ncxigMLvZ0YfA4hE+BvxEqCHxn7jGobm
         JnEaCa89aMoTiLtf2RyWQojRgBO6r51msdJclJ0OXRlsMN87HqwgnEsMDYXSX+L+5oj+
         CW/M8pvV6ng9TQzKO1X47QfnXE2YkQu47QA8dKQn93QiXG1Go4elJWHBTKjULccYiTq6
         eVuKmB1yK+gBLr1I5tcnPbFbHhpooUjLBj0Z5sCA+M8N+Zb9WTQB3/ORkeMbHtRHSHun
         OUSBSdW0DJFwLmU2+DnbaB3G8dNFYKaNghluvVCFuQ6dy1LwXiZh62YH8B913rUoO4iV
         f6KA==
X-Gm-Message-State: AOJu0YysH9d82cV8qS4nS1ZgLV5bPP95uapo5qboyuIxcoN2dADH7fzi
	DsxmdZiVafmQSBjZMPhYPsKKpErDV3+tOcGj4fcqVqzNUWpIxy/ND8ksURw3kx7kTcGBQeDJFAA
	6
X-Gm-Gg: ASbGncsprviorOsK/PZpo7tLcW5AEr9XX1+b9sp/6hZ/eig+qa3kfl4B6qUyIF+tans
	9YmVJQKP8KMKQLYz6dLgp40zpGUCAeZbXo8eJKyu6PmboGCqyz0jG6X+ZIRa1G1YCJiK3dWABAq
	eEh88j4I1HR2aRg9pBXVq3winEI5+aPGVEYMZMxBNtDucHX6J5xetTRqcy3W6Xzi5KhCxFz+/ws
	oPXQ6pGXy+DdINNUAIOxV5fX5EuByG0GCiTeuCeTVTdvkTjriTwwjawiynmqRnE
X-Google-Smtp-Source: AGHT+IHnBaQu1DhPBGat2sDKRDZUTYJiTwiMjyOz/sMaLw7OXuOAdGpHfnLjskryoT26SpF0/sdHcw==
X-Received: by 2002:a05:651c:220d:b0:2f7:543a:3b1a with SMTP id 38308e7fff4ca-2ffd604a28emr71967461fa.7.1732891581758;
        Fri, 29 Nov 2024 06:46:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b87cb290sm622832a12.12.2024.11.29.06.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:46:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-yarl: Upgrade 1.17.1 -> 1.18.0
Date: Fri, 29 Nov 2024 16:46:15 +0200
Message-Id: <20241129144619.780319-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114114

Upgrade to release 1.18.0:

- Added keep_query and keep_fragment flags in the
  :py:meth:`yarl.URL.with_path`, :py:meth:`yarl.URL.with_name` and
  :py:meth:`yarl.URL.with_suffix` methods, allowing users to
  optionally retain the query string and fragment in the resulting
  URL when replacing the path
- Started running downstream aiohttp tests
- Improved performance of converting :class:`~yarl.URL` to a string

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.17.1.bb => python3-yarl_1.18.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.17.1.bb => python3-yarl_1.18.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb
index 07dfe4b635..8cf74f1fd7 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "067a63fcfda82da6b198fa73079b1ca40b7c9b7994995b6ee38acda728b64d47"
+SRC_URI[sha256sum] = "20d95535e7d833889982bfe7cc321b7f63bf8879788fee982c76ae2b24cfb715"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.39.5


