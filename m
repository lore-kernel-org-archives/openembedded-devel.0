Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.11173.1608908118259002376
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 06:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OrzNcK2L;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id w5so4534976wrm.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cWdnUK7/cBJW3cVFn3y7C2rmcDc8WzJnVdZTChC8WD4=;
        b=OrzNcK2L3Uyi6dSQelW1KbGb+0ZkJGq8xwbBOC7k7iMNIWVUCjK0BrIUsvvC5L5C+N
         h46nCYnvU/iNFWG1DKzg+djyxRtE0zudIYL4m0DNcYfdwLxU29As5cr6jhPMpbJPFd5J
         ffh4kl8OnhKsg4MxABRKMUeBR2OtnclEeZf93QPZXSctsYiA1R/P9YRJjC3u5RKlOtcP
         egNpqA+3YPqtoB2bPLRwDh6DF1W5+yBHHRMgnlwtAm0ZweZTgNj77yJZ6Zi2OXdTVGT4
         ZIQr1VirdXS7s1ZsGPoQ5BC9TpztyOYwHBY8rjYggJ2ag/LzUOSfffdRCTimtQ/YDaZw
         X7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cWdnUK7/cBJW3cVFn3y7C2rmcDc8WzJnVdZTChC8WD4=;
        b=W89v+hvUI/Y7mTN3fnwRv1YCdHWnUnI/ARwCu13fBgDdGt76E9Di6ic+oVZJU+2vi1
         cElkFpp4+go2bNKmzthmDx/mPWxLQjtaYMSsMgmaOIB5hPoeSzYuisPZCAt9/TWbEknJ
         usxF6v2wF9kAhbntmvz/YNnWNiJfgI95uAenEF8jd3g75P9IttZ08d3ThRR8uIhzOVhn
         bJd+ZKAJaxg5UrvCXPHLBx+o6ZluQADcuZ/iV1lmpybkar4gQUqNp+gYbHyTB2tQ7j70
         a4/1EY1Sv5Rw1nWhlpkJWbdHv771wrXQAD1GM0/NfJJwaBwAKwDTsYUbOejsfOsKhaGx
         /+2w==
X-Gm-Message-State: AOAM532CuR0IzlQFxZ1A5hGEb9CyOARGCX0MBfvIsaeifSbvR/FUJaud
	sJynRqYcV14EeNuaRjs/RDUDqjVQUXZgJQ==
X-Google-Smtp-Source: ABdhPJwWxYqRlDUWhoyrGg+EXRWEkE/W9kijN1IYdbhYW5RtU9xGLsMm71YQemqrTTLxlVTKZJNpLg==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr38392818wra.275.1608908116445;
        Fri, 25 Dec 2020 06:55:16 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id v189sm8756317wmg.14.2020.12.25.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 06:55:15 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH] yaml-cpp: add new recipe
Date: Fri, 25 Dec 2020 16:56:37 +0200
Message-Id: <20201225145637.25443-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

yaml-cpp is a YAML parser and emitter in C++
matching the YAML 1.2 spec.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../yaml-cpp/yaml-cpp_0.6.3.bb                | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
new file mode 100644
index 000000000..48e9c6fba
--- /dev/null
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
@@ -0,0 +1,24 @@
+SUMMARY = "yaml-cpp parser and emitter library"
+DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."
+HOMEPAGE = "https://github.com/jbeder/yaml-cpp"
+SECTION = "devel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
+
+PV = "+git${SRCPV}"
+# yaml-cpp releases are stored as archive files in github.
+# download the exact revision of release
+SRC_URI = "git://github.com/jbeder/yaml-cpp.git"
+SRCREV = "9a3624205e8774953ef18f57067b3426c1c5ada6"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES_${PN} = "${libdir}/libyaml-cpp.so.*"
+EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"
+
+do_install_append() {
+    install -d ${D}${includedir}/yaml-cpp
+    cp -r ${S}/include/yaml-cpp ${D}${includedir}/yaml-cpp
+}
-- 
2.17.1

