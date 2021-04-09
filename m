Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.3682.1617934881455551521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nEuiGKWs;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so4307766otb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ysYQ9bpWFDrmmf40SBecziQBe5xUzEHkX78WcrFr5FA=;
        b=nEuiGKWscG7ExnoQeMVQU/v6cJ1jiKV2IaRFfGkH/Jhkc6SauLiLjbQv9HQ0ZHIfyp
         waQNT97t4uKseM8Rlf6KaIskyr1i5bwJQ5WhwfjwxPHIGe8X4frSttiQdr9G6rVz2mHA
         /vOM16lmSxIcyCb4TAWECxkFGW+7cIxfbRouGHlfeHO+6J0j6It7K0WOTConc1IBl7fc
         +7g63kMmTWDLc421JNBX5nwoQ46kQ7RN9O5SD2CPpRxG2q+VqSjAoufdJ+0VBHFxQkX9
         gGgF1KGZvKCCitYOWw0L2pRaN9GIf8GHlxAwWfdt1eVtP3uO/sgMnIrKGUdqwUVqoGkE
         g9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ysYQ9bpWFDrmmf40SBecziQBe5xUzEHkX78WcrFr5FA=;
        b=XI9kZcqbzf2nxSPJb+GZd2qcgfa/Vgd2zt1zxjiBmEeKXFqyqXrxydHVNgIbdrBBKD
         6/VCwq3umTeCbOoHtjMKi7Q9XKVGbZqHTpannCFXg1FDHSfQChvQD7aOkK/jSYjWVjJp
         VcmOeqvhOa8zboKm81ajT81cUUEO3ZLHTdfm2ArK31cXka5qp2384n7i9sACyh0sL3rJ
         d0yoZ73nPurMD47RWZgjnyTS9P6Bmy6naFfDWtN8/xgGkJQbSA74kxVlgg5ErvCzDUWT
         h+QJlooDEhl16A9QR2kdVJzmgds9kHMa7J5Rh8YwliV4brskKXqIuoZRXuXZQkOz32Yn
         E0+g==
X-Gm-Message-State: AOAM530dxoGcXuWNMWjrwxct8aobz4Bq+YKCnwIDa0dlpsqEYW4pRq/M
	3PsIWwTEqqXiWbk+2gUImbHBqE7bfdE=
X-Google-Smtp-Source: ABdhPJx9FvlVC9NGtvU3HD7QY5NCNDyKoSMicWUaXXMptkL1EX4CyTuC/rL+6ntfIRNXQFI70Fp5Qw==
X-Received: by 2002:a9d:7256:: with SMTP id a22mr1660658otk.221.1617934880678;
        Thu, 08 Apr 2021 19:21:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 31/36] usbredir: upgrade 0.8.0 -> 0.9.0
Date: Thu,  8 Apr 2021 19:20:44 -0700
Message-Id: <c977acfba5dcf43c0314311abdca9b157720be80.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 613729e7803c5faacc39823925e0c711d0da7682)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../spice/{usbredir_0.8.0.bb => usbredir_0.9.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.8.0.bb => usbredir_0.9.0.bb} (88%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.8.0.bb b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
similarity index 88%
rename from meta-networking/recipes-support/spice/usbredir_0.8.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.9.0.bb
index 9ee43be1ea6..079f52f99bc 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.8.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1"
 
-SRCREV = "07b98b8e71f620dfdd57e92ddef6b677b259a092"
+SRCREV = "bca484fc6f206ab9da2f73e8a0118fad45374d4e"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/usbredir \
-- 
2.17.1

