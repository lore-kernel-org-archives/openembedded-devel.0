Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCF4E6F09E
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 14:31:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.36560.1730644260482517623
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 06:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxZphkkW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so41306145e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 06:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730644258; x=1731249058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KBnatgeUwF84+ssTTZl4c/sHYx+renEuYvmDhCXH/5I=;
        b=bxZphkkWkDh7MHXcarJ3B9IaZELa4te880WE19xYUriR0dJKNKMzsswnYRhXTRTu2v
         TrkVir1SHXVK0JzY4YYt9gbbDoLqBC+dmT1lsoA8kof5vTYnIA8V7E+Ku0Xq2RSGH0MF
         SfzFiiK7YdhOdGrZ5fMy0irrZ8E7d58+n0g6/XZih5v3H943KmEOgZZOCuVLxBhxLsak
         RpH1pUKUVqHGR4B0Yd+/teRmDKPzKzkX/uGag7kIKZFiT3ltz7/k7ekQAsJ5uc1J2fzz
         eSH6IP4ZUB5C3Zuo+izZGXWMWPYCUtGhhBOS+/AbQrT+dSUkMozYGAL/AzFaFt5qAjfe
         SuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730644258; x=1731249058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBnatgeUwF84+ssTTZl4c/sHYx+renEuYvmDhCXH/5I=;
        b=qEAnzPCxVgi7ckzP6HP/aXAwsc8PxxiKiRnMT9bEvGGUMjKiPHSzv7kSdkLkqaTsDD
         gvkDfEcaJObf4U9y6sF9VZjWw3q2vtp2qcH7dkBb5BTJe87heV4JshExvLufBxgg+hj6
         3LrFbSiZaAYaxhxisZvktrN2PFAwQMTz8+HZpm9QbP+wrJTOE8dcjrrqFjlbKGpymlCi
         ByC2/fgoKMjnwvyUNMiw/wOTz4XNvtUov35opCQ/6UiKjqA+RnCzR2duD699cyplKa8X
         505fGfmOir0z7VAhIJZTEDBPRoQW9HwoscqPzk+WH2TMBc5AXHad0GXQkJ2PlA/V05Ew
         7rfw==
X-Gm-Message-State: AOJu0Yyf2c4m3f4rvakZ8VyJaN5l71o3l3FaCVFTudVN8jXI8HzfzLgJ
	etKKMOkQaGsSiP6Y1yIUVKY+hUcfNVrGqIY6B85zXb0vRruLbWAgQvuKYQ==
X-Google-Smtp-Source: AGHT+IFNHDPCaGyChIyRJbaBvRE8AJ7Fyj9mKozS6uoO9pzGGL1x+ds5L/wdD01bYeHf4UXcsnJwPA==
X-Received: by 2002:a05:600c:3b82:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4328b4bdc8dmr66332775e9.32.1730644258355;
        Sun, 03 Nov 2024 06:30:58 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7392sm10732907f8f.55.2024.11.03.06.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:30:57 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: WebUI choice between all (default), v0, v1 or v2
Date: Sun,  3 Nov 2024 15:30:38 +0100
Message-Id: <20241103143038.186087-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 14:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113396

Added a PACKAGECONFIG to select the version of the WebUI to be installed.
When not set, all versions (v0, v1 and v2) will be installed.  What is the
default of Netdata.

Enabling only the v1 version makes the package 25% smaller.

More info: https://github.com/netdata/netdata/issues/15640#issuecomment-1946041083

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/netdata_1.47.5.bb                 | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
index 88dbe19e4..7693335da 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
@@ -75,6 +75,10 @@ PACKAGECONFIG[cups] = "-DENABLE_PLUGIN_CUPS=ON,-DENABLE_PLUGIN_CUPS=OFF,cups"
 PACKAGECONFIG[systemd] = "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON,-DENABLE_PLUGIN_SYSTEMD_JOURNAL=OFF,systemd"
 PACKAGECONFIG[docker] = ",,virtual/docker, virtual/docker"
 PACKAGECONFIG[go] = "-DENABLE_PLUGIN_GO=ON, -DENABLE_PLUGIN_GO=OFF"
+# WebUI (packageconfig not set: v0, v1 & v2)
+PACKAGECONFIG[webui_v0] = ",,,,,webui_v1 webui_v2"
+PACKAGECONFIG[webui_v1] = ",,,,,webui_v0 webui_v2"
+PACKAGECONFIG[webui_v2] = ",,,,,webui_v0 webui_v1"
 
 # ebpf doesn't compile (or detect) the cross compilation well
 EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
@@ -123,6 +127,22 @@ do_install:append() {
     install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
     install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
 
+    # webUI
+    if  "${@bb.utils.contains('PACKAGECONFIG', 'webui_v0', 'true', 'false', d)}"; then
+        rm -rf ${D}${datadir}/netdata/web/v1
+        rm -rf ${D}${datadir}/netdata/web/v2
+        install -m 0644 ${D}${datadir}/netdata/web/v0/index.html ${D}${datadir}/netdata/web/
+    fi
+    if "${@bb.utils.contains('PACKAGECONFIG', 'webui_v1', 'true', 'false', d)}"; then
+        rm -rf ${D}${datadir}/netdata/web/v0
+        rm -rf ${D}${datadir}/netdata/web/v2
+        install -m 0644 ${D}${datadir}/netdata/web/v1/index.html ${D}${datadir}/netdata/web/
+    fi
+    if "${@bb.utils.contains('PACKAGECONFIG', 'webui_v2', 'true', 'false', d)}"; then
+        rm -rf ${D}${datadir}/netdata/web/v0
+        rm -rf ${D}${datadir}/netdata/web/v1
+        install -m 0644 ${D}${datadir}/netdata/web/v2/index.html ${D}${datadir}/netdata/web/
+    fi
     chown -R netdata:netdata ${D}${datadir}/netdata/web
 }
 
-- 
2.39.5


