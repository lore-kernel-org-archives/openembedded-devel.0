Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.4093.1619143939016154828
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 19:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eLSHsPy0;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id s22so13078736pgk.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 19:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5nw3ewDCssDy7UmrxJZTw+d9J4Ykum0nRZ2/Bghg78=;
        b=eLSHsPy0IOnHbGfRB6ePz7R4pUJ81fgYH2ImQNmI/lqZ6WzYRtFJxKsPxBP+mhwwLd
         IA6QW2PQgc2diDukETyhAR3K0Z8+UWNwLEwoNbXpSKAnSNFa2A1L3ACues8+QkTItnxI
         eKya0HemAuaXmBTi4JoEQQLQCP7CzR9gKDqhIc7Xm4QVDYgvA9u/UVjUstlbm/QxsuhG
         s2SpPKVNxm+Pe6m4HCqSISEbvZk8gR3TsGZ3zkOgPIrcLNNaTsfk5dAQYZ9lY47eyjiO
         Akw618ReTyBrB1VpO0JB4WNFVcsL5jPBSEW2UaOS6TmSxl/cWPbmk7fcPTXaa0CaJt2k
         zfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5nw3ewDCssDy7UmrxJZTw+d9J4Ykum0nRZ2/Bghg78=;
        b=koat3wTebJ6n2ibdpDuZ0HURCRYy0erKuL0lSC/gMYT46v9vaFfb/qVr+3NE6u6E9b
         nas7kGe5iIGNkZXKpQ9V03JuX00cl3/w73Pg33zOI061D9jaHuGY8PkXiGBPFFdn4Te3
         F8BfP87xNln/m7+903Z/pMsmRB9qBxwwugl4zjB97FvURarBrWu7xEwin7UBaBoC0F+S
         chNn0B8JAu0nYaamVAo3b7S++91bI3/cFLzJ+yHs8rTI3ywQz+NVD+a43WuxMmXrhQg1
         yR/GZ2wQpE8YJePZtnWjErX8GhcYBhvUzW51XPzWpuWabbYZ847xRrr7v0EGTU47XcHr
         Sfdg==
X-Gm-Message-State: AOAM531JGB8HBy1uQL0Ey4tQJ7x090F5Vr4lfnbRZ0BoeM+G4OszwQDU
	H51xrC5bUOa921WhW3m9eE4jmDqfdEM4rw==
X-Google-Smtp-Source: ABdhPJxd3kU/hM6LnP35ngMMNIbcuyLbGIeHSmYP0cf5SoQAKttpF2i2IhPkNmmmJUedhDl7M/aFeQ==
X-Received: by 2002:a62:6481:0:b029:249:ecee:a05d with SMTP id y123-20020a6264810000b0290249eceea05dmr1605584pfb.9.1619143938348;
        Thu, 22 Apr 2021 19:12:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w9sm3101435pfn.213.2021.04.22.19.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 19:12:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-docutils: Delete
Date: Thu, 22 Apr 2021 19:12:14 -0700
Message-Id: <20210423021214.3735846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its already in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-docutils_0.17.1.bb   | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb b/meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb
deleted file mode 100644
index 0364cba8e6..0000000000
--- a/meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
-HOMEPAGE = "https://pypi.org/project/docutils/"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause & GPL-2.0 & Python-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
-
-SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
-
-inherit pypi setuptools3
-- 
2.31.1

