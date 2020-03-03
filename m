Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 31CEE61992
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:25:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z11so5101407wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q4rmrt4MZMKo97j2W7C9U/kRzCYK+GUf2s7LHMMAq74=;
	b=qknSBcfqOt+JwyVj0n7jPWQc5I4kZc47DSSOv+fyHxYWpvcqNhLPossx/HNZfF7F1o
	d5qb1D+/uTo0ZNurQvVPX/ww8dzjm4yGvC1f2Z/2TEX7FwkXjZDUibe99PlqKfpH6JaR
	Z1iOyPLLEUv2uhEA8XFAf1TtThnc/igilrs4xn4/jTuiT1SunubRu3BAoG//dYZwtlqf
	eSBVkt7qLS1rwQePHhe9AYTE+KH88bjLd9oHGh8dYUb9W+QH5BOnKyWN3Z0L485GjIdB
	P3Wz19kfug62H2x/iPzchJzyhy7ognozhXa6jGkKiPeQi8kKdpEcHlL1UDoK9Tb2UdA5
	ua0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q4rmrt4MZMKo97j2W7C9U/kRzCYK+GUf2s7LHMMAq74=;
	b=qjc8HkB5hie4YcLtvCvXdppevC2BRG/v+WtFMgEBho2gg+57lYq8QU1XzTeKHmlg5W
	P4XoYoqGkWjE4MYLbMQ9Pn9i+BVet5oRNNEw/D2Sr2dypUuWYBetVnBAX8wrT/T9IEBS
	j9xmBYzVuJOSCFdeXUbYt3y9IfOFhAM5CTH4waTWojabsCVa83fKXvgzYtfdSLM0x+o4
	sMBS34KCbg1U4CZGA2htg8PhfjCFY08x7r8WXEXvNgHlQr5lnGwr9pnxhTCkmnnDqlW5
	NyldYQokP1oiDGxvanKw4VXu3ZqiE69DChHCGqVbFWicIxR6FQjF+YkLTlOT3NWX6g4E
	O6rw==
X-Gm-Message-State: ANhLgQ3kM3UfhmHyMjm7l66aCZkFJjkV8HMMOCr0ttfRibD7hUrDz/Z8
	FRSnQP4MEMD6lXd3/6zdatUDXEDM
X-Google-Smtp-Source: ADFU+vvuFhNZdfHO/IsG+tUvA2DDqKrnke7cd/FRhnFfUOxpa/nxv4SEc4a22xfIlX0E54tytZEQ9w==
X-Received: by 2002:a05:6000:8f:: with SMTP id
	m15mr5940651wrx.378.1583252711605; 
	Tue, 03 Mar 2020 08:25:11 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	m25sm2810482wml.35.2020.03.03.08.25.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:25:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 17:25:08 +0100
Message-Id: <20200303162508.12573-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH] grpc: move from meta-networking to meta-oe
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
X-List-Received-Date: Tue, 03 Mar 2020 16:25:11 -0000
Content-Transfer-Encoding: 8bit

* because sysdig from meta-oe depends on it now, since:
  commit ed798c764319d83ad9eb1b963bfc99b1fa1a791a
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Wed Jan 2 17:59:20 2019 -0800

    sysdig: Upgrade to 0.26.5

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      | 2 +-
 ...1-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 0
 ...01-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch | 0
 .../recipes-devtools/grpc/grpc_1.24.3.bb                        | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-networking => meta-oe}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename {meta-networking => meta-oe}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename {meta-networking => meta-oe}/recipes-devtools/grpc/grpc_1.24.3.bb (100%)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 103c99bb17..1e10c3085f 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -55,7 +55,7 @@ RDEPENDS_packagegroup-meta-networking-daemons = "\
 RDEPENDS_packagegroup-meta-networking-daemons_remove_libc-musl = "opensaf"
 
 RDEPENDS_packagegroup-meta-networking-devtools = "\
-    python3-ldap grpc \
+    python3-ldap \
     "
 
 RDEPENDS_packagegroup-meta-networking-extended = "\
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d09653901c..e04b48f85a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -110,7 +110,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     android-tools android-tools-conf bootchart breakpad \
     capnproto cgdb cscope ctags \
     debootstrap dmalloc flatbuffers \
-    giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
+    giflib grpc icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
     mpich msgpack-c nlohmann-json openocd pax-utils \
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
similarity index 100%
rename from meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
similarity index 100%
rename from meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
similarity index 100%
rename from meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
-- 
2.20.1


