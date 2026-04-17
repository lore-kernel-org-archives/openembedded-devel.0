Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D54F99C69
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 21:12:17 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55661.1776460329056407079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 14:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QbXhTm/U;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c565dd3a7so1980323c88.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776460328; x=1777065128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CSlY5T7pknSvE7RLBSsGv09aKO6ZlWa+/AXL5h7xvE=;
        b=QbXhTm/UAhnPqhqOzL/QLsFswZNxHeFTJAWiCRLekzf/BaRGux/pK0z8om28PZO/pf
         hyqBhBfSoATvJdgn9h+XmOqz/kAzgODBhaZfwoGVf4WEuaTgfWgo+tdvpWNX9LQ/3+Rl
         /brib5AYtz9hCgnTLzoNKX3Yxe0OYDWt9hpPslyj0WOGZawaXaBSF1bMT8w2Uv65ZjWO
         89Df2sSc3NKXFa31/89KDxVkEbrIP2cEQdy5k8PSdFK9dAnllrIvZCIFtj1TH5Zlo34H
         OSOf+Cuyw681STWVwrk2eaJ4rqLeUv8hjy+kkdNN+XUmHODSKjNZ7+4LESKOxgFk2tix
         umvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776460328; x=1777065128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CSlY5T7pknSvE7RLBSsGv09aKO6ZlWa+/AXL5h7xvE=;
        b=gVn0P62eKgNZ5gQtMPIVTQWl0+tstPlhiIMZnHEYtno5rVuOsm3PD5F26baEK1oBmF
         hBEDf6e6Wq0LfTUae4LN/dlMdhwf1i91iK4zoaTtqK5kqifkp0uDylVeqJIDi9MHgJct
         0pC3sMxqRSA4RYOKzAgbPC5vBaYGU/nwzf/ZwNfQxNQWUbGIBTJthpO8R/ULdd6uX/Rg
         MJiDkQ5Fs4HYPR90Z8It0ux5F3Nlinh6fUG75mPXOdxQNGqVM0+e8FVtz6KTdXLJMCLN
         5e5O6QTAacYQHsZQzdCbn8r0KsosmaSvY68Kj2lJDbssdQNRSZBdWwggFAU4E6UQFNLw
         GF6A==
X-Gm-Message-State: AOJu0YzVOm3zxCqod0barlpVNtuqk76pBVR2PUnCqIuYkILBEavBg0R3
	+BMXG89AJGEVJlVGReQxvMjNFeDA35/0CwV80+YplDAm8+RC35DVhr6iNWYTkr3w
X-Gm-Gg: AeBDievL4Nk6zH+lgav71+E3njV6e533/aRxCD4QD/MyLTixsIqXVCvPzwV7cRL6NYi
	YQUD9ql+bJWkBiPa4oM/R4xivjkGPlIU3SoAjcWxsQesYG2ZuGNBP67rbU8U5XXJD75pRsPiFn1
	dbCSzZxUXGqJfA2aNjdnUxC00dss94tpERjQV17ETa0Swala59rSJu2devQbZQiZY1l7lKpaAUy
	qFlEGdNqeA4WnwzkzlrByRMaXUdHhzFTEWAykRfieNe0c4Toe+4iAoFkqRXk1ysdbiwSD/eG5c4
	7nhv4MqhBvycGpOAGUvv7hZMhdVysOvnusCE1xNz37Z5MBVaq1iDX02PQbmxxGN2mHxVIzjmtWP
	YoJxINGDS6CUGSQPIgJA0UM6yuuk01G4D/+QhNI/JZ8KJ63RJcMQA+eYS/YVwoS1pfsnQarb9+Y
	WiuoG/MGO8gT0VkUVqy4BEOaHu63b7MO4X54tMru/9hI+tAv+TTu62YhtPZdoX9JU8QNgM/xbnk
	UxXR4S07r6sn4tzGr3NXmO6CFk/Sj2Dtcid5bHiYbyUkrMD2Ny+l9ZiF2vFfju3+jgDuewAAS0N
	EVrWgCh/QdlxM+LSVrpCLGYQS9MOicaJcnoQCm4ZRPE0eMXyj85dq3fEcv3WKQ==
X-Received: by 2002:a05:7022:6728:b0:12b:ec67:3529 with SMTP id a92af1059eb24-12c73f781e0mr2458507c88.14.1776460327938;
        Fri, 17 Apr 2026 14:12:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm5834551c88.10.2026.04.17.14.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 14:12:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] liboauth2: Add knob for code coverage
Date: Fri, 17 Apr 2026 14:12:05 -0700
Message-ID: <20260417211205.1332259-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 21:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126451

Keep the knob disabled by default, as it will need
c runtime to provide profiling runtime, which is not
compiled into compiler-rt by default. So it ends up
with build failures e.g.

| aarch64-yoe-linux-ld.lld: error: cannot open /mnt/b/yoe/master/kas-build/tmp/work/cortexa72-yoe-linux/liboauth2/2.2.0/recipe-sysroot/usr/lib/clang/22.1.3/lib/aarch64-yoe-linux/libclang_rt.profile.a: No such file or directory
| aarch64-yoe-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...rage-linker-flag-behind-CODE_COVERAG.patch | 33 +++++++++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
new file mode 100644
index 0000000000..f234cbd50b
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
@@ -0,0 +1,33 @@
+From 7c70315f7f6b4305d761804fb03f8f90ad7572eb Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 17 Apr 2026 14:01:46 -0700
+Subject: [PATCH] build: guard --coverage linker flag behind
+ CODE_COVERAGE_ENABLED
+
+AM_LDFLAGS passes --coverage to the linker unconditionally,
+it causes coverage instrumentation to be enabled even when
+configured with --disable-code-coverage. Wrap it in the
+automake conditional provided by AX_CODE_COVERAGE.
+
+Upstream-Status: Submitted [https://github.com/OpenIDC/liboauth2/pull/74]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a079dcc..a3f991d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,7 +8,10 @@ EXTRA_DIST = autogen.sh ChangeLog README.md LICENSE
+
+ AM_CPPFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -I${srcdir}/include -I${srcdir}/src @JANSSON_CFLAGS@ @OPENSSL_CFLAGS@
+ AM_CPPFLAGS += $(CODE_COVERAGE_CPPFLAGS) $(CODE_COVERAGE_CFLAGS)
+-AM_LDFLAGS = --coverage
++AM_LDFLAGS =
++if CODE_COVERAGE_ENABLED
++AM_LDFLAGS += --coverage
++endif
+
+ LDADD = @JANSSON_LIBS@ @OPENSSL_LIBS@
+ LDADD += $(CODE_COVERAGE_LIBS)
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
index 5b1ecd23dd..83825c69a5 100644
--- a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV} \
     file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch \
     file://0002-Fix-use-of-strchr-with-new-GCC.patch \
+    file://0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch \
     "

 SRCREV = "12571b6d6568c2db7d5f080f60ecb55795c0db19"
@@ -20,4 +21,4 @@ PACKAGECONFIG[memcache] = "--with-memcache,--without-memcache,libmemcached"
 PACKAGECONFIG[redis] = "--with-redis,--without-redis,hiredis"
 PACKAGECONFIG[jq] = "--with-jq,--without-jq,jq"
 PACKAGECONFIG[apache] = "--with-apache,--without-apache,apache2"
-
+PACKAGECONFIG[ccov] = "--enable-code-coverage,--disable-code-coverage,"

