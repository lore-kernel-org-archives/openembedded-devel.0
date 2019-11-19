Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id D95796C132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 01:16:42 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id bo14so2036196pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sNYkX76fj+CYjMoiAInB5NGZD2HHRoULZrp9v3l9CxE=;
	b=jN8MifEI9igiPOegQCNloRBbrCy/igcYm6hi0xYqYQ05NoyP9QjWuZ7P6+ly2hwLjs
	i8g5dVrzXa+RW9HkRjZjoMJpI05yXxZIDun9OHse47lpxhajNGmz32ADC0KunqLJLhNy
	1Zx9IrjHXy+1GyQpJCz4dv4kVeildKVNfDhwzXig/RePmDsI1a1yNvhTY0Gy6ErZADI3
	QZ2O/wqNrBaJIhdX5m+zSlWIDV+2Ocy+8t36HSGiD6grsSQ2qyPTytbYHeM0Dxly3R8Q
	tVWTAHlJ7au1GKhMowwCHOS95i0KfMii6keMAe6u9ttTBqKHY41SdB4sz6Ih08HMRI5u
	PfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sNYkX76fj+CYjMoiAInB5NGZD2HHRoULZrp9v3l9CxE=;
	b=QsVMSA/tl8oVTeOE5IcGfd+Hox6jqRYZ6/Fh0kcfxmLiOWeVj1tQm5kZRd3Sfo8dXO
	ge/ldd0ec/L9UpW4qlNhqUt/OEFLlP3FoVeyEytnmZb0EVeN0v/YDjdlSse4cZV2XFG5
	LUsaQQjWGkMnqtz1ZVxWBVFBBlTQTDvoTdHV+5c9fUBEQeno+173w6FLnBVpwOmbSpvj
	DFdlCozuad+Fy58/H59qKt0JiW408ZfXb9kDeYODhp7fr7Eeaht8A49L1m0IUX8UPxjF
	s9TeBwErXfjLUjNYvRpGH0s1HRXHF/PXWmQfLKXNgXMzMlG9HNmF9U+esw5hDfFsv66a
	Dxmg==
X-Gm-Message-State: APjAAAUDbwPaP/tWJ1FYQKH5Z0aJvMrhHAofumzk1TvuGubsg5d9J2k0
	bukfbZzgw6mnLpwIJyUf1RKGmLH3DII=
X-Google-Smtp-Source: APXvYqxgUkQW8QWAzvN9JGIikOHl0yo2w/6oHHWYNOeMlN8a/o0+NwE9VxD2lWBfV88j5sCyoPKeNg==
X-Received: by 2002:a17:902:d708:: with SMTP id
	w8mr427866ply.280.1574126202956; 
	Mon, 18 Nov 2019 17:16:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id y8sm22021106pfl.8.2019.11.18.17.16.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 17:16:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2019 17:16:28 -0800
Message-Id: <20191119011629.3835732-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] grpc: Link with libatomic on clang/x86
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
X-List-Received-Date: Tue, 19 Nov 2019 01:16:43 -0000
Content-Transfer-Encoding: 8bit

clang does delegate the atomic<double> calls to libatomic on x86 where
as gcc tries to use intrinsics, its debatable who is right, but it does
seem that clang is safe in case pointer is unaligned

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
index ecc575bcfb..24072c0832 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -42,6 +42,10 @@ do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
 
+do_configure_prepend_toolchain-clang_x86() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
-- 
2.24.0


