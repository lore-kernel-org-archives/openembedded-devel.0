Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.4578.1614852790346945002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gM2ELX7g;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k66so9074544wmf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 02:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjBNgsA/J8Jyyq+sn/XbZL75N0oHnLWo0Qsig/IYJRI=;
        b=gM2ELX7gcO0kEq2p7KhZpuIv3hOad1Hl0qBFklPqW1mvgO1zFWEslHYqPZT1OxoiP5
         jv4DB3+EMNnW6Trwu7QmavYOIOHWzvqlWRLh/PcZNgGgkCnZhrXpnwQ/DalvAIvjC7gQ
         bHfULt6iaXQ9blfODPVPPWrDOddteZ9ZYy0HeFeZf3zR4FUkqzNU6a2gks5P/X7We5na
         qVnqNOUAjptDlcvXwes01j0/B5PZLgZn4XwfvIWX5tMYbm1hl8AHIz8nBKJFYOQRiheh
         DiV/xhEwt4i5FZEY1a494gAlFNrXN2T8DI8A5qC9sPkJimAJ80gNzP563DIOd9Lra3w3
         lLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjBNgsA/J8Jyyq+sn/XbZL75N0oHnLWo0Qsig/IYJRI=;
        b=tAGLGQdw8MrtxiztuAezdyZ/jVxS/wzc1Q6Tl9eLuYL4+kp7sei8/70V5n0DbMKm24
         bTub5f8vCLTo75+TzNDJek29QW4BN1d3A7Ebe67tzbgmfUGkBH38xKpezSSt2ExRmLGI
         nu8f2GatGWd9SkC/Aw8CBEvHTTWIyYHOYwGJzRRmQ7TjzPHSIAaksZE37LyQSiosK06B
         n/noYXULWZAMKIj36DtRmITn1hBgAEbCu5iblRMk+v4Ky+cL1P3PGS5cJDGvhXvTMFXs
         iqpSwy4dlrRAOmQfuOwch/l7ZLeZxZ5RGD66ipdT62qX/M6t6Z7/M57gKs0ZGg6Xh+h+
         1aAg==
X-Gm-Message-State: AOAM532eCJ57KW4PbxfyHabm6CK+S1t7ZMHPJEtXfuPRYA5s8riKFgBT
	6OcnlI44gnb+K7DLYTPKUoyuYLW4BvsEqw==
X-Google-Smtp-Source: ABdhPJwhqYc4fo778u/JvhPcMuWPRHDsDl5luzT1iKOC+y0cztT6rXaNmJHd2d6/htQ4lQH+wjcWXw==
X-Received: by 2002:a05:600c:1550:: with SMTP id f16mr3082940wmg.97.1614852788076;
        Thu, 04 Mar 2021 02:13:08 -0800 (PST)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id m14sm8727548wmi.27.2021.03.04.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:13:07 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
	Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] grpc: Add PackageConfig to build only required plugins
Date: Thu,  4 Mar 2021 11:13:02 +0100
Message-Id: <20210304101303.1199430-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
index 6e2707dae409..56f20a4bfaed 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
@@ -35,11 +35,20 @@ EXTRA_OECMAKE = " \
     -DgRPC_INSTALL_CMAKEDIR=${baselib}/cmake/${BPN} \
     "
 
+PACKAGECONFIG ??= "cpp"
+PACKAGECONFIG[cpp] = "-DgRPC_BUILD_GRPC_CPP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF"
+PACKAGECONFIG[csharp] = "-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF"
+PACKAGECONFIG[node] = "-DgRPC_BUILD_GRPC_NODE_PLUGIN=ON,-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF"
+PACKAGECONFIG[objective-c] = "-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=ON,-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF"
+PACKAGECONFIG[php] = "-DgRPC_BUILD_GRPC_PHP_PLUGIN=ON,-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF"
+PACKAGECONFIG[python] = "-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=ON,-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF"
+PACKAGECONFIG[ruby] = "-DgRPC_BUILD_GRPC_RUBY_PLUGIN=ON,-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF"
+PACKAGECONFIG[protobuf-lite] = "-DgRPC_USE_PROTO_LITE=ON,-DgRPC_USE_PROTO_LITE=OFF,protobuf-lite"
+
 do_configure_prepend() {
     sed -i -e "s#lib/pkgconfig/#${baselib}/pkgconfig/#g" ${S}/CMakeLists.txt
 }
 
-
 do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
-- 
2.25.1

