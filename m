Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.19298.1629691066465287040
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Aug 2021 20:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JBcgOVrd;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C12461250;
	Mon, 23 Aug 2021 03:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629691065;
	bh=gY+soB27Ib0DMIbe4R2q2R1AXfZhQyG03Drl+HiFfOg=;
	h=From:To:Cc:Subject:Date:From;
	b=JBcgOVrds062b3a7djbQj+g0UbAIKoaqrxjUGDZ/Hhus1vZISezE5uNFdYQLsb5e4
	 RrTUaVWU/j7++RNpx7pea48nDFWs6FkeUtENg31M0Ij1VqaLflnieK+cWeYbhHnwZG
	 IaU9kgCXa3veid6WeKKhH753T2UMbMjPsE36Su3gAb4+tkv+2XU1HGMErVnG6fkIG+
	 TqV/J7Wn5aiXMe8hCNYwzUWd2nGtcUiQV2Fm8GZsCIiNAVgWAS6/jZ+MYA0YFNkaw9
	 CHFZkBpHO66ZrmgaF4/gu1miQJIb80F27oc5YL5gHbPBNhuiOcXNq2yriNVVBwGzJp
	 SUdkB53X9GYGA==
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] grpc: make SHARED library build optional
Date: Mon, 23 Aug 2021 03:57:39 +0000
Message-Id: <20210823035739.7142-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Shared library build is known to not work on win32
platforms. Make it configurable.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
index ac8aba382e..b4f10662dc 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
@@ -34,12 +34,11 @@ EXTRA_OECMAKE = " \
     -DgRPC_RE2_PROVIDER=package \
     -DgRPC_INSTALL=ON \
     -DCMAKE_CROSSCOMPILING=ON \
-    -DBUILD_SHARED_LIBS=ON \
     -DgRPC_INSTALL_LIBDIR=${baselib} \
     -DgRPC_INSTALL_CMAKEDIR=${baselib}/cmake/${BPN} \
     "
 
-PACKAGECONFIG ??= "cpp"
+PACKAGECONFIG ??= "cpp shared"
 PACKAGECONFIG[cpp] = "-DgRPC_BUILD_GRPC_CPP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF"
 PACKAGECONFIG[csharp] = "-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF"
 PACKAGECONFIG[node] = "-DgRPC_BUILD_GRPC_NODE_PLUGIN=ON,-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF"
@@ -48,6 +47,7 @@ PACKAGECONFIG[php] = "-DgRPC_BUILD_GRPC_PHP_PLUGIN=ON,-DgRPC_BUILD_GRPC_PHP_PLUG
 PACKAGECONFIG[python] = "-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=ON,-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF"
 PACKAGECONFIG[ruby] = "-DgRPC_BUILD_GRPC_RUBY_PLUGIN=ON,-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF"
 PACKAGECONFIG[protobuf-lite] = "-DgRPC_USE_PROTO_LITE=ON,-DgRPC_USE_PROTO_LITE=OFF,protobuf-lite"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 
 do_configure:prepend() {
     sed -i -e "s#lib/pkgconfig/#${baselib}/pkgconfig/#g" ${S}/CMakeLists.txt
-- 
2.17.1

