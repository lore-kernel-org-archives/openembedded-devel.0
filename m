Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93A0C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 01:21:14 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.3811.1713576071374052322
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 18:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KE1GN0Fq;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1585880a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 18:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713576070; x=1714180870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNTfbAGu2gK5mOXE0IgjkuoSkgX0uS/lMTUxjZpBhGU=;
        b=KE1GN0FqhhGadh0GaOEgbnPrCAeaRxHRTmDLePgcfOIEoLZoBAl/ibAje6gZyO/0DL
         Gb24yaLivnopnaoQIA1JwoKetp2NRgRmceWSddMOtSG0Bdq92fDXBch3eIGI4aaN9s9y
         IU4MNBjwwfXgHUmx3KyS8zTGVPUpvCb6d0tcjKTS1JmmN7PO4mUdRzH6qR3F21gUEDHK
         vr1nHgUH6GbyHo1jUBQrEHVK1Fmzjasg+HXMYckE/Or2ZsEN/3jQeY6mkMCVjzZ0okpD
         mOt1pU5Pm0l1L50ZDGRL13k04RRYOzDwdmGt6SJ2McD3ihGcFrPVfFXcTsTLyU6oV440
         Bnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713576070; x=1714180870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNTfbAGu2gK5mOXE0IgjkuoSkgX0uS/lMTUxjZpBhGU=;
        b=TivBluJQT00TiGRN9LbTHK/T/h+0t+vQdbWhvnfxyWOELRX65FcOK2VR/YEl3i3v0R
         xDc5igxiwufMX5M2mUvzZCYSIzArpOGOcMNfLyG2DPX89u4iJicq0o6si4UKrG75uyPS
         fZJuTAB8FeYQveRI38jP7HwVpJaGVtsX04uIHL4fGjS/NUl8cJD3DWWwDM3QY9oEMdSu
         xIFoeIBjsJLfTvCE2+VJ7LOTKQ8QK9XCJTsEclJDVFeVWtkgjl8HF68hgp2j2W+K1Fq0
         S4EEq5/y9Kc1URpOVgy9ga+kOpjXLPzuLun0ZgA7tpeC/5PYdKgqfCrwZFRbjCT/mfNi
         2/LA==
X-Gm-Message-State: AOJu0Yx/dLQnBOk4WWL9gX+HwM59gxZHj6Y584d5G6weKu4MRNhdwScj
	9eWe9wlnkao2UDV6o8p5FavuqcOr3pUP/wUZG0d03Myq57oDzFC6tbCkaayP
X-Google-Smtp-Source: AGHT+IE8kMau1eZc6vb6jVdHRDTopgZlMM0viPkbL5IZlP49YbBKQ4MfXgbnOSSXJ+OqV6+D+S1ojg==
X-Received: by 2002:a17:902:f690:b0:1e2:7ea0:c1f2 with SMTP id l16-20020a170902f69000b001e27ea0c1f2mr4935857plg.58.1713576070202;
        Fri, 19 Apr 2024 18:21:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::62f6])
        by smtp.gmail.com with ESMTPSA id j23-20020a170902759700b001deecb4f897sm3978353pll.100.2024.04.19.18.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 18:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++: Fix build and upgrade to latest git
Date: Fri, 19 Apr 2024 18:21:07 -0700
Message-ID: <20240420012107.1957858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Apr 2024 01:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110073

 Fix ptest run while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sdbus-c++/sdbus-c++-1.5.0/run-ptest           | 15 ---------------
 .../recipes-core/sdbus-c++/sdbus-c++/run-ptest    |  6 ++++++
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb | 10 +++++-----
 3 files changed, 11 insertions(+), 20 deletions(-)
 delete mode 100755 meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest
 create mode 100755 meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest
deleted file mode 100755
index 2dc6e1eca1..0000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-set -e
-set -o pipefail
-
-SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
-
-${SCRIPTPATH}/sdbus-c++-unit-tests 2>&1 | \
-sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
-sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
-awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
-
-${SCRIPTPATH}/sdbus-c++-integration-tests 2>&1 | \
-sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
-sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
-awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}' 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest
new file mode 100755
index 0000000000..5e285b39e0
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+set -e
+
+./sdbus-c++-unit-tests 2>&1 && echo "PASS: sdbus-c++-unit-tests" || echo "FAIL: sdbus-c++-unit-tests"
+
+./sdbus-c++-integration-tests 2>&1 && echo "PASS: sdbus-c++-integration-tests" || echo "FAIL: sdbus-c++-integration-tests"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
index f52ba141e1..5422e08dd1 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
@@ -12,14 +12,14 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-exte
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
 PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap,basu"
 PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
-PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${PTEST_PATH},-DBUILD_TESTS=OFF,googletest gmock"
+PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON -DTESTS_INSTALL_PATH=${PTEST_PATH},-DBUILD_TESTS=OFF,googletest gmock"
 
 DEPENDS += "expat"
 
-SRCREV = "30d9f1d46258c2be4ce29b7f7f168ecdf6d4f328"
-
-SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
-SRC_URI += "file://run-ptest"
+PV .= "+git"
+SRCREV = "334fcb8833afb298270531dde369135e4b5b88fd"
+SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master \
+           file://run-ptest"
 
 EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
                  -DBUILD_DOC=ON \
-- 
2.44.0


