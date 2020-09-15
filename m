Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7550.1600204864794569084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 14:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufLOO3UT;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d9so2706814pfd.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 14:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2KdANi82+ISOz25lG4PTk528q5ztTjl49+zOTYEHyTo=;
        b=ufLOO3UTDRhInPvefSiWDF0E1O0vaVDUQ+mF+Gqa2YbfcNiCOKL/A7Ym73vqLL7IwD
         6dmHcXonkH03ELKCHdYpgOUWmwneYZ1cv5J/O0JVnAZJ9+1LNZOa5Xat/JboKNY4Udvw
         zLatUYZX4i3bWOo/u1E2QLckdZnxj4jOzTDPJyeQ/hiFmAIWcq31fjRBnRg7hLOrphnV
         g6lTu3WnsaaOs8KAm4vdUaOuoGoHUQR7oXJRLgACeK3MH3qDwrZDw1ibxa5TDx1iKXSZ
         dqB/wFDYgRqETx+sBHWIx6ABmB7jFgMm1ShHE0s33lNduz8mDweEwD5M9BX0zGZbTT6L
         Mdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2KdANi82+ISOz25lG4PTk528q5ztTjl49+zOTYEHyTo=;
        b=dAySG5brR137mxbWC9Toyfl35snvUfem7atA+pKH/peu6PDAjOBwTw1m2P2x1czHRN
         js0NeKKvm61gIjxw7Zke2kUiUQqFRvt/+ug/ddnlHNvnu4eD/nM1qI/2ROM3D98in6X6
         a5Nn+S6WthSvo9N9fdaIdmfvOJP9Ef4OdPDGYNpZAVDev0wNRVtG6yAVT8dTJ83Tc7YS
         etCb64eNLj/88tXamMw7PlOYz+cWDembiYpxdwgmUjS8jnL3SvhEcmU0yLxZW1HcKfaA
         3seQ5+Y18fpExRzjWTy+oifcoOAy4odpojpJf/5nPehvpd82BrwnI0J1E2tVhf7J0mYk
         qCGQ==
X-Gm-Message-State: AOAM532pGSpF65fbL9Em8M5gTRtETvl4f2FkLRbWX9ir78eFZvsaLwGI
	Zar1dRPDMP9suvjwBG8Io82h4hKnwVy/cA==
X-Google-Smtp-Source: ABdhPJw//hjlz5dvVO5vxOfATrf7PT/ERrXLolCTVr6f7Mt+ra+Hb16KaWQiaqRPJRE8XC0x+wHg8w==
X-Received: by 2002:a65:4b86:: with SMTP id t6mr15452927pgq.81.1600204863621;
        Tue, 15 Sep 2020 14:21:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id m13sm13440710pfk.103.2020.09.15.14.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 14:21:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vincent Prince <vincent.prince.fr@gmail.com.com>
Subject: [PATCH v2 1/2] mongodb: Pass OBJCOPY to scons so it does not use it from host
Date: Tue, 15 Sep 2020 14:21:00 -0700
Message-Id: <20200915212101.583424-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
objcopy: Unable to recognise the format of the input file `build/opt/mongo/mongos'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Vincent Prince <vincent.prince.fr@gmail.com.com>
---
v2: Drop musl support patch, its not needed with v3 of upgrade patch

 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 0606e34407..6ac14ebd02 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -60,6 +60,7 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  CXXFLAGS='${CXXFLAGS}' \
                  TARGET_ARCH=${TARGET_ARCH} \
                  MONGO_VERSION=${PV} \
+                 OBJCOPY=${OBJCOPY} \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
-- 
2.28.0

