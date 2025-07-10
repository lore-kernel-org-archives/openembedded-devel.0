Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243ADC83F22
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:39:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.1132.1752169138320381942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q66Yfq1g;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55502821bd2so1278683e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169136; x=1752773936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npn0lmJuh9VBbUYnCUVRxxmZ9OewhaiqJEPZYP6Fo5Y=;
        b=Q66Yfq1g3nuPgkepwjz9Vj0ysoaivwyODPtBex+2eD50nArU5mgtgkD9Y4N0j5+tPu
         y6uqkmuq8rk+GS/rsnIhAc9hALRvmd3xtltspnTqR9KX8oEuq/2mYaImWVbEoI7mWQZR
         VJVw40ZnCpZ0Sd0kqbZv3eeJVMJhanW3I1DRmxcZKy4b7vGB+GTzoaRQROamWeekRAaE
         8ZLjKvmiH/PRIYfapK1aa5SvN+Xzbuq9WAtOmilbPXRePb2eFasdRCzdjjpuKo01p5df
         An4LLEMGXO6Ub6C36JtKabZXBRLV6k68d8pEfzQRJbOuDv2jGH308vPjxOQS4mvLqVTa
         Gh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169136; x=1752773936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npn0lmJuh9VBbUYnCUVRxxmZ9OewhaiqJEPZYP6Fo5Y=;
        b=IsJAgjTHzMMrPtY0NgkeBfYQuztYCQ6wb1j7g4vz1+0gX7G/K2hPajuGtnIQLsotNQ
         Q8eS4o/lyHXm1rglJdMryJ7dndlAoK6Fn+UM5HzeIU4Je+BbvnBGi7MGr+544BmZdPjl
         Sou7I2ZH2c4TnajTedpbZSmAeU5XdexVlSLOuu1T3tGgHnaol0CrQldrLBgCFauw+akP
         Q9nUifBhc3Ed57pLYWWQH9lmgHwpCihmu4maR3WFU+nLid3tkuhvclPUll5P/hLd72qM
         KzXB6kEi8VMKS8Gxx+qyvofKz6Ys27HziOdyLLmB7BjK73lhWyh06yRstXuGrmEwZYFA
         EFEg==
X-Gm-Message-State: AOJu0Yy/j7Qew2EWjDPuE9ao0M5NtknRSxsbSzGtCiukxKI6uuQJAaTv
	rRLH0ASvP98+DndGcrb59m9Z4AT9j4LOYsFcupyr7qYZcAE5QjpicdRGe1sLUg==
X-Gm-Gg: ASbGncszqTkEkiKU5EsfczJX0eH15Mvrgrmt0EGXGQ4HRr+nqrbZjirc/WAHjJlTX8M
	OSGF65ARATSFgt28vZrvlUpIFubJxrpf+xWCnxDO6iadLavA/IHQwxaNX/mjpB6ud4ZATZ2IJNQ
	Wz8OX3oRR2lhggDAhh+eDqKoMOOUhFu1QiRab2AmRTBhtnS7fAKk79MyiaAwyH2x0e7M8mplvPG
	6pclMw0CVRhLVArbUWkZHfLHKw/8gMeQzJLhqxZrsyaNLsF2Os7StOQYJuLpdN04pzyzIBmcT21
	YCPHmM7E0uDlbpJE/0qd+OuuNt93Gj4eiBtNfuffr7a4poicZWj/eGudJkY/qhZJiYSz7tYqymz
	HA7U=
X-Google-Smtp-Source: AGHT+IER4CckKqDNTAtOFVhoqVEbkh8D/P22403Dl6AIIjWwgCT1a4PVoyRiWyqG4uVL2RZa2oae+g==
X-Received: by 2002:a05:6512:3b89:b0:553:ab51:12a4 with SMTP id 2adb3069b0e04-55935b77ed5mr1404508e87.56.1752169135178;
        Thu, 10 Jul 2025 10:38:55 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8185csm431191e87.246.2025.07.10.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:38:54 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 2/5] srt: Add patch for CMake 4+ compatibility
Date: Thu, 10 Jul 2025 20:38:24 +0300
Message-ID: <20250710173827.43239-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710173827.43239-1-alperyasinak1@gmail.com>
References: <20250710173827.43239-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118417

Fix:

| CMake Error at CMakeLists.txt:10 (cmake_minimum_required):
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
 .../srt/0002-allow-build-with-cmake-4.patch   | 43 +++++++++++++++++++
 .../recipes-support/srt/srt_1.4.4.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..ba281a3a53
--- /dev/null
+++ b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 5a71ca427a10fe89ad48e9dbb6641e4403d81fa7 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Jul 2025 13:30:25 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:10 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://github.com/Haivision/srt/commit/0def1b1a1094fc57752f241250e9a1aed71bbffd]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 328a433f..448d6254 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+ #
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ set (SRT_VERSION 1.4.4)
+ 
+ set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/scripts")
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
index 91651fda8e..e72a36f657 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 SRCREV = "8b32f3734ff6af7cc7b0fef272591cb80a2d1aae"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master \
            file://0001-don-t-install-srt-ffplay.patch \
+           file://0002-allow-build-with-cmake-4.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


