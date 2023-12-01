Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A7FC10F04
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:11:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.18059.1701418282780995746
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVAPMi0p;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cfb4d28c43so2281965ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 00:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701418282; x=1702023082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8srMqS5ZrlQqu2EetKVj5gYYERRn2GvNlai4HvBMGFc=;
        b=kVAPMi0p13oAEA0pmQZjJorSEKL+tSfsduzmbDHLO8fDgDTsNBZDHxzsmmvQei4bpZ
         ygSwppv5O7OrSWJDZkq/9ahAY3j7+Ey5l+w6tWiv7cTl/EQ8vyQAOW89Tkc1lYLBkcyh
         Iwdt7GsKibVlljTp/l3Z9rHucZv85dw/sC3IOtozW1ZgvypZm+GV31pwhkebZj3p0rDH
         PDvstI5gmGDyaoq+hpAHvTbDzPT5U1seEgB3gOL677A8zc70rQaDuciV3Cp0dVJGHIYY
         j2VVxBkaMSHdiJAPgVJSGzXNo28EcyzI9DK3t1dPyAXiocC6r8X6L/DRKXYxL9ldfnTE
         1QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701418282; x=1702023082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8srMqS5ZrlQqu2EetKVj5gYYERRn2GvNlai4HvBMGFc=;
        b=uqjAoDvYC5Lv7dGh9217cCxRUCFtq/un1fZQNRHM1G/MWF+PVygdfigycWTt2QsRWn
         eolbEvbziuTOeIzoyG3svRUDuEkLhJLaMxzpSaVFtTVZus2OFKH8Ul1mSrkBhoLx8lXE
         jvITz+OEq3Ua9rhjXJNkQ6NBV/8JhMRRv1t83WVzoxNYgCRAHQ2qcI/wpSDhqW9IlnjC
         Z/59G0SQT+pxBdmriJ5pcH61belya+NOG4/JrQqgEgahU7IeCkrbi/QSuRxl1vBINvgx
         ANnLQroVxNK6y3RCo/l+ONbdLS4/ubVNJTZNAyOx91vckDfORl1crK5okenqCq+FCst6
         N0Tw==
X-Gm-Message-State: AOJu0Yw/xAuUuEFFpndbb6v0Sc+1XP4i+mTT+eoQl6xIRv+uMWm6/ZaA
	AYkizy5qs/QzTc595Z+g8v13iPyLXRYFgQ==
X-Google-Smtp-Source: AGHT+IGc+ENHI77q8jYCGLzsh8eG5B8+kuhGUTDI1Lgf1QyRh7WEM6vNIv3TYvxRSw2MnQf1GZT65A==
X-Received: by 2002:a17:903:244e:b0:1cf:dd41:dd4 with SMTP id l14-20020a170903244e00b001cfdd410dd4mr17681185pls.27.1701418281797;
        Fri, 01 Dec 2023 00:11:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090311cb00b001bdeedd8579sm2690409plh.252.2023.12.01.00.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 00:11:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sdbus-c++: Install ptests into PTEST_PATH
Date: Fri,  1 Dec 2023 00:11:17 -0800
Message-ID: <20231201081117.569210-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201081117.569210-1-raj.khem@gmail.com>
References: <20231201081117.569210-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 08:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107186

add rdep on basu and dbus when not using systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest | 4 ++--
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb        | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
index f6ade0c7e4..2dc6e1eca1 100755
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
@@ -4,12 +4,12 @@ set -o pipefail
 
 SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
 
-${SCRIPTPATH}/../tests/sdbus-c++-unit-tests 2>&1 | \
+${SCRIPTPATH}/sdbus-c++-unit-tests 2>&1 | \
 sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
 sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
 awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
 
-${SCRIPTPATH}/../tests/sdbus-c++-integration-tests 2>&1 | \
+${SCRIPTPATH}/sdbus-c++-integration-tests 2>&1 | \
 sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
 sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
 awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}' 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
index 869bfa951f..ca91b351ed 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
@@ -10,9 +10,9 @@ inherit cmake pkgconfig systemd ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
-PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap"
+PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap,basu"
 PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
-PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF,googletest gmock"
+PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${PTEST_PATH},-DBUILD_TESTS=OFF,googletest gmock"
 
 DEPENDS += "expat"
 
@@ -39,14 +39,13 @@ do_install:append() {
     fi
 }
 
-PTEST_PATH = "${libdir}/${BPN}/ptest"
 do_install_ptest() {
-    install -d ${D}${PTEST_PATH}
-    cp -r ${B}/tests/sdbus-c++-unit-tests  ${D}${PTEST_PATH}
+    DESTDIR='${D}' cmake_runcmake_build --target tests/install
 }
 
 FILES:${PN}-ptest =+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
 
+RDEPENDS:${PN}-ptest += "dbus"
 # It adds -isystem which is spurious, no idea where it gets it from
 CCACHE_DISABLE = "1"
-- 
2.43.0


