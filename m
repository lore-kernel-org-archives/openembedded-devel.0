Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307E1C25B10
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:11:01 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1018.1715044258752942004
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 18:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZ9wYhLc;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso2016489a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044258; x=1715649058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGPgDXcmOcjrxLktvUpzPOCo5dbxZ7qROIV7FSXzPIw=;
        b=NZ9wYhLcbtS74fr/W4NRo4mwe3EvAd8xMnpFdgrvdRdExGF8YVuW/MmjN7MbblF3hz
         +xVcPXfqDo7d6hhIXsBBun/1GxdURq+u0H03BQHcM47TL8cFeITllhBZz7BWIWLvTJRY
         at3ZfzSIoHJaDfiIr5BuKFDi3ewdbZhER/rFcVucY7/KuzRmzQdQB6H3hwXnz47tuMyI
         PNkjaVZoUKN3ETbpvJoMQ9SfI3nC8PVZxqlTEGJ2RFaTerxwSK5Dasm0KQ+ea27yO8Y1
         bK1z71c/I/gx7u2BNNlg06QptxZ8YxfHU6CVjgV7f45+HwHR38VDUIjYT7Ozkc8ZJH0E
         +gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044258; x=1715649058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGPgDXcmOcjrxLktvUpzPOCo5dbxZ7qROIV7FSXzPIw=;
        b=wxo/+b9jZpaQSDOCQ5Pb6LQqNooPemNU6tNmw5//zX7FJqT5qfZUeZ0Z8fcvdO9xlU
         xjUyhCI0dugRwuO6bUdQuhz9em2fLjygOKguQ5Lsd79ZB/CbXl7etAleeDBzPlfQHclF
         68ddhh48UTyWk3ztnvRCgN+u3996udGd0jgQD3oqYMTW8VEUWNCANNFJ6wlWT0vA7J7O
         8ywA1TYoqOojNnYHX0Tw9tZrdURZPQ0vAg1qCvilCGM0arjfEty9Of7DeG/qyc+EE8/f
         gmXMWfQv0k5sbkGEPCNCGucq1CijDcdVwA7OE6VrkYDMOWpwOiZKtGZGKF1oU+WPv2nU
         /d1A==
X-Gm-Message-State: AOJu0YwJgVXXkU3l8evIue76sfH64qtcmMO5Vel91R4h4V7GunL+10hz
	2FowXpAlvol2bxRSjTQ7e1mwh5xYuBffbhGjhnjw9qDLrzYBTt3J96Kh9LRU
X-Google-Smtp-Source: AGHT+IE6hFKVj+UzupQArA/uXXqwl8wCqI7sE6sQS/ar/b4imlMIKJqBNbp0OSfWAuyyEAsDlHmxtw==
X-Received: by 2002:a17:90a:9ab:b0:2b1:a150:f75f with SMTP id 40-20020a17090a09ab00b002b1a150f75fmr10371433pjo.23.1715044257418;
        Mon, 06 May 2024 18:10:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id sy15-20020a17090b2d0f00b002a5d20778ebsm10693201pjb.32.2024.05.06.18.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:10:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] pcapplusplus: Fix build with gcc14
Date: Mon,  6 May 2024 18:10:53 -0700
Message-ID: <20240507011053.309743-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011053.309743-1-raj.khem@gmail.com>
References: <20240507011053.309743-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 01:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110265

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++++
 .../pcapplusplus/pcapplusplus_23.09.bb        |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
new file mode 100644
index 0000000000..f2e210fc67
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
@@ -0,0 +1,35 @@
+From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2024 12:15:30 -0700
+Subject: [PATCH] initialize timespec variable
+
+Fixes build warnings with GCC14
+
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
+/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
+   23 |         timespec nsec_time;
+      |                  ^~~~~~~~~
+cc1plus: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1389]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Packet++/src/RawPacket.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
+index 8ad52d52..07dbbbe2 100644
+--- a/Packet++/src/RawPacket.cpp
++++ b/Packet++/src/RawPacket.cpp
+@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
+ 
+ RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
+ {
+-	timespec nsec_time;
++	timespec nsec_time = {};
+ 	TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
+ 	init(deleteRawDataAtDestructor);
+ 	setRawData(pRawData, rawDataLen, nsec_time, layerType);
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
index 39c6942c83..0ce4885ab7 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 DEPENDS = "libpcap"
 
-SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
+           file://0001-initialize-timespec-variable.patch"
+
 SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
 
 S = "${WORKDIR}/git"
-- 
2.45.0


