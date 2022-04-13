Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E771C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2983.1649828098785517221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 22:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmvTrT2m;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id n22so709902pfa.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3+sZgGY5kI0Pu2JNRQMnGNJ8L+i0VlL52YasqvgDVU=;
        b=WmvTrT2mZoM6Oq5pDl04XH3rnu8PtzjgXqeqUYjPHMTin9YEyTBS3SoFaj6pAnMdUR
         bTljTiBL13kIJnkpCJ5g+J9phfzpNTFtvati2/RqVf9r7UnszXsVbJbRL6qZzzgHOTzf
         +8FsUa99vRDidBMQIuxAfjd6lp4V5e5kLiLbp4omO3SNUrt3XQ1RUGNKzyimaV7HnkHl
         00V7797RFQJoar1RCSIQyF5mvInr4FSLv5M5z7SYK6GhyaRzSGQF522KryiWcCZFmyuY
         PQ9OeNylW7qdCstC5Cp4MGRMCZO6ctCx0bQFKcQHr5uFEjLHj0bB9aV8h7Hp7s5/Yse+
         f9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/3+sZgGY5kI0Pu2JNRQMnGNJ8L+i0VlL52YasqvgDVU=;
        b=zDXu2Md47cFrPXOrAJaUQ3pINkmP7D9VgfwEf2wqOgTh7wAdFg5twQreBqLlQawr3G
         CMbSWGwjh4X9PQJ9h9i8cTUcDS0IqPeY7fs2MGgbCl3142Grm14FWbRt86OafL6xRFx8
         M36+S7zEpBeuqu37YnTS13OZIXBeBlK0mXkJQJkBG4DGazwdJDHNC1fuhheYZzWun2AH
         tX/AMyXaqIt3MpUtNBW/RIM2yXhuHeGVnJw3/Ypf725fDzTsrC6+s9CaLm5lRyGMom+6
         dSjW5/xJJZ1eHAJtFMKbAPdSornxGr4LRtp7zHBi7a/1vwYfL0eWLSpZtNE+T87bdkDE
         wplQ==
X-Gm-Message-State: AOAM532cugzB2dNyk3C6pFzRcGdeQaQEwWux4lzxlbUJtcJyHOvaa8eo
	K1A1D0xn5zWn+VcBWepDK10btMLsVRa3Sg==
X-Google-Smtp-Source: 
 ABdhPJymniXs4qF+q/cwgc76D9fMFpMjSEzGPk9PpU11R1g8H0j7M+m31llCh42aHiZzLWLLmdEIAA==
X-Received: by 2002:a05:6a00:a0e:b0:4fd:fa6e:95fc with SMTP id
 p14-20020a056a000a0e00b004fdfa6e95fcmr41535262pfh.17.1649828097838;
        Tue, 12 Apr 2022 22:34:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j18-20020a633c12000000b0038204629cc9sm4733992pga.10.2022.04.12.22.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 22:34:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] opensaf: Fix build with gcc 12
Date: Tue, 12 Apr 2022 22:34:54 -0700
Message-Id: <20220413053455.1460109-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96606

Use configure logic to disable certain warnings if compiler supports
them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-array-header.patch   | 32 +++++++++++++++++++
 ...-configure-Disable-selected-warnings.patch | 32 +++++++++++++++++++
 .../opensaf/opensaf_5.22.01.bb                |  6 ++--
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0002-configure-Disable-selected-warnings.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
new file mode 100644
index 0000000000..e735d432a7
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-missing-array-header.patch
@@ -0,0 +1,32 @@
+From 6168d43ddd353b92ad8bcd5c49dc68f18caa8a00 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Apr 2022 17:07:49 -0700
+Subject: [PATCH 1/2] include missing <array> header
+
+Fixes
+src/osaf/consensus/key_value.cc:25:30: error: aggregate 'std::array<char, 128> buffer' has incomplete type and cannot be defined
+   25 |   std::array<char, buf_size> buffer;
+      |                              ^~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/osaf/consensus/key_value.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/osaf/consensus/key_value.cc b/src/osaf/consensus/key_value.cc
+index 692dd3f..6e16cbf 100644
+--- a/src/osaf/consensus/key_value.cc
++++ b/src/osaf/consensus/key_value.cc
+@@ -18,7 +18,7 @@
+ #include "base/getenv.h"
+ #include "base/logtrace.h"
+ #include "osaf/consensus/consensus.h"
+-
++#include <array>
+ int KeyValue::Execute(const std::string& command, std::string& output) {
+   TRACE_ENTER();
+   constexpr size_t buf_size = 128;
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-configure-Disable-selected-warnings.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-configure-Disable-selected-warnings.patch
new file mode 100644
index 0000000000..8bb659743d
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0002-configure-Disable-selected-warnings.patch
@@ -0,0 +1,32 @@
+From fe654d5340d18f04e4689ba19f843554909a0c00 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Apr 2022 17:16:37 -0700
+Subject: [PATCH 2/2] configure: Disable selected warnings
+
+These warnings are emitted when compiling with gcc 11 and gcc 12
+Do not treat them as errors
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c28d2d9..2846175 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -601,7 +601,9 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+ fi
+ AC_SUBST(OSAF_HARDEN_FLAGS)
+ 
+-AX_CHECK_COMPILE_FLAG([-Werror=format-overflow],[NOWARNINGS=-Wno-error=format-overflow])
++AX_CHECK_COMPILE_FLAG([-Werror=format-overflow],[NOWARNINGS='-Wno-error=format-overflow'])
++AX_CHECK_COMPILE_FLAG([-Wuse-after-free],[NOWARNINGS+=' -Wno-error=use-after-free'])
++AX_CHECK_COMPILE_FLAG([-Wstringop-truncation],[NOWARNINGS+=' -Wno-error=stringop-truncation'])
+ AC_SUBST(NOWARNINGS)
+ #############################################
+ # List the output Makefiles
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
index 8ce324d306..930755d624 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
@@ -28,6 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-immom_python-convert-to-python3.patch \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
+           file://0001-include-missing-array-header.patch \
+           file://0002-configure-Disable-selected-warnings.patch \
            "
 SRC_URI[sha256sum] = "f008d53c83087ce2014c6089bc4ef08e14c1b4091298b943f4ceade1aa6bf61e"
 
@@ -48,8 +50,8 @@ PACKAGECONFIG[plm] = "--enable-ais-plm,--disable-ais-plm,libvirt openhpi"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
 
-CPPFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation"
-CXXFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation -Wno-error=format-truncation="
+CPPFLAGS += "-Wno-error"
+CXXFLAGS += "-Wno-error"
 LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
 
 do_install:append() {
-- 
2.35.2


