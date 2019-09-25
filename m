Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 700B17D714
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 21:04:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id y3so7159648ljj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6DTItBvyBjyzI4y4V6Rl+NPJ8O/+03i/vLZhbxpNsQU=;
	b=cD13rHMz1r0A3yftzQ2RxoXrmrBJn69QXGJyydxv9MFRIX3maVdVGhbjHkBCKA5ySB
	3E4APLRMSexKnVsFuhu7rIPAfMJtaZh/dzBCdgBKfjm/kur3lMcFBsKyoxqjf0ofm+RC
	a/7rfVZ42/XNnAsdQ3qnk/JSVA+TRle2oKoZApt1iCeZAhjrSMy5NomeYfLTWvsJfKRp
	JCZkaPCywqqt+DiFADnvwWv1OvbU0dlRlvbQFkyNo0O2sc7SUz8PRVc268tT/FU5Kc15
	O8jnRzkmopqfvki5/CZrNTdD1G0o2d1JoZkWEPLqHlAj6VL3xa+WFtK1kyX3iiAxZGhu
	KcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6DTItBvyBjyzI4y4V6Rl+NPJ8O/+03i/vLZhbxpNsQU=;
	b=qbtVlZrJciOiF3NtMAcPOoermkLfkvZsDFbHvMxMjkY3ZYXWFa7o6BcApmTCEuiQ4A
	PiJJThucBeFjQ2k5F1dF4vdHJ7GGdBadzHtcpPYA/ma3GLxjDS6PwTqkQxWjQQNmetOh
	iKGAptDuP6u1wyTgqHR4nxctnsVKH+DVANOIZJkgEs+EAUkLJNVRtpBTnV5CRVWMuTmW
	CAIm0nCNLnHsI9JUMF3ZH1WSU1B1k9qjFbd1aRkDehJerm1EuOacbH63lByYSS9VH2nW
	+EySJiD19bwNAKMABPcMzVsR+uA7jebPB9LYXvBPDuYflpWT2GPxzPrNVTPEJ4A1TVWw
	zfcw==
X-Gm-Message-State: APjAAAWjm4BTsz+PzjRhmwoZKgDFjL1lyH8jxR7ogt5twjj0ywFVg7OK
	9NIpglQAnIuH1gP6TBwQa4bh2mQxnyw=
X-Google-Smtp-Source: APXvYqw51Pf/BzJiadybQWj2B7GoEM0VvTlUb6epJJ9A/01C59qlHm5+RMR8caYCzrgvE8A1O/vvHw==
X-Received: by 2002:a2e:9713:: with SMTP id r19mr187101lji.81.1569445479318;
	Wed, 25 Sep 2019 14:04:39 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id t27sm31089lfl.48.2019.09.25.14.04.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:04:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:04:35 +0200
Message-Id: <20190925210436.30673-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 1/2] libyui: update to 3.6.0
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
X-List-Received-Date: Wed, 25 Sep 2019 21:04:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1-Use-curly-braces-for-MAKE-variable.patch | 32 -------------------
 .../libyui/{libyui_git.bb => libyui_3.6.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch
 rename meta-oe/recipes-graphics/libyui/{libyui_git.bb => libyui_3.6.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch
deleted file mode 100644
index dbe241709..000000000
--- a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-curly-braces-for-MAKE-variable.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4eed37b1a61458fc8e5251f7cb7c6d64e8e9da8d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Sep 2018 17:48:09 -0700
-Subject: [PATCH] Use curly braces for MAKE variable
-
-Fixes errors with ninja
-| ninja: error: build.ninja:142: bad $-escape (literal $ must be written as $$)
-
-Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/137]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- buildtools/LibyuiCommon.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/buildtools/LibyuiCommon.cmake b/buildtools/LibyuiCommon.cmake
-index cb93307..e6fbefd 100644
---- a/buildtools/LibyuiCommon.cmake
-+++ b/buildtools/LibyuiCommon.cmake
-@@ -122,8 +122,8 @@ MACRO( SET_BUILD_FLAGS )	# setup compiler-flags depending on CMAKE_BUILD_TYPE
-     ENABLE_TESTING()
-     # add a wrapper "tests" target, the builtin "test" cannot be extended :-(
-     ADD_CUSTOM_TARGET(tests
--      $(MAKE)
--      COMMAND $(MAKE) test
-+      ${MAKE}
-+      COMMAND ${MAKE} test
-     )
-   ENDIF ( ENABLE_TESTS OR ENABLE_CODE_COVERAGE)
- 
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/libyui/libyui_git.bb
rename to meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
index d313fb02d..d8a921925 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Fix-build-with-clang.patch \
-           file://0001-Use-curly-braces-for-MAKE-variable.patch \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-PV = "3.3.3+git"
-SRCREV = "50672da835ec9d52766320a44a2677e08a24c99c"
+SRCREV = "8459235919f592b1bc099ecf9a947cb6344b6fa5"
 SRCREV_FORMAT = "default"
 S = "${WORKDIR}/git"
 
-- 
2.17.1


