Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.43711.1589813415200542312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TcMvDc0F;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id z1so5079234pfn.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DtZov9DSe05IO3nz8bAwMK8KaU+gwuSVqorjsa4NgSE=;
        b=TcMvDc0F7sXnAPLKMQgimiJk0Q1dQ2SJc5LccqmKRgS1/iOuwIWIDlhpKtiJuVDE9M
         Rmsck6eqxsEOPQ/MKA8PrapNBiR4yPGqvhhs+WDaubuve/pqu4zJxH2WsnIVfGIttEHf
         3R4kZRw0rKKk6PI+8wJCKxBOWVzQPzoEjKagLF9ulvq0eW7/TlqAdl4Tsh/8bSbPSAyV
         D7lCDfCOeUiQLApZxcUb/Pexr8uKtn/LWq4z8kIELwYn0fGdjHVVmFv8skQb3jI+XVJb
         CZBKxBolCAiQbDtjwahwpkrkhXbzx6X5eagIRXxdM7V1jnxpzvQ66I1aOnRVCeWbM2BD
         Bpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DtZov9DSe05IO3nz8bAwMK8KaU+gwuSVqorjsa4NgSE=;
        b=Ke0eLV04RUHXTN/Gp71BI5sqDl6y1digmpAxM1I6ex3fK46LWYI8ifZz1B7Tl39bEc
         acIsFKqzi93W6iP3RbzYiS/IMocTFyNuLUrkKqau4Mj9CDDmVZzozGDNtQpmTs0Rjdeq
         dywFAXh6zVwbdivEz7NUsRhsVqQ0zFjNoOPRhDW4fyKK7Fd15ZcwfXBu0S5abZbcPLW+
         1fSN1edemF5Ct9WpGcza1Q99MToPW4dQvdMATpixPed8UvL3KYBSCxj6/S5sJujmyRiw
         z/U9mUUPPIzk4Zxm+9FVxSx7r6YZzJplmjT3cG/JSDDq4aXqh5AqhVpjEFPXI7pA+0sK
         RW+w==
X-Gm-Message-State: AOAM533DE9SDvNdSbViyN25t5VEV9PZ1RYrV9Xecz6aBy9B5ToXpzBrs
	uex5V4Z8BinwVYkFhvdxh3Fik5kt
X-Google-Smtp-Source: ABdhPJw1U7WxMncAgU3wDdO4L2skKmGTGZFNsPLmHbDZ+TFm/WjSsD9ngz38Q7KovpDvZ9aBe3peSg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr15546412pgb.252.1589813414563;
        Mon, 18 May 2020 07:50:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:14 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/57] python3-pkgconfig: add missing rdepends
Date: Mon, 18 May 2020 07:49:13 -0700
Message-Id: <4ccf941dd26e15fa97524c5f13f9a00963e16985.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pkgconfig
 [snip]
 ModuleNotFoundError: No module named 'shlex'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 47b063d1da919ca022cf76b721959cfa82f1b876)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
index 92eb8bfb55..fc7a47a43d 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/matze/pkgconfig.git"
 SRCREV ?= "8af0102346847e8873af8e76ab3f34ba9da806e2"
 
 RDEPENDS_${PN} = "pkgconfig \
+                 ${PYTHON_PN}-shell \
                  "
 
 inherit setuptools3
-- 
2.17.1

