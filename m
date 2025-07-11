Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE069C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:44:29 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.19860.1752255865515124512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 10:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i35Ce4U+;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2705849e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752255863; x=1752860663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aM6Xarw13whLxNRKqVemqlpaNs42b7OHe/BrhiuUlOE=;
        b=i35Ce4U+ssgrL8qHkFBCuIYYqRWqAd1BgVX03tzv1hrSfHdRqRz7r/Ndf06f6sipFc
         N/5hUcZspzMirA3iiB2SSJcxsI9agZsBLRZNKYu6gUDVXbWI37Di739ZScv6gx77cbyf
         AXC5d1X7RG88pKmI3WYGw5DYPQP8N1eRs8gZIO+/Eg5H2/CV8ymwmL3cdPcnIJE2Zc6d
         hpM7ArLgF41RpZLmAYKPKk9LR9uguHSmUDb5Cwraplh1zvvtzLOcrIcEWqXclFOAHkm1
         Xm3GeAuxlXCTfTYoXTeiGZgPhBHh2EkopFNFO0Ixrq6MFGxP+/UB+lZYibzo6t+YYjwP
         N7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255863; x=1752860663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aM6Xarw13whLxNRKqVemqlpaNs42b7OHe/BrhiuUlOE=;
        b=WSp/cgEgMmuZxXw1yrRIb/AT/tmwNeYlfx/utsYyt/bzRxmGIhz1fJkpKzlZKbubHZ
         9B9yPq8+vEbQrSgSLZ7HgvGV0ymJ8qlMUKIaPgevAHw0HrW2/sRXR6XMBkYKAdDxjdy8
         IfJC+PSYpS/btnGk3RVrrCSL6HsDP958sF+4KjzTMuVIpo4VrsKER3uH3uv4EAduIbPT
         +i4sFB4xe/g4qNKQ2yiLMr1dBlEYFO3d1AX5AUQQkr0gcOZhzclYUhXiJX4QU9tvCWP+
         jYpNSd6wIEf6qlHma9dTRWkIbtTAVTBLv9y7V20sjSa8DUpquFDcI6TPMcLyclgxye7Z
         Hh+g==
X-Gm-Message-State: AOJu0YyNAFqdiOmwfky+T7BDi2MT1mct7THB+C6Innc8BZnpBn0ebV38
	1UU+VPuKhe7W/G19w6AhJlmqUhFT62dhqFwEEWm86Ke7Wfwq7dbcdupqcO7OAQ==
X-Gm-Gg: ASbGncu7rmAR6F5M4Go85w8Kbdp+8BRUYDbwdXDUci6jVj+Gv0qBMldIbEhbVyRwF20
	o7qi7PznoEv64INJH1LoZ32Jq2FJEx8sWpTd15JqSMOezpGGRN6vQyUhNmUqF6q3vbHknuoUsLW
	FPXBuku7+AisWupbMqhMyHIanX6RH5t+YL35hs9lxee+0KbqnyllN0rRznb8Rg3ue540uau3g/o
	ldfKRy9JcTGNqo49rr595SV/rs0rOxBoYKA56Ant1d/meHWsPG+Z9BepEQX/RSiGKCNo1tMtH4C
	fY5/xhQqhWu7Pmn0mNHPWanPHbYx8FCIzhLo2ec4GGQGLBYRN4igO8DcJ3g4R2ah+LKthil8h7n
	0GjMJVP8iAJOd3OjXZr2wU45WSrkYoB7Sh4l4lg==
X-Google-Smtp-Source: AGHT+IFN/GqnbOZ5oX0VndJVjTdpyqFGqKUnpENS9v2/1FBu+p20BKtSaLqEbqWRn09/hyTwVYQCEw==
X-Received: by 2002:a05:6512:159b:b0:553:3492:b712 with SMTP id 2adb3069b0e04-55a0465469bmr1615441e87.54.1752255862526;
        Fri, 11 Jul 2025 10:44:22 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60791sm1028002e87.150.2025.07.11.10.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 10:44:21 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 1/3] libmatroska: Add patch for CMake 4+ compatibility
Date: Fri, 11 Jul 2025 20:43:58 +0300
Message-ID: <20250711174400.2092299-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118456

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
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../libmatroska/libmatroska_1.7.1.bb          |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..ba4ccadd20
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 193661ce9dcc956bf609065df6cbd753a3cbd8e0 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Fri, 11 Jul 2025 16:18:41 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Backport [https://github.com/Matroska-Org/libmatroska/commit/dc80e194e93e6f0e25c8ad3e015d83aca2a99e10]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8fed3ca..63ac23d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(matroska VERSION 1.7.1)
+ 
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
index d38366a735..164783a34f 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
-SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
+
 SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
 
 
-- 
2.43.0


