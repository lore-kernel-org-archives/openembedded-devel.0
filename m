Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web08.54567.1606703278963125173
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Nov 2020 18:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqoSvW0i;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id r9so370715pjl.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Nov 2020 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmPRWoiGZzuTUJI9+uK/a7Uq6XKds/gV/ChVS4nz4XU=;
        b=iqoSvW0iBsJuUBb35oW90ZK5BOoHuHFCPs/S2zMCi7rkY2VtpOWiT8xvqBeJ2Spiwg
         +pzqRUhsntOWClvBeEZUhK/osx+12qVArDdsg19ETizgulaV1KW3budnQeBDaD+ccQDp
         ttHBRMYX6lUy1RN7a+OECluZ5SC31jyUbIipMBTYhJlRMhdhrEbZBUNvBURd6wq7IknH
         u0RZK/gotyBvUgxRUcJuQyrlVvmviHsT0SG62WHmaxIkE2A0L0e+j9BDk05c+l4hmlk5
         Z7K2dqafx1IU5ECY3A1Vith8D4sHT8nN5qQUWzg4YxTLJduWZxTQlev93Ze0XKiJw3UH
         qW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmPRWoiGZzuTUJI9+uK/a7Uq6XKds/gV/ChVS4nz4XU=;
        b=RUPyXv0nkdxpqGdpqjStJAYt6+Fb4kF+CZGfw70C4LX/tivFhSHay1aNUyiUlwBwIQ
         Fsj4Udy0E1ao4qfWZ9cywJfzWocavsYgbiVGm+DgecQM0EUAc7eaPbG7+IOQ1M0iBQya
         2eXmQlxG3WEumPftNrAHa8xMwXMYHubjabAw0e65z0OTuXvgizkO06D8g7elt1d4bSkW
         WHwLZKP+cWNFh+BUqTyblVReC71WVcNqy8xbZFZRd/tVw7j5kPJivgS8MKukUhXKMkzQ
         XYUnG3fHgIEzYice6dYugFYl2yz1XovJpMQVFj8ZOiSp0Z9x6kCJxYoWfybUARqccWDz
         3/mA==
X-Gm-Message-State: AOAM531UMiN002aZPcb46OuYUqY5OQLGweuHi/nlpQtN78ojPiK+8mmh
	eg0oXFCcNXIyDhV+Fsr65f2g20GVLnmNWQ==
X-Google-Smtp-Source: ABdhPJwEbtwYUSvlHojy1CcjuwoVFJ2IVxCBeTUUi84B2nhx+1t3hp0QA0JCg4v5w700s/zkbpvQ/g==
X-Received: by 2002:a17:90a:7c4d:: with SMTP id e13mr23948007pjl.146.1606703278328;
        Sun, 29 Nov 2020 18:27:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id i14sm8807192pgm.35.2020.11.29.18.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 18:27:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-matplotlib: Disable LTO for clang/riscv
Date: Sun, 29 Nov 2020 18:27:55 -0800
Message-Id: <20201130022755.3534198-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LTO fails to link on RV32/RV64

| Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (
ignoring target-abi)
| riscv64-yoe-linux-ld.lld: error: lto.tmp: cannot link object files with different floating-point ABI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-matplotlib_3.3.2.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index a2e7074d78..3cfa3f31f4 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -38,9 +38,12 @@ RDEPENDS_${PN} = "\
     python3-pytz \
 "
 
+ENABLELTO_toolchain-clang_riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
+ENABLELTO_toolchain-clang_riscv32 = "echo enable_lto = False >> ${S}/setup.cfg"
 do_compile_prepend() {
     echo [libs] > ${S}/setup.cfg
     echo system_freetype = true >> ${S}/setup.cfg
+    ${ENABLELTO}
 }
 
 BBCLASSEXTEND = "native"
-- 
2.29.2

