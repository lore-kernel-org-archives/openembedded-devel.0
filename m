Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FDACA5503
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 07:58:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6597.1694591880785057060
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 00:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WGSXN3eA;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso68585535e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694591879; x=1695196679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkY42O3CPQZcrftt+Bh8p31BrM8sOVsDQ10xxUB8HE0=;
        b=WGSXN3eA2l3WVWEEk8pZYyXTnCGMrfnxUsjNLLgi+S+6pn6jvh1TZVQcDdz7T71HCb
         rgvG71NXDTPgXvg9Ug77O3hgC1SENVEcvw52yRrKMUU/OWS7DbvlnvqWIVxdlTNQO5TY
         wTslTZBY0aBaGXdAc6oeflWfMVOuzqzskwYy6lf8DtTwooBSzVq3S5RNeGIEHN9pmhCf
         15c2jMJY570gTUXLi5WHR5d4oaAuV9foyfHq5Lai6BHHrxaBNyupDHKjx6qn9RPyDyjt
         7xGjCdaArapjkipDX3u/5PGhix75qaQeVO59B29Mf1Wvyt9H2TBqOoNjWd5ZT3jL3sZ7
         xI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694591879; x=1695196679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkY42O3CPQZcrftt+Bh8p31BrM8sOVsDQ10xxUB8HE0=;
        b=G0haevL/MTEFlyfmNG+uO07Ryz5/x5k5ALcKFphdJvLQ+CW3bSXcOCsS1dzwSXpVeY
         Ulqj3Bmq36Wa62dnm2kijRg5UvPwfSipmMu1IvZOPMBN6EmDOepg1NcHItyl7D2+3Swf
         UpMmdLRiWLzc8236XIkdVMWu+otceJPSsPIr6bZuKkF/GDduirRBsmWVCzaZkNdmIVu4
         /n4CAtT+N2xzKcgv2FDYt7hlyajpjfhQOPZZXobLVje6woZf4obBS67bXBxIcmmjhz3N
         mT4w95U8oe6ycoj5EE/BcouM9jWlKtUkWqudcXDwKJlg4iuhx8zRHiTPPvs3SOksEayE
         LlMA==
X-Gm-Message-State: AOJu0YxqwLAQu5Z8z1kU2VxWzER4x2HJuPgUPQcvW/xNisPoWAe0yMZ/
	LuV1nSE5R4fbGGLfA1c6ZD0WUe4QaB2F2A==
X-Google-Smtp-Source: AGHT+IG5DmNaQkfZrJme7HpEiugAjyD67FpmFzPn9y2tK89dm+9uW+0Ix3gJV0ICC7fAlWYvdqDPew==
X-Received: by 2002:a7b:ca52:0:b0:401:38dc:8917 with SMTP id m18-20020a7bca52000000b0040138dc8917mr1426960wml.6.1694591878483;
        Wed, 13 Sep 2023 00:57:58 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id y15-20020a1c4b0f000000b00402ff8d6086sm1224611wma.18.2023.09.13.00.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 00:57:57 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] mosquitto: upgrade 2.0.15 -> 2.0.17
Date: Wed, 13 Sep 2023 09:57:54 +0200
Message-Id: <20230913075754.2385566-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 07:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104853

Fix for CVE-2023-28366, CVE-2023-0809, CVE-2023-3592

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../mosquitto/files/mosquitto.init            | 20 +++++++++----------
 ...osquitto_2.0.15.bb => mosquitto_2.0.17.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.15.bb => mosquitto_2.0.17.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
index 9d5963c41..d0da219d6 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
+++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -1,18 +1,18 @@
-#! /bin/sh
+#!/bin/sh
 
 # Based on the Debian initscript for mosquitto
 
 ### BEGIN INIT INFO
-# Provides:         mosquitto
-# Required-Start:   $remote_fs $syslog
-# Required-Stop:    $remote_fs $syslog
-# Default-Start:    2 3 4 5
-# Default-Stop:     0 1 6
-# Short-Description:    mosquitto MQTT message broker
-# Description: 
-#  This is a message broker that supports version 3.1/3.1.1 of the MQ Telemetry
+# Provides:       mosquitto
+# Required-Start: $remote_fs $syslog
+# Required-Stop:  $remote_fs $syslog
+# Default-Start:  2 3 4 5
+# Default-Stop:   0 1 6
+# Short-Description: mosquitto MQTT 3.1/3.1.1 message broker
+# Description:
+#  This is a message broker that supports version 3.1 of the MQ Telemetry
 #  Transport (MQTT) protocol.
-#  
+#
 #  MQTT provides a method of carrying out messaging using a publish/subscribe
 #  model. It is lightweight, both in terms of bandwidth usage and ease of
 #  implementation. This makes it particularly useful at the edge of the network
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
index eea672a70..690b6bc12 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6"
+SRC_URI[sha256sum] = "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.34.1


