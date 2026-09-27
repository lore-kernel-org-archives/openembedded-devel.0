Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46399C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35333.1790506239630186583
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nI22owWA;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso294957b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506239; x=1791111039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Our2qKJwX1mHzTXwM5UdxUcEaFkPYHXWeIbk3tVWso=;
        b=nI22owWARKZDLCpKtEuGugFnzKhU7EW94JAeb21tpMo3HzzNPQhNfvMAFMp+xHTPHu
         b7M7JLD5tybH4PE+oji+XcSif6kTVXSQlbQ3rgl5u8Ejyjb56RVIPI/YmS6WUev/Hm2L
         3LPXC1//nJqZ9n1t1evb7hh1nVMBA4ZhXz4CVXfSkT/+JlLTIGgX7IdUzU9mLOy+/urq
         4agxsAkFzwm9tDrAZB5qIFnbasYKYJSf5rBtJenDpKPOcidTRHFC6EZ3Kp7XRKxETevz
         +vhx9xH/+evGiaAoJ3Zz0KPyrOb5ThtXUKOzneEnp1GRam+mrR/hdCeOjpR0jNgVG0At
         yhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506239; x=1791111039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Our2qKJwX1mHzTXwM5UdxUcEaFkPYHXWeIbk3tVWso=;
        b=WF4U/RyCgxEsMLgAGq6WG49RV74WsEB1wmhASI9WkkwE6H6vbbqp87PxTWXg77FVV0
         LX24qn7gUrfun+UuSFUKWGlBq4XB49hNDuLrxF4+VvC8jH77yQCbqeS0p8gJ4QPz/VV8
         bXosLzH2EJo1GgCcko9Lhx23o9Vituu9+OaxoAFD+H1HVMtvVBpAsHoScFe3xKK7rgBD
         KSa8lg0NBg+vfleG+6Ssf3AnpixNxdvrBBpf2IV76S6mU8mybFZu369pCIZexLcwz/fW
         l38I0/NbqMd+wDEU0EAvx9ZhZgnDIQYFG6BoLb4lkyJ0dT8DxK9B1wExgzhvbSlgq4pQ
         CI9Q==
X-Gm-Message-State: AFuF++nOCaBP9YMXXIGA0RDOQAdgmFEtbVfFijgCwRcW0wDkcXkBjYW9
	ocSmvtwgpiGvN3AyYE6uOUjTW6bYcNN8TAwg22jUXhQ19KE9n/rT88G/zuT+vg==
X-Gm-Gg: AYBFou265cf2v9hFIlISFRoZkZgZmEywM1cGGDBLXSdEkKAo7W3cU484MC8yD1VWrZf
	woeIxLql5Iflllqcn5qjxJ8so8iZ1pt3ZjxrymWQi9QFK3oWEaq+Mk4ka4ldrue+kLl66dh7oXo
	zkVFsm9YuTs/3/gb0wjnnyQj5WYRj/6PtO+fgEn43lg5PPvZGEZOrgIQck9R8HEyF9sAHvx8BEA
	BuO1+z6v1R30AW5+KUQyG/7bqHkP2lgPFQaslfcgaf7xZ2YYVpdRHjZCqaDd7VcGgG7mQu2euPJ
	ef5J8z0IdWdkg4UzDvPiNz3xj9KvgmHMFj5Vr8l/Jsc0ofhSWWz4HU2IgqcQEWjBj5XR0y9UhNm
	ddt5XY+5rtGH2/Z/lUsmLX7HsxuWGK7g042MPv9ZGbgLONlNM4Znei/Gae4BQLubaJGHVFNp9Cu
	TxGOa8q3pL95dEfRv1A5ookX+H89+DSvsNQSlD2KehlKaHWi+la76kfK6qF4H19xA0/bfoSBFmi
	SNpywX4o7n3mMdsIQd1PQ9wC9SfebILuw==
X-Received: by 2002:a05:6a20:748d:b0:3db:710:5ca4 with SMTP id adf61e73a8af0-3de0e6f245emr6165119637.3.1790506238988;
        Sun, 27 Sep 2026 03:50:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 11/35] nftables: upgrade 1.1.6 -> 1.1.7
Date: Sun, 27 Sep 2026 23:49:38 +1300
Message-ID: <20260927105002.1832451-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130345

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

Also drop sed subsitution as upstream adopted python3[1][2].

Changelog:
https://netfilter.org/projects/nftables/files/changes-nftables-1.1.7.txt

[1]https://git.netfilter.org/nftables/commit/?h=v1.1.7&id=9c0ddde6c830d4718cea88160693fdad6cb15137
[2]https://git.netfilter.org/nftables/commit/tests/shell/helpers/json-pretty.sh?h=v1.1.7&id=66dc3bb9962ffc6b06ba50d2ebc0f4c15d2fa63f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...URCE_DATE_EPOCH-for-build-time-stamp.patch | 41 -------------------
 .../{nftables_1.1.6.bb => nftables_1.1.7.bb}  |  6 +--
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.6.bb => nftables_1.1.7.bb} (91%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch b/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
deleted file mode 100644
index f52ff28b21..0000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From fde27e62b241fb7d96de36a2fd6d7879c24f5de6 Mon Sep 17 00:00:00 2001
-From: Jeremy Sowden <jeremy@azazel.net>
-Date: Wed, 28 Jan 2026 18:31:07 +0000
-Subject: [PATCH] build: support `SOURCE_DATE_EPOCH` for build time-stamp
-
-In order to support reproducible builds, set the build time-stamp to the value
-of the environment variable, `SOURCE_DATE_EPOCH`, if set, and fall back to
-calling `date`, otherwise.
-
-Link: https://reproducible-builds.org/docs/source-date-epoch/
-Fixes: 64c07e38f049 ("table: Embed creating nft version into userdata")
-Reported-by: Arnout Engelen <arnout@bzzt.net>
-Closes: https://github.com/NixOS/nixpkgs/issues/478048
-Suggested-by: Philipp Bartsch <phil@grmr.de>
-Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-
-Upstream-Status: Backport [https://git.netfilter.org/nftables/commit/?id=ca86f206c92704170a295b8dc7a41f6448835dde]
-[Adjust patch for 1.1.6]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6825474..527049f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -165,7 +165,7 @@ AC_CONFIG_COMMANDS([nftversion.h], [
- ])
- # Current date should be fetched exactly once per build,
- # so have 'make' call date and pass the value to every 'gcc' call
--AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
-+AC_SUBST([MAKE_STAMP], ["${SOURCE_DATE_EPOCH:-$(date +%s)}"])
- 
- AC_ARG_ENABLE([distcheck],
- 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.7.bb
similarity index 91%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.7.bb
index 9567e8f8b9..d0ce19b742 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.7.bb
@@ -12,10 +12,9 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
-           file://0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
+SRC_URI[sha256sum] = "a6fbf060d8d4fff001517a2b94f356bb4366bfbf0ba366366f9d27cc38caa58f"
 
 UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/nftables/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.xz"
@@ -116,9 +115,6 @@ do_install_ptest() {
     cp -rf ${B}/src/.libs/* ${D}${PTEST_PATH}/src/.libs
     cp -rf ${B}/src/.libs/nft ${D}${PTEST_PATH}/src/
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}/${TESTDIR}
-    sed -i 's#/usr/bin/python#/usr/bin/python3#' ${D}${PTEST_PATH}/${TESTDIR}/json_echo/run-test.py
-    sed -i 's#/usr/bin/env python#/usr/bin/env python3#' ${D}${PTEST_PATH}/${TESTDIR}/py/nft-test.py
-    sed -i 's#exec python -c#exec python3 -c#' ${D}${PTEST_PATH}/${TESTDIR}/shell/helpers/json-pretty.sh
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }

