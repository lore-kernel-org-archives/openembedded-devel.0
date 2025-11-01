Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3A7CCFA02
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 18:12:55 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11201.1762020768172561387
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 11:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=B31u94k3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025110118014222969d3e1000020776-_qwlsi@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025110118014222969d3e1000020776
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 01 Nov 2025 19:01:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xPprdxipBTDG0bhFGteVveaCRCsLOvV5hSs2eGmjBmw=;
 b=B31u94k3+wVJ++yDQZ+ziktcO4m/iM10VIJ3CLbOhSiUYBRVRT4JhD69AtBGXowMMDlX/P
 MWTffqerU+loO1OIjME5ei02fBAauztTelqGNtrr3cxJgVPdsfjwFRPoUFDk9pIoCncZ+IXr
 gN4pjd94gmGKOfL1GXJsFolxeMn42Bxn7e1UcIbL0KRC9pGDBGbE8OlDJJGdaZ24sMGwiB+l
 yq09yFAqgdDj8T9sWPsK1TmKFeaFaCKH1TTSHfuJHsp2RcfUefu2RUymde+zsHlOjK+uaFUB
 XeMFmGSKI4KkhMNYwEuV5+1/EQGxnr5hCSuAqQYNnyBsTKwBUNk1eLuA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 1/2] mosquitto: bump to 2.0.21
Date: Sat,  1 Nov 2025 19:01:37 +0100
Message-Id: <20251101180138.9437-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 18:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121250

From: Louis Rannou <louis.rannou@non.se.com>

Upgrade to mosquitto 2.0.21. Update the patch status for issue 2895 and create a
new patch for an issue introduced in 2.0.19 which causes connections to get down
when the clock is changed.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
This was backported to kirkstone; pick it to scarthgap so it does not
have an older version.

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
 

