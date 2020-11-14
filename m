Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.7094.1605366292158940534
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 07:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QYP4k9c6;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id h2so18931781wmm.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4XP819tHf0RSWGRSKsE3A4dacZY/sqkR9WT5boIPr4=;
        b=QYP4k9c61Psq+FHtTeyhl4W9nDZjz+HoE3hhEH/13wdApFv4CFiREfAsjCsHb8ZdhO
         aQ+CJdP6VeBAeWIN4ZqIUXS5aI1+yC7ZlilySZ/bUFIhX3ZLGS4vEkymd8Lto5WvkIKE
         UYNrVId58xbzC8tbP+K5kpNp5nmmgTrbcUcIs+35JL0EWkSyUDC4o9VunNeFzBblCK/V
         oRu8s/2rTkv3ptwXeyriJRY+Y+rSGQRjTOiSwQAzk0/orBy9hKjnDlaofvOEWGhKJNqt
         nZy2dVKCrboy3oZdYJMMPwpBpQwMyRPfnodCClSt3DjquzuOoHXCcsuAPcgI+Av/G0/6
         Djdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4XP819tHf0RSWGRSKsE3A4dacZY/sqkR9WT5boIPr4=;
        b=nT4QZJIscTONnW5fKJNSYOYyV7rhLj1kIaW2JPe4X06tdWrahCzJGgvs/c7a3/zSvU
         0d4VlwEWCMjrfMTzk0c4jLWX0yaP/XyQjj4M5E7kqUhED4hYaz4xjkAH3Mo5AryS1rzC
         Y55ZQIimUPvzhDT6z+Rtk6ykBsXifyX1a2SlH8DaRgxCvN8zR8wfZGhfH4IU7bjbIP/r
         gaqwO4RpwNyTt+g/mbV9uITY21+ety4wj/5c9gn5LI0T01jSaqZ+JERJ6StB8VUHuvXV
         cmo3fLIiYFyYHPoHLvADvfOMRB8yS8NU1GUrncfTX1JY7KzBZ2OVnDhkxwBBcducwxEq
         MWUw==
X-Gm-Message-State: AOAM532HiY1Lmall0yoXM30TE1yIHnLyGMyCeOVnDsAlEs04PckpVSX7
	v1NjI/kXec36pNLSNniX0aCKDy01ILc1xw==
X-Google-Smtp-Source: ABdhPJzIITDGKvu8BRxZzz9pHmhwsqVL//2gqRdO6tZyZ2XO0l2zPU8MHLHqL8lmL29mPG4a/YWlqw==
X-Received: by 2002:a1c:c343:: with SMTP id t64mr7524761wmf.140.1605366290227;
        Sat, 14 Nov 2020 07:04:50 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id v8sm13559169wmg.28.2020.11.14.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:04:49 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-multimedia][PATCH] srt: add receipe
Date: Sat, 14 Nov 2020 15:04:43 +0000
Message-Id: <20201114150443.2647350-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Secure Reliable Transport (SRT) Protocol

Secure Reliable Transport (SRT) is an open source transport technology that
optimizes streaming performance across unpredictable networks, such as the Internet.

SRT is applied to contribution and distribution endpoints as part of a video
stream workflow to deliver the best quality and lowest latency video at all times.

As audio/video packets are streamed from a source to a destination device,
SRT detects and adapts to the real-time network conditions between the two endpoints.
SRT helps compensate for jitter and bandwidth fluctuations due to congestion
over noisy networks, such as the Internet. Its error recovery mechanism minimizes
the packet loss typical of Internet connections. And SRT supports AES encryption for
end-to-end security, keeping your streams safe from prying eyes.

    * 0001-don-t-install-srt-ffplay.patch
      Upstream-Status: Pending

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../srt/0001-don-t-install-srt-ffplay.patch   | 28 +++++++++++++++++++
 .../recipes-support/srt/srt_1.4.2.bb          | 27 ++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
 create mode 100644 meta-multimedia/recipes-support/srt/srt_1.4.2.bb

diff --git a/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
new file mode 100644
index 0000000000..5b76b16328
--- /dev/null
+++ b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
@@ -0,0 +1,28 @@
+From a45b43a2acd4c29bc8a204f51a3fa5e7b9815613 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 14 Nov 2020 12:29:56 +0000
+Subject: [PATCH] don't install srt-ffplay
+
+srt-ffplay is a simple bash scripts that pipes the output of srt-live-transmit to ffplay.
+It need ffmpeg as dependencie and requeire that libsrt is builded with -DENABLE_APPS=ON.
+So remove it because there are no option to disable the instalation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ed6e603..ef53dc5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1224,7 +1224,6 @@ if (ENABLE_UNITTESTS AND ENABLE_CXX11)
+ endif()
+ 
+ 
+-install(PROGRAMS scripts/srt-ffplay DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
+ 
+ if (DEFINED SRT_EXTRA_APPS_INC)
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
new file mode 100644
index 0000000000..567ea68edf
--- /dev/null
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Secure Reliable Transport (SRT) Protocol"
+DESCRIPTION = "Secure Reliable Transport (SRT) is an open source transport technology \
+that optimizes streaming performance across unpredictable networks, such as the Internet."
+SECTION = "libs"
+HOMEPAGE = "https://github.com/Haivision/srt"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRCREV = "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
+SRC_URI = "git://github.com/Haivision/srt;protocol=https \
+           file://0001-don-t-install-srt-ffplay.patch \
+           "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DENABLE_UNITTESTS=OFF"
+
+PACKAGECONFIG ??= "crypt"
+PACKAGECONFIG[debug] = "-DENABLE_DEBUG=1,,"
+PACKAGECONFIG[crypt] = "-DENABLE_ENCRYPTION=ON,-DENABLE_ENCRYPTION=OFF,openssl"
+PACKAGECONFIG[utils] = "-DENABLE_APPS=ON,-DENABLE_APPS=OFF,"
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'utils', '${PN}-utils', '', d)}"
+FILES_${PN}-utils += "${bindir}"
+RDEPENDS_${PN}-utils += "${PN}"
-- 
2.29.2

