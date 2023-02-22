Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E31C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 22:18:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1001.1677104291748814077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 14:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8KKJyjP;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so4723574pjz.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmBVjeq37COds2BFc1RPKuvmcMZqnpQYdGNuuCF1/bE=;
        b=e8KKJyjPqDmneF1HtTeFlrv195TIuF1HfrAwmAyHAmYQDSnQrU2RFQejA1axBcK9J3
         UEmcMUAZ836dBkpWEevo5n0xNEc6dtMh0LT2OTkiIcekhKE/jaU+r0hjrRnQScMeokGr
         LOtvVI1Kb7j/zImO3B8HSEkH/rffOfopdixWDjHpycwPqTiCmO2KSUwPOcsd//lMt7Jk
         MWsyVUA5us+uWvPfYjnaj0TkFnGytfe97/xYgqv+i9stzkh7NQYr9lgGVYXlfhwRy6QO
         dwlYougHCf60Ghazf+kVSMDXBcXRQ0edSZ1O6B84wR+lx6gRUCMIHak1s687H4g4qu+6
         7yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmBVjeq37COds2BFc1RPKuvmcMZqnpQYdGNuuCF1/bE=;
        b=LTDSviYoActV7gxiKFv8EBNdtxnCjCDPZdSmkQq/7gSjQvKkeK5wYDL1VTqbwnw6r4
         9yxxaJkgNykEpQGPowmmT2pLXrq4lPq2QZQiV6SrTHgg1gcaQ/Pq44V7s7t2tGtcozm5
         RnncE0oyRG6ELzA7kt83pTUpEU4ObpE76eatSFyMc8baHQHaKp/z3+SIrBKhIFA7Qooc
         fiugDGcJAzCp+SuYr3J4oM9R9NSdM13iSpnqMrb6PzGt3MgUp4QBnjjtSRwIRj/WrZ+x
         42X1H1vkab9uP3tbALUK44xL3x0Tv92H5JL2+UaFavWP18S2I2IMlCeLEgLuGj4F7+ES
         xypg==
X-Gm-Message-State: AO0yUKXINQDpnCgXPxblnwil9WW79NfdmMBpojGRQvGi/gcnxY1mK4Uc
	gvTlEH+J5EkInZtvXwpWEq7l3/LDPwI=
X-Google-Smtp-Source: AK7set8iYNe3+50OgYMRrpJ91a2vE/c5bwS4c5uHPFcp7pJfiOVhOpn+Pc8XCF9/G5Xu45XL9fatGw==
X-Received: by 2002:a05:6a20:5492:b0:c7:6cb7:cfbf with SMTP id i18-20020a056a20549200b000c76cb7cfbfmr11004610pzk.10.1677104290616;
        Wed, 22 Feb 2023 14:18:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w4-20020aa78584000000b005a8cc32b23csm2393167pfn.20.2023.02.22.14.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 14:18:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] zchunk: upgrade to 1.2.3
Date: Wed, 22 Feb 2023 14:18:08 -0800
Message-Id: <20230222221808.2738340-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 22:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101221

From: Ross Burton <ross.burton@arm.com>

Add patch to fix build with musl/clang combo

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with musl/clang

 ...-argp-with-source-snippet-with-clang.patch | 29 +++++++++++++++++++
 .../recipes-support/zchunk/zchunk_1.2.0.bb    | 22 --------------
 .../recipes-support/zchunk/zchunk_1.2.3.bb    | 25 ++++++++++++++++
 3 files changed, 54 insertions(+), 22 deletions(-)
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-Do-not-probe-for-argp-with-source-snippet-with-clang.patch
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb

diff --git a/meta-oe/recipes-support/zchunk/zchunk/0001-Do-not-probe-for-argp-with-source-snippet-with-clang.patch b/meta-oe/recipes-support/zchunk/zchunk/0001-Do-not-probe-for-argp-with-source-snippet-with-clang.patch
new file mode 100644
index 0000000000..b5e8e7fd9c
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk/0001-Do-not-probe-for-argp-with-source-snippet-with-clang.patch
@@ -0,0 +1,29 @@
+From 39b66fd1161850822142343507a5d2db241705b8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Feb 2023 14:00:29 -0800
+Subject: [PATCH] Do not probe for argp with source snippet with clang
+
+The test fails with clang erroneously
+
+Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/92]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1817cee..d34c4b9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -57,7 +57,7 @@ if host_machine.system() == 'windows'
+ endif
+ 
+ # argp-standalone dependency (if required)
+-if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
++if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or cc.get_id() == 'clang' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
+     argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
+     if not argplib.found()
+         argplib = dependency('argp-standalone')
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
deleted file mode 100644
index 0baea5032a..0000000000
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "A file format designed for highly efficient deltas while maintaining good compression"
-AUTHOR = "Jonathan Dieter"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
-
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
-
-SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
-S = "${WORKDIR}/git"
-
-DEPENDS = "\
-    curl \
-    zstd \
-    "
-
-DEPENDS:append:libc-musl = " argp-standalone"
-LDFLAGS:append:libc-musl = " -largp"
-
-inherit meson pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
new file mode 100644
index 0000000000..87473815a7
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "A file format designed for highly efficient deltas while maintaining good compression"
+AUTHOR = "Jonathan Dieter"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
+
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main \
+           file://0001-Do-not-probe-for-argp-with-source-snippet-with-clang.patch"
+
+SRCREV = "f16dbeb0831eb37a9397356570327abb97860875"
+S = "${WORKDIR}/git"
+
+DEPENDS = "zstd"
+DEPENDS:append:libc-musl = " argp-standalone"
+
+inherit meson pkgconfig lib_package
+
+PACKAGECONFIG ??= "openssl zckdl"
+
+# zckdl gets packaged into zchunk-bin
+PACKAGECONFIG[zckdl] = "-Dwith-curl=enabled,-Dwith-curl=disabled,curl"
+# Use OpenSSL primitives for SHA
+PACKAGECONFIG[openssl] = "-Dwith-openssl=enabled,-Dwith-openssl=disabled,openssl"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


