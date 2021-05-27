Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.8115.1622127501220325031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 07:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LqxEKlxj;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so2522482pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjzT4+Nu8WLfqjciKFlX6yzE86nFEN99DxFYBAGjMJs=;
        b=LqxEKlxj3htxb4qv9H2DhP1GR8W5B9MWE5SoliliGLdObLhWqAj5lEITrgznxSxfAS
         1vGZ2hvNYjkAK4eqzultpenzQcljUqkNwgwhBiCz78EN37V+3bToQ+LkjAbVlPNIxL6M
         4DZ1BA4wYJnSHw+3b6MD4xtMWFh8bW/xKG1A5vQcigCwZljaesq1dJW3PJZpe0lYrNJw
         bQe5FLa1Mjr/7hnYC/hJgHut235kReT9eXSF2BjYnX5tkIXtpKElVVlqmhUiZexbHHXz
         KViGmnjraLqzFB8U5liZlHB63DlzwNO+vcdH/8H3f4kddxfP7+k/X0n96ID3gS/T8QLl
         t3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjzT4+Nu8WLfqjciKFlX6yzE86nFEN99DxFYBAGjMJs=;
        b=qd1UfOxB2WZ0iVN9qqbQoR9rWk98MYext0VDCjQPTGZtyOCdZOENyfprKgRtOUbPHy
         VCkIbjelFMsypUA9Hs8x4tPrXZdGOoJ+bcae+s1ScskDluhNoBTkn9BzHkAqZh3nrvEI
         Zqk7IDZGIKEKXUyKeA8lqnUXxVk3k8yA61Kn1govCPd1D6C0mvmTAB1PmeUppL22Rv0D
         Ed3bpZ6oumYJnSOELtI97tVwuedWP6e+ni1iHkeSD6qe3kQAAndtvY+K5d2p7GHMmRtm
         6g8o0b+5oCU1C400Hq4+uNYA9AoWU06CE52GObV4H6lEywju0iRzNUE0BBFUg4O67QBg
         dEqw==
X-Gm-Message-State: AOAM531Sf4JFni2nv02ebBt7JpTjF4S+5OYH8HHWtITrGeWsd0JHjgUh
	DlD0vuYYrhHN5COk4LrcIfOj8H3eyaxUSQ==
X-Google-Smtp-Source: ABdhPJxhpfEiS63bEWjPCUJ++jnqKClb1aM2zfyzinG3a/NufufTEqnNb6kt+CusYmVaWULNvSYmzA==
X-Received: by 2002:a17:90b:f95:: with SMTP id ft21mr4151073pjb.215.1622127500561;
        Thu, 27 May 2021 07:58:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id 5sm2378382pjo.17.2021.05.27.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 07:58:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Do not lock to gcc only compiler
Date: Thu, 27 May 2021 07:58:18 -0700
Message-Id: <20210527145818.390247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latest version of openCV + clang compiles fine

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 226bad5778..31dcc3c29e 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -230,5 +230,3 @@ do_install_append() {
             -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
     fi
 }
-
-TOOLCHAIN = "gcc"
-- 
2.31.1

