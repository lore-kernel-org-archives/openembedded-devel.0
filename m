Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42933CCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 18:01:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11020.1762020108323519967
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 11:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nwDNyaEi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202511011801467403ad5b1100020790-_azohu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202511011801467403ad5b1100020790
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 01 Nov 2025 19:01:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qOE9vPGM1gmLDe1mbF3ybnoGMQESsq2EoL7ebStGt9A=;
 b=nwDNyaEi4GNfM1L0FOzVotLMiLMZx2JFWtJLYNAjL0F7toFHLp0MjLts2ifx9b5Vw1/aBS
 xd0Ya2CS/Fq+A0HGWOIM8JXQKie5FYUYvyrSO93eEpIYZ17rbb/qNExHz9yXvBaVp5AJPAXT
 ZLlC6yn6l4OWQT+7DnxvXoxehZs1MHAp4Ujriyr6NR0xWeWTXUA/A5+zqkyORiMVJj+IAHMw
 thiuBYTgl/USWMnJ6gbHp+Qdy3sm6pClpsi6DTiPKr/M2z7RcyRazw9FjiB+NeHHun5c4TyL
 MAwv40MY3SV2lZJb8gSeMGKaN+AabsC6s8LFGXTq6xot5faezgVMCY+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 2/2] mosquitto: bump to 2.0.22
Date: Sat,  1 Nov 2025 19:01:38 +0100
Message-Id: <20251101180138.9437-2-peter.marko@siemens.com>
In-Reply-To: <20251101180138.9437-1-peter.marko@siemens.com>
References: <20251101180138.9437-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 18:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121249

From: Gianfranco Costamagna <locutusofborg@debian.org>

Refresh patches, drop patch 3238, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
This was backported to kirkstone; pick it to scarthgap so it does not
have an older version.

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
 

