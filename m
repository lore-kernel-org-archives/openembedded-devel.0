Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355C8C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 08:08:33 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.14668.1716278912445278097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 01:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ejYJG5tp;
 spf=pass (domain: smile.fr, ip: 209.85.208.172, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so39099021fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716278910; x=1716883710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYcK+VYVeIp0LKZbOgNcLQFxD750rTAVbe0cnc64X9w=;
        b=ejYJG5tpzhvO27E25n2NfThdZloEPrNYhPwr+6zj8Juhl3ZusHKrT3KPA8WhQj4zkM
         KBBWH4N/w9sz4Qokmf2FbNlhD05f7XCjJA+s9JnllwQ6Kruwyjg1e57rr6PjAvdJFI63
         SH1LJ2RUNi7ddCJmiMqmMqlBk5XpTxPsdCsvYkwzE2ztmZQBCDmVSIeNxBWfbBZ7ToPF
         Q7iVL14FFVHo4pUHLKkJCEFid0cdzD64ADqYyvfiNqeB3mm7RV6oPU0l5R/CwVlS7e3n
         Ttxho6ImgbipyiCJp2ayONx2eQI63OXhjeRU2Rk0DVk8pv30RqADD3wEsQWAkm42QMVI
         X6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278910; x=1716883710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYcK+VYVeIp0LKZbOgNcLQFxD750rTAVbe0cnc64X9w=;
        b=ifmcU/cXx3Yi30fuFbGyYAVt7TcI+WeaeYG/mNSH3mThQ7YnxE5Lnan52mDeRFlD8d
         V3ylkIC8C18XXS1nhim041AFPLWEjqLvqtg+3jAi9oagBNi57WrWYUyNaTphx0NZIS/l
         hDMisU/qLtOMh+KAtOpSQq9y+9N4hO93FuVHBZNIR74Go3xEQuop5vmhWlChihE/CGFK
         UKMI4VsyoGagwlw1lIB2YiE2HARyDMwcLFuPAQND2Co0YcAUuRfdenYRBqu7jTYK4xGY
         LZKkpg8+0ygGPlZeep2yH8uwYYAqPUUc42+HYDXX0onv0cmbTsx5/5ihwRXaz9BQmSUT
         +3CA==
X-Gm-Message-State: AOJu0YwFzeahYDKsDoHWerpdCq+zw1Em3kSjWSmSwhwrDi3HgTBE7TWA
	uhZFauMFKXKcnj/Pqmdnbj8xj5AbouvIhLeicWLvSmBVcWR0A8ItTW+Vcxq8colQnoAZ/IlWuck
	jT9Y=
X-Google-Smtp-Source: AGHT+IH+GjkGJzYdv5JhJTDjvkStniLeW+TsiSkolfvD2OJ321LbumAavpi1gIUCx/nt5xoo69x0uQ==
X-Received: by 2002:a2e:a555:0:b0:2e1:a8db:2bca with SMTP id 38308e7fff4ca-2e5205e2972mr242579441fa.48.1716278910298;
        Tue, 21 May 2024 01:08:30 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee934csm454838225e9.38.2024.05.21.01.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:08:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-networking][PATCH] mdio-tools: fix mdio-netlink kernel module reproducibility
Date: Tue, 21 May 2024 10:08:05 +0200
Message-Id: <20240521080805.1415945-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 08:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110443

mdio-netlink source make reference to ${S}/.. which breaks
-fdebug-prefix-map and results in the full TMPDIR path being present in
the -dbg package and, also, change a related CRC in the main package.

This changes ${S} to enclose the whole SRC_URI repo and adapt relative paths to
build (MODULES_MODULE_SYMVERS_LOCATION)

This make mdio-netlink reproducible and fixes this warning:
WARNING: mdio-netlink-1.3.1-r0 do_package_qa: QA Issue: File /lib/modules/6.6.29-yocto-standard/updates/.debug/mdio-netlink.ko in package mdio-netlink-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
---
NB: I could only test that the module does load correctly and works for
an empty MDIO bus. But, diffoscope of before/after the patch show only
change on the debug side, so it should be safe enough.
---
 meta-networking/conf/include/non-repro-meta-networking.inc   | 2 --
 .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb         | 5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index e0f448fe31..45eed5398e 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -15,7 +15,6 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     htpdate-doc \
     keepalived \
     keepalived-dbg \
-    kernel-module-mdio-netlink-6.6.17-yocto-standard \
     libbearssl-staticdev \
     libfko3 \
     libfko-client \
@@ -25,7 +24,6 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     libowfat-staticdev \
     libruli-staticdev \
     libsamba-util0 \
-    mdio-netlink-dbg \
     mosquitto \
     mosquitto-dbg \
     ncftp \
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
index b50d33f908..3867b89052 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
@@ -3,11 +3,12 @@ require mdio-tools.inc
 DEPENDS += "virtual/kernel libmnl"
 # This module requires Linux 5.6 higher
 
-S = "${WORKDIR}/git/kernel"
+S = "${WORKDIR}/git"
 
 inherit module
 
-EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+EXTRA_OEMAKE = "-C kernel/ KDIR=${STAGING_KERNEL_DIR}"
+MODULES_MODULE_SYMVERS_LOCATION="kernel"
 MODULES_INSTALL_TARGET = "install"
 
 RPROVIDES:${PN} += "kernel-module-mdio-netlink"
-- 
2.39.2


