Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6104378400
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 01:44:28 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id k8so47981pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OITxYd+E0YdovFImUpjgqd13Y5qP1GL72TamUpF+TF8=;
	b=dM63otTu/HGjur+v253L7GcrdZCQzTmHesGKtuf9+X7YQ9rDEZoF1vx6IgsV0VO3E/
	Lf52SPbZ3zy/rX5aJqYvWyDkd99v0sbRBiXBwt3ToKEy2K7SdJPxLSjoNyuduHDoQ2/T
	utl1ocMgZ6f3JEpLYuDOeeFj/7V9FQE9y3DGDsV5BjtgE9mRIyE8xHsCWVcIzDZE8zlh
	SSgZwjIyfGUfBKywMS/pB0o0gfjdZZxcLaf306ebnrSXmJep717v9B4GBlraksI/aib2
	klnOErXenICx7PgfASVGkuoglAIGDmwExcK/rhmGvAv7A7U4mhhxk5qdoATZOdHJNLJI
	TPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OITxYd+E0YdovFImUpjgqd13Y5qP1GL72TamUpF+TF8=;
	b=BIuOXEs467PhZIYAo6wN0018K1K7z5PZrNfwuukbh1gZ347k90Yq7by3hf98ZxoyBU
	8rsyNbbx9u1s+uXCbTvvgDivym53hHCqh9Z9skTNIG3YZeb8dDwU4lK3SzFSQO0AAfX4
	3E4oHj+hgDV1Z77EDn087qQoq4s30Q/CCzG8aAgW7kNIX5WGPXB6UUk1CMGZzOwCOYJp
	vUGPHRV8n+BDDrF+4A7dDKUzW1yr1BrN1eNdtelD4MgYs1AQOMzBAT5z9elI6fyKyPqJ
	iTJin4ZvdCjbfPrmY1iJN3TPc3h4l2shcBYLhlEToj1eUbRYXg0bMUot5zaWl3hRfCo5
	kudw==
X-Gm-Message-State: AKwxyteIPmg26Xn/tQ2Si/p0U+IDURP7f1Z07VqLAa78AxIXommmLG48
	B6k22Zu9pLpjd4wpSah+JFsSvA==
X-Google-Smtp-Source: AH8x226M/6InwUDd+vd8/PFazszvlhGyBJwRB7C7cTaEqmXU3x9tlF45C87sfWff07ZyeemfLI4n2w==
X-Received: by 2002:a17:902:52f:: with SMTP id
	44-v6mr29655028plf.65.1517449469578; 
	Wed, 31 Jan 2018 17:44:29 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	b63sm48160246pfl.78.2018.01.31.17.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 17:44:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 17:44:14 -0800
Message-Id: <20180201014414.12948-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180201014414.12948-1-raj.khem@gmail.com>
References: <20180201014414.12948-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] grpc: Update to 1.8.5
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
X-List-Received-Date: Thu, 01 Feb 2018 01:44:29 -0000

Switch to Unix Makefiles in cmake generator, it
could not be built with ninja

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch | 0
 ...01-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 0
 ...001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch | 0
 ...01-use-the-right-protoc-executable-regardless-of-protob.patch | 0
 meta-oe/recipes-devtools/grpc/{grpc_1.6.6.bb => grpc_1.8.5.bb}   | 9 +++++----
 5 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch (100%)
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-use-the-right-protoc-executable-regardless-of-protob.patch (100%)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.6.6.bb => grpc_1.8.5.bb} (78%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-use-the-right-protoc-executable-regardless-of-protob.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-use-the-right-protoc-executable-regardless-of-protob.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
similarity index 78%
rename from meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
index 6fde33d85..c37cc4411 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -10,12 +10,11 @@ DEPENDS_append_class-target = " gtest grpc-native "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "https://github.com/grpc/grpc/archive/v1.6.6.tar.gz"
-SRC_URI[md5sum] = "a960878ad0231189d48ac8ff17eeca3c"
-SRC_URI[sha256sum] = "b97eaa0c8a63b0492dc94bdad621795b4815278e841f06b0c78d6bcbd4c8bdec"
+SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "b565fa6787e42f4969395870c2ad436e"
+SRC_URI[sha256sum] = "df9168da760fd2ee970c74c9d1b63377e0024be248deaa844e784d0df47599de"
 
 SRC_URI += " \
-    file://0001-use-the-right-protoc-executable-regardless-of-protob.patch \
     file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
 "
 
@@ -33,6 +32,8 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     "
 
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 FILES_${PN}-dev += "${libdir}/cmake"
 
 BBCLASSEXTEND = "native"
-- 
2.16.1


