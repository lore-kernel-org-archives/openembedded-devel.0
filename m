Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBE7C87FC9
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.32564.1753070440037893466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSnjkBf2;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748d982e92cso2564656b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070439; x=1753675239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Cxt3vzxnTdakfZgsjfrgl6Kou9BJmCRZ2zUodHcLsw=;
        b=iSnjkBf2sUMQino9HlUXdCALu1kIx5J/XhETCUZsI4/oomN+ndiUwP9gMKHdKMzSes
         /ij3SqWp5Rp5Oj8k1bl1CVNlaJwKn/+9zfrPpoFuGLc0FjHB2HA5o7YRafD9hesj2xdS
         qCxlSrRmj0/+3qG2e4OnExvyx+OJ6lvC9ydA3qi0A29rVRxHe5dZBAjZv2fjDoyehSiH
         GBPcovEQVXBdczA9EaVig2cOW3T5OKbiAZKicFPnFq9IdaCMvKoKNht1THsm/s26zfKy
         cm9sFsmfBdDr1AAq+zmuRPz5qEWcDQlaAJ/pUM+oslG4osbJsDvPx+IGb6r6fA8CGe1X
         xVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070439; x=1753675239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Cxt3vzxnTdakfZgsjfrgl6Kou9BJmCRZ2zUodHcLsw=;
        b=mRs6eVMoXrh+IrqMaeGM8Tlp2P7keOcn8aaBR3CAsZWR2zVUtayaorcM/hRLzJSSuJ
         I1Vje7Ru2SA3o8hTqgpfIMs2PcKMhoDjJhm/s2hbLrKWXOohMLGzcfgOsmSWawSgOvel
         nAASAWdD+m6IJmgr9flNpwU0TkeWHmOUc9s1BkJe/UqaB0U6QEX38S1tuoKlTADlzhb/
         v7LyolY1Jki1GJ48qrghve6RsMfcBUCJQMBjuF8mu9ZxFDbGgQstcq52rqvhFZt4a8MA
         sIyLAhvN1YsLx3iC16/b+GzvBoDaRA2WPQg9/IMmOUHZkRXZgnaQUQUKtRoJd2Y7DN3i
         OvrA==
X-Gm-Message-State: AOJu0YwcPoDqPkApexiMTzSevibLAHgsjt90X1zHq0PVUPFEifpTPlxc
	tYlVhkZJKu4k/SPEwlcUH7NjLlk86GhXjnehRsDtMPiZeZN2mkz1ETTT0hfiPmsWf0g=
X-Gm-Gg: ASbGnctOy+dPlgnsaKLhSiJQ8OCkTecnW+8CtdEVcaYwRkHUkGuuxh0HRs55jaqlrT7
	BNGx13O4g4NltsOOB/6cysuKLtaFaS312a8LIfk9nIkFYN8dWtgJVdG8KbNCr9Q/FkbmKcc2mU9
	F3s6GcFTDAnL7ibu28u7QfnyZhHYmt1XzZ7vK9ROw8hj6Ohf0VnisYGev+zqzYAjq3UeEBABPYf
	5OdC7Ae4/SYFCnlFbjTaRpaFjSgUOj25OYN0KeyCVnmJMYLoH4JwcUeLHZCGNipHoIYmfkRt5ck
	N3WJeiO8BWAc/24HR3uVk/d0skHSeVl1AvnfUA8AjuZ6KfXZfUjxWVWep2UuQZyG3H6xvhnQdqy
	HD+1RjrXJOOg1GPDEo5MTuQlz
X-Google-Smtp-Source: AGHT+IFj2SigVriH047eMUj4AubPBHsbtu7D2NWtKbJ/60UO2U6QxfpxoXDXNoJ+kFuyJHchHvIssg==
X-Received: by 2002:a05:6a00:1994:b0:749:122f:5fe5 with SMTP id d2e1a72fcca58-756ea7bf7b0mr29624356b3a.18.1753070438863;
        Sun, 20 Jul 2025 21:00:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] nodejs: Fix build on arm64 hosts
Date: Sun, 20 Jul 2025 21:00:30 -0700
Message-ID: <20250721040030.641212-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118650

When clang is used as cross compiler, it confuses gyp
system to enable -m64 option for host pieces of build
and the reason is that it assumes clang to be biarch
by default for all architectures but that maybe true for
x86/x86_64 combo but not true for arm/aarch64 systems

This is a backport from node 24

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-remove-redundant-mXX-flags-for-V8.patch | 133 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.16.0.bb |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
new file mode 100644
index 0000000000..7841a9d7bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
@@ -0,0 +1,133 @@
+From 403264c02edc2689671dbefaf032e3acb4fb713d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C3=ABl=20Zasso?= <targos@protonmail.com>
+Date: Sat, 19 Apr 2025 12:22:10 +0200
+Subject: [PATCH] build: remove redundant `-mXX` flags for V8
+
+They are already set by `common.gypi`.
+
+
+Needed to build on aarch64 build hosts with clang compiler
+Drop it when upgrading to 0.24.x or newer.
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/403264c02edc2689671dbefaf032e3acb4fb713d]
+
+PR-URL: https://github.com/nodejs/node/pull/57907
+Reviewed-By: James M Snell <jasnell@gmail.com>
+Reviewed-By: Marco Ippolito <marcoippolito54@gmail.com>
+Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
+---
+ tools/v8_gypfiles/toolchain.gypi | 91 --------------------------------
+ 1 file changed, 91 deletions(-)
+
+Index: node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
+===================================================================
+--- node-v22.16.0.orig/tools/v8_gypfiles/toolchain.gypi
++++ node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
+@@ -97,33 +97,6 @@
+     # Indicates if gcmole tools are downloaded by a hook.
+     'gcmole%': 0,
+   },
+-
+-  # [GYP] this needs to be outside of the top level 'variables'
+-  'conditions': [
+-    ['host_arch=="ia32" or host_arch=="x64" or \
+-      host_arch=="ppc" or host_arch=="ppc64" or \
+-      host_arch=="s390x" or \
+-      clang==1', {
+-      'variables': {
+-        'host_cxx_is_biarch%': 1,
+-       },
+-     }, {
+-      'variables': {
+-        'host_cxx_is_biarch%': 0,
+-      },
+-    }],
+-    ['target_arch=="ia32" or target_arch=="x64" or \
+-      target_arch=="ppc" or target_arch=="ppc64" or \
+-      target_arch=="s390x" or clang==1', {
+-      'variables': {
+-        'target_cxx_is_biarch%': 1,
+-       },
+-     }, {
+-      'variables': {
+-        'target_cxx_is_biarch%': 0,
+-      },
+-    }],
+-  ],
+   'target_defaults': {
+     'include_dirs': [
+       '<(V8_ROOT)',
+@@ -553,71 +526,6 @@
+           '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
+         ],
+       }],
+-      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
+-         or OS=="netbsd" or OS=="mac" or OS=="android" or OS=="qnx") and \
+-        (v8_target_arch=="arm" or v8_target_arch=="ia32" or \
+-         v8_target_arch=="ppc")', {
+-        'target_conditions': [
+-          ['_toolset=="host"', {
+-            'conditions': [
+-              ['host_cxx_is_biarch==1', {
+-                'conditions': [
+-                  ['host_arch=="s390x"', {
+-                    'cflags': [ '-m31' ],
+-                    'ldflags': [ '-m31' ]
+-                  },{
+-                   'cflags': [ '-m32' ],
+-                   'ldflags': [ '-m32' ]
+-                  }],
+-                ],
+-              }],
+-            ],
+-            'xcode_settings': {
+-              'ARCHS': [ 'i386' ],
+-            },
+-          }],
+-          ['_toolset=="target"', {
+-            'conditions': [
+-              ['target_cxx_is_biarch==1', {
+-                'conditions': [
+-                  ['host_arch=="s390x"', {
+-                    'cflags': [ '-m31' ],
+-                    'ldflags': [ '-m31' ]
+-                  },{
+-                   'cflags': [ '-m32' ],
+-                   'ldflags': [ '-m32' ],
+-                  }],
+-                ],
+-              }],
+-            ],
+-            'xcode_settings': {
+-              'ARCHS': [ 'i386' ],
+-            },
+-          }],
+-        ],
+-      }],
+-      ['(OS=="linux" or OS=="android") and \
+-        (v8_target_arch=="x64" or v8_target_arch=="arm64" or \
+-         v8_target_arch=="ppc64" or v8_target_arch=="s390x")', {
+-        'target_conditions': [
+-          ['_toolset=="host"', {
+-            'conditions': [
+-              ['host_cxx_is_biarch==1', {
+-                'cflags': [ '-m64' ],
+-                'ldflags': [ '-m64' ]
+-              }],
+-             ],
+-           }],
+-          ['_toolset=="target"', {
+-             'conditions': [
+-               ['target_cxx_is_biarch==1', {
+-                 'cflags': [ '-m64' ],
+-                 'ldflags': [ '-m64' ],
+-               }],
+-             ]
+-           }],
+-         ],
+-      }],
+       ['OS=="android" and v8_android_log_stdout==1', {
+         'defines': [
+           'V8_ANDROID_LOG_STDOUT',
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 4bc829f140..0663e8c52e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
+           file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

