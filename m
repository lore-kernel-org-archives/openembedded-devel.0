Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7EFE776F8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126878.1766604324655326103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GueFn2Uv;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327778df7fso183985f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604323; x=1767209123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2c4g9Whv35WtYY0XC3x60od3hdr7yyoohrOSy6qjch4=;
        b=GueFn2UvbNq7J9eOVWZgZTHD3exSAot6H7GtEc3fxAN3OYSnAFn+enRq4LNncC3vGx
         sToWH/EPD61w5wIbHHxmbDuuPnIMDdUqiWC6KvioTxr/K86gFB4eCSmTMf9iyKsCj4M/
         zpFnCLLBffLSJGvt4gOJ/yyvoOwFA9eCegk65qyRrm+H6e7xv9XV5vGFmDjDbiQU6rvd
         mDLhVpbopXdGNKTiXzB4sDYWNd7bh7JFiwaYXnCvMgdYN1084zQxbuwZ2QU8GSuqC5kz
         BwzB7Xiitz7a//f5Quhj/1lHO7HmzFUB6JmBrwuhDaGUr3wjDCsHQIMP29yxMhVSY4Fn
         HP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604323; x=1767209123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2c4g9Whv35WtYY0XC3x60od3hdr7yyoohrOSy6qjch4=;
        b=G7BGVfySd/XBHmDvMBE8Noly6voRIXJsZ2K+QKi9l+Wgb/kZP6iLvqmPJTOOTBrmvU
         MxYFs1y6Ewr+b4ApfzxRws3afmWQFhzlpeU1Jr7eBtKSEH9fo9BV6Rq93udRR3Rr9TLt
         u+VMQwMH9XiT+EQiSOkeuRHafAXBtMQaxfZhNxubOhy2b+ZLkoGFtYFw2rxFzFjt3d02
         gAeTUfMbHtA6iclQ4FfVCC3rqMHRaYlZw/zfAU8lEfVtGChGgE6UUUHcfj3P31Q6wWNm
         F/MosywtbSeNJxT7XkiNNWEN6jhh6hwxtkX8M//28Kby3qHuDpLnxXCV2ztIqVWJc5Jh
         d8jg==
X-Gm-Message-State: AOJu0Yw6u+8zscJsO+QL+qDXFddeNvUFuJSg5cC+k0/FLAnfFjKlTDL0
	MTn462Jxksv+K1dm61q9iDTa2lv4dc4AqLbd//JpyG8/ejaLAYy9I0fy1w4Prw==
X-Gm-Gg: AY/fxX6pIuvVM3FlQC++r4jK+s37PJ8nqU9oD21wdqY33L7bRUqKp3pDknR4/JenDmM
	EmVYyA7setG+u+s01CLcFNFHLp9Fz0pz+8b4QRMpt06qKmkfp3CxDa2S1JFGp5d1Y4Eitx73F1L
	0w1oSCtgnkaW6fsS5OWzfSNlLaLje0B1heYxtCLmQaP9Cq56qGeLMY6GlPJPawzzn1xlk6J5kbj
	SD5KU7m8V0JB8PwugdLbweeofUsKd61jcolqKb12r+EK0ip1SurCoMD5aQO/syllH5VH1JNkUCT
	IIAH7SSdvgeMEPEXVr74RirI4NsMHUKnpIcCrhZC5PNxZzPpEIhnqNPMz+o1dNahFgdcfoA9lxP
	LbFX82K+NkKfscrqp7xHMG7w/bH7Jb+PGkRU8lAs1xq0vcqxcScy3+rqgz1m9yH54XraJsNJcpZ
	roldncxy0g
X-Google-Smtp-Source: AGHT+IGO9SDsBDuhliHfKZs6QRytojIPwvhNb3E5evrWIZf81IoBR5KCQMQZ2ffVzGCJghauexlY1Q==
X-Received: by 2002:a05:6000:200f:b0:42b:3ee9:4776 with SMTP id ffacd0b85a97d-4324e4c180fmr22447919f8f.5.1766604322899;
        Wed, 24 Dec 2025 11:25:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/6] libmediaart-2.0: add ptest support
Date: Wed, 24 Dec 2025 20:25:16 +0100
Message-ID: <20251224192519.2630037-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224192519.2630037-1-skandigraun@gmail.com>
References: <20251224192519.2630037-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122888

Test execution takes about a second.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-24T15:50
BEGIN: /usr/lib/libmediaart-2.0/ptest
TAP version 14
1..31
ok 1 /mediaart/stripping_failures
ok 2 /mediaart/location_null
ok 3 /mediaart/location_path
ok 4 /mediaart/stripping/nothing-to-strip
ok 5 /mediaart/stripping/case-strip
ok 6 /mediaart/stripping/single-char
ok 7 /mediaart/stripping/single-char-case
ok 8 /mediaart/stripping/remove-parenthesis-round
ok 9 /mediaart/stripping/remove-parenthesis-square
ok 10 /mediaart/stripping/remove-parenthesis-squirly
ok 11 /mediaart/stripping/remove-parenthesis-gt-lt
ok 12 /mediaart/stripping/whitespace
ok 13 /mediaart/stripping/whitespace-with-content
ok 14 /mediaart/stripping/messy-title
ok 15 /mediaart/stripping/unbalanced-brackets-square-start
ok 16 /mediaart/stripping/unbalanced-brackets-round-start
ok 17 /mediaart/stripping/unbalanced-brackets-gt-lt-start
ok 18 /mediaart/stripping/unbalanced-brackets-round-end
[...many lines...]
ok 31 /mediaart/process/failures
PASS: mediaart-test
DURATION: 0
END: /usr/lib/libmediaart-2.0/ptest
2025-12-24T15:50
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc   |  1 +
 .../libmediaart/libmediaart-2.0/run-ptest            | 10 ++++++++++
 .../libmediaart/libmediaart-2.0_1.9.7.bb             | 12 +++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index eb8d4ffe89..0c40d967d9 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -10,6 +10,7 @@ PTESTS_FAST_META_MULTIMEDIA = "\
     gssdp \
     gupnp-av \
     gupnp-igd \
+    libmediaart-2.0 \
     libopenmpt\
 "
 
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0/run-ptest b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0/run-ptest
new file mode 100644
index 0000000000..9a3780da65
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+RET=0
+cd tests
+if ./mediaart-test; then
+  echo PASS: mediaart-test
+else
+  echo FAIL: mediaart-test
+  RET=1
+fi
+exit $RET
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
index e52ee61b74..4b588292f4 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 
+inherit gnomebase gobject-introspection vala features_check ptest
 
-inherit gnomebase gobject-introspection vala features_check
-
-SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b"
 
 S = "${UNPACKDIR}/libmediaart-${PV}"
@@ -20,3 +20,9 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
 EXTRA_OEMESON = "-Dimage_library=gdk-pixbuf"
+
+do_install_ptest(){
+    install -D ${B}/tests/mediaart-test ${D}${PTEST_PATH}/tests/mediaart-test
+    install -m 644 ${S}/tests/*.mp3 ${D}${PTEST_PATH}/tests
+    install -m 644 ${S}/tests/*.png ${D}${PTEST_PATH}/tests
+}

