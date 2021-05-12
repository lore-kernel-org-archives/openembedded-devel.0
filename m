Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.4468.1620811869627157835
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 02:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSQgyB2d;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id t4so34053666ejo.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wXy0guXnL4MN74ToPPqfciCcPpnYlVvSmRbdOOtx2I=;
        b=eSQgyB2dkjMINK9bqNZBxy5Liv494ISa3DFkBugyBK33KxLKsa9SAQmKldPYqtnrJ7
         UF3sFbCO/xihI8yQTC9y4KXA4DGUDRz2zlBWpdg92AUg8x7EhRqcp9HBN6qB3kjsSwpa
         29HIZnAuKsuW6dF23tctkjeIHpyzx1lUbOZgG6ko+emLNxC1ILMxbBUA8uCzSZNeagGb
         1mfhgMUJIJwITuC+IoslSszL2rjNjiA5XLdGaGLx5Sk/ebbuwtjyAj1n24kTbM20yD3F
         nACVQRLjrnZEOeXPoBRcRGXF0RqZVmRE5CSdq9BHHtFBN8+U/i9kXk6QEdagof2kRwAS
         cTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wXy0guXnL4MN74ToPPqfciCcPpnYlVvSmRbdOOtx2I=;
        b=mT/coRag3ZkEKCi0PuNOtUrtMUg+fE+bQItnK+mxl3w7ZQmhT3dyMoVcji/fXc9yRM
         Xa6i3zxAkBo+UQDJb0RqW/5LaxtQFDU04NrsgNcwSdMf71kukXEq2tz40kSmT+fEsuNB
         4yenRzRp2ezGIBECloMw8wAW24Qyw6mK79UNLo9Ex0kPEvqHlRBoQ8WG0emCRgMcVR+v
         K+zX61VrdjljBGuFI96FweXf8TDsLXO63m105z6T2BsxUIWHtsj7d4ON4EEkv3UlgTk3
         AcklAVPdd1bbcGBQ0wg5gM5++YeWTuR1G19/rdmsPwZ3FAnSPmP3vo8/2R8K6SxQbfZl
         M8rw==
X-Gm-Message-State: AOAM533DruJ+kaaSpgjh0XDpDlfkHSCmc7cI80UUcUFUbJmNUIdbHF1e
	3CuOkuBnP0mkt2L3TvFoG8+lTVkz/hM=
X-Google-Smtp-Source: ABdhPJymr1EqtarcODUcjj61r/MU08nBj/eKMASt31nXcT7OgmKfwwPnKtPmT7p4j9N1+6ufjJoe+A==
X-Received: by 2002:a17:907:7216:: with SMTP id dr22mr36779396ejc.185.1620811868263;
        Wed, 12 May 2021 02:31:08 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g16sm5913168ejw.42.2021.05.12.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:31:07 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][PATCH] ostree: switch from default master branch to main to fix do_fetch failure
Date: Wed, 12 May 2021 11:31:05 +0200
Message-Id: <20210512093105.48339-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* branch was renamed in upstream repo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2021.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.1.bb b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
index c382ad87f2..32aa842ff3 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 PREMIRRORS = ""
 
 SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree \
+    gitsm://github.com/ostreedev/ostree;branch=main \
     file://run-ptest \
 "
 SRCREV = "e9e4b9112083228b8c385ad26924b6c4623f4179"
-- 
2.30.2

