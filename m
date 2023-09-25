Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58342CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 13:14:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.60997.1695647640381191807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 06:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqfPElmb;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4053c6f0e50so55314845e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695647638; x=1696252438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEYzTU90ZYxZ7zZ88quAwVcWYS2X/8yAooSqikmwe/8=;
        b=hqfPElmbWtrRU7tYaqkWPd+UjmP6/bQO4en4sbdXo/z2BJkjeVXqZh7LfgNWLRZHK0
         Xlfs7kwBBBvaNDvF6JJMfBOhIGXDvnvFJ5NQ4/v/FqFsoJ87hK0jTo1qXJugKG4fKXGN
         oDSwdPZYPSEqykBYGp0ayxXXTkw14C1pUUVhuR8yzaBOhOP10gF1Tkc37feqMrUQRxjG
         CC225cBZ2GOrZ4uP/ZXsYGGBCc6RQAwfIdGhpiRxmz69QAuYpMOH93xz9v3j3gF7G4jy
         BlP5vEit/QsprLa/3Mpy8St0LCn+bslS3Co8SitMfGo5+UIW+pM8cgWTfGWiB23w9OLN
         +bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695647638; x=1696252438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEYzTU90ZYxZ7zZ88quAwVcWYS2X/8yAooSqikmwe/8=;
        b=YKFmc7osBK0hMvrOPZ2Wiwe3zLkK5B/mlnOHcrT5IBIB3yaWV+ucXyA70Rzrgu3IPX
         4vB/slSqtIHjQEaK1d7d2Ikr230uo+NgqVNrvsKnZNufwVkGUmTVCai7y2DUUOTFZn28
         twSa2qIaPYV1MHoxW0L5lNbGmOKsvD7psXwf4ktsM+Dgt8dLLzQHOwlpcXw18Z9qCrpc
         tYdbI6slTIOs9hqB0wQ2mIjE49+TJT1wxo18SCn+wbvWPPWqcEvLZqm6vfn+ZZh5KOCT
         jURw7vzrAsPQUvn7yRlTudq7TO4GfS2WVAoleYjKCC8GlpzrKo9nUPnkTnlDh7k3iVtu
         SQMQ==
X-Gm-Message-State: AOJu0YwKRhIQg+HfnPXAXx8FYg6Ok7LxngO0qiGJvuKU1OzuAOiB6/ml
	1M+cUu0GvH8Y17O1Nxa9vqocAD4AvL/Yrg==
X-Google-Smtp-Source: AGHT+IF36dD17AOr/5VMzUcheIPhl/5vLCgn1XZcwvJdK5kwde1tX8xBchprGfPGz64ImiUGDOMx6Q==
X-Received: by 2002:a1c:7c0a:0:b0:3fe:dcd0:2e32 with SMTP id x10-20020a1c7c0a000000b003fedcd02e32mr6122832wmc.19.1695647637778;
        Mon, 25 Sep 2023 06:13:57 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula (mob-5-90-45-88.net.vodafone.it. [5.90.45.88])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c230800b003fe61c33df5sm15164296wmo.3.2023.09.25.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:13:52 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] mosquitto: upgrade 2.0.17 -> 2.0.18
Date: Mon, 25 Sep 2023 15:13:49 +0200
Message-Id: <20230925131349.12941-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105128

Add two patches from Debian, pull requests proposed upstream as 2894 and 2895
to make it start only when board is online, and to fix dynamic websockets link failure
---
 .../mosquitto/files/2894.patch                | 23 +++++++++++++++++
 .../mosquitto/files/2895.patch                | 25 +++++++++++++++++++
 ...osquitto_2.0.17.bb => mosquitto_2.0.18.bb} |  4 ++-
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2894.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2895.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.17.bb => mosquitto_2.0.18.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
new file mode 100644
index 000000000..3275e57e3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
@@ -0,0 +1,23 @@
+From: Joachim Zobel <jz-2017@heute-morgen.de>
+Date: Wed, 13 Sep 2023 09:55:34 +0200
+Subject: [PATCH] Link correctly with shared websockets library if needed see:
+ https://github.com/eclipse/mosquitto/pull/2751
+
+Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel Engberg <daniel.engberg.lists@pyret.net>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 9380a04..dce8313 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
+ 			link_directories(${mosquitto_SOURCE_DIR})
+ 		endif (WIN32)
+ 	else (STATIC_WEBSOCKETS)
+-		set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
++		set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
+ 	endif (STATIC_WEBSOCKETS)
+ endif (WITH_WEBSOCKETS)
+ 
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
new file mode 100644
index 000000000..a9e9c97b8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -0,0 +1,25 @@
+From: Joachim Zobel <jz-2017@heute-morgen.de>
+Date: Wed, 13 Sep 2023 10:05:43 +0200
+Subject: [PATCH] Mosquitto now waits for network-online when starting
+ (Closes: #1036450)
+
+See: https://github.com/eclipse/mosquitto/issues/2878
+---
+ service/systemd/mosquitto.service.simple | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/service/systemd/mosquitto.service.simple b/service/systemd/mosquitto.service.simple
+index 15ee0d6..c2a330b 100644
+--- a/service/systemd/mosquitto.service.simple
++++ b/service/systemd/mosquitto.service.simple
+@@ -1,8 +1,8 @@
+ [Unit]
+ Description=Mosquitto MQTT Broker
+ Documentation=man:mosquitto.conf(5) man:mosquitto(8)
+-After=network.target
+-Wants=network.target
++After=network-online.target
++Wants=network-online.target
+ 
+ [Service]
+ ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
index 690b6bc12..0c9ccc810 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
@@ -17,9 +17,11 @@ DEPENDS = "uthash cjson"
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://1571.patch \
+           file://2894.patch \
+           file://2895.patch \
 "
 
-SRC_URI[sha256sum] = "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f"
+SRC_URI[sha256sum] = "d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c083822823f4448a"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.34.1


