Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.4076.1628131679221908914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUhM+KKE;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id z3so5317936plg.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGPrLlEV7FNUGrxZR+L/+HwwhMnA5gUVHdoe0fGQ63Q=;
        b=cUhM+KKEl1UJqH0bQfjfqIEhNjRIZM6noVn5f9QAgZdyRmwDfILTATRlsC8xO8o4hS
         v+WnarCbxCAjmLHhcf+QYcO6yy/xVe/MApmxtmtQ+DnYxEbr+A7EsIublmu2l7egqXBB
         sM0bbyIHsjYSxiShxknDd/ZAcWz/E+oGX+ypktEAV+JHuRLMtACGFo+xh0pD39GsSv40
         JCh6PUdWGpQz3dbL0ax8nkTWW6Imwqe8ZJ2IykcEzfbbgEwVBxQscxyN6zXlXeTD3eqE
         ZZS5cQzl3KnDenoYWzQRtXcW3zsoJyyLjFMAYdErFCgKMtYhkK+jgTqIMzi5PekJ5Up5
         SGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGPrLlEV7FNUGrxZR+L/+HwwhMnA5gUVHdoe0fGQ63Q=;
        b=Q39sIiAg3CHYkOeg2UTMDuQ6vpak1cPoIa1y5gwJsZdYclimxOwbJghkxB7m3Xgk5W
         3tKHwEKCX+k218up77X9YT6Lz3kIiGDLzU6MUlYlDTJVxZWtjCIoJ4lMf9qAM6OZA0sG
         06tWdW++eGd8iNpuo2X1htLiMjfBNvBwYl07XSXgR5/bMFbFGHIgpG2yvL2QyjegVI5V
         qwHNPn/HNeuXNuvmMwH5f6bw/Tjf2rcwt/zh2UalHRmKHpXjJfSayUWgq7egFIH8TNjG
         fMGARNnE2UexiUQfmGzj1me2wflkh5lymVTzD8TcsrcV9qXTJT2s753XZxRLKsBy7bS4
         LtFQ==
X-Gm-Message-State: AOAM5314sGXkPEDhWlSaKFREndNLhHPs58KhX82u95N3+FQ904upg3Aj
	A7KSCc42LOFQfgU4aLkcInDddu/0gbQSbA==
X-Google-Smtp-Source: ABdhPJxC8pkQKPi8GlBvaGpAgHytvjojOxWLvG1yQPAU1M6cNn43G5hFP2OrRAY/WzTG1z1THzq5wQ==
X-Received: by 2002:a17:90a:9f91:: with SMTP id o17mr12689533pjp.29.1628131678534;
        Wed, 04 Aug 2021 19:47:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id b10sm4405722pfi.122.2021.08.04.19.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 19:47:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fvwm: Fix build time paths in target perl/python scripts
Date: Wed,  4 Aug 2021 19:47:56 -0700
Message-Id: <20210805024756.4062870-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rdeps as needed
Fixes shebang-size QA warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index 54e0a0ef4d..e0449269c0 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -82,6 +82,9 @@ do_install:append() {

     install -d -m 0755 ${D}/${datadir}/fvwm
     touch ${D}/${datadir}/fvwm/ConfigFvwmDefaults
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${bindir}/fvwm-*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${libexecdir}/fvwm/*/Fvwm*
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/fvwm-menu-desktop
 }

 # the only needed packages (note: locale packages are automatically generated
@@ -112,3 +115,7 @@ FILES:${PN}-doc = " \
 RDEPENDS:${PN} = " \
     xuser-account \
 "
+RDEPENDS:${PN}-extra += "\
+    perl \
+    python3-core \
+"
--
2.32.0
