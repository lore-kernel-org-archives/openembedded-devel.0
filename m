Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25543C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:25:54 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.34296.1703111144033707601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7fe0ae57bso6499639f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703111142; x=1703715942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Kg4S/scXRfEZ1shi0Bo3l9dxoMp04aTKfc8xnhLqM=;
        b=UzElPmlUwZ1EK/52nPQfRIyCx7ddA41bL5RCIiQotIaekE+tba9MigLSl6pAJeLihZ
         2dEZma/5PW9X5TgF9Xa0AqMeIGhIOhMv0KgRb/Z96T4WcmlA/Z3TSJEDF/O2zG2u1rh5
         R+Q327ATRxRWYnReZ6y/q1UL46vXYMG86zdvPqrGUbqHOv3da7kTQ6TcCnXwn819guaI
         S6mP1GnoxIHIXbb4zVhBug93RGARXr2LSECvqO8Yo3IsWz8d6qw5h1cqt64kyH1JQcAB
         Nk/f8qOokOdlhiXViOKDjFJHLqB0KygMS186FYjWqth8k3v8qPj1UIxhYMGrfuDeqL8y
         95yg==
X-Gm-Message-State: AOJu0YywY167LpZxGJVKDBzbv8BlHy9aurMKJc+9OYXDMvjC2Y6mKhnT
	9q8YQwLhfqUhTi13JUAqJuUSz5HltX/q+Q==
X-Google-Smtp-Source: AGHT+IGoIfHJnhWTE9VjSgLPuGZW5QScmJXTum7X/njwg+e4vLTXRtF44iZrrqCQuuXLV2uHeOo5oA==
X-Received: by 2002:a05:6602:2c4b:b0:7ba:7dea:9da7 with SMTP id x11-20020a0566022c4b00b007ba7dea9da7mr1203158iov.31.1703111142476;
        Wed, 20 Dec 2023 14:25:42 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ck17-20020a0566383f1100b00469a2bc65casm129821jab.171.2023.12.20.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:25:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-zeroconf: update to version 0.131.0
Date: Wed, 20 Dec 2023 22:25:35 +0000
Message-Id: <20231220222535.3810653-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107683

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-zeroconf_0.130.0.bb => python3-zeroconf_0.131.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.130.0.bb => python3-zeroconf_0.131.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
index 8ae169c52..1963d899b 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.131.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "db96a3033bc2ece2c75d873796e82530e092e250d03d07dd530828cf84ae16f0"
+SRC_URI[sha256sum] = "90c431e99192a044a5e0217afd7ca0ca9824af93190332e6f7baf4da5375f331"
 
 inherit pypi setuptools3
 
-- 
2.34.1


