Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FAEC83F15
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.3021.1752082278696743159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCcffaAi;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so61069e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082276; x=1752687076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jsH5eubNbr/sm1/NAIF7FIK4uYq+6w3VOoSeNTp0CA=;
        b=kCcffaAiksY8FJk4AKjpyQNp9BLDDHLaAzfnJ4Ske6IoPGOU3EpQCr6OGrSvMlsXsB
         FS3D1w/VLZMgUPPUlERTczeG51Jd+H3y+it1NcSeQ0kHi+x7EjR+eAjgRrSNg1sgQaBB
         r+MiDvITfUB6aC7TCaMId8mjgazfex5wWWP7wRHu3IVH6A5DQq+TVSh3kcwZmTC1BuRa
         gYBxMiWFXrxrhSHZi8rgeXY+HPj8iVSOIAoXYecoy8+Cmpi6N442rtgYtFevfZIx4G/q
         FYP0AfxGXxXVbuEmswtPcOkOd74pbpIvGEU9ZbNPtRExPYBIoBs9LENDGH7XJR2b+dA9
         iRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082276; x=1752687076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jsH5eubNbr/sm1/NAIF7FIK4uYq+6w3VOoSeNTp0CA=;
        b=EaOWbL3FRLOcszovZPeb8IoH1vmfAJu94vQJmPeXXt24IqOOLLxOuZCWR7gkviPPGC
         43FBivQW5ySs9bH4B/YtF29D19RHLj+C6d7etTlDcmxvGUbTcYqL+RtgxWSfdoUZoUf9
         1zbTMW7P+khgsfjKTXYvSxr9YFZ9wC46iN6lIEKxF938vciZ5Sa+RQTE32ZYTuZokPIr
         rIDoieDXdvxPIC8cMY8+rIGNWpqS8oZ4CxxvUXujJoNRWVh/d6LFZt3FsTkcaU9VPT9V
         /zSsLBhMQpcgxDqnfXXcNE3dE2+H71oUkXwUz7G6qbrA9ivnDnGXw5WnnpX3vKzykZal
         4YpQ==
X-Gm-Message-State: AOJu0YwDX/56+nT1pa6vpSkFunUZ58mLMZpdQYhRQldUXmpQnSTlS0LJ
	HpnpLL7EOBrMlWIHipjH9wmJJYccjgFlS/zCXhK7UhGb021S10O31SpfL6pWTQ==
X-Gm-Gg: ASbGncsttorbf5KZciel1gMq9V2QCv92C0Dx4oq6TBKZ0TiLDvRF8W/aIqCxpSu+vXk
	9QsDrWMhj1TilCVbUjCPk0cRlgirkGeG2rzD/QSy//yN/+VpAup3paNB266ABjTtA5Cn3gsQzO/
	sgB/PrhwIG2NTJzG3BlsTRUiIU4jhEk6LeC1HDTBQQhU/E/Po2/g9beEa75u1X3aysZ9ifABwVF
	2X7SEL+AEu1ARQW3DyofmWeWL1SkNOS7tXViXMjpqGNFtJaiwEUiNMVDM+hlp1bXHmM9iCXIegm
	z0MDTP1Q7l1mLv0xfU45tMhsGGCp8f2qrJkpDbE8zNoiEDyJIafx4tae4wsLPPtR4eWLTbwmm/i
	v4h0=
X-Google-Smtp-Source: AGHT+IHj1OIjDvRv5+gPQbtXqSHfZ9PKvzroV1jezu+JlkoXi7Nxp6oV4aYX7SwDX999nhmJbK9FgA==
X-Received: by 2002:a05:6512:2c8d:b0:553:cc61:1724 with SMTP id 2adb3069b0e04-559000476bemr269518e87.24.1752082276260;
        Wed, 09 Jul 2025 10:31:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:15 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 08/20] snort3: Upgrade 3.7.1.0 -> 3.9.1.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:42 +0300
Message-ID: <20250709173054.605430-8-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118362

- Drop 0001-Fix-build-with-gcc-15.patch because fixed in the newer version.

Changelog:

https://github.com/snort3/snort3/blob/3.9.1.0/ChangeLog.md

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../snort3/0001-Fix-build-with-gcc-15.patch   | 79 -------------------
 .../{snort3_3.7.1.0.bb => snort3_3.9.1.0.bb}  |  6 +-
 2 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.7.1.0.bb => snort3_3.9.1.0.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index f9cade5256..0000000000
--- a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 2bfb46b11d35f2fc5f3926376651cc936c6eab13 Mon Sep 17 00:00:00 2001
-From: Nguyen Dat Tho <tho3.nguyen@lge.com>
-Date: Mon, 31 Mar 2025 15:59:51 +0900
-Subject: [PATCH] Fix build with gcc-15
-
-Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
-
-Upstream-Status: Submitted <https://github.com/snort3/snort3/pull/408>
----
- tools/snort2lua/config_states/config_ignore_ports.cc     | 1 +
- tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc | 1 +
- tools/snort2lua/preprocessor_states/pps_frag3_engine.cc  | 1 +
- tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc   | 1 +
- tools/snort2lua/rule_states/rule_gid_sid.cc              | 1 +
- 5 files changed, 5 insertions(+)
-
-diff --git a/tools/snort2lua/config_states/config_ignore_ports.cc b/tools/snort2lua/config_states/config_ignore_ports.cc
-index 4ddfebb5d..ec180a558 100644
---- a/tools/snort2lua/config_states/config_ignore_ports.cc
-+++ b/tools/snort2lua/config_states/config_ignore_ports.cc
-@@ -21,6 +21,7 @@
- #include <vector>
- #include <string>
- #include <stdexcept>
-+#include <cstdint>
- 
- #include "conversion_state.h"
- #include "helpers/converter.h"
-diff --git a/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc b/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
-index 2a41decb8..79e98dd2b 100644
---- a/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
-+++ b/tools/snort2lua/preprocessor_states/pps_dcerpc_server.cc
-@@ -25,6 +25,7 @@
- 
- #include <algorithm>
- #include <cstring>
-+#include <cstdint>
- 
- namespace preprocessors
- {
-diff --git a/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc b/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
-index d5c1fcf4d..c0309cc6f 100644
---- a/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
-+++ b/tools/snort2lua/preprocessor_states/pps_frag3_engine.cc
-@@ -19,6 +19,7 @@
- 
- #include <sstream>
- #include <vector>
-+#include <cstdint>
- 
- #include "conversion_state.h"
- #include "helpers/converter.h"
-diff --git a/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc b/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
-index 1e97a58ad..3df35340e 100644
---- a/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
-+++ b/tools/snort2lua/preprocessor_states/pps_stream5_tcp.cc
-@@ -20,6 +20,7 @@
- #include <sstream>
- #include <vector>
- #include <string>
-+#include <cstdint>
- 
- #include "conversion_state.h"
- #include "helpers/s2l_util.h"
-diff --git a/tools/snort2lua/rule_states/rule_gid_sid.cc b/tools/snort2lua/rule_states/rule_gid_sid.cc
-index 7f2b84ae4..d3215b655 100644
---- a/tools/snort2lua/rule_states/rule_gid_sid.cc
-+++ b/tools/snort2lua/rule_states/rule_gid_sid.cc
-@@ -27,6 +27,7 @@
- 
- #include <sstream>
- #include <unordered_map>
-+#include <cstdint>
- 
- #include "conversion_state.h"
- #include "helpers/converter.h"
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb
index e9169a050f..598b1f4dfb 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.7.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb
@@ -9,11 +9,9 @@ DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind l
 
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
-           file://0001-cmake-Pass-noline-flag-to-flex.patch \
-           file://0001-Fix-build-with-gcc-15.patch"
-
-SRCREV = "6a11279883a8584e06ad9ab2df162c639961cd61"
+           file://0001-cmake-Pass-noline-flag-to-flex.patch"
 
+SRCREV = "6730d53f99f3714654804d07203f33e6b1b8a107"
 
 PACKAGES =+ "${PN}-scripts"
 
-- 
2.43.0


