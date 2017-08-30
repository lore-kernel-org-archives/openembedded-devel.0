Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 092D97831C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 15:16:39 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e204so2131937wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VU0aziFjLarskQ6VwB9yY/tW6UDhgGgQEDBY2NOEPXs=;
	b=bUbQSXc4e0LHs3dUsMZ1fIHEBZGnZBVdpey0sth+M/4lML+ZtkKmFe3KAe0wn1IEhX
	MJ4Wq5Hls4NJ96Obd7uOPzA+xOhlaM9uefkeiNot8nPFzK2PCBAzt/UNErXT84dkqW4t
	pYgRel1OFV0bUORY/7zCM7HKDBX+8SHTfnoq7garfNZU+le7DFRnMwVP8l5NhuOxEIi1
	DmyV5LcMNBdF7Ahls3P6jx8hXMbxRR5mBYL73GaP/nuVnH92SmoGksWLvoKmy8UH8wIU
	8aDfECe8qg5NpwtydfGPjy7vPTlNU7hx3NB7ht8SysjSDK+zQhfN8GpHusUNSIb1WwHX
	N93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VU0aziFjLarskQ6VwB9yY/tW6UDhgGgQEDBY2NOEPXs=;
	b=BgI0rTwQ+aXZ6JoO9B5E7GQ/dn+GDCfOjiTwtt4zWxRvBM0xDYM/xjkcmAHDHXYxu/
	BHJArdIMgtv0YUXu8fseF6Yeh7YOl5yiEEWWXgTfIFa4Cpj31KgrUiP3Phz8F/ZfYmw1
	MSseGB4kWbaJn4SUayJWiuUtvCyFiJ44lgLoso1YdqIOD3g885uE1XlEbTB7VnPD3xQW
	0+1bdVt1zXKJ/2nlf84aHmpoZlt9HjyOqlUuz2TPLtOPOTC1Mr3CdDgSfW6KxYYSGRfw
	Bz2zUzHGmgzA6vb5TgmTCp9+8pAmh4qQbSL34ya7/VLYK6fli4M3bDyZKelPijkxnmez
	Meng==
X-Gm-Message-State: AHYfb5h78B6cHntxWzjVRh1ZEZlYQh1WAK6pty9ucMiOROnQ09uZD2qn
	9f40PdxhIPbPfIOpZDw=
X-Received: by 10.80.149.180 with SMTP id w49mr2034643eda.254.1504106200509;
	Wed, 30 Aug 2017 08:16:40 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.200.238]) by smtp.gmail.com with ESMTPSA id
	l50sm5168591eda.21.2017.08.30.08.16.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Aug 2017 08:16:39 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 17:16:29 +0200
Message-Id: <1504106189-26931-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] librcf: link to libatomic
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
X-List-Received-Date: Wed, 30 Aug 2017 15:16:40 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In commit 1d594f18f66700f0b2c03b7acf1104a825b155b4:
[ librcf: Add -latomic to LDFLAGS ]

I added '-latomic' to LDFLAGS, which worked for clang 3.9 but it does
not work for clang 5.0, seems the linking order matters for clang 5.0,
it should be after -lrcf.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch | 2 +-
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb                       | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
index cd0d143..560c3a6 100644
--- a/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-Add-CMake-build-files.patch
@@ -53,7 +53,7 @@ index 0000000..f6e24be
 +####################################################################
 +INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
 +
-+SET (LIBRCF_LIBRARIES "-lpthread -ldl")
++SET (LIBRCF_LIBRARIES "-lpthread -ldl -latomic")
 +INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/include)
 +
 +IF (LIBRCF_USE_OPENSSL)
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 46b75c5..43eff72 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -23,8 +23,6 @@ SRC_URI[sha256sum] = "bbfcc88de502c39604878c395f516b03fff4eac63eb4f7f44c07d43383
 
 S = "${WORKDIR}/RCF-${PV}"
 
-LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
-
 inherit cmake dos2unix
 
 PACKAGECONFIG ?= "zlib openssl sf-serialization boost-filesystem boost-asio protobuf json dll static shared demos"
-- 
2.7.4


