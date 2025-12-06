Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BC5D3B7DB
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 18:32:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12564.1765045918991007611
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Dec 2025 10:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3C+0Hy/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1472141f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765045917; x=1765650717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdJX4NPvzvR1R3PPRiJKEtkHi+h5v4/ES+5MntKQUNI=;
        b=S3C+0Hy/KQS2kL0GvzwxzykGKIELuLez06E641m6u+/NuEJHu5PGDevhP58Am/ZYys
         JExaVYxKWjUcJtMbOKLiz2N2CYsztzNnFMc0Bsx67zd52DkYmR6gT8Pq8GPZrVTvjLze
         BxMVBBQO+MQd2rlMdihZqBtT2KTD4HqeuXVoBKYbsU+10bRF+N+D9HaSD5kTEFfx3MX3
         kkMwqOE2KKv8hp2arOiMNiaSLVNE5DoASYuymkcKQOeekdWlKi0n/yyKVBzc7q8cLdhw
         /+RWRM22yPl8Fea3tj8RGRH/YSJYCC6KBpJvFIkvu59XPXch9eZriJPJWvsAsOmn/kac
         dh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765045917; x=1765650717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdJX4NPvzvR1R3PPRiJKEtkHi+h5v4/ES+5MntKQUNI=;
        b=j7ANOr7PvCWMwRZd58PDpb1iHFFoom5N2QeQKUOyv7pAd3Sf3l5Ofn5D29Aj9riGGh
         znZfAws89IIF1NslmFFbdwCwFb0FaEsauAIrlqhjik/k/96MG0BfijC3qUguVbd0tGNx
         l6mz3+06piNVNW3K5fZSJCU1jBX10+ak3KvRKOLP/ZJFQRWCNNI994aoR/T+BhMRp8kU
         y3BPY1qE58wOwjl6C7ejV/pGLh2GUNUevTIE0TGBrjX1uHz3CUA4KnojA8+OoZEKLSSq
         SnaHEm7NgjkWv0qBYTyekKzXLyEY0vII/k1Q8x43C48dzExYkVfYdtYI78iol/S660Yg
         ZtXg==
X-Gm-Message-State: AOJu0Yy7GYEtbpHZPq3CCLdiMY+BbJHQEGTYml4rlPaLmDArD75OMk6p
	TMRLTdT8eEcsU1hhVmk91m2fYJEtUzsM6KfsqGJltix84bJV1kSVPxFe05S3NA==
X-Gm-Gg: ASbGncumEdm3NkthgJEwWYCTpWrV/pBazMEwyRPLGev3Fz4uDMDopqHot8Ylc7lnFbO
	nci76ahHlxAnuCjvdAk2LjlyDov3MGXIFzFWKiQURAAVXUZbtLzn+HnsSV05s9miU+KWgnQizGB
	QHN3dMgQYnO/LZkb52oQApPY7/wbg++iIj9z6QtrIx5UFpzj4S+rBCXTTdbiCe17fnAMjBWuTVJ
	2lc7seWUP5VQ/oikfC5P2tSz4x1WHNr2ICWEDfse0u6s3lOw3z8x3hRNlVBhTEab8WvTFs65ty+
	pu3vnKPbHh5Uc4JDaO4GvLFVm6SrQ9zzvhcx2yZNQXsaiLqTYMepKhtCy/IK84aGhUOk2eg8Uzt
	oxw8ppnplTDTX9tum31Da6DwT8HbbxtiGmMcbVG8rlFvFGg/LV4gA5Di+rI0JlmctW1WdVrvHYy
	5kPzc0nU/S
X-Google-Smtp-Source: AGHT+IFqpAC5FGjk1Pvu92Hzt69vAGVG8i8LyhmdGcqdwPr3UP0x9rcGjzF4Pk9JD+uCbNRW6Tv4MA==
X-Received: by 2002:a05:6000:18a6:b0:429:cfa3:5fde with SMTP id ffacd0b85a97d-42f7875ce73mr13323791f8f.11.1765045917206;
        Sat, 06 Dec 2025 10:31:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8a7bsm16101901f8f.4.2025.12.06.10.31.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 10:31:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 3/4] gupnp-av: add ptest support
Date: Sat,  6 Dec 2025 19:31:53 +0100
Message-ID: <20251206183154.3656603-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206183154.3656603-1-skandigraun@gmail.com>
References: <20251206183154.3656603-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Dec 2025 18:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122365

It takes around a second to execute the suite.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 65c2f6de55fa662bce0281046ed3f291c414ff82)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gupnp/gupnp-av/run-ptest                  | 12 +++++++++++
 .../gupnp/gupnp-av_0.14.0.bb                  | 21 +++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest

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
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
index b253c54d92..e4ffa06355 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
@@ -6,7 +6,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "gupnp"
 
-inherit meson pkgconfig gobject-introspection vala
+inherit meson pkgconfig gobject-introspection vala ptest
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156"
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

