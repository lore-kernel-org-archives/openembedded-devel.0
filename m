Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9200.1614582130151498896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 23:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EI1yjdQ5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id k66so13334513wmf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 23:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8JE0MRwP0dHxNiWnNUIbFZfisnVie6jdnqfiwok5cOY=;
        b=EI1yjdQ5qjEYSLREXu6n/nOdnZNU+q85Sk9G5WGV3Xteks+XH1ctThtV7fIWUqt+T3
         0df+tpwj+BJvz0HzQAYoblIVz+qaBe2YO9mp3jun5eFHCF98N7VkJ8RQVibRZ61zbED0
         4shgBj9CwBMYH3HkUc+w+xd4dM7gy3+F2cpN5xaSq/kaHYSI6URhwinquzS7sTos3rTQ
         iXzTTSii8RJ5CUCSjWWZpJRfkmdMayEODtB2n1+IURIwczu0H+iNs6Zc5JxJgTg8qWf/
         WdehmpvHz7fyhrO3jpoVQRL9Zv1kR5m3CCSmvvvyRzRvkQLOMX2XBR8cn9FLmxiAaGMv
         C+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8JE0MRwP0dHxNiWnNUIbFZfisnVie6jdnqfiwok5cOY=;
        b=PNV90QmOBSh+nNZQPSmaosFkDVhNXkIhWWiOPRL3WzJOVQUjoeCAzGGbSYcV3A1lj+
         Nn6X0LGy3XPBvoV+AVzlkhV/s6JIIeqXeeJ6uakLGqXEyFvmU33Si881pCHjmzb86VVg
         9xCyoQGdSaPl9ybfLVDpl03DJbDTCgOZWFpWRhtzzidSyHLMgb38ukNIDTGAw3P6cxjk
         EdFut3g5bc1Mm86gyoUUkbr0oBVPJZTUJHhPMRd5w02W5Mtw1CzDxq5KsDh1CYN6uzOA
         7QL7zI0ZSG5WKETjJ7276AKN1e5efLng3XEAQlBPXXAJpQyJrCVuE48jSE8B98HH0Wm5
         +bSw==
X-Gm-Message-State: AOAM531VqezlngO7AVFSX6JmBDnd9z/XgZbR6YWTGUZF/g1oCKYGv1dG
	99G1e/eaXaatASK9nW0qSBO6gwiU3n8=
X-Google-Smtp-Source: ABdhPJzWUyGOX2il6n4NSorvbSTfgALjbsLxaIh4QGlYniwA0z4Dg045JjHaQsPpWTUO2yxhBswXtg==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr14170341wmc.136.1614582128205;
        Sun, 28 Feb 2021 23:02:08 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.9.212])
        by smtp.gmail.com with ESMTPSA id i8sm12915240wrx.43.2021.02.28.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 23:02:07 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe][PATCH] mosquitto: Upgrade 2.0.7 -> 2.0.8
Date: Mon,  1 Mar 2021 08:02:02 +0100
Message-Id: <20210301070202.579720-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.0.8 - 2021-02-25
==================

Broker:
- Fix incorrect datatypes in `struct mosquitto_evt_tick`. This changes the
  size and offset of two of the members of this struct, and changes the size
  of the struct. This is an ABI break, but is considered to be acceptable
  because plugins should never be allocating their own instance of this
  struct, and currently none of the struct members are used for anything, so a
  plugin should not be accessing them. It would also be safe to read/write
  from the existing struct parameters.
- Give compile time warning if libwebsockets compiled without external poll
  support. Closes #2060.
- Fix memory tracking not being available on FreeBSD or macOS. Closes #2096.

Client library:
- Fix mosquitto_{pub|sub}_topic_check() functions not returning MOSQ_ERR_INVAL
  on topic == NULL.

Clients:
- Fix possible loss of data in `mosquitto_pub -l` when sending multiple long
  lines. Closes #2078.

Build:
- Provide a mechanism for Docker users to run a broker that doesn't use
  authentication, without having to provide their own configuration file.
  Closes #2040.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 .../mosquitto/{mosquitto_2.0.7.bb => mosquitto_2.0.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.7.bb => mosquitto_2.0.8.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
index 06220327e..03a829fc8 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.8.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "56de4e27533ab53697245809feea95bf"
-SRC_URI[sha256sum] = "a98054f0b8161588975ef24e1d467550d3935f4c16ccee63ecb623248a28356e"
+SRC_URI[md5sum] = "542c30f32c4473b7c50dc2e4a1424cf6"
+SRC_URI[sha256sum] = "b15da8fc4edcb91d554e1259e220ea0173ef639ceaa4b465e06feb7e125b84bf"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

