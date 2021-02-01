Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.39379.1612205763805733981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 10:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ku3kmqP6;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id q20so12214274pfu.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Feb 2021 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HGIxkAxWud1stUWdDKIqza9q8lmqsAo58sttdH0PLtw=;
        b=Ku3kmqP6E+JMNqhRgWzeS5K6dPxzWgBLWjXAheXcEP4nBTK4Cc5/V9dWC0HIAToiou
         U/vSrEIW9sMevgHkfOSDa1kuyGFA1MAKFhZfQsvObY45jroy8IgvPcgnlzUM07Q2hFwy
         VtP9e+7CxjbH9mj2hAglX+XLLlxxmDS3dJIT1PwAorJyRjiky6daRYbgpYMAFPEaGyD2
         dPwCaSyYK3jKR87R7HeKKVB3PO2Y+tQFufRgxGbDcG7c4qDJatzl9j70VP0PRfMvox3N
         8gDkJfNHzxzUhKzLWDvEGuagmXkwygqMhxNhC1FjsRm0r8UiFdWUL51EfWIk/t+mZdsS
         /I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HGIxkAxWud1stUWdDKIqza9q8lmqsAo58sttdH0PLtw=;
        b=CSu4XDtI1up1lzbbHWUArDxnFgTC4ECqfiBB0FRQCmTZBxnZWMJ/kbxgJDuSpn/3Kv
         si6mrX+BDwLIOCkqfyUAnAOLfVhbY1zhNj3V7nbmtazTa4EGVq8wnAwc/CSa9cHdMw3n
         DqB8aTvcGU+VS540ZJ+QsIvbh2XFr6WUn5X2gLrYlARvOhs17ovTTi1hthKP5XI+tLjZ
         Qre23q/3lV1R+I5HXTxNcHgfEF5ooGOJe/+HNZivtkkW3rdygl0JbohnRlJEmjdOWFFj
         g696YrFdfPmeI7KhMpyOLY9lKBLRHg88ME4MZklBI0ceLPFGsQGOGg0UaXoQ8zFrO4DD
         ovXg==
X-Gm-Message-State: AOAM532Q9VIqpR1/Y/8lM1EVjLaTyBe4RGuao7trJ26+gbucMRsV/ecZ
	MYNX0A9Z/D2luRbi/XZBxKiGi4LzU+rjgw==
X-Google-Smtp-Source: ABdhPJwTSOteUvWEpf2paKiMA/ejbvh3n7HlQUUJB8fdYmC7qfr3LAUY1Z9FXcvoyCE4+TMiAx0F6g==
X-Received: by 2002:a62:d40a:0:b029:1b4:ca2f:2074 with SMTP id a10-20020a62d40a0000b02901b4ca2f2074mr4015159pfh.45.1612205762935;
        Mon, 01 Feb 2021 10:56:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id y4sm135992pji.34.2021.02.01.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 10:56:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cereal: add cereal a header-only c++11 serialization library
Date: Mon,  1 Feb 2021 10:55:59 -0800
Message-Id: <20210201185559.367902-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 ...cense-files-for-components-of-cereal.patch | 99 +++++++++++++++++++
 meta-oe/recipes-devtools/cereal/cereal_1.0.bb | 26 +++++
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
 create mode 100644 meta-oe/recipes-devtools/cereal/cereal_1.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 94830e2970..ba85596995 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -961,7 +961,7 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
 # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
 # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
 # spdlog span-lite uthash websocketpp catch2 properties-cpp cpp-netlib
-
+# cereal
 # rsyslog conflicts with syslog-ng so its not included here
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch b/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
new file mode 100644
index 0000000000..0000ab9197
--- /dev/null
+++ b/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
@@ -0,0 +1,99 @@
+From 481b2aa46b3f54d9bee059d9da68263edece2bb3 Mon Sep 17 00:00:00 2001
+From: Adam Miartus <adam.miartus@softhows.eu>
+Date: Mon, 1 Feb 2021 16:15:01 +0100
+Subject: [PATCH] add license files for components of cereal
+
+Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
+---
+ include/cereal/external/LICENSE               | 21 ++++++++++++++
+ include/cereal/external/rapidjson/LICENSE     | 13 +++++++++
+ .../external/rapidjson/msinttypes/LICENSE     | 29 +++++++++++++++++++
+ 3 files changed, 63 insertions(+)
+ create mode 100644 include/cereal/external/LICENSE
+ create mode 100644 include/cereal/external/rapidjson/LICENSE
+ create mode 100644 include/cereal/external/rapidjson/msinttypes/LICENSE
+
+diff --git a/include/cereal/external/LICENSE b/include/cereal/external/LICENSE
+new file mode 100644
+index 00000000..66300b68
+--- /dev/null
++++ b/include/cereal/external/LICENSE
+@@ -0,0 +1,21 @@
++Copyright (C) 2004-2008 René Nyffenegger
++
++This source code is provided 'as-is', without any express or implied
++warranty. In no event will the author be held liable for any damages
++arising from the use of this software.
++
++Permission is granted to anyone to use this software for any purpose,
++including commercial applications, and to alter it and redistribute it
++freely, subject to the following restrictions:
++
++1. The origin of this source code must not be misrepresented; you must not
++  claim that you wrote the original source code. If you use this source code
++  in a product, an acknowledgment in the product documentation would be
++  appreciated but is not required.
++
++2. Altered source versions must be plainly marked as such, and must not be
++  misrepresented as being the original source code.
++
++3. This notice may not be removed or altered from any source distribution.
++
++René Nyffenegger rene.nyffenegger@adp-gmbh.ch
+diff --git a/include/cereal/external/rapidjson/LICENSE b/include/cereal/external/rapidjson/LICENSE
+new file mode 100644
+index 00000000..4546f15a
+--- /dev/null
++++ b/include/cereal/external/rapidjson/LICENSE
+@@ -0,0 +1,13 @@
++Tencent is pleased to support the open source community by making RapidJSON available.
++
++Copyright (C) 2015 THL A29 Limited, a Tencent company, and Milo Yip. All rights reserved.
++
++Licensed under the MIT License (the "License"); you may not use this file except
++in compliance with the License. You may obtain a copy of the License at
++
++http://opensource.org/licenses/MIT
++
++Unless required by applicable law or agreed to in writing, software distributed 
++under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
++CONDITIONS OF ANY KIND, either express or implied. See the License for the 
++specific language governing permissions and limitations under the License.
+diff --git a/include/cereal/external/rapidjson/msinttypes/LICENSE b/include/cereal/external/rapidjson/msinttypes/LICENSE
+new file mode 100644
+index 00000000..e3d96f8f
+--- /dev/null
++++ b/include/cereal/external/rapidjson/msinttypes/LICENSE
+@@ -0,0 +1,29 @@
++ISO C9x  compliant stdint.h for Microsoft Visual Studio
++Based on ISO/IEC 9899:TC2 Committee draft (May 6, 2005) WG14/N1124 
++
++ Copyright (c) 2006-2013 Alexander Chemeris
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are met:
++
++  1. Redistributions of source code must retain the above copyright notice,
++     this list of conditions and the following disclaimer.
++
++  2. Redistributions in binary form must reproduce the above copyright
++     notice, this list of conditions and the following disclaimer in the
++     documentation and/or other materials provided with the distribution.
++
++  3. Neither the name of the product nor the names of its contributors may
++     be used to endorse or promote products derived from this software
++     without specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
++WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
++MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
++EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
++PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
++OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
++WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
++OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
++ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb b/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
new file mode 100644
index 0000000000..db647219cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "cereal is a header-only C++11 serialization library"
+HOMEPAGE = "https://uscilab.github.io/cereal"
+LICENSE = "BSD & MIT & BSL-1.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23 \
+    file://include/cereal/external/rapidxml/license.txt;md5=d63ab70ba21ca0544b03284958324301 \
+    file://include/cereal/external/LICENSE;md5=b07578c9df99c0b8b45eb041efd4a645 \
+    file://include/cereal/external/rapidjson/LICENSE;md5=e7abb663111d4ac17cf00323698aff08 \
+    file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
+"
+
+inherit cmake
+
+SRC_URI = " \
+    git://github.com/USCiLab/cereal.git;protocol=https \
+    file://0001-add-license-files-for-components-of-cereal.patch \
+"
+
+SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
+
+EXTRA_OECMAKE += "\
+    -DCEREAL_INSTALL=TRUE \
+    -DJUST_INSTALL_CEREAL=TRUE \
+"
+
+S = "${WORKDIR}/git"
-- 
2.30.0

