Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FD4CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:43:21 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8516.1778226197511993328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 00:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rw9C7ctW;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a7109f568so17584277b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226196; x=1778830996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WaSwbZu30PdXSIJLDv38/JN/k8LDbSHYpEd0col/LE=;
        b=rw9C7ctWteGYiowYzLi3xhJOYrL9BYjhqWzE+o0ch5NGUbPU2qcIbVRMWsrcq1WAj5
         B9iYTFQHcAsE9WIP0D1maeto1wNJZgOo7sY8AzR+/XQez0SPQcRLcbrnRKqO9Zt4KSzH
         lkkGjMa1PTC7b7AqL1DG6x8baVFN2aUi2+ZLs4D7OKjKrLe2vwQliBC/e1rh2/m//lxJ
         Gmp76p5c3GZ42gr5cIdsz8CBlzjOdfkwMF1dr9csmHTvrtH/NHOEBhnjNJjjoqvsFQWV
         VoBWBHlPGkM4AuATDpmODjcRk1iC2TglnGviX9D0s7opHD/WpWjtt5GiMCGLuKW1tYg6
         oKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226196; x=1778830996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WaSwbZu30PdXSIJLDv38/JN/k8LDbSHYpEd0col/LE=;
        b=FOPVR4Jwr6fDlTtSpd3zudQBx1kmZhJ+3P03vmz6+qPzM+8q3Xh1aIFa4q7tFCmhLY
         XVx429sW7xPNYfDlHJVAtNjeBYjGxw8JQ61Sz2/rgH1PcHFLbHPuM1XzsvVtElnWX6/e
         rPwM1VDTNdKcZA/bIjkSxIUQPX4+Q+YtLwExNOFCgoXKgWZOkLC+ugCHe/VGosSlUX3L
         v4La4nnQ2t/U2SGPP4fipu1O9Z2xntceTTgFUA5kuMLRt95aPuUD1y4pW+NxKcZfBvt3
         ENwNg8oU6I6rFFhICQG8tgB5lDzKCmgPw/qXWDTtwTT+Da6V/weR5wYE7ma5g/zix7Kx
         bczg==
X-Gm-Message-State: AOJu0YxOdVQavB8X3HioYV3U7nKWCpMsPxfvb7uJxx5OcYQdFK8FpfIg
	QIHvb+D4Zl9ZyOHEBusf4rub/dbHag6O9XMOGmCJazDXf9I1/kxWevhZEd+fk+eY
X-Gm-Gg: Acq92OEWIQK+Hry4MQ0+IvsN8pWf1TfbkpV9rUAOaJ/6hJGcsJTDa6i8qbfNwqzzj2+
	UEl5lw7dxCAFaKf6zSRRTouzjpIbXLkM9CAXlsBi2v3tuOGqXi/ge9ntk1jUP4+hhSe/R0n5fhW
	w3hnJeuUUUBGFFVWd83Ry1r61x6upNvClB35IcmPh/gXyV2IGrnQBMrWkeUdEemuz7FqmUzrpi0
	vEOjgKSOqDlfyCHerlqh6vNrUGqtOkmgL0vh2ek2xgIkZXV8nzTGqIodFDjAuFLm81CLtrfSb2i
	46r8xIF69OXIbuU8+erefFBELekLNbC9iSvAGa2b95PFooC5MnyNWo7RHdQJRtmc6UNdwLVmaqN
	WrBFKPJL+wFUFw2vh/Dol3dyBYSr8qsQmYTS95+WP3z2/pyObYgOp3J4uOq9RqY8CLrtyAZiW5Z
	PGmyiiMo+RZV2udpdvoatgiEtUnZkNC1Hml9dJb0Oe+3Zbd1qUU/rsToJ1lC29WNO8aoOWPhEIz
	BWK8Ilqon7FdVLI9iIhLv74XzqxwNUzDoQG
X-Received: by 2002:a05:690c:e34c:b0:7bd:6129:f254 with SMTP id 00721157ae682-7bdf5d8bc59mr125919287b3.10.1778226196264;
        Fri, 08 May 2026 00:43:16 -0700 (PDT)
Received: from testing.. ([50.219.35.228])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d96a57621sm444388d50.8.2026.05.08.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:43:15 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2] php: upgrade 8.2.30 -> 8.2.31
Date: Fri,  8 May 2026 03:42:49 -0400
Message-ID: <20260508074249.2676058-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 07:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126824

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.2.31

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.30.bb => php_8.2.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.30.bb => php_8.2.31.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.30.bb b/meta-oe/recipes-devtools/php/php_8.2.31.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.30.bb
rename to meta-oe/recipes-devtools/php/php_8.2.31.bb
index 13403855d7..e4965bde2f 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.30.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.31.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "104820b6c8fc959dde4b3342135f42bdabf246e86918a16381a17d8447c866fa"
+SRC_URI[sha256sum] = "948183fa04cf261c9b9363c02f428977b9ddf8c0bfdff8e8e1fba816ed570803"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


