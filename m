Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.8250.1625150725955513519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 07:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/IIYt+v;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id pf4-20020a17090b1d84b029016f6699c3f2so7095905pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUUoNzmLZE0ktJcR8kLdl/ulKaSURYATGrzs7/IoglY=;
        b=p/IIYt+vI3j+v0f3xT0A824H+9bDuwDMrJSY5Z8Q5t0hTuPCh4snyEYFKrC4FeEgE5
         8wRlDQOIAcyLLfi51dtw4gXQaOOuzVp2Nh8wtooS3aikoQcyBHFrwLWQOvd7SAKn73C/
         2ARtXZajGz9+okzMEL2eipPcMmNqVKecaHPk2+j5E0cy+o4Bg8UMPzsJlQ5kDafeZmSr
         XGXS5Dk48MeXZ3huoMHQtfPsXKb//xO2BR3RBUSJorJ7i067ZI74EBnjmXxu9aaB01f+
         qGc7PrOfqqyY8tmTnY+9hcssE43HGmw0n/FkQFSEgM6dMgpIH6Ygii9iDXNcNfdwvgTc
         OPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUUoNzmLZE0ktJcR8kLdl/ulKaSURYATGrzs7/IoglY=;
        b=nn9Nia8jzqVXKlvdQzz4KpHMI6wqLvjaHNfxjb2D6e84EnpdkQZ9mZ4jGnK+MuODAw
         SHM3zXMyO6VqyJR0kTFnIJZE6YsLpqcx+qyirZSd6cVAcdZilE1Zkz/bapzKdIDQ92o9
         pFijBCMfdteP3geB4AyI4jr0mgTP3gv/Y4slMSdUGzurgRIzZ0nTgYlJ00NCFYFJjWrv
         KI3xsOg3vK/Pi+Qp/GHBvVMP86jLQi9bYEoPop7kIB1pts6O6OOCg33T66STfJvDb6pm
         O95y63jR4dPnKHqtzuUZzphNRBXyfjU4N6Gl7kUJDnc27WyHdxrs7MRguDGfEXjH67G/
         LtNg==
X-Gm-Message-State: AOAM532x7z3yv81lh6GjS3szvJ1nHPjsh29sCgxCn0Zj8oPzqX1tEiZS
	Qc3je2uGNjCjQvRUZ5ecSnm34/C+FN2lUQ==
X-Google-Smtp-Source: ABdhPJx+akvmEVvdz4VJ6XfHEDmTo6lDMvjXBj2Mi8awmx/stjyTwnGElvXPCfdt/Dv7mZU5xUy5pg==
X-Received: by 2002:a17:902:f688:b029:128:e3ab:a868 with SMTP id l8-20020a170902f688b0290128e3aba868mr18250985plg.67.1625150725041;
        Thu, 01 Jul 2021 07:45:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id l7sm93661pgb.19.2021.07.01.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:45:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] imlib2: Use propert git SHA in SRCREV
Date: Thu,  1 Jul 2021 07:45:22 -0700
Message-Id: <20210701144522.4116124-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using tags still results in bitbake enquiring the repo upstream for
updates, since tags can move so it has to check this rightly and it
behaves like AUTOREV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index b44b03ce8e..085aaae128 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
 PV = "1.7.1"
-SRCREV = "v1.7.1"
+SRCREV = "01424487e360383a039dc123bc2a345fe7ea2535"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.32.0

