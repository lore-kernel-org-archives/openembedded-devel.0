Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC962C61D97
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:04:31 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.109244.1674842669370013876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 10:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ga1Yo/lB;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id m11so5341507pji.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 10:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEfF4cnC/ZlruXF0RlkL1Be8heZRn0AknCPATkZdQGE=;
        b=Ga1Yo/lBAsxcNqWJ9505U2HHvkso/kKlfqIVeR3wo5HrRsPYVso24pkCLbbMJyo6wi
         HLNYDDXHzr1aBcbhwa8e+ZMp+M5AcwRTusC9n5SH5bDFLcUxNcfOqVghnp7gq9rBPna7
         6FI5NzJpLElOHN+Tjn4xldPvCZqBnkCeQfqmtnAGk4HtNo1IgIuR0waMFOp3b9lqrq41
         ilp7SAK8dYEGKt/Rzdxusk/aMljp4YZ8M1BGUtxZY9zT4mC+tLV8pSbgPjve5zKhfKF+
         hQU3AdK9xzTa9GuM8j+DwKBgoCm9jI8sPxURh1A3WKYeVvrP5lUEXJAF6koTdoDSrvb0
         V2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEfF4cnC/ZlruXF0RlkL1Be8heZRn0AknCPATkZdQGE=;
        b=8EF2GhglL58NFL2VApXxCuYtZKc5/PUIhWa61uOkaTcY7MPeewhMtyDKz1soT2QDSa
         TfaOH4iTNiPllPDiR2lzLYA5SZG2sedrwQbbtyOpHLSpXX0+JoyBMczaEfmOMsXl0gzJ
         dSI8A0MRXTDcbRlzV35ONkDwXxRWKqpXBBisIZ45kQ6liqOY/dLJNJNrcLgosfP2o3vL
         wNaTR9rXNaH2PyW4X/qhDpqsUamIUh8CyoUJZeOPACG9NuD/x2S8CwnrMWGgHxBzAvsL
         yZAtzZ+HV27jDEsDd25BN4NcPIa878pmHE9FKuPy9uAL41bd9Qz2Q0roc9TZNJC3DxLx
         B8Pw==
X-Gm-Message-State: AO0yUKWwM8wP6dafZHxtJcJPYRMvc0yowA5iMAR/nTEjl+zcXSK9lxdh
	c0X56y9d9SvdyeqBUgVq76W9Vmpp0Kxj4w==
X-Google-Smtp-Source: AK7set+hr3cK8a8+mpraJHurspu4ukJyJNlEoDkQGzssF8nstuDMXTr0CNyLziADmn/R+oE4Hztvyg==
X-Received: by 2002:a17:903:228e:b0:194:7c28:3fa4 with SMTP id b14-20020a170903228e00b001947c283fa4mr7319038plh.19.1674842668327;
        Fri, 27 Jan 2023 10:04:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b00186748fe6ccsm3163554plb.214.2023.01.27.10.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:04:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] waylandpp: Fix build with gcc-13
Date: Fri, 27 Jan 2023 10:04:23 -0800
Message-Id: <20230127180426.754319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 18:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100823

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-cstdint.patch        | 59 +++++++++++++++++++
 .../wayland/waylandpp_1.0.0.bb                |  3 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch b/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..f2169c43c9
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cstdint.patch
@@ -0,0 +1,59 @@
+From 5e3243b163aa5d50083b4036c21f84c1204f2023 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 23:25:05 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/NilsBrause/waylandpp/pull/75]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/wayland-client.hpp | 1 +
+ scanner/scanner.cpp        | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
+index a3f782b..4598a0e 100644
+--- a/include/wayland-client.hpp
++++ b/include/wayland-client.hpp
+@@ -29,6 +29,7 @@
+ /** \file */
+ 
+ #include <atomic>
++#include <cstdint>
+ #include <functional>
+ #include <memory>
+ #include <string>
+diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
+index bebd71e..c25746a 100644
+--- a/scanner/scanner.cpp
++++ b/scanner/scanner.cpp
+@@ -15,6 +15,7 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <cstdint>
+ #include <fstream>
+ #include <iostream>
+ #include <list>
+@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
+   wayland_hpp << "#pragma once" << std::endl
+               << std::endl
+               << "#include <array>" << std::endl
++              << "#include <cstdint>" << std::endl
+               << "#include <functional>" << std::endl
+               << "#include <memory>" << std::endl
+               << "#include <string>" << std::endl
+@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
+     wayland_server_hpp << "#pragma once" << std::endl
+                        << std::endl
+                        << "#include <array>" << std::endl
++                       << "#include <cstdint>" << std::endl
+                        << "#include <functional>" << std::endl
+                        << "#include <memory>" << std::endl
+                        << "#include <string>" << std::endl
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
index 0deed332c6..5ba5aa7940 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -2,7 +2,8 @@ SUMMARY = " C++ binding for Wayland using the most modern C++ technology"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3aae28cc66d61975114c2b14df215407"
 
-SRC_URI = "git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/NilsBrause/waylandpp.git;protocol=https;branch=master \
+           file://0001-include-missing-cstdint.patch"
 
 DEPENDS = "pugixml"
 DEPENDS:append:class-target = " waylandpp-native wayland virtual/egl virtual/libgles2"
-- 
2.39.1


