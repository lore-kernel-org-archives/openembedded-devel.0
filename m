Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5407F266
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:32 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 6so22793498pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DV941sDWx3/pzUGNQtKao6pF1IH0UxI1Vc5CzwvwmPA=;
	b=lkMuZcs6OmiUiY1I59MDV9ewEAYyEod05LrUSdTkMcXeaqYuN7ljLnYFYjcDrIXPeB
	edwBU6UffGOXqb2HKfnWWyCK9QZqjNwSwvD1DzwYySX6xMwJw0q+L49z5tlhcCKi0r6N
	xcW69fDfakHrDKDPhYXiaFG5MiphNJWVFzio0Yy4k6pPcmKFvFO7RWPpS3Ux9/9akpyy
	NoGLgAOSAtkxbKbB2vNRspmCWiVnZvwdtK1LioOvrwz7ubwMm65Hhm5SVTzmp5FqlvC3
	3bQWPTjK2vJIyp4PWYFNwD5PaW8dEXhy1gnapwB7dexXWcju5PjyLkNkg3GWx06RjRQR
	OqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DV941sDWx3/pzUGNQtKao6pF1IH0UxI1Vc5CzwvwmPA=;
	b=hQiR09sp459U9W6s/smELTibSgN82nmnOu3Ifr3brzXTHll/z1U+WeQs/TV7NnEBlB
	hlHIlLX65hes/flkaL+hE6v1EhWLTGDh3hzz8g9l0Mi1MCRuQolBFWK50XVz97zwJExO
	1CC89LZvnsiIEKyAvXw2ihV749Meuu3eT9m4fmONUjplqpRz/bNWicZbClK7XBppWawy
	QZT1GNo3ETOR9SNiU2/35qKCCBXrEw7fOHcZ5QD0vE2x//h1Z/hBa6758OuaJ+mTqX2g
	FzcHxfDcnyI+y4XcGIZJFAaYGew3E7fbSVs/CZfY2n3XBeM5ZfYhDCbtWIJxMVPUYMUd
	359Q==
X-Gm-Message-State: APjAAAUKfUX0m+zqvhd1crHZ8gziNon78mWjdbz9kpVHgY91aTFGJ5oO
	Eq4QxIG2J6ux2lVsqIXtMRcPBzKl9Ys=
X-Google-Smtp-Source: APXvYqx9CxQ/HE5lPEb9nGmZakXx2OWOHw7bHrVSqZdqatLIZUqVn2yE9ACIFswMpgLdX0tSayK1ug==
X-Received: by 2002:a62:ee11:: with SMTP id e17mr75071453pfi.48.1578019773319; 
	Thu, 02 Jan 2020 18:49:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:48:58 -0800
Message-Id: <1a3b6600a6134430eb87cd7243f35a66634aba7d.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 01/17] grpc: Define libdir and cmakedir in terms of multilib
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:32 -0000

From: Khem Raj <raj.khem@gmail.com>

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
(cherry picked from commit e18d8c957034908f27350e6ffcae2a3d05a4387b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
index 5cfa3aa82e2..8d54dbeff81 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
@@ -36,6 +36,8 @@ EXTRA_OECMAKE = " \
     -DgRPC_INSTALL=ON \
     -DCMAKE_CROSSCOMPILING=ON \
     -DBUILD_SHARED_LIBS=ON \
+    -DgRPC_INSTALL_LIBDIR=${baselib} \
+    -DgRPC_INSTALL_CMAKEDIR=${baselib}/cmake/${BPN} \
     "
 
 do_configure_prepend_mipsarch() {
@@ -44,6 +46,6 @@ do_configure_prepend_mipsarch() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
+SYSROOT_DIRS_BLACKLIST_append_class-target = "${baselib}/cmake/grpc"
 
 FILES_${PN}-dev += "${bindir}"
-- 
2.17.1


