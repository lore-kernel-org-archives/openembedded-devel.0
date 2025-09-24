Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326C1CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:55:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.25605.1758747323902457664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PDjcx4CE;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so458657a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758747322; x=1759352122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=okZGnzH9fB5wqSEMAqhN7Rs1LXlJ7ZVIcKdprM4540w=;
        b=PDjcx4CEck7JV3UAM7EgLgLRau8P47ASJQ3x0+u837e9AtdzcPeCIy9V7pA5vZjAkn
         75qgp/83kLuFZZWD5LEA/1r7y4EyTXUZbFVngw38i58i9JMhDIHnpfEhC7xkIFL7mqZs
         igehUh70UnyIgz6SP9rEeDSfFu8s6haLFMsF4V6RbcEBKBYeBB5UN8H3rUH21JiQpKC3
         MBssQAaui6l7hZs3O12YA8eE4XFgU6MkJy2R9FkWzInZRhz+wVmWxQt4t4c3qq0/g6AQ
         Y2GMOU65hOn7CB+0rHmejiiuj/STF6eBNVL2+Mk41Q2Ma2f+ysoCW8imoa9E/LXyvpfs
         /JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758747322; x=1759352122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okZGnzH9fB5wqSEMAqhN7Rs1LXlJ7ZVIcKdprM4540w=;
        b=QCi/sE3Xt3NS5EC6//Y8jjxjqNDOXuvl5Rr2vs3wHsdGjDgYIf2yBPGUA0melwDuqK
         V5U3cZ1dBtSZ8zUUUhfOCC/kH7gPaw4DBKrDQWbKNVAUAaiPcv5+6QLJ4tbM1MFcd6ha
         UfiW7ZN/2/x4wGaWX+wKGl9skFFZMkuPpDxbFa3EvJKnKPVE493T/DMNtRe2sngmva6q
         0CBDajH8mDYLPZMvsHVr6L+7GP+XPSBgKwUOqNtDfrtYByJJFNUqJp1ekfZSGIRym8Ym
         QcpVa5XX/vodff23/rLxr781uT1f+9sr9oJyIbGq46r+jDvbq1yCal5gVlpyOnL9iVmY
         7Ddg==
X-Gm-Message-State: AOJu0Yy7+Qo2xHecDckzMQef7SPGcNukEnWOJUcTDImS79K6Rig+6Q9M
	X6tQRIj3khP9phPc/nXTUYuzkLy4P4eDTQk4BUUiz4iWXpt7CRlYZjS17szEU1du
X-Gm-Gg: ASbGncuhzWsRRlm1BYo4t8m+FdHiDSP6noCWmRNjD9FEEmSIvGTu+nBoxZWK6vGftnB
	qm4AXnVY4nUgOR5cHVZdozOdLHpKHncm9FY1yiLm+hRQsvv5LUxobfl/7+F1mmcUl72l1COIOLX
	SVpQgonKJeNSXclKL1FxNa1SmShM65ddKfB6PfI98Ao0zNFyCcGDMfU44DN8/3dQft9qmWMmVIq
	nkW4uqZdkUhvvFP92yY3SsnCtVomzIXPu8/udPqCURZLeFSE8YvWfHWkVP8SEEGX6EKmzWwtvYQ
	KXay1RGlrAySTw8O1oiSh30RBH+M4eMoIfR/MP7x/Lu2umDpRQeJPidl2xinbNx60/43wvvhmhP
	r/E3o1ER4KRNChxtuTaDq
X-Google-Smtp-Source: AGHT+IHA56pXnBLG8DOpeCSZputPJ4rM1opE0z8osQB8x7QgYts60qCGl7Om5JA+GG3yyaOWAcL+Gw==
X-Received: by 2002:a17:907:86a6:b0:b28:6440:a85c with SMTP id a640c23a62f3a-b34bc9720a6mr110754866b.50.1758747322052;
        Wed, 24 Sep 2025 13:55:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f76a9sm14021766b.60.2025.09.24.13.55.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:55:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] znc: upgrade 1.8.2 -> 1.10.1
Date: Wed, 24 Sep 2025 22:55:20 +0200
Message-ID: <20250924205520.133070-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119844

The project has switched to cmake since the last update.

The changelog is long, but there is a link:
https://github.com/znc/znc/blob/master/ChangeLog.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_1.10.1.bb | 22 ++++++++++++++++
 meta-networking/recipes-irc/znc/znc_1.8.2.bb  | 26 -------------------
 2 files changed, 22 insertions(+), 26 deletions(-)
 create mode 100644 meta-networking/recipes-irc/znc/znc_1.10.1.bb
 delete mode 100644 meta-networking/recipes-irc/znc/znc_1.8.2.bb

diff --git a/meta-networking/recipes-irc/znc/znc_1.10.1.bb b/meta-networking/recipes-irc/znc/znc_1.10.1.bb
new file mode 100644
index 0000000000..4477068bba
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc_1.10.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "ZNC, an advanced IRC bouncer"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS = "zlib"
+SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https;tag=${BP}"
+
+SRCREV = "29694fd26f5e9ec46731ee13bf66224181984966"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= "openssl zlib icu ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] = "-DWANT_IPV6=YES, -DWANT_IPV6=NO"
+PACKAGECONFIG[openssl] = "-DWANT_OPENSSL=YES, -DWANT_OPENSSL=NO, openssl"
+PACKAGECONFIG[zlib] = "-DWANT_ZLIB=YES, -DWANT_ZLIB=NO"
+PACKAGECONFIG[icu] = "-DWANT_ICU=YES, -DWANT_ICU=NO, icu"
+PACKAGECONFIG[i18n] = "-DWANT_I18N=YES, -DWANT_I18N=NO, boost gettext-native"
+
+do_install:append() {
+	sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g; s|${STAGING_BINDIR_NATIVE}||g' ${D}${libdir}/pkgconfig/*.pc
+}
diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
deleted file mode 100644
index 7356115d53..0000000000
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "ZNC, an advanced IRC bouncer"
-SECTION = "net"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS = "openssl zlib icu"
-
-SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
-
-SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
-
-
-inherit autotools-brokensep pkgconfig
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
-# ZNC has a custom autogen.sh that states that this command is needed *and* expected to fail
-do_configure:prepend() {
-    automake --add-missing || true
-}
-
-do_install:append() {
-    sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
-    sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${bindir}/znc-buildmod
-}

