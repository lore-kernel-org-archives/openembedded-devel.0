Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.5043.1614439377758836406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WgUGHVPT;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id p5so6927397plo.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Feb 2021 07:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3lO7Xu506M6ecRRbOwaCq1GucYM0OZFLHLD70rW/hQ=;
        b=WgUGHVPT+kHz5zAiH/ljXNK+8P2T/sj3VuQRAxsGLEmBqF8ZXijdhpV28jMphfKQW8
         xsps4rEGJb4H0bnSNonV3sGn+GtV1otMRDBo6c8yIfCkPFM1LdPHudDERwtHfDlwloyB
         3aBgK+JB1e3w3p4cRI1Bl3N9oTXvbNR5GUBi1VUkuJPJP2GGYot6qNrgVmgDwT9kOVHC
         p0kqSDMo1mm5PC6AwF5dtzI4VvJKYF3tCYICRnrk2E/fJiFvbgbB3hhqngTo0p6GUFXq
         nI9IAEAMRJ+WWJgNZ4rGTixNVkswpjOmp2JxWrG3bu7OmeFUKLwS6q5YVtP6Bay9AebV
         uSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3lO7Xu506M6ecRRbOwaCq1GucYM0OZFLHLD70rW/hQ=;
        b=HFEJWZTgVa18ox1hRJMPdRiGq2uzjUa+znBQFiK6fsUgzHccVBMC6HqEX2zth8QWKK
         3qqN5Kr5VtH7fmRaHVn9mGmcXPkBlh3fjK4RnLHWzDf/Wyfvh88Gf1UhdD2i496kILP5
         70OC8YneD5g9wxTTIdHzEZ0CrkMn2HZ20DxrTIT0ce9d/O5fdL68c1aOnlB4WYnyOixp
         N+fD8rB511V8AxD0ZLHDx2+MBissluBc1Rjx2aiGRRY/R+OoS/Zk6tjSX2Zr23NLJk3v
         sHYqJNaN1XGJku2hEG48sc6tYycdg460AEV15/K/+3UU3RPkcIIZithFuKnNf7V/czFD
         7n6Q==
X-Gm-Message-State: AOAM530KLD6bkSfAQsWnmmQvI0X6ZEYaG+/z1EXjOo0zMlGzLdFi33LF
	q+2C0bykNQ+yPf+OpK48rpfz3eilDRhFBw==
X-Google-Smtp-Source: ABdhPJwmOUmcy3ylc50GRXBFBvFIdX+1dGQKaGd49FiMyNAKZd3ka6kx6kAgBo3A2yncfn4sqYT/RQ==
X-Received: by 2002:a17:902:a3cb:b029:e3:23b7:ef2f with SMTP id q11-20020a170902a3cbb02900e323b7ef2fmr8000413plb.44.1614439376841;
        Sat, 27 Feb 2021 07:22:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u15sm12645393pfm.130.2021.02.27.07.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:22:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] cereal: Remove
Date: Sat, 27 Feb 2021 07:22:50 -0800
Message-Id: <20210227152250.157722-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227152250.157722-1-raj.khem@gmail.com>
References: <20210227152250.157722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

this component is already configured by 'libcereal'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 ...cense-files-for-components-of-cereal.patch | 99 -------------------
 .../recipes-devtools/cereal/cereal_1.3.0.bb   | 36 -------
 3 files changed, 1 insertion(+), 136 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
 delete mode 100644 meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ba85596995..94830e2970 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -961,7 +961,7 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
 # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
 # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
 # spdlog span-lite uthash websocketpp catch2 properties-cpp cpp-netlib
-# cereal
+
 # rsyslog conflicts with syslog-ng so its not included here
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch b/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
deleted file mode 100644
index 0000ab9197..0000000000
--- a/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for-components-of-cereal.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 481b2aa46b3f54d9bee059d9da68263edece2bb3 Mon Sep 17 00:00:00 2001
-From: Adam Miartus <adam.miartus@softhows.eu>
-Date: Mon, 1 Feb 2021 16:15:01 +0100
-Subject: [PATCH] add license files for components of cereal
-
-Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
----
- include/cereal/external/LICENSE               | 21 ++++++++++++++
- include/cereal/external/rapidjson/LICENSE     | 13 +++++++++
- .../external/rapidjson/msinttypes/LICENSE     | 29 +++++++++++++++++++
- 3 files changed, 63 insertions(+)
- create mode 100644 include/cereal/external/LICENSE
- create mode 100644 include/cereal/external/rapidjson/LICENSE
- create mode 100644 include/cereal/external/rapidjson/msinttypes/LICENSE
-
-diff --git a/include/cereal/external/LICENSE b/include/cereal/external/LICENSE
-new file mode 100644
-index 00000000..66300b68
---- /dev/null
-+++ b/include/cereal/external/LICENSE
-@@ -0,0 +1,21 @@
-+Copyright (C) 2004-2008 René Nyffenegger
-+
-+This source code is provided 'as-is', without any express or implied
-+warranty. In no event will the author be held liable for any damages
-+arising from the use of this software.
-+
-+Permission is granted to anyone to use this software for any purpose,
-+including commercial applications, and to alter it and redistribute it
-+freely, subject to the following restrictions:
-+
-+1. The origin of this source code must not be misrepresented; you must not
-+  claim that you wrote the original source code. If you use this source code
-+  in a product, an acknowledgment in the product documentation would be
-+  appreciated but is not required.
-+
-+2. Altered source versions must be plainly marked as such, and must not be
-+  misrepresented as being the original source code.
-+
-+3. This notice may not be removed or altered from any source distribution.
-+
-+René Nyffenegger rene.nyffenegger@adp-gmbh.ch
-diff --git a/include/cereal/external/rapidjson/LICENSE b/include/cereal/external/rapidjson/LICENSE
-new file mode 100644
-index 00000000..4546f15a
---- /dev/null
-+++ b/include/cereal/external/rapidjson/LICENSE
-@@ -0,0 +1,13 @@
-+Tencent is pleased to support the open source community by making RapidJSON available.
-+
-+Copyright (C) 2015 THL A29 Limited, a Tencent company, and Milo Yip. All rights reserved.
-+
-+Licensed under the MIT License (the "License"); you may not use this file except
-+in compliance with the License. You may obtain a copy of the License at
-+
-+http://opensource.org/licenses/MIT
-+
-+Unless required by applicable law or agreed to in writing, software distributed 
-+under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
-+CONDITIONS OF ANY KIND, either express or implied. See the License for the 
-+specific language governing permissions and limitations under the License.
-diff --git a/include/cereal/external/rapidjson/msinttypes/LICENSE b/include/cereal/external/rapidjson/msinttypes/LICENSE
-new file mode 100644
-index 00000000..e3d96f8f
---- /dev/null
-+++ b/include/cereal/external/rapidjson/msinttypes/LICENSE
-@@ -0,0 +1,29 @@
-+ISO C9x  compliant stdint.h for Microsoft Visual Studio
-+Based on ISO/IEC 9899:TC2 Committee draft (May 6, 2005) WG14/N1124 
-+
-+ Copyright (c) 2006-2013 Alexander Chemeris
-+
-+Redistribution and use in source and binary forms, with or without
-+modification, are permitted provided that the following conditions are met:
-+
-+  1. Redistributions of source code must retain the above copyright notice,
-+     this list of conditions and the following disclaimer.
-+
-+  2. Redistributions in binary form must reproduce the above copyright
-+     notice, this list of conditions and the following disclaimer in the
-+     documentation and/or other materials provided with the distribution.
-+
-+  3. Neither the name of the product nor the names of its contributors may
-+     be used to endorse or promote products derived from this software
-+     without specific prior written permission.
-+
-+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
-+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
-+EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-+OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-+OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
deleted file mode 100644
index a4b7f3432a..0000000000
--- a/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "cereal is a header-only C++11 serialization library"
-HOMEPAGE = "https://uscilab.github.io/cereal"
-LICENSE = "BSD & MIT & BSL-1.0"
-LIC_FILES_CHKSUM = "\
-    file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23 \
-    file://include/cereal/external/rapidxml/license.txt;md5=d63ab70ba21ca0544b03284958324301 \
-    file://include/cereal/external/LICENSE;md5=b07578c9df99c0b8b45eb041efd4a645 \
-    file://include/cereal/external/rapidjson/LICENSE;md5=e7abb663111d4ac17cf00323698aff08 \
-    file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
-"
-
-inherit cmake pkgconfig
-
-RDEPENDS_${PN}-dev = ""
-
-SRC_URI = " \
-    git://github.com/USCiLab/cereal.git;protocol=https \
-    file://0001-add-license-files-for-components-of-cereal.patch \
-"
-
-SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
-
-EXTRA_OECMAKE += "\
-    -DCEREAL_INSTALL=TRUE \
-    -DJUST_INSTALL_CEREAL=TRUE \
-"
-
-S = "${WORKDIR}/git"
-
-PROVIDES += "${PN}-dev"
-
-FILES_${PN}-dev = " \
-    ${includedir} \
-    ${libdir} \
-    ${datadir}/cmake \
-"
-- 
2.30.1

