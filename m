Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.857.1606938537411703481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 11:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jan974o+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id e25so11722864wme.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Dec 2020 11:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uKQyJlEt719uqwX/6VCAf0AL1Kn6zUURrxykN8ZAjc=;
        b=Jan974o+gt4Jby5DlytLZODK6AsXxyVNFREKb54pp6MmRemW7nlmjYM88d9ouy9Hrw
         wnL7Dds94RL09AR0nnwokPekktQwUxUlr6G8/uBmT808wtyFZxqsEmJqt3ZKOJ4U/hsM
         Z+Wz6Ph/QtfAfbKZtv8Dg24csPc7lT1Sqg7eO68lApL6WJaYDqauiNX/M98SYl4EpDg9
         9K9dZTaHK3lVZl2XmICwDx+1kNhQJM3P68M/eDibdtiyJH8G2uv8mzGr30CMGm28N0vu
         n6XVOg0PfBATczINn/Vkg5h/pfOPXVjxq3fRJNdiaO3LLik8HkBsDbElV4EOV0EDeEhB
         PIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uKQyJlEt719uqwX/6VCAf0AL1Kn6zUURrxykN8ZAjc=;
        b=I8jTEKTAd0d0OaANOf2rrNKP/SdyUTm0UFAJBCiWrYl/6MZMJjQ1btP+4zewriuWc3
         +DC5xf9DAsAt45a3mtKduJgrMvRLUWUC3QHzt8G6DIkH0ffk3tbAbWZG4XpFg/S7W3Dk
         a+zg5kfLC6AmWsYYz/OwssSMQ9BUsKMGANsh9V0oTP0gi8aLIJ4VcmjgZwQR2QY+jUjN
         KylOhHK4CMNt98QnjYfloS/qIUe6E9laJBrFajNxdc5oYf59CdtvBd4NsHuHwYINNa6i
         gLLvlYCJ6mcvaK8ODJuzIMD+I9zZFoD+7al6I3DNvv0Pm0Iqkv32cl00Kq2Wm84aaeSu
         DFrw==
X-Gm-Message-State: AOAM5327yWBZHHR33BRv0/9i/QCKhgU1pdatTQ/HKIERQrw+OqtNksz9
	KlpwR5XG2/1qZ3of7CuagKgRPCz2Yjw=
X-Google-Smtp-Source: ABdhPJw9BPLE8ib6YtIpcWSi35YqrGYGo/KTi2Nbcxe6ELtjbMo2HBkUW4KebxnD/IbUxeR/O7/MBA==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr4792646wmb.98.1606938535508;
        Wed, 02 Dec 2020 11:48:55 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q12sm3209850wrx.86.2020.12.02.11.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 11:48:54 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] nanopb: move to dynamic-layers
Date: Wed,  2 Dec 2020 20:48:52 +0100
Message-Id: <20201202194852.43068-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* depends on python3-protobuf from meta-python:
* fixes:
  ERROR: Nothing RPROVIDES 'python3-protobuf' (but meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python3-protobuf' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python3-protobuf']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'nanopb', 'python3-protobuf']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: add it to packagegroup

 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend     | 1 +
 .../meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb         | 0
 2 files changed, 1 insertion(+)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 50da5e5d0d..caa552edb2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -3,6 +3,7 @@ RDEPENDS_packagegroup-meta-oe-devtools += "\
     rwmem \
     speedtest-cli \
     mongodb \
+    nanopb \
 "
 
 RDEPENDS_packagegroup-meta-oe-connectivity += "\
diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
