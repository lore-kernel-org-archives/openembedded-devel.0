Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D30FC433FE
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.11123.1635021385369608654
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=pxt0N4oV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id o11so8536235ljg.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4OsvA5Jh17nciVFY9GfcOcwkKQfHUX5k1MOBvw+TaA=;
        b=pxt0N4oVSlfojTiJ1qe7lx/8QKC1aVUyyKfOT8LySrX7jsylULh1CASm1VYrUPsg/V
         4zR2JdG8dFXm25ODmv+wf2aFsXIkr3rvFPqBZxnKLthd5JCZSiNkgoWUW/QlDM/R0v7y
         pSDK19W7cdDtJkxk4GUJl3jB9QyCxuJbdOOGCCi5UXBaH+6eOq9bjOiQGNrJxmSOsbES
         c3ATzSBxg7Bi/WzzfmWfZUX8/FKh1uQJlJfjGa/VVr1RMGeikxKliH+vVCxpj8tZTbCt
         cBg0nH5EjXeM5HDo+sPFWfubncXmXOT+TBqfDteKs1XG1lQb8ADwC8GcHppqctfomSxd
         56yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4OsvA5Jh17nciVFY9GfcOcwkKQfHUX5k1MOBvw+TaA=;
        b=Vy/qJ2wr8R7BUYfoj4ZQJ+Zo8LO/sQbg1SX7Tb7q2hW+TJEA08IIzKfkqQXZVJLUBv
         kFSOgiegR+BX4A0cWZCg8fAhp0ZuDRus5dn44ZFfXZqYtKAKiSZbBz6p06eUT8THk25y
         Qjk3maQSaSmeoHy1jb/FFr2k1VTsQ2LP2QwinzsGvCcNK54r/b59BPVYmYE23jir9x2d
         FpnWdnmdrPqYte8o/k2sny2sIrLiYJNnIMa+X5fT6OrkUNJjlgMZzLgyrpwb3jxFgpXH
         uAWw4hpQO9eqphXB4ToDUr7uhzXmFPmqmaM+T4q6/o5tkZudnf8mK6jIIgkz9vB2MzGj
         nUng==
X-Gm-Message-State: AOAM5329J8pqCMieAx7UmPs0L1TY54zD/46YlmMFN80jJBsxSsUwBAh7
	l0iGY7Bmx5FbWxPODBZvQVLUL9DB5cqqJHkC
X-Google-Smtp-Source: 
 ABdhPJznkcKeeTImT9bkHcnLbXpk1Fbz8zCzujDarcJA+UgjvXwYNuW04lfoHmHMhKiUUFzlNMMHRg==
X-Received: by 2002:a2e:9a56:: with SMTP id k22mr8580839ljj.32.1635021383387;
        Sat, 23 Oct 2021 13:36:23 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 a16sm1218990ljk.100.2021.10.23.13.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-pychromecast: update to 9.3.1
Date: Sat, 23 Oct 2021 22:36:21 +0200
Message-Id: <20211023203621.1656882-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93549

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon3-pychromecast_9.2.1.bb => python3-pychromecast_9.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.2.1.bb => python3-pychromecast_9.3.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb
index 1fd76ed39..77b032ae2 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "883d6e836ff5f1068a8bd00364a15b4c9854293086495e9fd9cacd9b4d54c0bf"
+SRC_URI[sha256sum] = "a1d6807ae0fc455aaeecd2def87c31bb86679a2920cacfa7910db9c9db5085d4"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


