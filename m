Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA7FCCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:37:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13701.1762853866170802604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+OtmRL6;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29808a9a96aso22022425ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853865; x=1763458665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2C/5D/l0DmaOQA90fHeM9rmAkCp5L7LxztstXIaoxI=;
        b=C+OtmRL69CY4WIsOfc/Z+4QnyW/Ta4KO/hLDhKdMR2peAQ8kQilrwM6HlhUI4WXae9
         q+B5kdmU+dMWNll5olFZsmB7bFWGmAX7LEeoeJ3ZxEXJRkPIL3l8p3zAfzRnKnFZ/zXs
         toSpFx4/Mm42tf23/SCAN/WYWmiHNjKc6BrLULcXUIBALKKXl64bLYNrjCXufG47Kmnj
         cLY+7YzPusDJIds1+iMX12AIIiPKhM9z/wQEFOsL0KyHrS2iiLmXVFyMMP4nxJxobZ37
         6owz2YqKzW6TEZasZ3Enu7CzgHYtoVp4KVMc/WC2qSY42DTZvl8yqQudbz+oeuLzjCpO
         H2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853865; x=1763458665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2C/5D/l0DmaOQA90fHeM9rmAkCp5L7LxztstXIaoxI=;
        b=RYXCgljmU4LXWR0Sd3ci+UD7pRHJNcXUwtumu7LijwjH8p2hkNKabKceJHBqOO+RKx
         pm8sonDeRvhm0VUYqT6xB9DLfbOD76nRXecn8/a2G1mjIqrK9aKUaNIb5qTsB8hLPCLp
         gKMYBe+oevRpr3YONQH6s9UgsO9QyQpCZEGS4oPWPcSRw/6gy84x8NI3uXu0xDdgfW+c
         7vakNss3t6zBDe16PpQFN4X59F4Hm0W1XavAb7Ba68b68kCbUuu5UHzjw0xixl6Y5UgY
         UHppIMeI6j2PdOQH7egD70hu/PPas2DoMTKvmr13HjLsIB4nrQTqs0YVNubbPTQ9OSgO
         rZug==
X-Gm-Message-State: AOJu0Yxkc+6ViyZ2qiyVTxjeAZDZ6zfyyDFf1RMxWoa8DvmmOeW1DrDD
	qZDAG52eVeA5sHDhpMQp1VtK6Y7DcDCerA/BCSzJaKwzWwg2mBaRT6+gqCnAdZu6pqY=
X-Gm-Gg: ASbGnctSZbMjpADtr4zWQAsz9yqQe9XHiBrjBtS3WgG+raUblJMCnQj/IHYdkOJdSdT
	SAa+TEmWNWwXtoB8Iuw50qWaRlhgDnRpQa6tmYygHaQBxpsgBxnxec7CvajdUTeWyMv5lNopMCH
	yY1WKgc/HZL5lwxmOEihyRTVT5VQhFPxBRcAi59+Ryzlqsqr1fKkt6GVE+0xfAHBWANJUPAC4VP
	Cu0EIwYyA5cgUspjQ6aRqqU5fVYbEpDcku8Rnc4sODRbRRz7aA2mxW2I5Ms70GzZDoWhqL2b9ZY
	BUR2lDGuLi73xLwxjiVZxANnUjjQln1+ljwxmu5h0CZGPCQWYKyDuS/qBgOnghcZ+Dox/nIsp8C
	gVoPMNVEtk838BetoLknrcYo7d6p76TSiKqrPMXK4JMjagG4wNtdEGRR8VkZN3Or267yhvCyslm
	uf3WIQ+3nwRb+0zw==
X-Google-Smtp-Source: AGHT+IF9NTYkPXUzyzxpo307dclbA0YlDpfbyXVPA+gMFmZ93oYTaLdTz2BXE7DG7BerTByUAvxTDQ==
X-Received: by 2002:a17:902:f68c:b0:298:33c9:eda2 with SMTP id d9443c01a7336-29833c9eeeemr55576395ad.33.1762853865162;
        Tue, 11 Nov 2025 01:37:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 02/18] mosquitto: bump to 2.0.22
Date: Tue, 11 Nov 2025 22:37:17 +1300
Message-ID: <20251111093733.1393568-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121505

From: Gianfranco Costamagna <locutusofborg@debian.org>

Refresh patches, drop patch 3238, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0331499e1f023471173e5d35d29d7ef2362b4aeb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mosquitto/files/2895.patch                | 15 +++++++++--
 .../mosquitto/files/3238.patch                | 25 -------------------
 ...osquitto_2.0.21.bb => mosquitto_2.0.22.bb} |  3 +--
 3 files changed, 14 insertions(+), 29 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/3238.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.21.bb => mosquitto_2.0.22.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
index 4c39a290b0..d9432e749e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -10,8 +10,6 @@ Upstream-Status: Submitted [https://github.com/eclipse-mosquitto/mosquitto/pull/
  service/systemd/mosquitto.service.simple | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/service/systemd/mosquitto.service.simple b/service/systemd/mosquitto.service.simple
-index 15ee0d6..c2a330b 100644
 --- a/service/systemd/mosquitto.service.simple
 +++ b/service/systemd/mosquitto.service.simple
 @@ -1,8 +1,8 @@
@@ -25,3 +23,16 @@ index 15ee0d6..c2a330b 100644
  
  [Service]
  ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
+--- a/service/systemd/mosquitto.service.notify
++++ b/service/systemd/mosquitto.service.notify
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
+ Type=notify
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/3238.patch b/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
deleted file mode 100644
index 89795f4cd9..0000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 2cb8129793b54de7c68efe1a4a8e91c788077a8e Mon Sep 17 00:00:00 2001
-From: "Roger A. Light" <roger@atchoo.org>
-Date: Thu, 1 May 2025 11:58:23 +0100
-Subject: [PATCH] Fix incorrect reference clock being selected on startup on
- Linux.
-
-Closes #3238. Thanks to Eric Guin and karlri.
-Closes #3168.
----
-Upstream-Status: Backport 2.0.22
- src/mosquitto.c | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/src/mosquitto.c b/src/mosquitto.c
-index ff83ef3da..2aea55237 100644
---- a/src/mosquitto.c
-+++ b/src/mosquitto.c
-@@ -465,6 +465,7 @@ int main(int argc, char *argv[])
- #endif
- 	struct mosquitto *ctxt, *ctxt_tmp;
- 
-+	mosquitto_time_init();
- #if defined(WIN32) || defined(__CYGWIN__)
- 	if(argc == 2){
- 		if(!strcmp(argv[1], "run")){
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
index 86d26304ee..189250ea60 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
@@ -17,10 +17,9 @@ DEPENDS = "uthash cjson"
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://2895.patch \
-           file://3238.patch \
 "
 
-SRC_URI[sha256sum] = "7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d"
+SRC_URI[sha256sum] = "2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 

