Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9C5C60656
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 08:00:13 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r7so146663wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 00:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5CieSUSk3FikblbMk8cKa75pIgGBR6Gth11t+FY2EYQ=;
	b=H5OleiwxwctYWmRQ7uo+EYrCiSJkmlul+9QmTom5V2b+9auwXfo3I0pJRNgkSXHhCE
	K7zD9eCTJ8knlf+gT7oP/pJ4336+dUQGrhekrPDwC3PXLipgNveNpJlUxXIHPafSZ2Q0
	h3UeEhLIv8th2dGA4GNcwb6CewWc1T7m4iOBYpE1arBmrXAoxaLKaB6xlCEO3upedMAQ
	8BIA7eEtpHMbWeClGgQ5m6SfMUvW+atrMPwcrVYzKFxykVAqwWa+x5ABlbZ/AZu4s+45
	fVMNZkP0d5H52Cr6UQ+f11HsAG0iRB2yTvKKTVByUL0nhJeqX0I/tj2mGc/wxLO9T5W9
	wpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5CieSUSk3FikblbMk8cKa75pIgGBR6Gth11t+FY2EYQ=;
	b=LdhAx2DCoYSv4HsC8aCs08gbY7TDpUVViMtrJs/ev7RjC56s/iu10jj0X4zt6IS77G
	zOgqDN/PlxctPsIlpsSt7GwQdEZg2WB+cJvmcCw1Wgtm3wfoz0EZsJ3AiHK+pn72nfkO
	w6sSi0eYHj7XENON+pS4ozGFZSwVTddp0Em1z9UE3kqkTgFUXKLsj2oGc5v/zx63wx+n
	Crxf406CEcWYTmyEs2r2w/T87hB/c2gq3nr4XF6b7/nWF8Ux4uGffVeE/RdFOp8AHCFA
	iSOAlFpoFD244Dqf3iPJXTFrVCKpk7beomgY6B9BIUQONEJ90K60k+C7VSzmxM0SgMv7
	ADiA==
X-Gm-Message-State: ANhLgQ0Yr2PrHTFqunCnCst1pHiZQdEhOWdig9Gp+VVyniS4epDnK914
	aoOfOrbxMC2jy6TkE4cAO3lgcIfp
X-Google-Smtp-Source: ADFU+vs7Ah8LX3jVrKyyr+EiGwc4DnZQIkgReTeBlSTLW32wRou2yQUaJZun+UMWalDeC0DQHFVKBA==
X-Received: by 2002:a1c:a502:: with SMTP id o2mr13390956wme.94.1583654413400; 
	Sun, 08 Mar 2020 00:00:13 -0800 (PST)
Received: from localhost.localdomain ([5.171.136.142])
	by smtp.gmail.com with ESMTPSA id
	i10sm50367072wrn.53.2020.03.08.00.00.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 00:00:12 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 09:00:06 +0100
Message-Id: <20200308080007.21944-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] mosquitto: refresh patches and sync with Debian packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Mar 2020 08:00:14 -0000

 Also add patch from debian to mqtt_protocol.h header file

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../mosquitto/files/1571.patch                     |  4 +---
 .../mosquitto/files/install-protocol.patch         | 14 ++++++++++++++
 .../mosquitto/mosquitto_1.6.9.bb                   |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
index 2cfa48457..93ff6bcfa 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
@@ -9,11 +9,9 @@ Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
  lib/CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index e1521f12a..14ba12739 100644
 --- a/lib/CMakeLists.txt
 +++ b/lib/CMakeLists.txt
-@@ -88,6 +88,8 @@ set_target_properties(libmosquitto PROPERTIES
+@@ -89,6 +89,8 @@
  	OUTPUT_NAME mosquitto
  	VERSION ${VERSION}
  	SOVERSION 1
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch b/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch
new file mode 100644
index 000000000..1397fc6a2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/install-protocol.patch
@@ -0,0 +1,14 @@
+Description: Also install mqtt_protocol.h, as is done in Makefile
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Bug-Debian: https://bugs.debian.org/951116
+Forwarded: https://github.com/eclipse/mosquitto/pull/1599
+Last-Update: 2020-02-15
+
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -114,4 +114,4 @@
+ 	install(TARGETS libmosquitto_static ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+ endif (WITH_STATIC_LIBRARIES)
+ 
+-install(FILES mosquitto.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
++install(FILES mqtt_protocol.h mosquitto.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
index 0d840e938..a0321a36f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.9.bb
@@ -17,6 +17,7 @@ DEPENDS = "uthash"
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
            file://1571.patch \
+           file://install-protocol.patch \
 "
 
 SRC_URI[md5sum] = "52f5078ec18aaf623b14dfb121fd534b"
-- 
2.17.1


