Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF37ECE584
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 15:04:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.55430.1725894266813810621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 08:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWgVxrcb;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-205909afad3so43770035ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725894266; x=1726499066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsaSPeS8ZrB9e8dhonRjIRKZCQhuzxfWkNy43DVVFSc=;
        b=DWgVxrcbsgVq+F1rLt0aYzaJ907ZNPJl3lgn93n0q831nZmFSFIjUKT1zOvAhbzD95
         ofplJ3Tz20g5AmkGJYl2hBsq5sP4p6zNx4Iz1xkRYTLBHnmGCj+Pv1Byy1O+g1GGQPrS
         75OECvb6E1g+ki6t8d7KBHgEbPW/qTjxPV0KDahIT3GM/pLi2fWENHUYwpf9n7DdQXdx
         MaIcOnod8o0x9hJnVili59w4HiZu/YPZwusVu8mt/h0I/yRMt75S4Piya/HA85qkBKah
         UOAZ7nnhaLsv7ABwCPenFPt4Obnw2PqPlqfaECmL7+HcUd8F7rV/wjUC5q0PqW+zY+fN
         +Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894266; x=1726499066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsaSPeS8ZrB9e8dhonRjIRKZCQhuzxfWkNy43DVVFSc=;
        b=PEcIJ1ITahnX5lPJ9ARLOPyIDSrAQiRVEGGPrkVVycfygbyEaw8wz4O17FIgyhU9G4
         ZB5NW5gdyUIhM2NpykRHutioxef99knYINIGu/J8IyaniaANdJ6SX0IAeAVt+wRTGP/Q
         2tdZYzixduGdiONOyF5LMZ26fuwAwdv717BLw7ASsXD/dgt9OeTu1/jsbOP/lYdV2Ai9
         Tno437QHs+GiyRk7jIJuSisZdr+S+4V4018N0Z/iilAtDk/qqST46Foi24/iZic+7wEF
         hWuBHM+6wFEK9TkWcqVl09ilRuxzf7CG5t2tkadfcXiDzv8qYwXhjKJQp0wAxBlUy/5u
         WkBQ==
X-Gm-Message-State: AOJu0YxgYi0g0xFRPqBqVlN12oCR82Y37ecAWXtmwetFMPJ3OqfKlBS0
	CT9cMNqRqHAbg6rSpLV6fonqHAIQFE31VKlvsqSBdwFnnP4VtNwcUUwzOJ9D
X-Google-Smtp-Source: AGHT+IF6+zqKU+1mRoT9zTH9XpSnNP/yJNCZHmdiXOePTsVnmMgPnSWjyAc0RjTyIxvfybY3mDmHKA==
X-Received: by 2002:a17:902:d487:b0:206:cfb3:8c81 with SMTP id d9443c01a7336-2070a816a77mr91982985ad.55.1725894265878;
        Mon, 09 Sep 2024 08:04:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d825ba6b4dsm4063182a12.94.2024.09.09.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:04:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] paho-mqtt-cpp: Move to tip of 1.4.x branch
Date: Mon,  9 Sep 2024 08:04:21 -0700
Message-ID: <20240909150423.4157986-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 15:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112179

- User git submodule fetcher
- Disable building examples and enable MQTT C module

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb                   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
index f374837fc6..d2fbc3a34c 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
+SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
            "
-SRCREV = "c310578ee68d38cd53e79d7107fb41dc68dbafe0"
+SRCREV = "ac1b023eab789e829656144f12b248602c40e37b"
+PV .= "+git"
 
 DEPENDS = "openssl paho-mqtt-c"
 
@@ -21,4 +22,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DPAHO_WITH_SSL=ON"
+EXTRA_OECMAKE += "-DPAHO_WITH_SSL=ON -DPAHO_WITH_MQTT_C=ON -DPAHO_BUILD_EXAMPLES=OFF"

