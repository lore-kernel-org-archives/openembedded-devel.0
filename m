Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF5D5752F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:16 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id g20-v6so9476152plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2IP90ot/X/DS9nPZElW1ApQGVp/KYs7VHRtK6rCUuz0=;
	b=Gop0ZNWAIVjgITLukqvYASDbi/fwW5b/u8nl+uQvVeNfD6Hp0I/ezOn8Q0AjbMc475
	vnmx9rq6wPsjVT1AJ1Sm26JAuxOkNQeDc6pgU4GKrr6vQ21puU0xv9GRYy0XLr+ClBX2
	3p/bt8Y2ulg/18Odv13Bo7CalshJ3eqsZ0qAjR2+HJQeuV+8/h+9tl+beDBqjf8SNquw
	VTJLC+ICRKaoX7pZ13NcyeqE5xb3hiycgbZjN1AkiWrGCK5ui5cGJk+39gzQJd/3oML8
	NLM46fjo5FkBzADKmxMwQ7aRLlykoDTMHnd2UiBhiX3ZCaPZTvpX8Ir1/P4PWRMCmjVr
	MfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2IP90ot/X/DS9nPZElW1ApQGVp/KYs7VHRtK6rCUuz0=;
	b=ZgPM1RYhgH8B3fzz29fp7d9d1M9u6zsxbp+XBxTNHqW9Qq5gx0TOA3SCQmdjeDMHhd
	nS2zx4254XaLl5AdzwrZ8t1IX3kwi6dzVSn/Qx6h7g1m7HcR3lT4CpCpbzpV+B9LY6c5
	Bkt881i4tjRp1By+LdQvJKoGTX8E52bAiJk155sIkKTa0/qJElBcGBj2VA3Nkw3eHBu5
	CHuYOsK/9n726FHVe1SEWnLVtJvzU7owciCBYjIk84Wf2Ck8XgKLW0jFES2M1Fg6gEdC
	qcBaryfdRso3cLDlP9rRpxWsOOh85a7BgFfaKCsUuUYPg9hY1Jx/AyA4/7BgVjsWeR2K
	o5UQ==
X-Gm-Message-State: APt69E19SJQEZYJTwOGPCtkrQq4bqXGCnVaDpUlXvjPq/qlqNE5wVpYc
	3NOzKXVjIVL0mQQgzAU+O7Nbgg==
X-Google-Smtp-Source: ADUXVKJ7XDf0mr3vLISWFSFdmRY4MOqTc/rEAR6ZBSrsSdkUdwEqddsKAvk4KG6m7gJ37MIuBe/k2Q==
X-Received: by 2002:a17:902:284b:: with SMTP id
	e69-v6mr9459091plb.240.1528526657697; 
	Fri, 08 Jun 2018 23:44:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:12 -0700
Message-Id: <20180609064415.10270-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180609064415.10270-1-raj.khem@gmail.com>
References: <20180609064415.10270-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] cpprest: Fix build with gcc-8
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-disable-more-Werror-warnings.patch   | 48 +++++++++++++++++++
 .../recipes-support/cpprest/cpprest_2.10.2.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
new file mode 100644
index 0000000000..febfd5bc96
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
@@ -0,0 +1,48 @@
+From ee92f84a96a507b0a7a3c54929ce190ee28b4ecd Mon Sep 17 00:00:00 2001
+From: Alexander Moriarty <amoriarty@fetchrobotics.com>
+Date: Wed, 6 Jun 2018 10:38:43 -0700
+Subject: [PATCH] disable more -Werror warnings
+
+gcc-8: -Wno-format-truncation
+
+clang-6: -Wdelete-non-virtual-dtor
+clang-6: -Wunused-lambda-capture
+
+removed duplicated: -Wno-reorder
+
+This fixes #778
+
+Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/pull/779]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Release/CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
+index 1267aff1..fb291ccd 100644
+--- a/Release/CMakeLists.txt
++++ b/Release/CMakeLists.txt
+@@ -166,12 +166,12 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes -Wno-pointer-arith")
+   elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
+     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
+-    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
++    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
+     set(WARNINGS ${WARNINGS} ${LINUX_SUPPRESSIONS})
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
+   else()
+     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
+-    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
++    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
+     set(WARNINGS ${WARNINGS} ${OSX_SUPPRESSIONS})
+ 
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
+@@ -184,7 +184,7 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
+ elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
+   message("-- Setting gcc options")
+ 
+-  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code)
++  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code -Wno-format-truncation)
+   set(LD_FLAGS "${LD_FLAGS} -Wl,-z,defs")
+ 
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-strict-aliasing")
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
index 1dbe093bee..a8de01218a 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://fix-cmake-install.patch \
            file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=.. \
            file://0002-Define-virtual-destructor.patch;patchdir=.. \
+           file://0001-disable-more-Werror-warnings.patch \
            "
 
 # tag 2.10.2
-- 
2.17.1


