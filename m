Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.3394.1612317680192942943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 18:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxFnyD1C;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id o7so16222465pgl.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Feb 2021 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aa7jqkLYc0akVoxcGJxYpScqMVKQ8dKxLNaGAbUTnaU=;
        b=rxFnyD1Cz24PWKXLTugNW1EYj1MNNaTuUYthl+jXGWFTUl2Q+BBISS+r49shsI6Nv5
         Qf17oIrxtF3suZxFCpqnMkFAvirvv4ZdXd7RpE3eWh5hWzqaSRkn4NtYlBGib+4Rv4Ab
         0heslmWcSGSOBvhcanTtppmpyYu8ZwYLEusFdgFxxorDbSiWpexGcAzxMD/bsRuz6YDj
         udDI4X3XY2zf+BeRiJEQNFq6yuW1TTV6VI8A7D+piQPAuXop9ZRqrjYVmIDt/g8Uv9dc
         ahTK3Pn/jy9zBUlbKYsU4HxGJdpiQLKNF8K96OnECIvxLpOxDSX//VmPhPgIJATkqMRv
         /lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aa7jqkLYc0akVoxcGJxYpScqMVKQ8dKxLNaGAbUTnaU=;
        b=uVx93it5SVDafvT94hLwvcvyOQI6KJm/aOHy9rjd7tySSTxNFkHdEfvBRZ9KKFMm05
         NW6UJoQAFltHM3P4W2uUo90rqXggaPzcdaMZMqpD+oKhDLxPsXhnNIRv8uLMrupaUgPz
         p9HPQS8zeVl6AAd1qBIt0jnyzdspSSkWU1TOvlqb6XfT1vQ10AiuPUUjYKhZyRbZKeW1
         ry4Zt1HnEDt9Uykq2meoLdtovUP5WF8aWcUBVsLj8VcFeJzfN2Kd7Uj7Kc7h+Fa6Fr7I
         Q+DOuKCYNJK4FjFbHt1LLLTYsaV7jGNwYAedaaynlvkIwiazLbgSGyO7S1Yfh6uwT7oh
         sG1w==
X-Gm-Message-State: AOAM531+BnAnEnPs7LSgipW/IuPxHd1AMcfnepQrzm2fU3tNP3CNaIqg
	mk/IQTNmchCJi8B8oEdFahtAQtdGvU5h3A==
X-Google-Smtp-Source: ABdhPJzuch5ooFEb9ICXd12oD7z2T0tN2okOoyN8IaUNuPEK4+S/fCbbrhawPyA/dkzc+vygr//GvQ==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr1079272pgi.3.1612317679131;
        Tue, 02 Feb 2021 18:01:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id j1sm250374pfr.78.2021.02.02.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 18:01:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2] cereal: add cereal a header-only c++11 serialization library
Date: Tue,  2 Feb 2021 18:01:15 -0800
Message-Id: <20210203020115.2759192-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix packaging errors

 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 ...cense-files-for-components-of-cereal.patch | 99 +++++++++++++++++++
 meta-oe/recipes-devtools/cereal/cereal_1.0.bb | 36 +++++++
 3 files changed, 136 insertions(+), 1 deletion(-)
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
index 0000000000..dd3dc189dc
--- /dev/null
+++ b/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
@@ -0,0 +1,36 @@
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
+inherit cmake pkgconfig
+
+RDEPENDS_${PN}-dev = ""
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
+
+PROVIDES += "${PN}-dev"
+
+FILES_${PN}-dev = " \
+    ${includedir} \
+    ${libdir} \
+"
+
-- 
2.30.0

