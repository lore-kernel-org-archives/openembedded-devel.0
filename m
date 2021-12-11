Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7BEC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.25372.1639249094433078003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=1QOnRpAC;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id l22so23758715lfg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uiU91x1Bhdb4+LPCZ9jY/GLAQ715aZBNTBkuoayiqUg=;
        b=1QOnRpACKQhZhWASjm1Faui3xlYWEyGuRGYfpWvMYw+8ms63lnR54DltzkGaIYz43y
         6Dmvfi4LanI6PnVd49K155JlSu/M9QWIA0Y11GuaiX1LCYpDuzlJppwskxK+3NwOy1Gv
         jvCjqoQ9cD/MmEQbDkcKRFzBSyA3+a1cIaJ5WIXkF/n9B+zGJpF8W1FlDS8VafK2818D
         69Ob2oqY7Eyts2CcTnhLIW9LRy6eoy2vKniL20c4+JYhJ4GolIQQtrR8c7ctDjG+lTwX
         3r3vsGfga25urjgE+Mwtt6FS4Rx1YCyOv0Fdz4XH8zsELqMOiwJiLiEb+uRhPkyaeo+b
         eu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uiU91x1Bhdb4+LPCZ9jY/GLAQ715aZBNTBkuoayiqUg=;
        b=r6W5szkNjTcgyTYuiGllV0GfdrF+9XXAQbOn6kD5IhUGC4mrCzR1fWlyZTB9DlpRpF
         xVwJqMicuILnyhaNFDLRSUtf0KVPIJIaaKLRtL0Fn3Hu8EM8NvIaUKL1yhGoNApfPSO1
         mx+TCRveYRxVqgftyrmL+QReqGWXopYCWkKVpryjDOeIDMLl9HhuJJl4k4wHf5yZK9mi
         Tx1ddlQKhXaski7WbYZpJakjk5a4uUf8zeBJDCd3IRDevMKO92L+3RlpvkvTWGXbHf8h
         8seh2zPEFZi5R62Z/PFKeqEZ8OM8lGpcIQbfePKlG8NK8UvtTe5CYWxw4RDdK+sh1mMr
         uAiQ==
X-Gm-Message-State: AOAM530VXaJ6uDLzvHXyjDCWhl0O0L8HErwXCmm6t+7+NflndWerKN9u
	kMF2ViYdKBF4sgaz9MPwJKM3U9H4Wse/xK0t
X-Google-Smtp-Source: 
 ABdhPJw2iXKzJ/MhGNDD3bI0xAg4Fm1KIxbocLtOhqQIUCQDhLR/2DoFQfBQoW9v6p46UgmFJox++g==
X-Received: by 2002:a05:6512:11e5:: with SMTP id
 p5mr18734154lfs.537.1639249092451;
        Sat, 11 Dec 2021 10:58:12 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f35sm730203lfv.98.2021.12.11.10.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:12 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-lz4: update to 3.1.10
Date: Sat, 11 Dec 2021 19:58:10 +0100
Message-Id: <20211211185810.2545977-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94291

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-lz4_3.1.3.bb => python3-lz4_3.1.10.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.3.bb => python3-lz4_3.1.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb
index b14484b78..b557529cc 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb
@@ -8,7 +8,7 @@ DEPENDS += " \
     ${PYTHON_PN}-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "081ef0a3b5941cb03127f314229a1c78bd70c9c220bb3f4dd80033e707feaa18"
+SRC_URI[sha256sum] = "439e575ecfa9ecffcbd63cfed99baefbe422ab9645b1e82278024d8a21d9720b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


