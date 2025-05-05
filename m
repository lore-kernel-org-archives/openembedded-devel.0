Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0BEC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.44490.1746426108598491336
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AVNqQuEp;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso5338123b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426108; x=1747030908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBUOs9msIN/oplGMQZRBq/ODuwg3trwgcFTk/Z/HMHg=;
        b=AVNqQuEp3uQ3CL86S/h4vYjCTeE8GoxLSBIivsydvqxNgkzTxSJqC+hxm5Uh0hXX7f
         Nk4Wfthtrf/w/4Q4X4ikbb6INpc09CqNIobwrWX5v39h1EsS8jc5s/20qkW8Jcb7a0IK
         YfS2znNsyyOVE7YKwTzcbCw9PlfGioYCsmRWQ51BP2X4/SrYfAYWRVbnOsVOck5yl47c
         OfvWp7MYiSeoRMJJJ4b+rcmUa7JdOcWnfc6+36cxzIK6ke9GkHEqsalvYeSgw0hiBMLo
         R5NHa1l/+ltuJ15vJ5+ehHteT5/Whu+HDNqi5kSQTOPMOy93euOxqu5zc+gywFBCg4lm
         rFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426108; x=1747030908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBUOs9msIN/oplGMQZRBq/ODuwg3trwgcFTk/Z/HMHg=;
        b=iLeOWUtNB8H5eqkLA+eyyH3HY8xH3z52PyeM2K6iF1kiDfYzjzraTeVN0eH8gHPK/U
         8BKAXfstzm/urLqwQRw0bSSISi4qQ7LY11/DF3fkxJRje8L2Mm4WAYhe53IXClYAOFfb
         kYnHGeVE8LT8kNnzczUswNKBud/qOzruDEkBFm31Cwe/4VS7WG6uY550iWQ9Puu+7AlY
         tj7KUeF/oBXDesPNSkONj3FPQNVquWSe1NrqQGQgNyvFHSfjeKZelHGGTI5qErbBvtlh
         Y6bQfkH8EvZrgUzPavDnp5U3VvsJfX2MI6Df3BNbS/daqVM/TQh8fvj/3eqAvEPHnDmL
         Q3SQ==
X-Gm-Message-State: AOJu0YzuOUcE0VDMEbNZMBAz1vYBpbPi2rNN/RWdbVjKG3Cgts936UaF
	9TGyDaBY8SUIMRuDys75RZMVeYzbyiziV0oOq1cJ3qAiY8NuT/kASPqgi06I
X-Gm-Gg: ASbGncvHs1pEoVvbxrq981bnCGRyt1isxaJzvHfNBzYitTjTwOHqeApPjBXPtLayG09
	Bg7rWIuDHs24bk98Q5Y/YnsrtG7yC50HsLu9dAyfzRtX0p+fmxtE8G6l0J77uKS2lu8ezV9PFYD
	//wJQCh7V1ULj0H57oPxto20SWEEmrAXNzPgeOwIk7pdkHJ3mTGoc7XrjO99wjAvlADpbSwTpVf
	YJJKYqsQQAl0unRymj2uxR5MH38gY30SL5+k41VkiJb82dRvHcsQjrbJoIXFZcIKCUzFK3twKUp
	Mtb8jRQw6Yb+ik7JDKy8O1Lj2gz/VSRgqxIHqCiexNk=
X-Google-Smtp-Source: AGHT+IETwjWNNTBx7Bmbq3oGbOr2djN/XElpjYioyF7gRR4W9hMq66n3ij4EK/S/Az5lan8K6jvkDA==
X-Received: by 2002:a05:6a00:ac86:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-7406730af42mr12675678b3a.8.1746426107552;
        Sun, 04 May 2025 23:21:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] geany: Upgrade to 2.0 release
Date: Sun,  4 May 2025 23:21:39 -0700
Message-ID: <20250505062142.3478500-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117293

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Upgrade-to-a-modern-Gettext.patch |  11 +-
 .../geany/geany/geany-2.0-gcc15.patch         | 146 ++++++++++++++++++
 .../geany/{geany_1.38.bb => geany_2.0.bb}     |   3 +-
 3 files changed, 153 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
 rename meta-oe/recipes-devtools/geany/{geany_1.38.bb => geany_2.0.bb} (82%)

diff --git a/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch b/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch
index b966847195..e6db688974 100644
--- a/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch
+++ b/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch
@@ -11,12 +11,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8,7 +8,7 @@ AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
+@@ -9,6 +9,7 @@ AC_CONFIG_MACRO_DIR([m4])
  AM_INIT_AUTOMAKE([1.11 -Wall parallel-tests subdir-objects])
  AC_CONFIG_HEADERS([config.h])
--
-+AC_PROG_INTLTOOL
- m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
  
- GEANY_PREFIX
++AC_PROG_INTLTOOL
+ # Silence "AC_LINK_IFELSE before AC_USE_SYSTEM_EXTENSIONS" warnings
+ # Note: Enables _GNU_SOURCE on Linux
+ AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch b/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
new file mode 100644
index 0000000000..2886b73d22
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
@@ -0,0 +1,146 @@
+Fix build with GCC-15
+
+Upstream-Status: Backport [https://sourceforge.net/p/scintilla/code/ci/c7ffad21b23dfad4e8e9f36bb587acc2f6e84fee/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/scintilla/gtk/PlatGTK.cxx
++++ b/scintilla/gtk/PlatGTK.cxx
+@@ -5,6 +5,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cstring>
+ #include <cstdio>
+ #include <cmath>
+--- a/scintilla/src/AutoComplete.cxx
++++ b/scintilla/src/AutoComplete.cxx
+@@ -7,6 +7,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ #include <cstdio>
+--- a/scintilla/src/CallTip.cxx
++++ b/scintilla/src/CallTip.cxx
+@@ -7,6 +7,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ #include <cstdio>
+--- a/scintilla/src/CellBuffer.cxx
++++ b/scintilla/src/CellBuffer.cxx
+@@ -7,6 +7,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ #include <cstdio>
+--- a/scintilla/src/ChangeHistory.cxx
++++ b/scintilla/src/ChangeHistory.cxx
+@@ -7,6 +7,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cassert>
+ 
+ #include <stdexcept>
+--- a/scintilla/src/Decoration.cxx
++++ b/scintilla/src/Decoration.cxx
+@@ -6,6 +6,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cstring>
+ #include <cstdio>
+ #include <cstdarg>
+--- a/scintilla/src/Document.cxx
++++ b/scintilla/src/Document.cxx
+@@ -7,6 +7,7 @@
+ 
+ #include <cstddef>
+ #include <cstdlib>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ #include <cstdio>
+--- a/scintilla/src/Indicator.cxx
++++ b/scintilla/src/Indicator.cxx
+@@ -5,6 +5,7 @@
+ // Copyright 1998-2001 by Neil Hodgson <neilh@scintilla.org>
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
++#include <cstdint>
+ #include <cmath>
+ 
+ #include <stdexcept>
+--- a/scintilla/src/KeyMap.cxx
++++ b/scintilla/src/KeyMap.cxx
+@@ -6,6 +6,7 @@
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
+ #include <cstdlib>
++#include <cstdint>
+ 
+ #include <stdexcept>
+ #include <string_view>
+--- a/scintilla/src/LineMarker.cxx
++++ b/scintilla/src/LineMarker.cxx
+@@ -5,6 +5,7 @@
+ // Copyright 1998-2011 by Neil Hodgson <neilh@scintilla.org>
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <cmath>
+ 
+--- a/scintilla/src/PerLine.cxx
++++ b/scintilla/src/PerLine.cxx
+@@ -6,6 +6,7 @@
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
+ #include <cstddef>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ 
+--- a/scintilla/src/Style.cxx
++++ b/scintilla/src/Style.cxx
+@@ -5,6 +5,8 @@
+ // Copyright 1998-2001 by Neil Hodgson <neilh@scintilla.org>
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
++#include <cstdint>
++
+ #include <stdexcept>
+ #include <string_view>
+ #include <vector>
+--- a/scintilla/src/ViewStyle.cxx
++++ b/scintilla/src/ViewStyle.cxx
+@@ -6,6 +6,7 @@
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
+ #include <cstddef>
++#include <cstdint>
+ #include <cassert>
+ #include <cstring>
+ #include <cmath>
+--- a/scintilla/src/XPM.cxx
++++ b/scintilla/src/XPM.cxx
+@@ -6,6 +6,7 @@
+ // The License.txt file describes the conditions under which this software may be distributed.
+ 
+ #include <cstdlib>
++#include <cstdint>
+ #include <cstring>
+ #include <climits>
+ 
diff --git a/meta-oe/recipes-devtools/geany/geany_1.38.bb b/meta-oe/recipes-devtools/geany/geany_2.0.bb
similarity index 82%
rename from meta-oe/recipes-devtools/geany/geany_1.38.bb
rename to meta-oe/recipes-devtools/geany/geany_2.0.bb
index d75e3b57fb..4b51195e08 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.38.bb
+++ b/meta-oe/recipes-devtools/geany/geany_2.0.bb
@@ -11,8 +11,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.geany.org/${BP}.tar.bz2 \
            file://0001-configure-Upgrade-to-a-modern-Gettext.patch \
+           file://geany-2.0-gcc15.patch \
           "
-SRC_URI[sha256sum] = "abff176e4d48bea35ee53037c49c82f90b6d4c23e69aed6e4a5ca8ccd3aad546"
+SRC_URI[sha256sum] = "565b4cd2f0311c1e3a167ec71c4a32dba642e0fe554ae5bb6b8177b7a74ccc92"
 
 FILES:${PN} += "${datadir}/icons"
 

