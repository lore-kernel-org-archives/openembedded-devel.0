Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153B9C369A2
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 03:31:55 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.3812.1744428706472704013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 20:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEAJ8wy5;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ff0c9d1761so25347007b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 20:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744428705; x=1745033505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mS9hyZ1qm01jH5CUCVcl5i3sGwJ5qnu7mt3UZD6APBo=;
        b=OEAJ8wy53UgHPUWsKBfV8cQyEI6XSQtrFj5hfdswg9ShK6VnatcYXKjoVnWe86xaeb
         d2Ycum8TD4S5E0mVAK1MPKzss0YIKeXQafbbrKheWKoVOAY/N21ZYshjrASjuARfBK6k
         MLbL6rOGwGOHI+5kIwhMBNNRqfUnoITok/gfmxwpoSO/GFB6q2eYobapJIQ5+qO5sOQO
         Ov/+Xk3R/YkAzPZ+9/crO42SUP0SE+cYVe36I9NdJSGu9jcsAuejdFRCKCXlkQb5tlEh
         59GIEW9h/hIpXJNnhSUfHjl98nwGP1DISF6FukFUfGVr8NTUlADJ5Up+DwUWNY94NAAq
         JL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744428705; x=1745033505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mS9hyZ1qm01jH5CUCVcl5i3sGwJ5qnu7mt3UZD6APBo=;
        b=GRFwvSjABedRxQ0kN1a0RdYKOpXVY+tul34koxIsUeybpBNzy1EEPjytDKGjho8L6d
         /QElWQpxgAxzO8TT0JfcGMSVJlMrjRXZ3rWKODU37KAmoDbIMedhcSpBNq9/1doLmLpk
         W4i4sN6xrS+qHhw2ih1eMimS7CAo4rdJlFfPnHt79i5IW+bRoF1xuzF8L7P655uQHfVK
         1rBbwx19wstfNqH+BHItFibxuBnoK0p7bwsB3RHrsYnlgTz7WksWmIh+AsSMKb4NQXG0
         UbnCPrL0iSANwile4fC2dN3JNe3KFIg4bARGqLrhaFHQESzPbnMM6onNhVZ77IILWKLQ
         qXeQ==
X-Gm-Message-State: AOJu0Yx2DykuG9LQiqEFiuNIwDEYi5wCm1NYsJpZ0jC8Eu8lkcy3Pl0Y
	phXxGX6fTiVvPLt9wuuuQB1Nq2Ijd5JuCDsdKM/o30Bpk+K6tt09zZnKu72D
X-Gm-Gg: ASbGncsqZmYyasckndTvf8vCjRqD0sjey4QnPepPVddeo4ow4da5UUtUmJoSLEUhjNW
	hbnfIQv2mNQQ4gadp6zzmkEJqFwx7rkch57xik9r0bwJeOFnQ+UtkqWhX2ooa1DRjyEttOLnvD5
	MBfbMGGQapigTUuB9J3CnyvA6z7vJZD3jPU9atTKn0qFYpPHNq8IXSaGiHelV1dWenKJz8Uli4s
	JgonsRLpjKVy3cU+Rp//ORpyCrmVANzLBdHBJ9df1HiS24OLXY2l0W0QDZq0MMsTJnZA7Sq+N9j
	1ulPINCfLy9yIJUfTsr225Oh/HyO96XN+LG+WvDo79AIEg==
X-Google-Smtp-Source: AGHT+IG3r6IK0lrO6rZEgn5EXwZaNpwMVxIneGipWsMZHyYf7LQzu2fY0wkCAwRWZ7ba2rLEXerNOQ==
X-Received: by 2002:a05:690c:6213:b0:703:ac44:d367 with SMTP id 00721157ae682-7055998eae0mr86818957b3.6.1744428704929;
        Fri, 11 Apr 2025 20:31:44 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e39d376sm18059267b3.113.2025.04.11.20.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 20:31:44 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.1 -> 1.34.2
Date: Fri, 11 Apr 2025 23:31:29 -0400
Message-ID: <20250412033129.14750-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 03:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116804

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.2

This release contains a fix for downstream packages detecting the c-ares
version based on the contents of the header file rather than the
distributed pkgconf or cmake files.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.1.bb => c-ares_1.34.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.1.bb => c-ares_1.34.2.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
index 877e29d9f2..21a0e37e6c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "7e846f1742ab5998aced36d170408557de5292b92ec404fb0f7422f946d60103"
+SRC_URI[sha256sum] = "35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


