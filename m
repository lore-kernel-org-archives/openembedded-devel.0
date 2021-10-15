Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE71C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.4357.1634339050135515420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Sta+T5ta;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id r19so46631759lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxf4PN8+ujCkC29epivoCASQ+X8spaOEAUDciszR+zs=;
        b=Sta+T5ta5xxLRYEKwVhQLwQUWwHMG+A6h/rQ2CdAWXBc2E7i55hVnMWPs3HC0ZHU7n
         ojp5uJNGKXa98ue2P2qVOySfcPLGY6TpThaT/VIyWPKTQAanOrVOuZBRq7w+g94rVflU
         hv0AGcVKodk2f30lf4jutDhx5fcfrGz1JQI1cTWrjfseF3aTbwp9fXbOymHwoQzhdzvY
         iJGp8zEgtn8vAQrXS5qknr4tw4dNk8UYeb5NcC5dULGsELMcBFCATpxtkwzjP/9KPf3Z
         hT60ycERnjcgUMYrlllfZyyYXdk4rQ7ehfkoGXBeL5IfDe8rX6aMQTGbuOZ9bqCvlbms
         DlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxf4PN8+ujCkC29epivoCASQ+X8spaOEAUDciszR+zs=;
        b=sscE7yVmvqboX8WcKkWnPyzNEB3mSZcOOtL7xwzrrT4M1MDlzr7Cr3KGs9WOZ+60pm
         BZ7wt/Q9xVH8kRO4voalJQeBFxyujUG7HHyGHCXBjuuRElqaxKFndUu7XiBvVVeE5Q58
         k07qshpCLZ8oO3skSBD2kYCp/MqazXVsXYIMngNcRJ4nJXB+iD1PFGyWtbiwZkoPKt+9
         3YaguGY7LERWcxKKMwdWiAAQacWr5u5MViWOxCoVap4eFAvNkdoC/sFaSBT84D79jWv6
         7Xj3Wg6iqwAygvxvgtXOgWI+XaGZiRsUOYJXweRCrIlFz77YgxCmW/VTPbYIwr6Lx2Xu
         JwLw==
X-Gm-Message-State: AOAM531AugwR+MwQkwozZQF5LOu/IMao34pGTjxZs0nD7Jb0iDtcJZbL
	v8RLmyaTm+fddFyZXFvM00OVdYuYIfQlTO5Y
X-Google-Smtp-Source: 
 ABdhPJwqANr2ZG986jZ27gbYTUBzT0iqwbfTiRizZwBZtvIKJRIjv2vLjzpM6b+bwQ7/oiSZ380WNw==
X-Received: by 2002:a05:651c:12c6:: with SMTP id
 6mr15334710lje.194.1634339048083;
        Fri, 15 Oct 2021 16:04:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 o21sm709845ljg.93.2021.10.15.16.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-cffi: update to 1.15.0
Date: Sat, 16 Oct 2021 01:04:06 +0200
Message-Id: <20211015230406.4166556-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93382

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-cffi_1.14.6.bb => python3-cffi_1.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.6.bb => python3-cffi_1.15.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb b/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
index 529d8960a..c36f23b3d 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd"
+SRC_URI[sha256sum] = "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
 
 inherit pypi setuptools3
 
-- 
2.25.1


