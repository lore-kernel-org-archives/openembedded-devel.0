Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.9632.1614936842351369302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 01:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IPsPZlUS;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m7so839642wmq.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 01:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nCh86RvAUCEChvCm7NsA3U3rv5F9PTh6vGTZ/q2gLF4=;
        b=IPsPZlUS18o4TMdn/W1BNT6CJwnJdVrA/dEZsU7yqkyC1DKlhNj/v2iWjsXEqfWkZk
         d6UmXgU80Lrjz12jHk5NbMfR6oEUJ8WAKWu2a67dkta8fKFxGpDgXPIBWcPBXPAZsgeS
         fbYhMSQUSD6C2tsD9B/1usSInFvhSXwodiUE5ENgCeWoEfY5LCUAw1KIZtUK6RTP3ae7
         V5e9F52IynM/TJUI78IO5X+gveFkffqNGLEvnaV1Cq6/7CXsc8ulO7+PxiHZrEl3E8pj
         mFcdaO2o4qxgabMH5TcT2RtMInApBL/pK7W7py87/nzLQd9i13OL3ecaAkYzjwNerTIE
         Lrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nCh86RvAUCEChvCm7NsA3U3rv5F9PTh6vGTZ/q2gLF4=;
        b=R2Qnjsi8edHHjapPphP8L1v2GIqxHlgXkJoymnhPdjeAUzEgUQUVA+cNQxx+ELGifq
         Ttqzki8IibdNTwc+iiW3nPr3NBM46flJLSQJ7BesYmphtPUvQ8daK/f1/jPV6J2asWas
         9cBbq6HNV9LtAcl+56lf7prpLqLY/1GLLBV/kaThkx7Ma1foexx2p5SOsX9HTJGVWxSQ
         nN1V/UOI8TJNs0hk+6a4gC/7u0YFZkqbu094E+pkoLc3+EDAWING3dDrI8dFhQjPdt9Y
         P0bCMWzNj94YafKSdyJAuYMJPGgYMEIm3qbBtnsQalHergAfKsPsbDEALDEaQd5nd/Bi
         GG/g==
X-Gm-Message-State: AOAM533/r6Fej940Wr76tlWGoa94x17vUO8FVQB3jF3a6tdA4/YTl9x4
	E/Vb6GeUirDlWeuus8ZRyautKOyEn9D9UQ==
X-Google-Smtp-Source: ABdhPJwanMLyOqnbaU3CIfLcUFxnHfqo8Nz1tAaymIKWrlZqqRoHySclWIY9kvBgM4Axy/nOTwQ6NA==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr129403wmg.182.1614936840576;
        Fri, 05 Mar 2021 01:34:00 -0800 (PST)
Return-Path: <peron.clem@gmail.com>
Received: from clement-Latitude-7490.numericable.fr (245.241.245.213.rev.sfr.net. [213.245.241.245])
        by smtp.gmail.com with ESMTPSA id x25sm3751631wmj.14.2021.03.05.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 01:34:00 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] grpc: move grpc plugins to a new grpc-compiler package
Date: Fri,  5 Mar 2021 10:33:57 +0100
Message-Id: <20210305093357.1450900-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Like it's done for protobuf and flatbuffers move the binaries produce
by gRPC to a grpc-compiler package.

This is more explicit and keep coherency with protobuf and flatbuffers.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
index 358ec80e8770..eb137bef52ce 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
@@ -10,6 +10,11 @@ DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl
 DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
 S = "${WORKDIR}/git"
 SRCREV_grpc = "3b7f86e3516746c5f0db1947e0d65e94159bcb12"
 BRANCH = "v1.36.x"
@@ -72,4 +77,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 SYSROOT_DIRS_BLACKLIST_append_class-target = " ${baselib}/cmake/grpc"
 
-FILES_${PN}-dev += "${bindir}"
+FILES_${PN}-compiler += "${bindir}"
-- 
2.25.1

