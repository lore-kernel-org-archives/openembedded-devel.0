Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFC4D116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:26:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3388.1764361603320976567
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXzJFMcF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso13098965e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361602; x=1764966402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9AXkbkUluXoP16BTLpUft4LHXN53wWDZXP4vrVCeiI=;
        b=LXzJFMcFl9V4nz4I2FrDNF6Zq5XG+no+Kk+aN2/LtkuispmNPKTlamDTobCxv08xPD
         pmuLwxpqlnXv1ZtsECAWV7qmjmShIZOV6529XcZ11qdP3TLMvTuwmp+hai76zcyURdZx
         p/fmtZ2/MtcOApThKRnM5JjwA16RyvSTsF6s7BJ3Chdk9jSQe6rTxCJ6jLoPNFDUgtL8
         I4iLs7php55E7Dkkdj5ME7bzaAbSEgb90zLdJMalY8SD3iBmszkaqwQMlJVmcYKfXgMN
         hl6daoB8aJklSQsv2zUaxHbQJkD/0UrCZAAAHLBSSQQTKfmEOoohGHDdZwarSq4qd5TB
         sVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361602; x=1764966402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9AXkbkUluXoP16BTLpUft4LHXN53wWDZXP4vrVCeiI=;
        b=Vao4IT0+vygx690Il592Iw0JTq/q17faOqC1Wbh+KPSoKYrzAq3ylV7t5N4eih6E4w
         s3uyURwxdlbtpa7yGVEklgNTIm8WLeHv4caExSXhKMmrIJKu0ahN+LWBTuo9xDyrRCds
         zx6H3prS452Tn0FtDeLE6kQ0CJ9Mb5Qlf9Nv2lW3stqoE0XdV1aH5i0qdZoiyU9Mm6/q
         qIFnZ8gjGX3gAln6E9TsAY+ytC32oDO1jCLTr78uiFrCuhqXnWwNfW7wyPPeQ/OjJI8z
         wCSjw08kHkxGFVao9R6Zk4vW0hN15jeU7xXHmNmGCsOJFEACJaSeBJB8tF9ZsAmgifNy
         6XRw==
X-Gm-Message-State: AOJu0YwA/+aIRInfluFVqxW5CVmpHqHKF8oCJIAuuv/l/JipeQqLnWrP
	Vn/MKOM+kLXqMfm4nyPPGFE7PRCkBYfmMXD++fcwCExGigcBJjgwTWWxdNDpvA==
X-Gm-Gg: ASbGncsWT+eJAcgBR+bpfqO5YaaeSNDwiZXRkyst86H9kZ1f/mC/19AANdMAwZYnZkp
	oFRz7CARA/aUgr4ZwEehBKMZsfM2vCYoLPdI1j6aZTl4K2iT0l4KYZ4+gyX/5c948LCIPNmF0M0
	YH4FSHAl34xLIsS/zNX4gs1qzM4/DYrLZeEO4P6NQHUDrOmETItmE3IJsUcIgQcHpDoilysLVbX
	9wRAjQ1sJS+ERaUZLjG0Sba05aUT61Xm+kCC6tLMzXBRhUiD/yAgZ45EHFzc0rxuB9t3pYAbsUy
	e98HWpSmYxpxDd40TjVEXN11oSB4e+1HURsIW0piLym7xJBv4PG1OcV8k04m08xi4Y/e0gNSJUc
	oIOqSvdX07Npk7i2EqjoMAdQAzC6+tWyZqzUIoZaCbR6Hk5pDvuzAovD5yUgIsuQ/96d1OxPGV5
	N4O7CWX+Fj5sNlUpjBSXU=
X-Google-Smtp-Source: AGHT+IFobG47G6lUnO4ykSlJ6qFdbY+8IeR7njaR3IpZYVs/IkUjy/fUFNgt2XQue96SXXdvpMSVSg==
X-Received: by 2002:a05:600c:1381:b0:477:994b:dbb8 with SMTP id 5b1f17b1804b1-477c016e7d5mr288363985e9.11.1764361601642;
        Fri, 28 Nov 2025 12:26:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc6f7bsm177198595e9.2.2025.11.28.12.26.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:26:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/3] dbus-broker: rework EXTRA_OEMESON opts to PACKAGECONFIG
Date: Fri, 28 Nov 2025 21:26:39 +0100
Message-ID: <20251128202639.2631231-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128202639.2631231-1-skandigraun@gmail.com>
References: <20251128202639.2631231-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122149

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 meta-oe/recipes-core/dbus/dbus-broker_37.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index c531f555d2..ae9c8f2fcd 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 DEPENDS = "\
     expat \
     systemd \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>= 3.0)', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)} \
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz \
@@ -23,9 +21,11 @@ SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 inherit meson pkgconfig systemd features_check ptest
 
-EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit selinux', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
+PACKAGECONFIG[audit] = "-Daudit=true, -Daudit=false, audit (>= 3.0)"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux (>= 3.2)"
+PACKAGECONFIG[test] = "-Dtests=true, -Dtests=false"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 

