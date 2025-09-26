Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D9CAC5BF
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.18522.1758896365346071692
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TnvPq5x4;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so4502261a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896364; x=1759501164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pa+iU4T5ym4uZpneCeoDtbnOq8+CovZGtrdFjImNgew=;
        b=TnvPq5x4pr13BXgCMFnh0M0MykbTYUNGvdZ6/DSNkYsBfzWhNERoBFafGY1RhNTVPq
         To8IiPEFcEiBKEaneb+zeXPQMuSGylDxJ8KGePw7t/lBfI0v0f44M/dTwtq6Q83q1Pp/
         xeFFlhMzlLUJSrwUsN+mPDSGIaWifxicVWPoYcDZuVZMGXDuN80Bk/oDtE71QxpApnhJ
         P22AIYVikm6uDbpdgLR7zMK6dRysEdQOIT1ei47Y3+dvDTrYroabJ/W29aDXqPLY36Tg
         4Ehl/+dnl22hJN9VYFa0xYte9+Tci2jayXHeTfq3+iv+1pzhoxUOLtNnOtRccExSq162
         aHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896364; x=1759501164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa+iU4T5ym4uZpneCeoDtbnOq8+CovZGtrdFjImNgew=;
        b=Sz11fjopmyI6IhteAi/NUJcjohfR379mUs5n2Ml1DhpZnvYjxbLcNDzst9YvQ5MuhM
         cxftLPpN+9AT0DX2uXKnKPXp41B3/lFOkkncGdOFOhHfUoP8kRgvk51oZjqfHZNhB6ui
         kHlG+y2amtl/URQwqFd4ai871JBiTcm5Mv5umthdrg7doIMRBQHCrv3ZMt6VyY2VPWIr
         dpAXGSFRJKyFRjsvmmAes1OO9YZhHvsxY23sRpbzaPOndSQKfhXKW4cEyi7WO0W4t1/k
         I1+AbXK9NnJPFaIZFl6szgo6aAjNvdDYbTlt1Ib6HQ5DG8ecPRUwisU4RcWHJj5Mk1DL
         O/Sw==
X-Gm-Message-State: AOJu0Yy6bE1dCXOUe3GYbvlFTDPV/bnvLZ9g5Zf06Hklrb9YwQwsJhLK
	UxoQ5SiOLNeXLztV5XqC8jbHFA7/Cs6+YBtYBDoBvpqlMOo6Ak7ujqSwd1bukA==
X-Gm-Gg: ASbGncsSQtui/I6azlj4H0nfe1qIxAonJaPWZeIknsxKoHc1moIakGMgSngR/CQFciR
	5yfHPDgsXMznDrvE00fjRThXwmCnf3k6cW9aWOdvbVbVNZdGVvhqzlrsexKz4V1K6o3M4wN861O
	TQjOFJjq3Rvl+jcVwZFMa88khc4uWbMqzM8GQxFWBblMmLVYBjc1EGMbF4HgqYYZYpI07xQrH0J
	CMuYpgONk6rs0RyXicL05Hr0McBi22XnaMAnX1YldrP4nNxOOwfiRhabf7W9GhQOONmwGPyIhBg
	IRetmMb7j97M0gfE8mJDKafGjjU/UIsDgst+QodOZgDNJM8B9C9RheT4vGWZgF/GajRxDzHTwa8
	1/FmLw3RgE7JBAJbEn/Cz
X-Google-Smtp-Source: AGHT+IFccAqTFxuBKZlE1Vb5iF1daIYfPNHstKMy4BmMealtUCtt0FGqztvwxrcI21QRi+mT2yYlQw==
X-Received: by 2002:a05:6402:4308:b0:634:4e56:ba02 with SMTP id 4fb4d7f45d1cf-6349fa7e715mr6628396a12.23.1758896363520;
        Fri, 26 Sep 2025 07:19:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 01/20] mosquitto: bump to 2.0.21
Date: Fri, 26 Sep 2025 16:19:00 +0200
Message-ID: <20250926141919.2010846-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119910

From: Louis Rannou <louis.rannou@non.se.com>

Upgrade to mosquitto 2.0.21. Update the patch status for issue 2895 and create a
new patch for an issue introduced in 2.0.19 which causes connections to get down
when the clock is changed.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a27eacee2dc066365e32bafa66c666bcd93b3ca)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

