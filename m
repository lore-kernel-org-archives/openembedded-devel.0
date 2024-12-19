Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CC5E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:32:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.127427.1734607960003130787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aLT9tsqw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241219113236daf9c23fae7990c02f-lioxww@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241219113236daf9c23fae7990c02f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 12:32:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vxe6rTHmzn5qbiSRmnL48pddBDvelNn1YNc8NrtD8H4=;
 b=aLT9tsqwkqyK/htkLNnFNlDq1ZyJ2juhqhSIIBTsOmYagJe/Fw6jMMffSnxX28TtIB6gBB
 BLGfhN5dG71Btld1wz8cI1zAby8mpBH/20YJYrxHNno1fc8AEJyBm3YA/U5jnNBp/C53ZrQv
 zJgGzqZHze4JRNVOBYy+f2evWVh6aYYkbRzy8d1C6eK61kM4nEB20sCNkOISydDB7JJLthl+
 B+iZg4VoHBVuuMvAM8BqdECfXpQ2ltpyehX3w6PPpNyEpEqkt9yQvfN4c2nix92S6azf5p9e
 cWgTwX7pyyBafw3Ac54ke8ax1YxNgAIT+kMdNzhLlP89vdLH1k1txoxw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>,
	Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/2] mosquitto: upgrade 2.0.18 -> 2.0.19
Date: Thu, 19 Dec 2024 12:31:46 +0100
Message-Id: <20241219113147.336484-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 11:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114395

From: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>

- Solves CVE-2024-8376
- removed 1571.patch and 2894.patch, already applied in v2.0.19

https://github.com/eclipse/mosquitto/blob/v2.0.19/ChangeLog.txt

Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../mosquitto/files/1571.patch                | 22 ----------------
 .../mosquitto/files/2894.patch                | 25 -------------------
 ...osquitto_2.0.18.bb => mosquitto_2.0.19.bb} |  4 +--
 3 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1571.patch
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2894.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb => mosquitto_2.0.19.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
deleted file mode 100644
index 627638ec89..0000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1571]
-From 3fe5468f1bdca1bff1d18cf43c9e338f41aa9e32 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Wed, 22 Jan 2020 12:39:49 +0100
-Subject: [PATCH] Add dynamic symbols linking with cmake too
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
----
- lib/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -94,6 +94,8 @@
- 	OUTPUT_NAME mosquitto
- 	VERSION ${VERSION}
- 	SOVERSION 1
-+	LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.version
-+	LINK_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/linker.version"
- )
- 
- install(TARGETS libmosquitto
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
deleted file mode 100644
index 7374cbd26f..0000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Joachim Zobel <jz-2017@heute-morgen.de>
-Date: Wed, 13 Sep 2023 09:55:34 +0200
-Subject: [PATCH] Link correctly with shared websockets library if needed see:
- https://github.com/eclipse/mosquitto/pull/2751
-
-Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel Engberg <daniel.engberg.lists@pyret.net>
----
-Upstream-Status: Pending
-
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 9380a04..dce8313 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
- 			link_directories(${mosquitto_SOURCE_DIR})
- 		endif (WIN32)
- 	else (STATIC_WEBSOCKETS)
--		set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
-+		set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
- 	endif (STATIC_WEBSOCKETS)
- endif (WITH_WEBSOCKETS)
- 
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
index ea9eb4857b..c6ce2e095e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
@@ -16,12 +16,10 @@ DEPENDS = "uthash cjson"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
-           file://1571.patch \
-           file://2894.patch \
            file://2895.patch \
 "
 
-SRC_URI[sha256sum] = "d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c083822823f4448a"
+SRC_URI[sha256sum] = "33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f2860af142abf82a9"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.30.2


