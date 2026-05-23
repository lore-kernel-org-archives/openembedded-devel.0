Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD833CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 03:47:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2371.1779508054736772989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 20:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o9nivwMV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba17c8cfacso81457795ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779508054; x=1780112854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGLOktOxHvpncSWd6uQSU/Wn9XkDecvhUyfNOyXoGHI=;
        b=o9nivwMVH76egzazMS7vaQLq1fiEvvXlMX0TvMImtlthTpuqFHgeL2Zau4jgq0Xj0O
         yrEbE9k3R/mLqRSUluYIG4ZYPEu93r8pmTo2PkxbVmVVVfQVnb5BMYbcggQeB26vKcuz
         AxJPD09Kf4vpsBbZgh1olwdEo1QbdtfHmLSvJbf8x5RLsHeLEioDA9YxvH5TcGuEvZHz
         dibh7pvMb3w/cIPWp6KFpXM3PoxWrRlawjBCZ/wxOGDp9HDy1nxvt8VsraVXAeGZyLez
         8L2K50249XvyTIejpnDtMd499Qqa6VFx7zdT1B2FckqQb9Sik1PM7qsuSHTx5+cy8jJK
         fR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779508054; x=1780112854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGLOktOxHvpncSWd6uQSU/Wn9XkDecvhUyfNOyXoGHI=;
        b=nkpp7Wjui9UYve/IYcA3QeePUeKiMuBAtiM4oeWQpfSEXuXhnYmJlsoAa/+w7QM030
         rCZQ7hysn/7ePSlkrkqGN1n+igw6nmK6QiBHZlM1EtSE7epKpeVkwqD1b5scASMo5kQQ
         1RbX6FGiGOHi+1oREX4I1sEPRh5rzw2GNLiwR2W1GsOYS8IT3d0fV01U/rnQjhEUyYAX
         dRzmf2ICg1IQHclOGSDeidvoKQJSNkwtQaBhxSM4e4d1frUBbXHUsHueQGIT9Ny/0jkf
         ZxPDZmLpqcgQ4pAY1aqguMVwz3WdKOTKUe8R7xS9JbZvTu3vCz3GXqhnT3NEo57O12fb
         /ZmQ==
X-Gm-Message-State: AOJu0YyiWKLfCCfxi3XUXgSJMYTJSXDGAr/aXLUs1Ujk7tI26pM/6cAO
	r0NpAgnjs9Zj+1ClfuQQnvSETrEih6cJ6DetNqnBxVkaJsRBdCGMYSk/LyqfmNoI
X-Gm-Gg: Acq92OHTiLArgKVjV66DiKB1JsopAEQUTQpRcZyaZ99m2IEcDM+1wS+Y07YYZqkgiHa
	BJOp3BIMgBMQR9QpxZIkQqm09g/zVAG1lfsZeI/nIkTWUFX9/UKwk6mvcbYfOK+foBCeOpo8ey0
	8FXp855tfzneisWAcgL1t/2ErtWUog8ogXC5hn52Mw8IRq9xTQmmLR8xUyZPOBHo97NcsTHBO1Z
	zWu6K5HYkpaIw8En0SzoFkoWcNQoin8+mPkJIcQzZ/sZ2Ey2pqZqqIP7O7lXDcXAjrh1dOibiNX
	/FrRM7Ylvo0vWrpQo029I1fwGcAPaTjrY5lrCI5KnekFzxYxjKzl2yD+5TCimBMQVAdZcHnDz0y
	fg8UbknuDNx2szT7qTa4d6sHcjHfjSyBdTRs7HKiRk2r24SMPrhjtYSP3ZOU+qpC6x60zq1VWtc
	HTfWr8JD6VecGKXYDYmA5Cn77+Jq47YjY8/lT4
X-Received: by 2002:a17:902:f544:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2beb05da027mr67935705ad.24.1779508053963;
        Fri, 22 May 2026 20:47:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b83sm28592835ad.9.2026.05.22.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 20:47:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 2/2] nginx: upgrade 1.30.1 -> 1.30.2
Date: Sat, 23 May 2026 15:47:21 +1200
Message-ID: <20260523034721.256262-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523034721.256262-1-ankur.tyagi85@gmail.com>
References: <20260523034721.256262-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 03:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127150

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changes with nginx 1.30.2

*) Security: a heap memory buffer overflow might occur in a worker
   process when using a configuration with overlapping captures in
   ngx_http_rewrite_module, potentially resulting in arbitrary code
   execution (CVE-2026-9256).

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.1.bb => nginx_1.30.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.1.bb => nginx_1.30.2.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb
index f774979f89..2ccc7226a4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "99765000d974896b31ca5882d8c279ce3fe7ef6f5c6f9f0a967ed7fd3407f9cc"
+SRC_URI[sha256sum] = "7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c"
 

