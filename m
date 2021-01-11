Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.35188.1610377311474116701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A5IpCdZz;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id r4so136666wmh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFUvjDTV3m2Bja6CQ5bZkvPwPB6cDceG3FEMMPGgJPs=;
        b=A5IpCdZz1j0AmyWuHnVdBh9ajMO2cS4xhGPX5G/GA/92jBWPS5hXExp+FLQZN0iGEc
         ke5+VgH24HVXKbH/ZudrU18CdwU5IHrqdHW34e7MArgGY161BcC5Pn5wvaB4p1h2CxSp
         jOZwMYWftQoiHh+9wr9i5gNpQKShzcjbVkmF5J5qiybtEQIUeZsnfZq08L23zaAeDYnK
         C2mHjAa/jgObduHiTj+z6q5EfEdZOXPDCNO55NWrOXg3uslmjxUXUCsZrJ7BaREXaWTp
         G7xm/wtuh8KDJrhCpsXe+yjYmQXvStEhuZETNxwbBaM85HOcptME7bgI3cxMOwuxluJg
         5DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFUvjDTV3m2Bja6CQ5bZkvPwPB6cDceG3FEMMPGgJPs=;
        b=uUAgb4rpBs6sT78EH9UfbQcjV5E6CJ2MUK3tYSvZiX+AY5qe1uIlgV6zHNHsNnYvgf
         49sQqiauuwSKGAF530XfIgOnKel8IpwDX1tFFHXTs26w3D/lCAfZeWPJE88Sm9BLrI2z
         Q67jSvv1PsdpvAlQCfRp0DN6oemHt6tIJsLjj8GRKZAc363GyinmxO7Jl2wrPECkNjaP
         puCHn7qtPssrkBZ+3LpcMhEeSGAD/nP9OfrfVsgl2kwMK+OpJWOm46+r1d1mahlQMtf3
         mQUPOG3hGBPg6rxQ8sItJhcUZYU2Y6cX6zS/UG7uGGpGO+wrQiQSLrL/BDza/PR6lVPW
         q82w==
X-Gm-Message-State: AOAM530UgY5YMQe7qZ/yhLgNeZvEn2eXbD/pbd1nHFS9A77h/uCnaLtI
	B6TLwSNTOKd973kFKU+wobRhGeEiEquzZ49k
X-Google-Smtp-Source: ABdhPJw6BuypOttiWKfl5sTTYJ9HW5FuVb84fO1s8mhAiej3xZovhApU6B+SLEGkjJp1R0FIYp3nVA==
X-Received: by 2002:a1c:ba44:: with SMTP id k65mr107322wmf.188.1610377309471;
        Mon, 11 Jan 2021 07:01:49 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id j2sm26244193wrh.78.2021.01.11.07.01.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 07:01:48 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: enable SO_PEERSEC usage by default
Date: Mon, 11 Jan 2021 15:01:46 +0000
Message-Id: <20210111150146.50658-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Linux 4.17 is quite old at the moment, the last 3 LTS kernels are all newver,
so it should be safe to enable a better security option by default.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_25.bb b/meta-oe/recipes-core/dbus/dbus-broker_25.bb
index 1f62c142f..8b6825029 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_25.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_25.bb
@@ -29,4 +29,5 @@ FILES_${PN} += "${nonarch_libdir}/systemd/catalog"
 
 EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
 EXTRA_OEMESON += " -Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
+EXTRA_OEMESON += " -Dlinux-4-17=true"
 
-- 
2.29.2

