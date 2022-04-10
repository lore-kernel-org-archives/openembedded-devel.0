Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D2DC4708C
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.21958.1649623486957418179
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=FHlUii77;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id x33so16933316lfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nCNU6P1BKQmYAxs1NMa9LGEObbfzc+jBz83wgNtDUE=;
        b=FHlUii77MTkj7liglsM0LsXYr3zFz5XQ2N+m//3dzGmzDh2Q/mE2Sh8w9JYi9Kgv2K
         er8Jy69O5shqlLK5NYUqh3Gk5v2i3u3426DR+f9RQtpF3uAJOVZPKp1dVPQXY0aaz9rB
         pLjIR2zE4OpezW6J3zOLJqTNLKaeY8FhEMuaht6Ik+MknOj6pgXWBE2STUWyT+Wrfw4k
         Ycl+V/KBbgkKM7zAEbJAHFqEkaNYTM7qPjSDj4xeZtaiZwB9w5mRPmnnK5ehpifvREWP
         yw+bWOdoa8cLyzBeGnXcfyqtp39xEbdlq1xqvGSZv/RnC5YYXFjzX0R/SWKuyxw6OwYN
         vnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nCNU6P1BKQmYAxs1NMa9LGEObbfzc+jBz83wgNtDUE=;
        b=5ahhjNW3bL+HY9k3iXfNlSaJY+ugbNjBrtnLSMucY2tO9+N8ddo6NRRAsWBytXJcuq
         VdhbBGokCyeNq9ImIqFhg8wPXehpA8gDRMondC2s5+76B5LY+r541uezr+WDrCWYCxyG
         h9nTktp8kXq6zkFvNx7vVjpPdOVMjSwVaUo1vgYGG0xAAQJfQ2jhB/Xie1wv0tFkSf29
         6aC5szmgREHutkhIfPhvEQsgKGVAq9Xn6LWSv7VE9yEIzim1DlIsXqYwuwrcuxVqaj3j
         D3b+/ZyPQHS9E8YAGsAcsD6OXbIuGwLHzHh93vf8XtEFWj+CeHdFxJTepiIXlCEfU/Fl
         hjpA==
X-Gm-Message-State: AOAM531hcPC0k+VIufspTFnbqgUx/bYBcdGN8SiQVSOR3CvwC2/92HsJ
	ZAuqI/fiZW8XUJyLzyf05sCWpkz9fRm7FIct
X-Google-Smtp-Source: 
 ABdhPJxwLhgh2DmFtOPu+NDRbRkl6ACdxPq1kXeWW4DAK3bHiB9xap1my0rVnh3tFKO8+wcPf9zDdA==
X-Received: by 2002:ac2:4ec8:0:b0:46b:88e7:9b2e with SMTP id
 p8-20020ac24ec8000000b0046b88e79b2emr8389591lfr.110.1649623485067;
        Sun, 10 Apr 2022 13:44:45 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 u26-20020a19ab1a000000b0046b9f6c7228sm357733lfe.43.2022.04.10.13.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:44:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-flask: update to 2.1.1
Date: Sun, 10 Apr 2022 22:44:43 +0200
Message-Id: <20220410204443.4047529-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96529

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-flask_2.0.3.bb => python3-flask_2.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.0.3.bb => python3-flask_2.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.0.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
index 4070fc012..24a704770 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "e1120c228ca2f553b470df4a5fa927ab66258467526069981b3eb0a91902687d"
+SRC_URI[sha256sum] = "a8c9bd3e558ec99646d177a9739c41df1ded0629480b4c8d2975412f3c9519c8"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


