Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 296597FCCA
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:13 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id q8so14723849pfh.7
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ftPKU1bUB+kiV0e90qKWzAk6atzAqUAOorqoxgJHtXw=;
	b=T1KroNCSEd0oLMnEuYb6NpYXhpZSCfuf+0Y6g3hgmt+JibEok7Uu1HYCHC4X1EGflj
	hDuPhOiq+/63g+yWAVrv4JC4N9utRZOWGn+oNBM4GhNqinEVZkpGiV3vAPYFo48OE3vI
	y5ZvVYXv/L8LKI2uNa4MO2e75MN17kQ09q4+LX4E32VUy0li7rWRoci+m9MqLD0m9VTt
	r+aIxFvAeRCfihmSVJbR3seZv7mUMi65LQdA3duoKSibc63ngjty5GsHDX6XyAgYX8qf
	N0R6jABx6CgQxinNTlPiUSNgu67V6a2S9AthRvhK48d7ncUFZjxfrz+iQQU4Of0Qpd1r
	yrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ftPKU1bUB+kiV0e90qKWzAk6atzAqUAOorqoxgJHtXw=;
	b=jGOVD0nAadkZeqymnBHeExh38f1FvowtWwgZ0K4YBT8I0nZH3wnmorYsUbtCH4q6mR
	YzFHagZIzOK3E51x0qiP7aNTCCspMoxuBHQG+BXmaZI/yMLAdxOH5bjEhW6L82cSPbaf
	H+WX3FYCapey0yuEXd+FtE1HA8MyZtvspEd0V/wDNQea9vZqjx7LZ3hIZBjOmQOcNUPz
	2asQD28ffUd4+dJ71D6mKLB4TSvA09jHnEQt2/rWHZeokFpg61ThfAeLul1K2bF5SI+q
	sZ6c86XUZqiXFR/PViHYkQrJ+Q3midmmqy/5zAmOoRBSi5HdK86mhzaN7XEjlzTdDiGv
	aP+A==
X-Gm-Message-State: APjAAAUk3xmbwdRb58BAhoko740PcMcoYoPvIYhOca3GKAQjmsIaEHLE
	o95yn0CKzK6A4siBU4v9lWbohpXU
X-Google-Smtp-Source: APXvYqw/ZEM9bdJ9c6sR4v8OhHplTBkOQfjfWZGscKILty4CwQKFtAOhyHOLoWX9v4/UIqJvZ4Y+5A==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr13770681pfi.260.1579467015080;
	Sun, 19 Jan 2020 12:50:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.14
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:04 -0800
Message-Id: <c5cf476e8ab0378253675af5d4b6d39083786de0.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 6/8] websocketpp: Fix clang specific flags in cmake files
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:14 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f7030891ef062eeb0e9ca01d4a6191b309e6a307)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 8a2a3e1b8b..97c1df2d5f 100644
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
2.17.1


