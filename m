Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B164CE7B15
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 09:38:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.10156.1695893896709189132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 02:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbSTIaC5;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9adca291f99so1598357166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695893894; x=1696498694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGLPsBLrVmotbmcaXZ6s5BdZv58KW6f668Nc+wOzu2o=;
        b=cbSTIaC5PREkW/K06bf2XdPLIdHAOHp5hY45SRyEQ2rCYkF8411nLoBHqGhCAJe1tS
         2oQTv0VxrOM7RUagqpB1gHl7pqcyXuYbTMWBGJjb7seEWbQlTKUn65DRfhHlULlDyCXP
         Cx0wKp2pQrd80IF/W3+7Fd+rPrNHXejkD4Z4vvNLnV0SISRl6Z44hywVYnXi+nGKzLj+
         Xs6q2unFX4MLMgy5dn/M4QG7hwo0WB44oebA1we0hAHUlLPj/ZIrWzj4/RJ2kAh/RLZ+
         kxRHE1L5h8deRW+dynYHbf+XF9ieutfHbxXpaVBfaSw/sz+a9bxn4fKZuqJn0FSXbMaw
         XKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695893894; x=1696498694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGLPsBLrVmotbmcaXZ6s5BdZv58KW6f668Nc+wOzu2o=;
        b=Xu1UYvZcTABt86PLGuahrHTcy2xeuZOYLOke0XEWfqiAKGGZibZsXyO4dkkn1ArxJN
         XoLmcMQsOdL+Y0w5ddsWpOhr/LNTHWzfxADz3RpeAB4Be93jXo5hQKO/wh2ymhIc1cCo
         +l4dp3LbTy0QvPxhWBKt0RqT4ygQN5Jr5f75RSpvDyX6Bnbv2Vh9rj2GuhTbHSBRQc6y
         VwgFq9nHYzKR35qhlAcy4KcoKt6JuS3n/qPLynpa0VcR5XBCYhbsNNPXeoi+D4U6JyVJ
         Aj2rojG/Ui5cLUvE8YaHoJVCVxrtyh9VY4A7bY3FLm9xBvY+IaeHV9WnXAdjqkULEvFc
         fqQw==
X-Gm-Message-State: AOJu0Yx+6a+3yZsaaWlfpJ3bBUtF4JTeDQ2jKY/M5g/bG8Vi68333OlA
	H+KPdYeEqLfQ4FG4WDSPqpEGWdbZh8cDTQ==
X-Google-Smtp-Source: AGHT+IEl0Z3tczeVubXtiJZCgS6V8anqa0HUIWPSJAY0jj5mWHcIhXfIjGKXEtufXA0iLtGjXGqCtQ==
X-Received: by 2002:a17:906:108f:b0:9ae:5202:e611 with SMTP id u15-20020a170906108f00b009ae5202e611mr677147eju.14.1695893894412;
        Thu, 28 Sep 2023 02:38:14 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula (mob-5-90-41-13.net.vodafone.it. [5.90.41.13])
        by smtp.gmail.com with ESMTPSA id i4-20020a170906850400b00992a8a54f32sm10579340ejx.139.2023.09.28.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:38:13 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Federico Briata <federicobriata@gmail.com>,
	Andrea Reali <andrea.reali@cnhind.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] dlt-daemon:
Date: Thu, 28 Sep 2023 11:38:07 +0200
Message-Id: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105219

Make sure also without systemd enabled as default, the tools can be built and installed,
such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples and dlt-console.
They have stub functionalities when systemd is not default, but they can still be used with
limited functionalities

Reported-By: Federico Briata <federicobriata@gmail.com>
Reported-By: Andrea Reali <andrea.reali@cnhind.com>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 33fae0619..3811772a7 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -22,12 +22,13 @@ SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
+ dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console \
  udp-connection dlt-system dlt-filetransfer "
 # dlt-dbus
 
 # General options
-PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF"
 
 # Linux options
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF -DWITH_DLT_SYSTEM=OFF,systemd"
@@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=
 
 # Command line options
 PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
-PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
-PACKAGECONFIG[dlt-adaptor-stdin] = "-DWITH_DLT_ADAPTOR_STDIN=ON,-DWITH_DLT_ADAPTOR_STDIN=OFF,,dlt-daemon-systemd"
-PACKAGECONFIG[dlt-adaptor-udp] = "-DWITH_DLT_ADAPTOR_UDP=ON,-DWITH_DLT_ADAPTOR_UDP=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF"
+PACKAGECONFIG[dlt-adaptor-stdin] = "-DWITH_DLT_ADAPTOR_STDIN=ON,-DWITH_DLT_ADAPTOR_STDIN=OFF"
+PACKAGECONFIG[dlt-adaptor-udp] = "-DWITH_DLT_ADAPTOR_UDP=ON,-DWITH_DLT_ADAPTOR_UDP=OFF"
 PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
-PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF"
 
 inherit autotools gettext cmake pkgconfig systemd
 
-- 
2.34.1


