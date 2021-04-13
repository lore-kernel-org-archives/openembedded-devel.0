Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.5211.1618294464890413614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 23:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Li7BqYij;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so10175899pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGfpECKjmzYsw9NhbBCEasMLVaEoDIS8NdXhfe/h41M=;
        b=Li7BqYijgZ2JmEpfhy8WyjLtr3f+mpSLln5pMu/P111LzaGcLaUVXr9E/jd2dewl+k
         0gRlxDzTECFCKPgQg+EBqX8HgNx7ov4KSWB/59HcgVv/vqKGm7E2I3YdxvnRFZH1VUqQ
         nGKOzrU5EQfpBhoJRh7lwZgfifORs4KEOuwV9Ug3YPajFZ/Z75Gn4H3ku7FHI4/I8vlz
         22xSTgCu3JLbCjMN4Ghhj7UEETqQ6bjLfFmq1KEwBudsBOhpD8GFKtkyKJyf4b/w5blC
         yD2xheA3tYnWgMVbXb+/nYgdjB+CLm/I4v16+45CknAbZGi89xnPhhR/9C0ksS8kTqds
         XW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGfpECKjmzYsw9NhbBCEasMLVaEoDIS8NdXhfe/h41M=;
        b=dVt817ahbxy/qAuyfb8/p3dmuaAxOFMAw5r4ANkJukCvKPyFV02u2DOscqY5XzUASA
         yasTwR+YvMA14bcdxmp9YfdMKpov4v38yGMDnkXVNrTZIGlCa+o8OIgcVgcDdoz5iIK/
         X39CjCAJ3wQJeiN9lr+40KEiECLV/OX43pefJKsZgEbrf7XeCOAj3zkkRkTJCvaSDiyj
         sdTF5++nQhbUZYDrcGTc47lkFoOxq8CT+rarj6tgK3UgTYi8lm1AWtqEtrC01WVcz+Kt
         EOkMBgGsHNO7YgJFoc6uo99xb0I/QHJWIfA4AFAfajO+saG12rwjrwENcMqQJg/OYpsm
         IEmw==
X-Gm-Message-State: AOAM533vwclB9uyfI92TW0KXXTQvHXDwj2xVb+U4G/V7/psvMVA44cJ/
	CLneb5AzUzwZR2U9aPDCmrpqbqcJy4Ak3g==
X-Google-Smtp-Source: ABdhPJx8+Bp5Eybj2SSyNuIkpKqsjzFYBuQO1YK1Alu2ZQeXBNm24wvZq6HJAc40wGo65PPQTZA34A==
X-Received: by 2002:a17:902:ce88:b029:e6:3a3c:2f65 with SMTP id f8-20020a170902ce88b02900e63a3c2f65mr30206017plg.66.1618294464190;
        Mon, 12 Apr 2021 23:14:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id a9sm3429455pfo.186.2021.04.12.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:14:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kai Kang <kai.kang@windriver.com>
Subject: [meta-xfce][PATCH] core-image-minimal-xfce: Use graphical.target as default
Date: Mon, 12 Apr 2021 23:14:21 -0700
Message-Id: <20210413061421.1201530-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that nodm unit is started during boot with systemd images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
index 8009acdd9f..9d997cf57c 100644
--- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -16,3 +16,5 @@ LICENSE = "MIT"
 export IMAGE_BASENAME = "core-image-minimal-xfce"
 
 inherit core-image
+
+SYSTEMD_DEFAULT_TARGET = "graphical.target"
-- 
2.31.1

