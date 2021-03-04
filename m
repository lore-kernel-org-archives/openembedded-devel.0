Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.3491.1614843091636626235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 23:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=op+kMVG5;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id n10so18328104pgl.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 23:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8iUhWdnwoiJ5lJ9cN2bzbpl/dkwJ0TCxQL49pM9F1Q=;
        b=op+kMVG55dweMIjUZqIWypcc2bAfGgp415saTbKQkHhhkZQSdiqYkrlEHgUdgb7nq0
         QjMGiMgwiWHXQmj1cOcbRePugrsDPWLRVG9LxUwjSt9ME9HAq9yHF0Cqv2J7IfPZ4ikx
         qTGoVXOo2ksf753CORn5v2ozLsfGVnQaVSM9HvvA3MDtsw06c7NGTJWAsY0R5ittxQ+a
         jRQudL4HBJgckkpMCh+WAVqkKFoRaOZC7DvT5M0ybD8Bq1eeUS0e3LatBoWUQnsDMxQg
         Sj/zrh8lv+uIxKUuosukccgQj/4al5gFi2/BKq5ETI7MA6dtJBuJhaOIrAXhU6FIepd/
         bvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8iUhWdnwoiJ5lJ9cN2bzbpl/dkwJ0TCxQL49pM9F1Q=;
        b=Lz8ZD+LgG6+jSFTy42nhc//pzpxfJL2BGHVfwc+NiBd/woaJN3o8OB4cdafNTgRNyl
         LeXPXhd49Tj2c6P6skDWCMDZ/un/xHWPZN17WrIfMw7cyY1f4E5AzDfWQEj03DbbQiEx
         iMqJe/rovOrV4GHspbxmzsPazAayyhrWzuDhKfLK44CTNOPrWUQQZpKQ9thzKnidJnbM
         7GyAZky18BovJ8PdhknxKmm8bI9ca2PFBeclBu6b+pUCxnQNZSSeUIvEVZveWg/AQmH8
         +iPS24serXFfp3OHLudHUmCJtvvgrHP32S2N5Ta8/EX70sOKVWQ7A2PPPo7JaU3cArH3
         MtlQ==
X-Gm-Message-State: AOAM532cQony91jycbNhglER51D2rEgUms51dEYw2EVO41W9gC2icWFU
	EEHPVPliW4IKeeicJR9iAdjsWfMj6aXT0w==
X-Google-Smtp-Source: ABdhPJx8OedRjYLnUilib2tpj+bisrtryYDpLyvr8JEy50oIanaPAigmOXTGExjBkbR8lvSv+myZTw==
X-Received: by 2002:a63:ff21:: with SMTP id k33mr2509164pgi.379.1614843090788;
        Wed, 03 Mar 2021 23:31:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id d16sm23906492pgb.12.2021.03.03.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 23:31:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Ask for C++14 std explicitly
Date: Wed,  3 Mar 2021 23:31:28 -0800
Message-Id: <20210304073128.3329889-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer gcc ( gcc11 ) will be defaulting to c++17 and abseil currently
needs work to get working with c++17, so pin to c++14 untill upstream
gets it working with c++17

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 38c3dbc510..9557c9345e 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -24,6 +24,7 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
+                 -DCMAKE_CXX_STANDARD=14 \
                 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.1

