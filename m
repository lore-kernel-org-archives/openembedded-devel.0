Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C09BD12674
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3367.1764708255058734350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+ANSlK3;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so61876705e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708253; x=1765313053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rvm1SvOb4UJ+0Z61744XZpg2IwKZaUhIet3rzxgjf0Y=;
        b=B+ANSlK36nPb1UOtQVfG3DZ9webd79q4IxTKdI9o5XcJS3EO0Jj7LAfIwVag7VQ0sB
         az9iXmac10mJX1/MreF5qEpSyX8i3VBu5HQp3mzh7lEGpWZ0H+948yMZecbQwmxrb9kO
         N1IR7fPEc2wVulm9Tv48DZ5N2aK5ae9BQ2aHQ9UZfxsiQX11AORlKYMwoRg/HKtM9DJr
         8Lmaibtub+eAVx7Gwk+mUwhVPuDMSlktawjfmYfh3JFJNe6+sQ6iPm8YsIBptX2pinHq
         L5hjKHjdNVB/uctZvcr5VX918hsBo8MPxcXn0szuP46qwTaya6V3e37qFldu/kZM/lB8
         438A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708253; x=1765313053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rvm1SvOb4UJ+0Z61744XZpg2IwKZaUhIet3rzxgjf0Y=;
        b=rilGHbRNydhUks0CguUtmNy9sKHGBeji1b7BIJfF1kv2NPI7gS/d91rk4d7Lcvt/F9
         QaNYzdUDAcVbiE1JdKTQzX8a76K7yJJA60VswECgvVYIX/Bne0gcNq8v5Ba7TIz0dZDl
         riN+XGl61Wyabi+xORKQ9g9gv65haQm/xpT2Pb1SClU51vlFL8ws6+oIpx0YznXXueoI
         JiuygUuFujkCepCX6vaKSH/9LOhIfoZMhqlxmwEZFGNSqr+4Y33XFuq1SD2TAl1dtryV
         6QqVWT/THFJt4js1O1ueINRHc8sWVHuTHpk7p8QKnnc1CRpwBCpNlGvoeqHIFqK2qGAy
         xGNQ==
X-Gm-Message-State: AOJu0YyLj1F8prBR2gXK4iIdjpCSc2duOlPtK/pHH6MEn6wumlUZgeBi
	uS1cPpLUU9Q50FLmCja22Z/yw/Mq3ax141CBMqUp4s8OkhthNOh6fAzA8DJREg==
X-Gm-Gg: ASbGncvXFdLFtNhuWIWn1Ljw5h3rm5qQBUeeUEuA3nhZ2PSBX+KBk9ehW6jUaWUdf3L
	O50jgAUI9zi9w0X0tjuvWGRMRvy75fnkpT7yVzPa0YqFQkXCX0UMk05b+edCEDUIFM46fnGqko7
	Cupz32f0giBeprmeNZqitJ4IWsOGgqnuQNFMXeH99bKQEJBugp/em5503kbiiSipnkTGTbu29Z4
	TqP322f/wX/x4HCE5wjvL3QNQlZzfHXdAkZlzwADKgxqcNXK71EK+b3mqOel3l7aViLMUcAPoKL
	36CFQ5Xp5PiEy2RuGGs3ovQJxBB8z6L0h4mX9UdFLZ/EKjSMNdlTMKVbWOB+cmEyVS1mbI+yuuc
	uuvY6GkRyl7LEmXuxi7qr5Y4lFHX3gBfpeua+qjjgET0rXnNSsIDFSwEDhoPk5eZxjexTPQRt3N
	alIytyGbQF
X-Google-Smtp-Source: AGHT+IHnW1XpNtFMRbZnKHrRVUBiQ4QwddV4ZjJN2LIo98oHj3YxXhULRu32jhrVNo8GTmvo+Y+ffA==
X-Received: by 2002:a05:600c:1d0d:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-4792a4c00edmr9430075e9.30.1764708253218;
        Tue, 02 Dec 2025 12:44:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 6/6] gupnp-av: add ptest support
Date: Tue,  2 Dec 2025 21:44:07 +0100
Message-ID: <20251202204407.3755450-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202204407.3755450-1-skandigraun@gmail.com>
References: <20251202204407.3755450-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122271

It takes around a second to execute the suite.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-multimedia.inc    |  1 +
 .../gupnp/gupnp-av/run-ptest                  | 12 +++++++++++
 .../gupnp/gupnp-av_0.14.4.bb                  | 21 +++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index 081ace6d22..ec10edfb83 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -8,6 +8,7 @@
 
 PTESTS_FAST_META_MULTIMEDIA = "\
     gssdp \
+    gupnp-av \
     libopenmpt\
 "
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest
new file mode 100644
index 0000000000..0f7504cd3b
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+RET=0
+cd tests
+for t in $(find . -type f -executable); do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
index 21f0449762..28e65e1bfa 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
@@ -6,7 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "gupnp"
 
-inherit gi-docgen meson pkgconfig gobject-introspection vala
+inherit gi-docgen meson pkgconfig gobject-introspection vala ptest
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "21d974b3275cb5dcf5b8aa1d9a3fc80e7edca706935f6fbd004c79787138f8c7"
+
+do_configure:prepend(){
+    # set ABS_TOP_SRCDIR to ${PTEST_PATH instead of the source-dir on the host}
+    sed -i "s!\(-DABS_TOP_SRCDIR=\"\).*!\1${PTEST_PATH}/tests\"'],!" ${S}/tests/meson.build
+    # same for DATA_PATH in the other test folder
+    sed -i "s!\(-DDATA_PATH=\"\).*!\1${PTEST_PATH}/tests\"']!" ${S}/tests/gtest/meson.build
+}
+
+do_install_ptest(){
+    cd ${B}/tests
+    find . -type f -executable -exec install -D {} ${D}${PTEST_PATH}/tests/{} \;
+    cp -r ${S}/tests/gtest/data ${D}${PTEST_PATH}/tests
+
+    # this test is not enabled for execution in 0.14.4 in meson.build
+    rm ${D}${PTEST_PATH}/tests/test-search-criteria-parser
+}

