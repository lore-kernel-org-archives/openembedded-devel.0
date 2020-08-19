Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.86104.1597834837417311052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 04:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Topcpbhl;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 3so1730436wmi.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CZBGx/MEQoN6v7rmQhzjhOQ85UGl0Lbq7h9G4EXt1iY=;
        b=Topcpbhl4Rh869zD+0kSfGwQr/na3nMbPNGq6UIB3tHznc0yFfgbU1rlsYvM6rZvBN
         LtIY9/G1PJMhtdQfGAG7XmREZWijH9RiTMP93Dgl/8C7X38J7OD0gG1nscdDlFGfERv0
         T8xaMCynbnpeoIZAVpgqQAfOy7H1NMBGjExMuFrQF7UWlhBlMCf4oAI3arV1dYdBWVCQ
         hES4/f0Lwmql1WTBLrf1hYW4eVyTXDXKB2rWPfz+XM2xt7abkMPouYZhb2VxzOXvmAJx
         yWC990pFWDVuSMI/eMgvwmhGzInstIModFh9oBVVKpjwLFKHhDDDTYBgaRz5vdnzuAM7
         3mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CZBGx/MEQoN6v7rmQhzjhOQ85UGl0Lbq7h9G4EXt1iY=;
        b=QVCq3c32x+ucWASeGNFYqRbNKdjgpg18283qBduCqRZZ9JWuo/0/QafLTY3GfXSyIh
         aj4MHTHXNzwSsZ6j2HIVvGibuMdQ/8bBjHbjE9c5y0XChUQyrR0n6JDaD3IqCkTi2JhQ
         QWsO0jrY+0ml5VLFxUYx6GZ1eJMhAxfhapIFa4RMm3vEEKMjz2bMLdiIrvy1WlEwhdAE
         93nrSr3lMiME618dV1NOHP4UZkRaayIfLGRMz8R5QKDoN2wCyziJfuozKXvDSg6dHyio
         F3+pkPMv03EBUBBk9PoRmFDGsGMLNlzBB+eIdUv9BBpvUfjczCecqiMFHZfzgDoRrROD
         trQw==
X-Gm-Message-State: AOAM533yRD/3khcQcRl5Ts39LMu4YNemKNKSKDHfuxXZr+kqRLW8Ih3K
	iKCV652bIBiCSogXfs70vUGORg8GiqM=
X-Google-Smtp-Source: ABdhPJwv+v5btrcTvFNXw2TN5cly69Y42g2qvDxiA/42Sjg3zk82vZSv34KHX+/SksqwgZwKrhfKCw==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4240963wmh.96.1597834835444;
        Wed, 19 Aug 2020 04:00:35 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id z15sm40906148wrn.89.2020.08.19.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 04:00:34 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: upgrade 2020.4 -> 2020.5
Date: Wed, 19 Aug 2020 11:59:26 +0100
Message-Id: <20200819105926.6791-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../ostree/{ostree_2020.4.bb => ostree_2020.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.4.bb => ostree_2020.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.4.bb b/meta-oe/recipes-extended/ostree/ostree_2020.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.5.bb
index 559aa0ffdf07..7527298c248f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.5.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "901747f98561cbeedb2ed150793d9b8f94451f20"
+SRCREV = "63797cb750b4b2a05c5143613d89de9df99df9df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1

