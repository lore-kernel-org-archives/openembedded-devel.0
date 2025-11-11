Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B348CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:37:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13799.1762853863327956839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDScTBZ3;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bbac8ed0614so844806a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853862; x=1763458662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9o4lapLl0KKy7Klu2loY7JATJ29mGXIDBep8/WhTDI=;
        b=XDScTBZ324eCibNrOTg9BAFl2lvJ17Bw9i4euogfdD6cOaKAzwQ91t12FMIGIPZk8r
         +ykgaH/6w11XMylXh3p20k6/lsFG/ruI1U1XBcdyA72TuOYj7Yxp+OuwomOz99LmsF0y
         /PiizH6mmY74knvwbELy1mX3XkU+hApbxboyDzChhN7STFt+e8tOANSOmcTUy4a+6TNU
         bl+69FM/rbUbPSxBDeg655+duTy5eF8TLbw2hFqRPUlrYnKX+7TZ56COv0G2TkgtQ9IR
         1n08KT3LXaGrF0AAnxiqfA7wJOHsbPQIQNwZO/EqI1JdG92Zjvwek71AOIz8DsRanXY4
         UcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853862; x=1763458662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9o4lapLl0KKy7Klu2loY7JATJ29mGXIDBep8/WhTDI=;
        b=wtKOS2n0Hpk6Cxn/r7XjAs9qAlO0nlwsCO8a1LXL4FU1XHrvxuKE76vgrJwKJfOTgN
         oyhg/KLiGvhpR4mc/QuwiEIEpbrjeQ2ahnMYuvhmVS4i0g9eZYv2E+HwOm/FaZuVHYt+
         svQaWQ2InEnZxyAww6hdusE0ZEKI8gONPW6WJ9kagxac/wNcLLeFIDFdlslh8lQSSTtN
         bykE/9izfhfvnw9Xtt4DZJ1jRaZ8PTKu+dkrqvQ93rY3NTKlG5QwR/DBj9KUTtM3/Ci+
         dCRnCbD33SRtDLUw2hZ7dqrniPLNeZjFBD3CIZDLEHfpuTwdK6zLMQMgzYbU3ZMXnY8x
         DmQg==
X-Gm-Message-State: AOJu0YxVvzsm7mKIFK6v3r0vW2Ry32kmeT5w252kU2JAS1rMIuDcKbIF
	4z/FjLuiksNFjR7Qc7YTR9uCsJYRHpT3E4Vps469RLto6HSiXQjKlXjJKInLN6kH
X-Gm-Gg: ASbGncscFeNXyA3tcmrpQ8k4KiBXbtUyd/GizrVojXI7dmdw+D54cYxB1gW8fybP+hW
	morKoJCsF35WWK1+r5YtYFBYxyiZLu5FE9f3b2ks7foEjeeA0+GeBBDtdkCDpP0S6VMYbbbKzXc
	Z4u/kTW5neSMtCfLFykWeWPRX6LpgQGbgQxN9+fyGFDIIL1oJBYoSlwqn/jiBPAqJ00YQolt261
	DLBi6PGPTTka5zuln4oRc6KbHdu4xygmNhq9ag2MtU+YDYf4XFgn0Ba4bby035QXosO27VhY0Ku
	ayw+o2BMzWVUUezGdwoKrkOd0qWWzJwc9iBf1PzKTHby8m37dNDuVD1+S1KyK5uAfKg22P/zqOf
	mp/H980dliVEiNfH/OtOsV8P4TjSbFH1jdVJ2+xoNl2QRf5ybr+OylV5VmdXw4OdDPwwKMCxUJm
	qOi90f7ZhV8xqsc0HxytyrSBNG
X-Google-Smtp-Source: AGHT+IFxINmqTgp4HqcAa+UkNPstZ8v+72hPuhko63c1UYa7IpY2eIAw8fYUjFxt1AuqUXxn0R5vKQ==
X-Received: by 2002:a17:902:f54e:b0:277:3488:787e with SMTP id d9443c01a7336-297e53e7704mr153491585ad.12.1762853862074;
        Tue, 11 Nov 2025 01:37:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 01/18] mosquitto: bump to 2.0.21
Date: Tue, 11 Nov 2025 22:37:16 +1300
Message-ID: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121504

From: Louis Rannou <louis.rannou@non.se.com>

Upgrade to mosquitto 2.0.21. Update the patch status for issue 2895 and create a
new patch for an issue introduced in 2.0.19 which causes connections to get down
when the clock is changed.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a27eacee2dc066365e32bafa66c666bcd93b3ca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mosquitto/files/2895.patch                |  2 +-
 .../mosquitto/files/3238.patch                | 25 +++++++++++++++++++
 ...osquitto_2.0.20.bb => mosquitto_2.0.21.bb} |  3 ++-
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/3238.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.bb => mosquitto_2.0.21.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
index 853f881754..4c39a290b0 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Mosquitto now waits for network-online when starting
 
 See: https://github.com/eclipse/mosquitto/issues/2878
 ---
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/eclipse-mosquitto/mosquitto/pull/2895]
 
  service/systemd/mosquitto.service.simple | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/3238.patch b/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
new file mode 100644
index 0000000000..89795f4cd9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/3238.patch
@@ -0,0 +1,25 @@
+From 2cb8129793b54de7c68efe1a4a8e91c788077a8e Mon Sep 17 00:00:00 2001
+From: "Roger A. Light" <roger@atchoo.org>
+Date: Thu, 1 May 2025 11:58:23 +0100
+Subject: [PATCH] Fix incorrect reference clock being selected on startup on
+ Linux.
+
+Closes #3238. Thanks to Eric Guin and karlri.
+Closes #3168.
+---
+Upstream-Status: Backport 2.0.22
+ src/mosquitto.c | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/mosquitto.c b/src/mosquitto.c
+index ff83ef3da..2aea55237 100644
+--- a/src/mosquitto.c
++++ b/src/mosquitto.c
+@@ -465,6 +465,7 @@ int main(int argc, char *argv[])
+ #endif
+ 	struct mosquitto *ctxt, *ctxt_tmp;
+ 
++	mosquitto_time_init();
+ #if defined(WIN32) || defined(__CYGWIN__)
+ 	if(argc == 2){
+ 		if(!strcmp(argv[1], "run")){
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
index 2bc1303185..86d26304ee 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
@@ -17,9 +17,10 @@ DEPENDS = "uthash cjson"
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://2895.patch \
+           file://3238.patch \
 "
 
-SRC_URI[sha256sum] = "ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8"
+SRC_URI[sha256sum] = "7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 

