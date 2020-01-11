Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id C7C596D561
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 16:39:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id z16so2704031pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fRwft9CmSc6GqxTR1HdqWNOw1doLGiO2G6eOT1I3x5k=;
	b=BQS4BO4OTZx12YxvW7oBZk9NpcIsSaaJb1Hl54MI7Rs/ZI4kyGR+i+KVZaKd94Dfi6
	9x/mOWKOr0lWJD2AXP8muX8eAD1cmkWcE/ebY8DmvfEhls9Z7ziiruN6SrS/yYxSKvLF
	GuSiWcVkBAUNpBKDaAgMo6kH5+RRgMZ23AAgpSjHXLEytYnB3YQ/kvzNAlQcDEWnARjH
	v+lfPpWMHvmTg/hj3+5fNwDEpObrsflY0XD0ilG3zusYaPmr4DDkS1s+I1Ymp3e1+Rbl
	eI8KmNYx8CXEwphEK3DyCP5fwAwkQiKO7x3WevqdkHSk6kb4vnyzfAiUG5XW8xxEkgsj
	JHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fRwft9CmSc6GqxTR1HdqWNOw1doLGiO2G6eOT1I3x5k=;
	b=tfkCzER5RT7apJ5+EOHxn85sR7wEgbE++cSrwW6/VuxsEFtcxQzwl5h+hynEt4jy0T
	cRm3MiK9U7hkRCj56OxzkhqQfpZLln2+T+a2tU7hvHUKTKGSGyf9ZWByGjiGpTT29N+h
	SdxQbm2/b1sIQOpkezIlbat/k+FRs5XuM4zWOOfX18ZPuAtgLgOr7Xoo50gPhkLXxnqT
	R5WdCwCmJpwpHd8f1Va7imEXXayqHj+Gx/baNyzBkPqQWDl696JaGFAZuLz5tCQ7RX9n
	8PoLXcMmXtFuhB+qFMs2+4S7l4mijZ2578F77FqNhW4UFBHWNDT1CyRh6ztZBIL+GO8d
	gEog==
X-Gm-Message-State: APjAAAUY9QNfhDTwdKn2XahCUwlRCrl4HYAZUwu9Om43fXvcLMQesMIk
	55UnhmZCV+qXxtHYT7AwMTC/HCPwL14=
X-Google-Smtp-Source: APXvYqzyrduIPB86f7hynqCiWHNGvs28ftZRcGRLwoEkO/RgpezmaqxVbvLXDN7YbG06kjqFA1fFQw==
X-Received: by 2002:a63:1418:: with SMTP id u24mr11493321pgl.279.1578760751534;
	Sat, 11 Jan 2020 08:39:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a983])
	by smtp.gmail.com with ESMTPSA id y6sm7196521pgc.10.2020.01.11.08.39.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 08:39:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 08:39:04 -0800
Message-Id: <20200111163906.675731-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111163906.675731-1-raj.khem@gmail.com>
References: <20200111163906.675731-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] websocketpp: Fix clang specific flags in cmake files
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
X-List-Received-Date: Sat, 11 Jan 2020 16:39:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Correct-clang-compiler-flags.patch   | 32 +++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
new file mode 100644
index 0000000000..4217897284
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-Correct-clang-compiler-flags.patch
@@ -0,0 +1,32 @@
+From 5ccaff351297bca0e254bbfd66e3f03fef9d9c75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Jan 2020 21:54:39 -0800
+Subject: [PATCH] Correct clang compiler flags
+
+Fix misplaced quotes, this was leading to spurious ; in compiler cmdline
+Remove demanding libc++, clang can link with both libc++ and libstdc++
+and platforms have their own defaults, user can demand non defaults via
+adding it to cmake flags
+
+Upstream-Status: Submitted [https://github.com/zaphoyd/websocketpp/pull/859]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2d13117..c17354a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -148,7 +148,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+         endif()
+         set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
+         set (WEBSOCKETPP_BOOST_LIBS system thread)
+-        set (CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++0x -stdlib=libc++") # todo: is libc++ really needed here?
++        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
+         if (NOT APPLE)
+             add_definitions (-DNDEBUG -Wall -Wno-padded) # todo: should we use CMAKE_C_FLAGS for these?
+         endif ()
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 4303f24738..af6d30a281 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
            file://771.patch \
            file://855.patch \
            file://857.patch \
+           file://0001-Correct-clang-compiler-flags.patch \
           "
 
 EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
-- 
2.24.1


