Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1716.1617726785900040942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 09:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b1CN2R5m;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l4so22921011ejc.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMh9z/7qxnOdCGGnQzGKoB8ZRardRBJlomX/S0LjwY8=;
        b=b1CN2R5mVnLeocmKBi0bbKFdnXf4jUpKFYcW3o0SxCDBnAnoKmRTKVwKUEm1fCFGnD
         2WJk3+MC2488q4Xd4DqZw5i5cozg6+KioKwKue+BUJYuDJCnlPnwZVi9hot5sz18FNP/
         LFCxfQRd5dLJGmKdtwtQvIG3Zw8ac4kgWtj6yzDwV4Tu9ubya3qBvKs+mR4PKxKxRJAZ
         eBSGi030YUjM2M8qkbNvp11h6n56UcahyzP36P+FUaEJ4Bcm06gU3py3mDZMr1KspCqR
         hJweyO/gwHvJM0HjhLLIisgJ2agT+dpeIErAgpTR+wAg752peNnR4etPvdZNdzIYzhkY
         xjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NMh9z/7qxnOdCGGnQzGKoB8ZRardRBJlomX/S0LjwY8=;
        b=p2fnh+vGDUNAhASGNTBkz9ijm7QM/7mnTmcuDm41Ad1O1xRU+TeF+llTDMBgKNByR3
         Bv8agli4DT7k2A10yCbWVMhnfadP+ltlL6utjCsIN36HQftKWP7TE+RmJLHchgI4MTLN
         JbyyvcQS6o3n4ZsEr2RLnVZGdvpoTiTAvNuRePP0GwTExF5fRK8b5P2o6YlNCpY+c2cW
         Pp47P38PUsCud5j6SGHl0MVySWTAopAHGur+gtuhqKzcFpLWTXG+qlrgh4JbBbH3jHx8
         qN39mxwBVdB2uedcDKXUYKMjlXKE723zex0VEv5OQymAzvtzFC9BPMLFoxXv1oKTc8Bh
         S12Q==
X-Gm-Message-State: AOAM5312ZHlV8hntHgO5Lck60Jga6Wt1J0OkP/+Cum7bY52+fPoEcUjm
	4ocssT/VLYpWGn/7DNIanfcVR+Z6LbU=
X-Google-Smtp-Source: ABdhPJzzUSAJ3UvlGHMz62UsIL6igRNV4M/ufjzgGr8R0DCEogLXN5mXoLikoH01diyFhiH/s93t9w==
X-Received: by 2002:a17:906:5248:: with SMTP id y8mr34337897ejm.150.1617726784386;
        Tue, 06 Apr 2021 09:33:04 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p24sm14233254edt.5.2021.04.06.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:33:04 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] android-tools: use PN instead of BPN in RDEPENDS
Date: Tue,  6 Apr 2021 18:33:01 +0200
Message-Id: <20210406163301.1500244-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index d93a7f7239..e8992346b0 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -160,8 +160,8 @@ do_install() {
 
 PACKAGES =+ "${PN}-fstools ${PN}-adbd"
 
-RDEPENDS_${BPN}-adbd = "${BPN}-conf"
-RDEPENDS_${BPN}-fstools = "bash"
+RDEPENDS_${PN}-adbd = "${PN}-conf"
+RDEPENDS_${PN}-fstools = "bash"
 
 FILES_${PN}-adbd = "\
     ${bindir}/adbd \
-- 
2.30.2

