Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.20902.1612709170920103983
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 06:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I+4IJM+Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j11so10329273wmi.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 06:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWpgalNEemBV+f5iykqoTYAG/Vj6vOsIgN01p01cx1A=;
        b=I+4IJM+YQNTk/MUcj9rfDOqZHLPplZfWUqJ7nfVNNhQcLQTHjgCwum3NuI4z0WG8sT
         ZdgSn2ufnnKToFPgSjSw/FbcIu9X3EGFI+1oTI72+RK7Qxcwv66GuXP1VJFB27TRsn53
         CqXTX/gbpiBo2LsEL+Mrr3VBJfUG1BHBr8ewbSWuMKQymJ5gTKu2PeP9TeiO03U7JI1s
         M4SchYecrlcsArLPH6+x9H+69+AwiblVSK5bb58FkiX9uNPvPqLbQMdFnZ+6EP8qizlz
         m6oQcTmRPL1sSwYjR8H1f4dzNgi88d1isgKiyEpU/YyT6ROTGTIoy0NBrFJAl1GWoJ0a
         xcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWpgalNEemBV+f5iykqoTYAG/Vj6vOsIgN01p01cx1A=;
        b=iv3wS0G0YW23X0kZW1k1hn1kN2cURfULuRY7VLIxGSRXgRQthqLTyFZ5pb7mUp2q9u
         YGhTCcvBARX458cfjymRkwKl9bxHa43Jgk8bgtGa6T2wDie1thimYqECU7A2IBlSSyt0
         g8+M3hrcq3lmmVB6CSp5Jj2gtO7ggk2EGdj2SltNlnMQ2lAgv31T6jzPkW1iUJrUjhGc
         JHu4JXmeubgDh8Wlla4VIbDIxJc194H25N73YRD7IQz3uGc3ti/1OS0WqTWSgo1gnbOx
         uiivu59LIkotlVUzycDDw+vq7SP3hRRXNgAHzD4WFHiBxq2/X0xPP7Zv740s0AJFSkNW
         yGXA==
X-Gm-Message-State: AOAM533Yi1+uaP0e2ulJwUMP4M5IYpxNU/Mb++qRAV9loLMd7LfVzh9B
	UET4zypq1+rkol5fdZtG71guvqNHHc0INw==
X-Google-Smtp-Source: ABdhPJysFOqfBeaPgK5FFG5E4CtFlnQaf4li2TxJwIMJmTzCxq2+drWeGtLKVmJWJA81SqDF/rThww==
X-Received: by 2002:a1c:b156:: with SMTP id a83mr2861121wmf.11.1612709169226;
        Sun, 07 Feb 2021 06:46:09 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f6sm14831018wmq.33.2021.02.07.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 06:46:08 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] graphviz: drop unused SRCREV and outdated comment
Date: Sun,  7 Feb 2021 15:46:04 +0100
Message-Id: <20210207144605.3784078-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the SRCREV isn't used as we don't use git fetcher here and comment
  doesn't make sense anymore as we're fetching versioned tarball now after:

  commit 985be3901e79c9e45cd5d23774e3cfdaab476b44
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Mon Nov 2 18:33:34 2020 -0800

    graphviz: Upgrade to 2.44.1 release

    - Refresh patches to apply on new sources
    - Switch away from gitlab archives
    - Bypass pdf documentation generation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
index bc46a11d3a..8fe837b75c 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -20,13 +20,6 @@ DEPENDS_append_class-nativesdk = " ${BPN}-native"
 
 inherit autotools-brokensep pkgconfig gettext
 
-# The source tarball suggested at
-# https://graphviz.gitlab.io/_pages/Download/Download_source.html has no
-# version in its name. So once graphviz is updgraded, only first time users will
-# get checksum errors. Fedora people seem to expect same so they use a versioned
-# source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
-
-SRCREV = "771bc4dbff3e6f358fa75cdc7774a413ccacad51"
 SRC_URI = "https://www2.graphviz.org/Packages/stable/portable_source/${BP}.tar.gz \
            file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
 "
-- 
2.27.0

