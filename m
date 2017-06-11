Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78BC7780A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:58:22 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g76so16381038wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IGwwWXjroEx0Qibwk+NGezP6v3EVaDLVGHEpPJxHO/w=;
	b=lul0xsuvBxSg/HKyhzJumKXV3gSIPZ8XqUExnKyGDTHG7ZLPPoXUTdFAafvnHTygtq
	vTcPIqtUIxAmanbbBUWkhd0v2Nnxor3S4c82kKeQ7X+2AHtoRlyb1eFTt+LMu8YvpxMr
	dbz9/N/ej/EP0tfx9Yj3SLhtkbKTxVgdsDhKuGY/IRlueLq/xcjLJxf5koESRpFtCKnH
	Z1Si7oLHoJNcd4XaNEpRfX06pmDm9ChqQe9GrjiTy0W3NKCNabKFFlaf9o9EH0CA/0LC
	a3f4wWCbsoF8QY+S+OszWOfXvNqn0DiCqlqIsrERsi0Dv+Me1NtoCAqTjYWeSu34jGKf
	TpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IGwwWXjroEx0Qibwk+NGezP6v3EVaDLVGHEpPJxHO/w=;
	b=XOljhiGjpk7LErq+CChDJDRzl8PMb1xNd2Y2Pz8dwhBmUrTyvbv/K/zeb5KOCUZTC3
	KRrpTS+aE9iTzm33Bb4M8nh9vh/yYeqALR9/0q7MBgWpnZlRyQHNNivruUXnnq/mJU0k
	2HJ6ZCIcBCNFjU6q7iXKQvixglmtYUCCsEvgJDA1RofKCwYRm9W5ZTucPvHoYt4hBxlc
	gwMtnC764QqCUBy9YZrl3ygQNooXrPLuNjwIUaSFjdVSSpXg/rdP/I1VDVSrWdDyAWnE
	BzyU310yQ4SKVokvdMPe+fDUVaHM27do8Bzl55wefMYYZBSqgzTlPDqbV20gPO+9ZunB
	m7ow==
X-Gm-Message-State: AODbwcDUHs6/zD/Cqy5ZisKTY0axlqw+5UW6I3+ZPQLdorp4qfTibIpp
	/Q91t1qSiqgyQYkuTNU=
X-Received: by 10.80.166.216 with SMTP id f24mr28489628edc.29.1497185903945;
	Sun, 11 Jun 2017 05:58:23 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	b36sm4092944edb.41.2017.06.11.05.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:58:23 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 14:58:15 +0200
Message-Id: <1497185895-3029-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] librcf: convert CRLF to LF
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
X-List-Received-Date: Sun, 11 Jun 2017 12:58:24 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

librcf is developed on Windows system, so CRLF is the line terminator
being used in this project, this can lead annoying patching issues if
the users forget to set autocrlf in git config.

It can be fixed by inheriting dos2unix, hence a convert_crlf_to_lf
task will be executed before do_patch, to convert all CRLF to LF.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-devtools/librcf/librcf/aarch64-support.patch | 16 ++++++++--------
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb        |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
index 28cd0fe..e08efb9 100644
--- a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
+++ b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
@@ -3,11 +3,11 @@ Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
 --- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
 +++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
 @@ -60,7 +60,7 @@ namespace RCF {
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
- 
--#elif defined(__arm__)
-+#elif defined(__arm__) || defined(__aarch64__)
- 
-     const ByteOrder MachineByteOrder = LittleEndian;
- 
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
+-#elif defined(__arm__)
++#elif defined(__arm__) || defined(__aarch64__)
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 51ad7ec..cf0a8e7 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.deltavsoft.com/"
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://license.txt;md5=137c2935b51c95068a8b1bbd434ffe2d"
+LIC_FILES_CHKSUM = "file://license.txt;md5=7586a312b9e978f9d6fac9a5780d1f84"
 
 SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d43383
 
 S = "${WORKDIR}/RCF-${PV}"
 
-inherit cmake
+inherit cmake dos2unix
 
 PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
 PACKAGECONFIG[zlib] = "-DLIBRCF_USE_ZLIB=ON,-DLIBRCF_USE_ZLIB=OFF,zlib,zlib"
-- 
2.7.4


