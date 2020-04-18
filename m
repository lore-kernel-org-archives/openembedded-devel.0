Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.8704.1587253189781314243
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2020 16:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rEvwsD3x;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id t40so2799366pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2020 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEr81+AJDtYzdaRfwDVX9j/ezd+KIAbXl1aGVIdTD5Q=;
        b=rEvwsD3xRPswhRSIXjxxpo+11sf49EETn9tu+vTCwf3T58+7hTKme+CGLC50xp2LrQ
         zdjZfFMzPN4mbJiIEBf7DM/CX5EGf465vXecS3KFZQfnOQcy+B9FJis4mdOnMe3s46sr
         L0HPeIsPjVWqybyxNpnpWTwhll0ELXpU3mfrNof8QgJ31FrNzepceD08x/K1cuGUtEdC
         /xFMDYXCT3ghWSXRzjpHJRIn/LLuvj4+lZ+Mz1lMp5OtmrZ83A2sFh01dDJ3O9xI3a1N
         rw+SQAtAq38F+YpVaDQXv7J3qO7tsNMuC+J6/46r72G5BARuaS5m3UQRgeq1gPdawBzJ
         j3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEr81+AJDtYzdaRfwDVX9j/ezd+KIAbXl1aGVIdTD5Q=;
        b=h457p337VbbqfwYwlZ7DqgQd4DgnITjhq2yQWEjharDHfOthhAZBINRXP6ECFDokxN
         Ee0qZD0OFhN5ZzXYO1nnomX4uhwCKET2KCqPzW18NckP8m4Gzw8z0PKQSqOa139Rvmgd
         GaEYF3ozF+oN9yFWDh+KvVktGMGBO8BqpiPHDcLOlXxI2mSfyKfYDESZpqYfbM2VGM8q
         o9gUx4qI98wb00atNyvP5HNAPitQJlBCOxdB9jR7KwuXaJ7s6TwxYWJxjeqa5gFCHZwG
         Wk5Yo7fgqpnSB7mNmQ48eUITZPvwwlYMk6Qu6wLkuuNfehAYXEiq81VISvtuKJu9egXS
         bH9g==
X-Gm-Message-State: AGi0PuaazQEyvS3dVet1Tv4Uuj3/UUnYF99SPyEhqrCbBdblLIfU7Lei
	kgCx/m/lLDM56onsvEPxNngwMV+NQrw=
X-Google-Smtp-Source: APiQypJsjjIBRhojfhv/Dvql6pnOI4QPLf3wAoupxfBJhwIyeYPRT0iD4UQsjUmG2JBLCv2WtKzvyw==
X-Received: by 2002:a17:90a:24e6:: with SMTP id i93mr13282188pje.13.1587253188753;
        Sat, 18 Apr 2020 16:39:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6cd1])
        by smtp.gmail.com with ESMTPSA id i16sm14063717pfd.108.2020.04.18.16.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 16:39:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sysdig: Do not depend on luaJIT for riscv
Date: Sat, 18 Apr 2020 16:39:46 -0700
Message-Id: <20200418233946.1755525-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LuaJIT is not porteed to riscv yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 8074b2e0e1..04a022af4f 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -12,6 +12,8 @@ inherit cmake pkgconfig
 JIT ?= "jit"
 JIT_mipsarchn32 = ""
 JIT_mipsarchn64 = ""
+JIT_riscv64 = ""
+JIT_riscv32 = ""
 
 DEPENDS += "lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
@@ -48,3 +50,5 @@ FILES_${PN} += " \
 # Something like this https://code.videolan.org/ePirat/vlc/-/commit/01fd9fe4c7f6c5558f7345f38abf0152e17853ab  is needed to fix it
 COMPATIBLE_HOST_libc-musl = "null"
 COMPATIBLE_HOST_mips = "null"
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.26.1

