Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 084EE7D71A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 05:09:47 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id s64so1711473pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 21:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5cGLTrifvtkGahYF5X/p4TJtsCiU8f48cJwPuMAJg7c=;
	b=nkGIzpnY27pGvB4vJKfPq+LHzUxTf2bTm/GFKYGi6ofQg9SDb9kqUPEjhlJHzj6Q+h
	YX+wHc2CzW5gTtu893+aOT3eOjmSIMc4+JioPcg2boPWZyGkN5agS81mIA4h+U2ROhyP
	MlvquwH86sj5yuhRZX4/KZJ680sVytM1n2J2htRz1TxIA/S4XY74h5MDpe36y3NMCqtO
	l6vsON8HUtIrdStsXA8zJtPXQuk1v9nmsMcPmAN7ebPWzYaghSkI00fgUbNTUEIYAHlV
	3qgcosL76BO6FEN/v1PqytgwGJXr3vTFgBcei4DCzcEOMszQ5P/IGvuR9AdcaxV8KbHt
	VPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5cGLTrifvtkGahYF5X/p4TJtsCiU8f48cJwPuMAJg7c=;
	b=JROmlTSf0zM1lEwP+PUsiQwnIq300t2rR12tc/56qkkrkOkHVR13K+IcErkAAOSXlO
	M7pUx4AZWjK9MCwbzaRd/MBURj8HnZyevbKJ6nimFwSidd4JqR4XCohtlc7MUtrN7+Z1
	1Z+WYGclEGrJQBQYJ8ZBLI6inQlytcpo/M+TmGa0VONSWAPGa/dvfkELLnH5ZMIQycTl
	2vZcnZ5odhYoEGDZgqJTS0VYlEPsDbdgxrC0wJmuGP419NuW/nj9tSEtvJKzpM4pME8O
	vUR7DpcG+qJ14TjtlAQz5Ucg+9jAVweKCi9qrMCMyrXiT6Q2RK2ZdA3asR0yq9ZLT4RX
	ZDdw==
X-Gm-Message-State: APjAAAVzX/mvo5vn+xdLrLQxsuKll8zzU+y4VeKyzJlVPNpx2fSBtJYk
	9Fp+Ljieru/SdadJZ5w8BE4bmXG+G9g=
X-Google-Smtp-Source: APXvYqyCGthtBUXjbmQez/1t9vbzsu4gPp+m9f5eYQVzaKifh7oSCBnEE/6qgoeOdrZETR3K/kYOwA==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr10158870pgb.306.1576386588713; 
	Sat, 14 Dec 2019 21:09:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	c8sm16835575pfj.106.2019.12.14.21.09.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 21:09:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Dec 2019 21:09:36 -0800
Message-Id: <20191215050936.25027-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191215050936.25027-1-raj.khem@gmail.com>
References: <20191215050936.25027-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] grpc: Define libdir and cmakedir in terms of multilib
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
X-List-Received-Date: Sun, 15 Dec 2019 05:09:48 -0000
Content-Transfer-Encoding: 8bit

This helps in avoiding packaging errors seen with distros enabling
multilib

Fixes

ERROR: grpc-1.24.3-r0 do_package: QA Issue: grpc: Files/directories were installed but not shipped in any package:
  /usr/lib/libgrpc++.so.1.24.3
  ...
  /usr/lib/cmake
  /usr/lib/cmake/grpc
  /usr/lib/cmake/grpc/gRPCConfigVersion.cmake
  /usr/lib/cmake/grpc/gRPCConfig.cmake
  /usr/lib/cmake/grpc/gRPCTargets-noconfig.cmake
  /usr/lib/cmake/grpc/gRPCTargets.cmake
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or de
lete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
index 24072c0832..3cde6f79cc 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -36,6 +36,8 @@ EXTRA_OECMAKE = " \
     -DgRPC_INSTALL=ON \
     -DCMAKE_CROSSCOMPILING=ON \
     -DBUILD_SHARED_LIBS=ON \
+    -DgRPC_INSTALL_LIBDIR=${baselib} \
+    -DgRPC_INSTALL_CMAKEDIR=${baselib}/cmake/${BPN} \
     "
 
 do_configure_prepend_mipsarch() {
@@ -48,6 +50,6 @@ do_configure_prepend_toolchain-clang_x86() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
+SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"
 
 FILES_${PN}-dev += "${bindir}"
-- 
2.24.1


