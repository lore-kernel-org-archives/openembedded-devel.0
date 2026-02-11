Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26CCE9E2F5
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:00:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17419.1770811251614601210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cvNgcyrj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso5725492b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811251; x=1771416051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQLQs0ilOT37IJdzOJLGAS+Rdf6AF6LhDTVJ71byTco=;
        b=cvNgcyrjwTRKDdJI/YlGj0imdqbmee61QvlOG+LDKiJSsoMUw8edp8iba3ZwZlQKsy
         DWM8RvX83zdsbM8UvtLmfrJxs8biEojnLMjVn1wU2BQOR3NAp9BPdE91fOd0sjUDLpAF
         SUdQU7BNSxJ7heBYqVy/quFHI2Cv9wksxH8D0vK9amirXSAxKn1jz7vM6nFqSmzLIHsT
         EnKcLCMLLXiRNJ0egnRxb0OypZNLTdOgJ6uhtGpRJMEm38hMzH5hvnaceKcMDGMFDiv5
         pKQpxMy7ueCQld5SJ0AoaXXR8qaKlbKuKzkPpo9+IA0qQPDUkgPRK/HZ+Tg4zFlKGp17
         Emlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811251; x=1771416051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQLQs0ilOT37IJdzOJLGAS+Rdf6AF6LhDTVJ71byTco=;
        b=KwvFwFyq4+ZfVpwvLqbgmt5Kp1IIHqLnCWgOSY0w3tiw6a09RkQlFt2z/9gOsgKA3K
         cVNOjcKNonNcCRyjLyBzEuprqG5WJyHrQt4PZ7/PUzxmwF08f2lF/9Fe+TofwokWPccO
         l+nN6T3+1/M5KEzMhXkYi/Fb/ToI5hRoJydrE1QJ/9rySdKYLNlx3ciPVzlGPllfcD+V
         4mPHCWuni5Ht1TQgJtDmLPi34/avPVZMnwrwKGFwlr4ZzXhkYN2DsA+mJAf+eeTwHAVp
         SCo6cU9yhbuqWMKYKeW/ZHtwUJbcJa4/CXz5SdVvP9jt5QNWcYgENO+j6OTVuMkBT7P1
         rPTA==
X-Gm-Message-State: AOJu0YzyAkiw6qiUaXGHeyRHsIkq1NmCM+vF+4Wv4zyytII9Ms1uioVJ
	LFGoXQelD7nA/tMHZdPoOOyIF083z9drxAFWw/3Hezcua8jRrzAsUYmuiE0ylQ==
X-Gm-Gg: AZuq6aIHcmN/XiBEGt4mEMAimyTp0fTfoI2J0FGEIo5/oLBdGuwCA/apmSRXWNncM4i
	miI8+8on3LhOKvCevzNC1vc47Fy75HVDu3K8UE6Jdpqd4ANKApw9UmWXfhptFopQo+zdrnW/Ocp
	y8u+FUaKDavYQhZJTOaeiNFqKFAI8jjIErV5WFOE/osdX1l9JSf4CaRgFwXJuWR7KCzKkv5NHU9
	hFt5Sojkb+OifbpPsaRTwMMpwZfD7QeMi9rZOYyOAHBGgLNojZu9svQENDNZQC79zyZ8hNtmO2N
	1NKuf1V7hC4qxMu4BIALykt2+5gXknPdVhAjSWZ0WLWc8kS5pQyg8IAaLFhLj4pXoWEFp/LYWUU
	GNo5HwLOk5vaSfki5ZSYWwjDM9+mMjpLLE3N1PPnCvcw2GDJpnsH9zYOsnnaglSdMiM5c6/n1ae
	i/VQQaHrkesJWzygHqY+ICPr1wCB8DmfW3hDd+8Xl7iROPiw==
X-Received: by 2002:a05:6a00:b704:b0:823:c4dc:d20 with SMTP id d2e1a72fcca58-8249fd886a3mr1428380b3a.53.1770811250800;
        Wed, 11 Feb 2026 04:00:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 4/8] paho-mqtt-c: upgrade 1.3.14 -> 1.3.15
Date: Thu, 12 Feb 2026 01:00:21 +1300
Message-ID: <20260211120025.4190831-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124332

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop patch to fix gcc15 compatibility - the problem has been solved by upstream.

Changelog:
- Update getaddrinfo options to support IPv6 hostname resolution
- Removed unnecessary _WIN64 conditional checks
- Fixed condition variable timed wait
- Support tls:// prefix

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb9d043f4639e88ea0267882f46a41b2c5e49c16)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rror-due-to-bool-keyword-with-gcc-15.patch | 37 -------------------
 ...mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
deleted file mode 100644
index 4215f698c7..0000000000
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 02fa96d0d59211e64483273e5253ca45c4395154 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Wed, 9 Apr 2025 19:05:55 +0900
-Subject: [PATCH] Fix build error due to bool keyword with gcc-15
-
-* gcc-15 uses gnu23 for c.
-  'bool' is a keyword.
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: error: 'bool' cannot be defined via 'typedef'
-   31 | typedef unsigned int bool;
-      |                      ^~~~
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: note: 'bool' is a keyword with '-std=c23' onwards
-TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:1: warning: useless type name in empty declaration
-   31 | typedef unsigned int bool;
-      | ^~~~~~~
-
-Upstream-Status: Submitted [https://github.com/eclipse-paho/paho.mqtt.c/pull/1595]
-Signed-off-by: mark.yang <mark.yang@lge.com>
-Signed-off-by: markyang92 <pllpokko@alumni.kaist.ac.kr>
-
----
- src/MQTTPacket.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/MQTTPacket.h b/src/MQTTPacket.h
-index fd384ae9..0c64a0f4 100644
---- a/src/MQTTPacket.h
-+++ b/src/MQTTPacket.h
-@@ -28,7 +28,9 @@
- #include "LinkedList.h"
- #include "Clients.h"
- 
-+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef unsigned int bool;
-+#endif
- typedef void* (*pf)(int, unsigned char, char*, size_t);
- 
- #include "MQTTProperties.h"
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
index ad6637ed88..64b9de3848 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
@@ -11,11 +11,10 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = " \
-    git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master \
-    file://0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch \
+    git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
+SRCREV = "62782406bcf511ee8e22bc34e826f8c6b8254c7c"
 
 DEPENDS = "openssl"
 

