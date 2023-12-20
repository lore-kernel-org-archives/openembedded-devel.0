Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B33C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:03:54 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.35002.1703113425541033373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35d74cf427cso704085ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703113424; x=1703718224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEQecKx1XRa+f8Y68WwdnsRw0zECjR8A2i43sXiLdt0=;
        b=rlR5wPIT02sphSJ0IoY8xkkQqDGEj3OROj3l49JwxiI6TTa0TqkBsupjjploz7YbWn
         B0Sx+Jm1uhmI4JD1AiX+elsXEBQt4RX/eKSQNBk1dnY6yRrK9WvDwQR5n6l7UcV5QpEp
         qReZ0DjU0nLr7gyvunUUo9ae0MhItHwRUxBhRuM4I79wtrLgxV+xEFLiNoEe6JF60F5+
         zv5nfEV6OdO7JMZh/RMusx8HgIFaXOkTEhCWINFGe8ZybAnrWP7IjWWtizNlCRknzH6b
         mJmD0wC1czxzy4y6eWhJC79gSVciZ7ymNGzfRnjQY9vHI3ZHPfcNvVzAbsdqUl/g9mfY
         JN5Q==
X-Gm-Message-State: AOJu0YweW5pMoshEVkUszikokQcLAgm2YPWFehQOCYjWJ8MDkFE559ke
	z66f1gR0g7XBGlQw/zs5aVLc10l7AjCXBA==
X-Google-Smtp-Source: AGHT+IGDgD2ALNqBMZrGJ13DdTkqwQU25+DMFJXEZTzJVYLEd8hwej9eNvVZB3vdVxoUIK39E+87GA==
X-Received: by 2002:a92:ca0c:0:b0:35d:a6af:5fc7 with SMTP id j12-20020a92ca0c000000b0035da6af5fc7mr31204474ils.53.1703113423758;
        Wed, 20 Dec 2023 15:03:43 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l9-20020a922809000000b0035fcd30ec3esm148328ilf.60.2023.12.20.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:03:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-lazy-object-proxy: update to version 1.10.0
Date: Wed, 20 Dec 2023 23:03:28 +0000
Message-Id: <20231220230328.3828487-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107687

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...bject-proxy_1.9.0.bb => python3-lazy-object-proxy_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.9.0.bb => python3-lazy-object-proxy_1.10.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
index 74c5e9b52..9232a5a91 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-pip-native"
 
-SRC_URI[sha256sum] = "659fb5809fa4629b8a1ac5106f669cfc7bef26fbb389dda53b3e010d1ac4ebae"
+SRC_URI[sha256sum] = "78247b6d45f43a52ef35c25b5581459e85117225408a4128a3daf8bf9648ac69"
 
 inherit pypi setuptools3
-- 
2.34.1


