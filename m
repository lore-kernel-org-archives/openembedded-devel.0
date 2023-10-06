Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3495E94126
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.5571.1696626409395223468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Vuq9UOCa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20231006210646b8a10875ed2ada3a87-p1wa6h@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20231006210646b8a10875ed2ada3a87
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=887fJsl/0YmkrS5BY3/e8uF39fUYQ0NrOboF6tG586o=;
 b=Vuq9UOCa0HvDKHLIaNEfBVNQlV+S2SnKGE6c/+k8uYLN0+uaX40Xx8E2VflKogNnWNh5Y0
 BjAk8yx2r220neNsA+RYnjUbE7AJCDfpfm0BP9jz3udwWE5grCkEkNozin4NbBh0Y3b0BClO
 kKrFbPhxfIsZ/IUYlfjqT8UHXiag8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 4/5] mosquitto: upgrade 2.0.17 -> 2.0.18
Date: Fri,  6 Oct 2023 23:05:06 +0200
Message-Id: <20231006210507.556767-5-peter.marko@siemens.com>
In-Reply-To: <20231006210507.556767-1-peter.marko@siemens.com>
References: <20231006210507.556767-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 21:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105377

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Add two patches from Debian, pull requests proposed upstream as 2894 and 2895
to make it start only when board is online, and to fix dynamic websockets link failure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
index 0000000000..3275e57e38
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
index 0000000000..a9e9c97b83
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
index 690b6bc126..0c9ccc810d 100644
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
2.30.2


