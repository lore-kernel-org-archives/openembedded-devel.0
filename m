Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33C2CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 05:46:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.67542.1754977565856776729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 22:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQYLoTf0;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b913b7dbe3so43828f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 22:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754977564; x=1755582364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6R0vHVEmkNWywlP/Y0/+mzkXuEsJQSYl41HfdWUKrEk=;
        b=fQYLoTf0/XLxLSeYtIU98IXQ+HpibA1DvHyX4beaNyNY+UbnXCrqpva2RAnpHC4qCT
         4c4REA0nM53bQ/ZgJywm5z4POY45KVZJF794h7ez187mRfItWJSkKfXDQBZV6gh1P8iZ
         sFSfMOm055QYpMqk71cHImjlLeXEo3aIwrZU8e/euJEyqLojLpbI/Wqaemsv+SyatMK0
         IrtIOIEnVk0tu8rQYN6MumijLvkin2A1yunhLGzWPsD6/3GhtYvgu9vIaLnApl9rzVgs
         WJbzTLkQ9sI62lWNBWFA4QqwqET14EOG835meyeVJ9VUwuXqg+XO1zxgF2eelvwXGSSN
         71Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754977564; x=1755582364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R0vHVEmkNWywlP/Y0/+mzkXuEsJQSYl41HfdWUKrEk=;
        b=uafOQn04Cy33vues+lbrvXuCERrRO4xy2hK3RKyNU7lnhn029uMQ2j0R0u7U0F/XxK
         6DT8BS47nA+/TUVmgy15uB7hWO/K9EGM7ilhrdYMN8MtsAjAfNdOkvHDJSH2Z9Dg1La4
         niAybaXiAK/I4QFv4J9PXMR0X5QGYyXEa07l275hy3veCFw4H0QxgGenQWi+xmQi9NT3
         DaD6ZpYD31ifK+lOeRNosAikk5CguArqx48bOrFqS31kO/38LlSBiqjZ0ALKoVqn6olS
         t1Z9xr3JZaz2+n2iaihS9UIuoA7dHz4C1Y3xR7UjS50Sb67lYJznEdIB/vuoPME1eqQT
         lNmw==
X-Gm-Message-State: AOJu0YwfukfRZCQuyZjb/glRL/ZiG2fQCiEWWvNcb5wm5AlNi7rtvxg9
	QOiR1W4aqPsYN2SozNmY1ACeAAvm8/adQKoG5tu9PgAariTDqwlBM/r5ByFulD6O
X-Gm-Gg: ASbGnctdffePyXvCj97e9RFOXYp03rO69cBFOTJ3L7Gfd/KeSd1LGIeIH8xlObfgD9p
	P5e4oxvY8VNyu1JuBgqaYXbnJLFbHWtViSEE4/Efns3PtlX+LGW4rQPgi9UCq51IIiCO7QC4Rl2
	Y8wg89dyFs8h16trl9UrN1Sx0m6rGLegXl1HSH+1GroNAIo68BJk3goqER4YrBc9fhCeI6ogDK2
	QYZMl9atsW6p8/lI3nktnhnXVsXDKA1tjQpQGyMMvEEu8FX8MLWIEAHYNzM+ByNj6i4S2UAWSaO
	/yz+UJ+y9D7dvO6n0HjoJOUZU1yNixxa0jWoVH/kzVrCbjep9j1pxNQTIS7cx26KjDPh8j7mtbF
	OguK1kTzGcSsDcL//s2itSwNugl56v+pREOIIUhuprYuMqk1nij4NkeXZ
X-Google-Smtp-Source: AGHT+IEM7O3psoelyxkEMlYKHXReBGhgLxi8KyFKSe55g3TdddxjubQQkt25Xeppo8sdledr0AUXTQ==
X-Received: by 2002:a05:6000:2502:b0:3b7:974d:537b with SMTP id ffacd0b85a97d-3b900b5042bmr12371631f8f.35.1754977563689;
        Mon, 11 Aug 2025 22:46:03 -0700 (PDT)
Received: from Unimatrix04-Noble.. ([2a02:b027:12:ba7c:7a82:b244:c15:3831])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b95f4sm42861223f8f.23.2025.08.11.22.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:46:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] mosquitto: bump to 2.0.22
Date: Tue, 12 Aug 2025 07:46:00 +0200
Message-ID: <20250812054600.249472-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 05:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118912

From: Gianfranco Costamagna <locutusofborg@debian.org>

Refresh patches, drop patch 3238, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
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
index dcbcbadd59..1bdf54eea1 100644
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
 
-- 
2.43.0


