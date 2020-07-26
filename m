Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.28820.1595769815689769890
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=RTqAVFri;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id m15so6891770lfp.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 06:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdBrw8Nntvk+Ve3aYzzCa4H6qEwF7zSfJIuon6rX5NM=;
        b=RTqAVFriReTiTgqALOOIGlnERu6xI3FBduwFGQ67e08UiTWZjFPkT0reqn6119BTqL
         cjEsy/ID2gOwJjPcVJR71zuNKsDLwTad8CFUUIx858/We7dzTc5jUduteRGdb0Xf/VcQ
         HVAHYwfsFmkwPQ4Lhf944qjKwm0ncjYHbEAw1Y5EMp1vC2sVM+KnU6G8wwBh+9eah6KW
         Nfuf7CjFijjYO0yUm3lIYUUS+7Var3uUthXvc1ZokXOgOeqgFxHRpp2Ak/Y79HJQNEFB
         hMXTHKvIzCp06itYqjiA5+RfU54QwrO9dWlCTu+2RU0w2ZM+WwjxSp6Zs0DiSMInAYLh
         vvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdBrw8Nntvk+Ve3aYzzCa4H6qEwF7zSfJIuon6rX5NM=;
        b=ohmJH9RRzXuuk1QDJdARmlhTAMzHJWCHk4b0rYjSQq75sNUH5pfvu5pql2MUmYMKxJ
         0lo4o4q0fMOX0+XxCXcLXc3bvKVG2b7TC4vTdyYzjhb83tUOtVrwOpwvDAyIKCHq05o5
         GCmGoiwtzmWX+2H55owXGMM/EVJHrhOxWYHZM2s+GGsL9cpXCWv4+/965aMT8ruNrtMb
         bAk4+2tzA6JGgU2uVHTcT9wLwjlztAyvOYvcfgFcfytGWv1tQazGvv3wUDDhjkxEy1QA
         qN4LjbjJ1G3cQj3HrBoW2avO9AyDXsN6OESLmQfGoMwfMOTztTRbU4EGzxqgG0/dVbXH
         z8NA==
X-Gm-Message-State: AOAM5323JDZgb1wMPev6am/2DwN1RjHEZFGgokbZz7Hf/wocJyfaV6zH
	WOctdzF6XTDT+1A+aa/TdBtAffQKU1A=
X-Google-Smtp-Source: ABdhPJwvE7HSqSVZP52yHlwziLT3qBs2nyYfpZi4Xj8SeTNn/Qm8vZkM68P13Y/BEuFgXskeFxyZgg==
X-Received: by 2002:a19:8c9:: with SMTP id 192mr9476467lfi.204.1595769813494;
        Sun, 26 Jul 2020 06:23:33 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 197sm388377ljf.103.2020.07.26.06.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 06:23:32 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] terminus-font: update to 4.48
Date: Sun, 26 Jul 2020 15:23:30 +0200
Message-Id: <20200726132330.164487-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License checksum changed due to modified copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{terminus-font_4.38.bb => terminus-font_4.48.bb}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/terminus-font/{terminus-font_4.38.bb => terminus-font_4.48.bb} (74%)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb
similarity index 74%
rename from meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
rename to meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb
index c460fc35c7..dc263fda4b 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.48.bb
@@ -6,13 +6,13 @@ AUTHOR = "Dimitar Zhekov"
 SECTION = "fonts"
 
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
+LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9b226721636fde0db38ea656c2aae4bf"
 
 DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
-SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5eed97b7"
+SRC_URI[md5sum] = "a2cb88f6cf174f3d07de93b91e115a8d"
+SRC_URI[sha256sum] = "34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af"
 
 inherit allarch fontcache
 
@@ -32,11 +32,11 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake DESTDIR=${D} psf txt ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
+    oe_runmake DESTDIR=${D} psf ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
 }
 
 do_install() {
-    oe_runmake DESTDIR=${D} install-psf install-acm ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
+    oe_runmake DESTDIR=${D} install-psf ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
 }
 
 PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
-- 
2.25.1

