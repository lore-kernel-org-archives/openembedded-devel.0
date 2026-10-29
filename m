Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5789.1793253941616645480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 23:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N8r5rdY4;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so499896eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253941; x=1793858741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PDiDU4egrDiaQEPbONDO/py82SLIxnL/LNLFJR4wvM=;
        b=N8r5rdY4vq0ZzB0Gvxg5nEhqNdq0rcnXafixZusMOGmOl1fWVqVVP77WUxULRpMYGF
         zmRl8ePokgxykNKB+/RI1GeFxX0NDZhEFuON7roSuYIbN2dEmVpN6CaPbek72yxsTTcM
         phacU5vBMqyNfx6W7cUxGZ9U8FOhb3qTodq6uMZf+J2f6HGuBm4HShItFBy8LCmeRiXC
         j7z23KhwECZ94IijpShTBTPRJo10gzSKGRy5b4L9m5mPYmxXJqX3s7cKez2nIFBGLqE0
         gcxDl6ya8XzN/q/4QIDvuR8YjTO54er1Zx6Nm6qvvferdiV7K4aRsNAthOorKiO7uh7L
         Wopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253941; x=1793858741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PDiDU4egrDiaQEPbONDO/py82SLIxnL/LNLFJR4wvM=;
        b=h7SN4X8XZpiqYTiGB9uuTDUfkFIC9ySQzYc+QwTyK05hqKTQoy77imLRTIAmcOqaVg
         TCmR+2WbUkC0RktJwnHbfEynLEIWKLz8a/vrnbQD2F5vDNEcHCz+20LmZUPuD/1k+cRJ
         OcBab4r3KNc0+s5cRqe0fkIzMHipWH3DPvpJ4HyhjS6iGKJ5GSxufAHGe78wirGIFAGf
         CDuQ+QSbzVIWXrYl0ekcFswElDkWwEdpT4+cgDNquswa3ujo+zit7OAG2f3oFuVFyI5+
         HMZPGCQAIVh9qpnG9FBq1tlQcuG7VSfNp82I2CFp85QABsJdgDo1IhM9rK/zX0rFZ7PE
         /hwQ==
X-Gm-Message-State: AFq9FYLWmpyzyKzVkPI9Fz1HIyHmGZHH6VcRHCOwDf//OEKVot4xnPCy
	WIE8sm3csl/AaIaqdZVBY1hvAP+4NXHkkZ3Sh8U5dI78P/whXtQw584nHQ/6qA==
X-Gm-Gg: AYBFou0Hu+4dkakllX5MRV6ogbPmj2UlK0GhkmF0ozJnrf3z3RD4wV262vg0HUN4oi4
	7NQg3Di7L6YWZvx5IbymVT3No+944Pw910jqpdZv3wtaATML2G1d4iloTD8G72kPeooBhRUwL8p
	igyX6AF+sviFng1GH7N0rNKe4VAnnUdS/pKKuSpPDf50M+hhaHM6yl0Hs32hmEZA655W4lIzZ/6
	bz/QaqYaN9HRSSIj/Lqs6RLfAm35HQmY4gTVuZAvWx6JlfhpoBvjhm8IWq7Ng1wx7YkcnlX0Oa3
	cN2ja7KK1UoTe1mRszRkvV+u2WJa5qrC3ISIT5UQuwJngv6CubRGY5a3YtGuafSqIujZLCgybbu
	pEjQ9XYphZsMww4ytC4gZU5ELKCmyaSLruDwzwxdK1ne2aOSKa2EUdLERrharZkc7WDqlE5aWrY
	W9Ey2uixBmyP3V5pnyoU5NQvA3oZxkerOmVEXBrgLb1R7+f01pSKsEnPfMV/Y9+Yq8Tt8KhRarX
	O7MX7hJgTqZcf5OAGlZoK1tErxxEgw3vV8cAttzEZiiA2tNgzY06RCIJ2NCEDOCW163BusFEBqN
	S1LfSXEF/zY6mQqgNju4lE2EE5UH0PDX0331CoLrMnLNyIc7c4Bec3/kxXTQaK1d
X-Received: by 2002:a05:7300:e911:b0:36a:eea:df88 with SMTP id 5a478bee46e88-36a203eff28mr6343625eec.19.1793253940603;
        Wed, 28 Oct 2026 23:05:40 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm17111655eec.20.2026.10.28.23.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:05:40 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [meta-oe][PATCH] crash: upgrade 9.0.2 -> 9.0.3
Date: Thu, 29 Oct 2026 15:05:29 +0900
Message-Id: <20261029060529.1586385-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 06:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131639
Content-Type: text/plain; charset="utf-8"

Fixes several commands on Linux 7.1 and 7.2, which OE-Core master
now ships as linux-yocto 7.2.
Update crash-memory-driver to the same revision.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    Built crash, crash-memory-driver and crash-cross-canadian-x86-64
    for qemux86-64 on master.

 ...-cross-canadian_9.0.2.bb => crash-cross-canadian_9.0.3.bb} | 0
 ...sh-memory-driver_9.0.2.bb => crash-memory-driver_9.0.3.bb} | 4 ++--
 meta-oe/recipes-kernel/crash/crash.inc                        | 4 ++--
 .../recipes-kernel/crash/{crash_9.0.2.bb => crash_9.0.3.bb}   | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_9.0.2.bb => crash-cross-canadian_9.0.3.bb} (100%)
 rename meta-oe/recipes-kernel/crash/{crash-memory-driver_9.0.2.bb => crash-memory-driver_9.0.3.bb} (93%)
 rename meta-oe/recipes-kernel/crash/{crash_9.0.2.bb => crash_9.0.3.bb} (100%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.3.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.3.bb
diff --git a/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
similarity index 93%
rename from meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
index 46de814e9b..80f84548ed 100644
--- a/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://crash.c;beginline=1;endline=25;md5=c278eae78e2bf99783
 
 inherit module
 
-SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
+SRCREV = "a507c2f2036e43c62053a9f5ece0289dcb6f05fb"
 SRC_URI = "git://github.com/crash-utility/crash;protocol=https;branch=master;subpath=memory_driver;destsuffix=${BP} \
            file://0001-hacked-Makefile-for-module.bbclass.patch;striplevel=2 \
            "
-PV = "9.0.2+git"
+PV = "9.0.3+git"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index d6447ebe49..f24d40b42b 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -24,8 +24,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
 # 0001-Use-CC-env-var-to-get-compiler-version.patch:
 # to get the right compiler info into ./crash --buildinfo
 
-SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
-#PV = "9.0.2"
+SRCREV = "a507c2f2036e43c62053a9f5ece0289dcb6f05fb"
+#PV = "9.0.3"
 SRC_URI[gdb.sha256sum] = "bdc1da4a033280ac752e7d34b0418efaa45bed093235cb88e62ea961752a37f8"
 
 
diff --git a/meta-oe/recipes-kernel/crash/crash_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash_9.0.3.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash_9.0.3.bb
-- 
2.34.1

