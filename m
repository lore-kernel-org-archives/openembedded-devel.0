Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE5D44143
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8288.1765526541489929461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2md6ZJW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so872466b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526541; x=1766131341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2+rtZ32HPi4TuUqbgcKCSA4f5GQUh10X3p2pOTCqnY=;
        b=B2md6ZJW04gYk4RwMubopZbvH9IU3dx6rrlj/ZQCFqN1ouCCJNxFjr10UOKXp59caC
         7SrTZ/7jtaIilUWnY6Pez3kmOHcYzPsF7RUM1bepU4iuDIOZavPKP79RoHghTzN2sm9h
         7MyX1TWJL7CFCktlR+Rbkxzl0Qm0idntV/8qdW/Pbq0cYkElN3OpPwMllK01bxHw+m/3
         WsQUuD4VcqZ99oFFM8uGogL0izMddNpZw7w9MOvw3fxhdW0YhRChhCVLahkaQj6UHcqr
         Oyg+krQ3XpbNXOZZBmK0UrfWpZxHiXP9/c0xpcWa0sWrsxUqN27lcHoPqhKJOBsw9mnJ
         oahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526541; x=1766131341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2+rtZ32HPi4TuUqbgcKCSA4f5GQUh10X3p2pOTCqnY=;
        b=XimWYcNgAzECkr+WCClewkozlp2+gQdkYao5OaI2fWBx5xdNjS5k1qu5J4tqmMtJzb
         DjPTR1kBMm5H5oo/dsSgqbsl3wjVUPW/f/pJAUD5Lb+/MF+S2DtkFt+44CgWwkwkVRzK
         CwhX4nKLaXUEdcaDieTaSyhPkqlCflwbQbthPqMcjoqUiV4iaCz90PgyyxblOxB+swN1
         uMMMkarQ0OnneK01ZZi8nDw70GbKtdQkwlS7AM8p8OAVuiXxIofDo8VWzTZeQ8oP/49E
         0/L4BlHuO4Jq8za3oc2NFystS87FXzANFOCj4Ns5ulV86n/wzdrfAHv8HV9kBxyxMd0q
         0bhg==
X-Gm-Message-State: AOJu0YyJV8wGsSaenwVm4oERqtJt0PMFgFilpb5ru771+mieg4ZEbBAL
	Ys+J2xA5JGWYKpJ3Goi/vB04NU68Rvur6aVv3zrBbHKq8YrL0ImaNC7Ru1vaxg==
X-Gm-Gg: AY/fxX4NlOjLsMUVYFFOUPc13XFIfZ/KAFJu4rKXdsH7hb2UAsvf0s2CepDHJx+hUPz
	yCO7xBc7vYp6pV1BDAZlXng8INEqs7onNtCajazUYCf60v4/uV1ncdxsppd9mHQp/iixu3xA1Xs
	LCZG1eDWoDo5l+qB/xUh1yXqicnxqmGgAOf6CwQAtjtOoP0SSGld5OukcfY2xV0MnuHHlVkcUcW
	0XkW5ZQ3ORmuz6MnOkSxlW8ylWVzE1tfGqkud+87aXH7+/CXVktxx/v0d+XLMOcELA1rV12n908
	Jho5s0tqfnLrLYOV9dQQJijRhg3Njeetp3xROPCjJeruKZsjzk5OV1A++d0pvMgVaA7AN7xubKd
	4lgvAcc9mC7AkHsQHFz/5ImF2ZiQVjsK2feW41kS2MajmC4FP0TOxEnBOCDUP6bbn+smvSZidHI
	Uwngiy+hbN8i6gw8HqI0FrmrE=
X-Google-Smtp-Source: AGHT+IFQdV8Ltd9Eq0CPHSR4wiJmSToPQu4rSXHCHCdmPX5zkXVqBaO8y/NE1AkIzCRk5eO/7tF+Kw==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:4398:b373 with SMTP id d2e1a72fcca58-7f66a075564mr1250214b3a.70.1765526540420;
        Fri, 12 Dec 2025 00:02:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 6/8] gupnp-av: add ptest support
Date: Fri, 12 Dec 2025 13:31:49 +0530
Message-ID: <20251212080151.3711461-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122594

From: Gyorgy Sarvari <skandigraun@gmail.com>

It takes around a second to execute the suite.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 65c2f6de55fa662bce0281046ed3f291c414ff82)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

