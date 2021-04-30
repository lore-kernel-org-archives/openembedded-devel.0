Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.6128.1619747763964941788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 18:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVKw8YBC;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id u21-20020a0568301195b02902a2119f7613so16261754otq.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=DVKw8YBCHN2yKN/G3ETqVd8hyPe22khLD2VCMJs/AuB3rLM4XEdr9pB8ogQQMBQmz1
         EeS7N29NiEMLMYtPqtUvBWOgUTbTnjSONjotl1hwzhldM7fF/leyasIwGDJXaIaHx7JP
         op3OI+Kq71B6b6uyVdLB2Bpgarva2AI4pakNuZ4kIqWuuDrpNpev38ps9IPSi790wPdQ
         C+j8sEJYQZo2VneGLAKmzbskvsW/SNNxS9EiUEvYsMEDvHOnLCeohCMCg7rMlXUk/R9h
         pKe+OGGAf7t54vq+QzhaaGiHJrlCWLpALdte8+ZsIBzSlIi1dp5WW+kjDpE4pBR3MrMC
         nXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=aUAOXXdCHjJw1O9W52lVibWv0xw165b/JQKa1QXKM3rEY448MYB1hTZHYJtYmKvmuq
         VNnJAaJxHoi48XlvBiNyQpUCIbucJj6z4gmZDYKTmPc5P2gk4YR2ShZYnrZ8J8dyxsxc
         RG3xPO2DC4nIittpuwmQF/TF9YjfzQuXFIk5JdN2xDkTs0mYfDEPqvGnaMZvncE/95Ha
         6fgHCglBPPQyyJ5/s3hXUaCCDTtruHRuJebdd+SXQ+2H4aieoAMBSVndPm/ycN/0ekwk
         W941kIPfvzVCqTgtz2cNLZ6A4dVDUqpNckxmsZtaW3M7ezhGNMxXOQzOXwDGeEs4NAnj
         33/Q==
X-Gm-Message-State: AOAM5303hO2gBe/S4YfvWUm3/jZQzTrQa2mP8ZHKXnKhwB2X/FCYzXQK
	7NgYpn+Jd0Q+CJyMsRpu+pnPss0FORzbHg==
X-Google-Smtp-Source: ABdhPJxbhOZLGwnIM/JfGsYuGBoFHvtBti7vt7xZs5isH1BLY6QQTYeqChtLXNAT6HCh1sGgUroSxQ==
X-Received: by 2002:a9d:2230:: with SMTP id o45mr1880242ota.104.1619747763073;
        Thu, 29 Apr 2021 18:56:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:a862:d97f:9823:714e])
        by smtp.gmail.com with ESMTPSA id q10sm364799ooo.34.2021.04.29.18.56.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 18:56:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] packagegroup-meta-webserver: remove nostromo from pkg grp
Date: Thu, 29 Apr 2021 18:56:01 -0700
Message-Id: <20210430015601.31140-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index 2fa5bc4a93..ec3334d8f0 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -26,7 +26,6 @@ RDEPENDS_packagegroup-meta-webserver-http = "\
     monkey \
     nginx \
     nginx \
-    nostromo \
     sthttpd \
 "
 
-- 
2.17.1

