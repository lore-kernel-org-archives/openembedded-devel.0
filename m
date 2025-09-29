Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1A4CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 23:24:45 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.12600.1759188276508369045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 16:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XwPF6xQ9;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-9194a0241aaso122891239f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 16:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759188275; x=1759793075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnZbw18pSrpPlX2aEb8XHtFQVgE7PhKZdskV9yRwhEI=;
        b=XwPF6xQ9tErMZFS+AjgfyehXWngIOhxy1xKXUdF9OlgMa4pHxNdxijxA+k7nYr6ooK
         zGGZbtdPdb7lk4hj5apgxpNHxgd0m4ZWRrzuGlTfkghhCjDqBMIzA9c1Gn+lMtGC1Ol/
         IduZapVwGRUHMqx6Bzin/Yz4D7HM5yAVdxjnNR42sBXedzJapkFbwl1O/MDnGWu2sPfm
         eAQ/4CthB0fLBF4WNL1bPkhLrV1DpUCQZvdLUSl8hQzMseH1YEMpis9Rk4G6LwASdRbN
         nBo3e8Qn4ccb+vFshZkdzc+Wa64C57C+W+4N56uUyO8xQW9Dkm3olucs8te+43A/MU8+
         Pbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759188275; x=1759793075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnZbw18pSrpPlX2aEb8XHtFQVgE7PhKZdskV9yRwhEI=;
        b=RxWNMeA6czt8m1G3itwNWRuMLWbRNDye+IGIwJV4CvlTNIqP95kqWYmAaimvFP/r14
         FiExG20q0AhtIibEa9LbtlvRYkm76dUiacSKpTtBm6Rb7FkRRLAQ68kHYiv7uuyB9Hd2
         elCHIg0ZOsPMeg3uT4wAOudh4DzL6xt4zwzpglcov+GvSN1BbsO8MTScKCV5DqkTFFdx
         Ie4sKxfrs9GnmoFjewOVXDmc9EaMoGe/chjGDoyYKWC6xI/fX2yfpS6SWRz6R96y7Sy5
         5PI/DICj6qUDhJYz1mO0Arn0H0hn6eFYu5UAYpYkcLyCX5sdOc8b5xr8cParnlNVnsLk
         YOWQ==
X-Gm-Message-State: AOJu0Yz9ct+LPX8g0uspUrLgJFvrdPmWOb8Eb/XSG0w/qKgQlpVgT0ny
	zCWT6xY8L7Nw1Dg0vHDRRvWApkmddY3PgsJ14lt5gasyEiBXnkLMTmCZq+oS/Ezn
X-Gm-Gg: ASbGncvRWS0HcYtDuVYucim+qgp382XiiRVDy/K+3i750DhkVFu3IsmcBI8G1Z+r2yf
	fRto1w/06W8IPhVtHRUoHJxnHqElyRYSWHif3yjktoGwKIT2pNA4vmnEAYG60T7fsdS1sPrdyVq
	HA4JNAsJzdRR7fCAC5UKVq6Tc9pxAwTBVsi0TB45raOeUgZklqfcokn9IC2DyOLkomBVfEiytDB
	aciu1KOHW+yWlzFAnTYhaX35Z75iQ1McQp2GJkZ2dv+nlK+rRPz/VBDfzmLehXrsef9osvxEMRj
	9KjuDB8dobeTXhtcjt7DoI7BQg2dkMy+aET7klmoprotZ/YZfIL27pssf9aTbfGs4T58I9Bhm3k
	qqs7JUg6MNe16P3ukfH21nDyriVxmmiyGc29Ex/DBsxsOh7RlB24N9XeqY6pMAw==
X-Google-Smtp-Source: AGHT+IEiSnm4uYVTcu+CUv1viFmrvTzJs9MVjn+Kk4ICXl67s4Nfheq9MtzbhVK5/SBMVO23LM2qvA==
X-Received: by 2002:a05:6e02:1547:b0:426:2f95:3190 with SMTP id e9e14a558f8ab-4262f953c8bmr214790285ab.21.1759188275408;
        Mon, 29 Sep 2025 16:24:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5ade67sm5244088173.60.2025.09.29.16.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 16:24:35 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH 1/2] mosquitto: bump to 2.0.21
Date: Tue, 30 Sep 2025 12:24:26 +1300
Message-ID: <20250929232427.950644-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 23:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120046

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
index 75aaf7cf38..dcbcbadd59 100644
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
 

