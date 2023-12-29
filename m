Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A3BC4725D
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.156015.1703876568146291199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SU4qXRM+;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ef7c6f4cfcso10356767b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876567; x=1704481367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdyBeuX4uoJHTJlzW46z3FwcFpLi6d/3NgxdXv5lsqA=;
        b=SU4qXRM+ZeUlILdsK7nRkKVryf1MrY4AclD1FuMm5Hg5L1hzlq+LlK7wkwPsDCk/Hx
         +QS7CEo1nx6X+zWIOh2O8pq25fqdUgrexlCB9ufzrqWCDPg8y+bxa2WtPJ+WXj4bWc/5
         4rNGla0fRAKdXzvAt53hQXuDx4sWsj/fGzBm3L2xTRYuby2UA8PvrP9IwrZDOmeF9WaR
         0DMQm4dyti9X7288BaGmV/4jwmKZ3HsSKN+9M4dNBXRPu5JmSlD/QcQNKvVe80LeejoM
         5YtYRoKpvv5BnqR5qpm6S7R/SsSdl8rfUcj+x0IxttszcOLQTYhg0tsUxWK7y8wfk2gB
         26sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876567; x=1704481367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdyBeuX4uoJHTJlzW46z3FwcFpLi6d/3NgxdXv5lsqA=;
        b=mRrTKIwRQGf92R5jaVfLbd1oXwPXTSKZHvj2NA8iLtbHR7kAEW+mYgRlQqqRPqXMsL
         sf+t79wNC4Mb5xaAOiI/wHWv5wU8GU/myHKYmbrY901dfxGklrqrIyo3uD/iMbE3gXQO
         c5BdDGI9KvyKZJRlsJgsqlONeKGZhfzfuiBajF0b2YqngmmH8CE0syG1sG5KDHOcb8L3
         9Ex96Mtpz8HM+/SGfyQGQfST1i+moEoeL65R+QIUL3T0/OY/en4OTcw3ee8wYpDKuoGM
         +t01hWO/UlRJGscNdWaMXXhLS4o85GdQBClp/5NSJgYN6GcimvfDkf1b34AzfshvVZCP
         2GUQ==
X-Gm-Message-State: AOJu0Yy1JplyU0A+z9QwjB9JD7Rp00broI8xY4L1aNGWOgeHaKRNC/PT
	zWh/nM6511YbWezgxObTSvDhRbz1OIRPMA==
X-Google-Smtp-Source: AGHT+IE5y/juYd7zhn+6GadU1SuPD5VrI+gedUNKnR+XlBiLZlr/k6wCYZbGcRq0JP3gos1/LaFzdg==
X-Received: by 2002:a81:6909:0:b0:5d8:2fc8:cc9c with SMTP id e9-20020a816909000000b005d82fc8cc9cmr7847110ywc.37.1703876566954;
        Fri, 29 Dec 2023 11:02:46 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeffrey Pautler <jeffrey.pautler@ni.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 14/17] apache2: add vendor to product name used for CVE checking
Date: Fri, 29 Dec 2023 14:02:27 -0500
Message-Id: <20231229190230.135480-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107896

From: Jeffrey Pautler <jeffrey.pautler@ni.com>

This recipe sets the product name used for CVE checking to
"http_server". However, the cve-check logic matches that name to all
products in the CVE database regardless of vendor. Currently, it is
matching to products from vendors other than apache. As a result,
CVE checking incorrectly reports CVEs for those vendors' products for
this package.

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51f70eaaa5973e385645f574093ee860f5648f88)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index 00f8aaa415..bbc1c6c48a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -36,7 +36,7 @@ inherit autotools update-rc.d pkgconfig systemd update-alternatives
 
 DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
-CVE_PRODUCT = "http_server"
+CVE_PRODUCT = "apache:http_server"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.34.1


