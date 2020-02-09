Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8FBC60CD0
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:30 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id d6so2537765pgn.5
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DS6Vta/rV/od7oeZedF3pou4WEV8+U7X3EWF/ITlvYo=;
	b=gjLEDuaXT0/YKrX9QDFj7wRGQb09Wx0b/BylqVgG9v34i4qzvNSE2kbQV5nkWQMVf4
	EsKZSGH4Gf5Vnhmn8u2/AKXKQmZeF2Y/Vz7nTCJ9XLwZaOAVxBGr00UyGatBSYuFRI+r
	ZnJiBGAn0vpYmu30BxMVpTg0+p5Ju1Jy5LF99lSr8hLR4CZeRu7FpsbrFbCGNnirQPQF
	WlW92ezTNyJSrCwTEH17lPhWgVpqGBOXYZYl2TJolucXDT0rw9TCYy0C6Vh/Qd1KQHKg
	94gZXk1UaeqJKCQq+l7FYNKFoUtH2YetMPzYIOwEuc0c5OpOVC2JYZZT8v5qIMD0L+qG
	/qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DS6Vta/rV/od7oeZedF3pou4WEV8+U7X3EWF/ITlvYo=;
	b=Gslx/AzVlS+V4O8lyGaexvCDFEz7MdLbY3gkGpQ8LVs7GWxYlswd4Sj/HddQUGFo6c
	W9eeNEVQQzAfQ4DOhAB8HBtdlMhCtCSgmSX4ClCg0fLn6PGfHTqFQtjGZwtxedpZWmZ2
	+gR+QRZxyf1ThYAO4Mngr8BVscJ1ZP4S8JGQ4k1Z8mnlwgnZNu/oVAUPkTCiTlvjsoQL
	gnp0waJ4k5PkAq4E53laX41gvEhbTOlDJQACJ9D1+iUubyj00T0KpakPts4PxrIJ9Po1
	PPyHfkUep7N5pHdzon7FH1h4OgCAHTywKCuBLTlLV6dLAvrujx/x2x7VtR0KVOFKNsJz
	UjXg==
X-Gm-Message-State: APjAAAVe1iCh+b+h261strjt8cq3vXsTSSLaice5AN+2pDuNzxGbaO5m
	In0NfMeyaJuvXEe9OHM45GYAa7k6
X-Google-Smtp-Source: APXvYqw4HvNUatbtXSfBualNhPnaZF5ZZqgIbll6Za9qd/ndOx8EQCsVuQJMpf97Ej4TrW0BSKKCug==
X-Received: by 2002:a63:64c5:: with SMTP id y188mr9697181pgb.10.1581265051789; 
	Sun, 09 Feb 2020 08:17:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.31
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:16 -0800
Message-Id: <a82494272d3cd477648c630a84f0005b4f9d1018.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 08/11] grpc: Link with libatomic on powerpc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 16:17:30 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b8c1fa1cbfa21fc0044a172fffa5986a0fd4ad0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
index c11b55669a..34b4e317be 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
@@ -44,6 +44,10 @@ do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
 
+do_configure_prepend_powerpc() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 do_configure_prepend_toolchain-clang_x86() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
-- 
2.17.1


