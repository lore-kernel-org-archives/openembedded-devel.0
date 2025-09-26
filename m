Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B3CCCA468
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.18543.1758896366108709499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSO+4V+q;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso4552685a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896364; x=1759501164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1xgLw+lT9DcPmovUybnqDzDx+A9Z4sYrh0ALc70Os=;
        b=YSO+4V+qw4S52yhylD9l6rkQ9yZjhMFVOQerD7rYYyjm90RH4fcs/zS+bTA6HQyRlr
         2EPqtAbIwo2txI5/pxMuwmkxuKNXS26tmOl+cskRKSingZPhxe6iIwFAyUDS/Ltao/8G
         SVkD32S8F5Lio9RJcprXU3yguOvRAOUGg3/fHdJ1JtOIOJuK+++WYQBgO9cBQX1g+bVm
         HTRieZaUZSdRGUUwqnxOdX04A+aF4Jhn0RMfNDT6DeNBjWGJCelNbGMVVP4JN9gP+ipd
         fzgGefUlYYvwyE+Q0zeEmNYcTMu64pUsk6hWZ7n8Us+JMvI5ggl8GEgmxtr9WQian5iZ
         +bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896364; x=1759501164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kb1xgLw+lT9DcPmovUybnqDzDx+A9Z4sYrh0ALc70Os=;
        b=N8At+MyKWQWpuWWJBp/ncg2a5hvOx9xZgwI2/g0ZQNHEDW94mYEJqIYgNzoGduTEhW
         u0bdTSRvfUYDvBVAPXStjiE2URDf8OOzw1G/gERWC0NNnw9/RRI8brAHvPlh5iY0Shg5
         p1UpCOUANL0q0g2MjeOJo1jzA6CrWOSy9lHU/NCZwAy05vSs/jfkS8GuM7QyPKWh4dAT
         n5WI1IUUnPuGLWa6BSXJqNqwnuxL24Egz2RBTwdD7vwWANK9iftsL337lkf59tZ41mSj
         rDcM+NhtE0fWBy9sfj5/bNVISnTrBKr6ttoWLsWWtmoKlkDRMdo9Vv2goepGY97YT6JR
         c4Og==
X-Gm-Message-State: AOJu0YwgfBNRT9tfjqLa/8RpxHJn/m/AC5jBQkIhfHE0Hu1VyDnR5/On
	pIniUH3uevjWXd7wAKnGdwI3+MVoCm7pyVET1Htqqseum9z2qkemUBik5KbhLA==
X-Gm-Gg: ASbGncvdlG4BYOwhBiu0zESR3z0NfwDHzc13v63vKL+QA1BbZLAn8kpTo1uy0QeGowV
	EcZPM9TVUqCphAiRgHN6xYh9ow2B7yKbUjtra4PTik93U55XnBe+cXS20O8fs84aQVfBpjVmxyR
	OLw5Uvc0OCa25yImxErmCBp6tjss0nKcmZy05qL7pJUZ6wSFAgTF3zcOUnV0xcwuYWZhB6bPm8l
	5YHIxj0MTmhM4ccnUnvFzmmrevVYOCFQt4eRLdimLcKWRvaukm/kjd6abTJUKdEfqMtP+l2m9BW
	Qyls4VPN/p0jqTTVijk1Bpc5d5+H6WLbdhP69lr1lu7RcToKMfNvhKgGhYDS7f2eFRfCCWxJJ+z
	b1Mt6nLJNDUA9+FsX+Djf
X-Google-Smtp-Source: AGHT+IG92SLtnAob/W6pkA1Mp1w05B/ksKpB7zOLnKspJ9Dd/5NnDM0FaOS/TLzcB1LAjbZNY6wSEQ==
X-Received: by 2002:a05:6402:5251:b0:62e:ebb4:e6e0 with SMTP id 4fb4d7f45d1cf-634a292cdc4mr5912845a12.1.1758896364199;
        Fri, 26 Sep 2025 07:19:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 02/20] mosquitto: bump to 2.0.22
Date: Fri, 26 Sep 2025 16:19:01 +0200
Message-ID: <20250926141919.2010846-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119911

From: Gianfranco Costamagna <locutusofborg@debian.org>

Refresh patches, drop patch 3238, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0331499e1f023471173e5d35d29d7ef2362b4aeb)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

