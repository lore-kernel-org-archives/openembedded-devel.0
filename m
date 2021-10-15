Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDC6C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4275.1634338581132779113
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bbR8irjs;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id j21so48216910lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mg9E2oSTB9tCNxnNHnpHpgnAY02CcAKSWFQrHr3yF0w=;
        b=bbR8irjsWGzeuq2K6tV9641DQTA/6iMytS/rR0XvExgMskYSNug8Xu4tZZBPVCQ6o6
         h4E0diQeyegR1buZ/5cSJXaXTjCAIYpV+ThMMYKUDRTWBTV0c9v6Vtjkg9vB6Ip7/3Sw
         SEKtGWqyWOHD/aUvdeMOKP5Le9it6WTJktWMuoY11PWM2+Jwku/a/WvulVoyVIEECTnR
         tWcylHWmDieXs6+sre8/eP6ffD+5geK9M2Rkiy6YaMrs0oci2E34XUfmMJQKwx/JWz7v
         B/yqJ00Wgv0e6dSFdFzBZRLIU4VoWIGgAE+kWNoGGMEK4OhyKKCN8eH5gDejj/Y7bVkg
         3D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mg9E2oSTB9tCNxnNHnpHpgnAY02CcAKSWFQrHr3yF0w=;
        b=NhIr4eNyDE87ZPoCeLnNbV2BtD917zr7xZFYKqhmGfJSDkwVDrcfcFZfrFiggwQGXi
         vB9PlFd5Eulhp2Nuk2WvMkGP1KcMSJBSVxaiE9y+4Xo3584GJ5zmGXhJIk1SCYQJOp/h
         QOlxWU4ll5lYVd+qdKXXN5r1KafMk2KCSqFje8JvFtQ8PN6gbfdZyu5GrywC32B5o9a6
         O5AQwl/pBMnzXo0VtNw7yLDmdyybGaCltL2Ei/V/6fFnBHXFsChc84KltviCAQBqMaxV
         lA9uTqH51GeaH9w8iCBnRSuVrHg0OH/0VSiPSDHuKYcGWKu2yi0711Y1utIKL1pTXwe5
         F6UA==
X-Gm-Message-State: AOAM530gNWJNdftPEWPN5m032kUSSkEFbKgC5qjvrS0WfQS+6s6+lN9x
	8+YSD4RiIYIymh/2ZZZ2CAcYLZ4gEifHmd4L
X-Google-Smtp-Source: 
 ABdhPJxkssJ9thQYIkPYTcjKmOAwfpDrHB9lcjSxq3Xue2QVmYxWZI7Dyb6mnVUxiqOq6XGaLZj/CA==
X-Received: by 2002:a05:651c:1136:: with SMTP id
 e22mr15903797ljo.329.1634338579226;
        Fri, 15 Oct 2021 15:56:19 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id u9sm657686lfg.88.2021.10.15.15.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyflakes: update to 2.4.0
Date: Sat, 16 Oct 2021 00:56:17 +0200
Message-Id: <20211015225617.4162643-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93354

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pyflakes_2.3.1.bb => python3-pyflakes_2.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.3.1.bb => python3-pyflakes_2.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
index 607879c8d..641bb2667 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "f5bc8ecabc05bb9d291eb5203d6810b49040f6ff446a756326104746cc00c1db"
+SRC_URI[sha256sum] = "05a85c2872edf37a4ed30b0cce2f6093e1d0581f8c19d7393122da7e25b2b24c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


