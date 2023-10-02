Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EC8E784B2
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 09:15:48 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.77609.1696238143765446394
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 02:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2Lu8Tou;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so2202931766b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696238142; x=1696842942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhXtLRxLnNxxCoA6cbhaA3bm/p17SQtNQEDCYppnRTQ=;
        b=H2Lu8Tou90erJaCkwhLatMNxWvP3DdsyRY2Q05G94kMGZpBKt5w//gdlISw0maYPIw
         f62RIoMVYh/HeIjz25F4hZ5eD5aqRCMK+rEZpNIGF4u+RA0lQwWC9WWQagVXV3d32kh+
         okYblmmBHfHA0XNyfZOMxv2PGoMZ3ysjod98JfjTfwsWywZvAuRWzq1YolGGGjVQdPdq
         o6tPdbKtBWUyuUwMBsbXuWqcDXx8wHqvAihm+dge8ozDBvZjpWvn3fUCfIf2+J9tNCsa
         pNA3FsQxTgh67qxvM6yiuNaPCzpR7NSsmhjQnRho0deLN81gBdSeYys/eD2lDBfB8UEH
         0KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238142; x=1696842942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhXtLRxLnNxxCoA6cbhaA3bm/p17SQtNQEDCYppnRTQ=;
        b=kSzgwCbst+gXr2q4Di9zQutgxCoEDZfSiO55ZXjc3QSs4kbxHop6nGj5pg33ey7TDw
         CpbtikZ978o7xXkClPFVrUOp6lCddM/fZa9ltCs+rvg8GU/lyonxkdYXyhHoamMQvuUp
         QrZP4lLXXBNFQhC3csHQMdV3sN1hre9VP/VLLo0gwrRYV0rvFMm56W5/O+O9NdLIi52j
         NBgm5oNY96nG8FZcsYY7d/KW5mb25iV+olzMYmVzSI7jn9RfNC3zpu/B0EgcK5HdJdh/
         WJk/1dhfPE+7kreQt4i0XK0bYvqquR6ro87jfc3unwPj1Ahgt87xpJo7VbyJtewRfbcx
         En6Q==
X-Gm-Message-State: AOJu0Yzs8a7LCJ/CnMN20SJUdWb1/PA2dCRcmL9ZAIL7G+SmHFKrREoY
	uNqHgkdm0ttva+0wmt9O/KRCMVgPAhvlDQ==
X-Google-Smtp-Source: AGHT+IEaOzd6PoFpNhYYilsUP8SoTHeZim6Qh8aq2K/51E8uMIj/edh78sOGls/jtjKlj3WbKeZw3w==
X-Received: by 2002:a17:906:3050:b0:9ad:e180:16e3 with SMTP id d16-20020a170906305000b009ade18016e3mr9378626ejd.37.1696238141531;
        Mon, 02 Oct 2023 02:15:41 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id d12-20020a1709064c4c00b0099bd86f9248sm16768977ejw.63.2023.10.02.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 02:15:40 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] dlt-daemon:
Date: Mon,  2 Oct 2023 11:15:34 +0200
Message-Id: <20231002091534.963730-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
References: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 09:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105302

make sure systemd is enabled before trying to install the service files, otherwise we might face issues if we remove systemd support
only for dlt-daemon e.g. with
PACKAGECONFIG:remove="systemd systemd-watchdog systemd-journal"
---
 .../recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 1522d02c2..410fffa24 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -55,13 +55,13 @@ EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DS
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE:${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
+                          ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-system', 'dlt-system.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 SYSTEMD_SERVICE:${PN}-systemd = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor-udp', 'dlt-adaptor-udp.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples', 'dlt-example-user.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-adaptor-udp', 'dlt-adaptor-udp.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-examples', 'dlt-example-user.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
 "
 SYSTEMD_AUTO_ENABLE:${PN}-systemd = "disable"
 
-- 
2.34.1


