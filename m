Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D5EC61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1025.1788051023869486503
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LcHx+VcC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1689052a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051023; x=1788655823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZakouM/cTpD+3yqVfxrGFe1zusWFhdkZoK9LJ7OAt4=;
        b=LcHx+VcCJ2Y8hRfY4ZuymOq0vAa0BS7lG1mpNYu/qMc+x5LgslmSocKb1tJneCE/ol
         kZxKMqeX4HRJbZ6tORI19kirGBET1VDOMRYLzGouXLX1m2flejOO2D8ERgZvvFXx0Ulb
         7A++GnkWm0f3pDq0nyAKrMc9wht5T4db9l7yGJFYL32FcrHncw6aoNMUebVuf0ANKI1X
         rSk3ztKZpZnY0vCZ7xsk6OAugZCBzdvPsHtEhZS823n2xSPOAxj3iwxQOsq/gQUkwcMa
         uKpaHfHlQ7PiNYDSFqeg7RXh5KKKWQqDPGkB7yL/bPkF7DWqvmaNBPZ4jXxxe3Cf9nSN
         2ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051023; x=1788655823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZakouM/cTpD+3yqVfxrGFe1zusWFhdkZoK9LJ7OAt4=;
        b=Yf2RgWnqqsXZxZw/7J3Afqw0+DghlJCOnHStLvZ+ZMQ+OHAzRbEGG2GOrK7IKgkXj0
         cI8SyNlIBTiTYLzibT9GCS791r0SepnsbQhLCpVQ2K2IJwawFT+ufrDIrMKUfvKxY+Tf
         Oz1Hsf88Hw6/pCcMIWjWD/PqIq0yW8oGQVAfVVW2G7Pkjf+GezDr9VHwsWv8PA7Z/5AT
         M3Mz1jQe34CQVMb037Lbui//iHljGRkFtp57jZUf5lEZwFp1xXX/ilx32u2dJ1A2Axw0
         3Ax6xyhcdYX3Dja7zLE3vxZKYlp6EuKPzOg9WW/SnZQHvZtxhR23SuzpqhoxGgnPUjhz
         bhMw==
X-Gm-Message-State: AFuF++lrdDN0fdEwkl6yjLyYt4vS2fu58HK3ceBttEYlb8q/7IdoOjvx
	03fWYiF5zuw2xtjgBrG6tlnFStAVVUSdvjV2DCLXkazYL35YXWARFvOq9nJ96Mm2
X-Gm-Gg: AYBFou2D2fU/F+LRrEniARwC6L4hY5blcjCZoYmPBdxj7a/UH8SjkWu2xvV2+UUbI4k
	1ogQQ/+SNkGHoGuup91tfJySDvLnlFIvRYdbRGztLjlEuYzRLSYXvOit5xZ4ip5TqzEwoTCrAK5
	cNLtv4gfPHXlzZlVlyAn9KelCPemt0LPuAUMOilLssRjXO5YGdpWulqB87v3zm/idHpgQg0PWtT
	c08zyVy80cYeu8LnWlgHHgiOFjKt+gA5Y6mAtFITK8JIUDx5UrHIwt6OxJygFd4CXrx0Zs3zZMH
	pNvkhTf/iB1ZRvtSDr45IdGQuBjfN5gXBxltkWmhB59UlwVQrGZRRNlqcUFVVxMzPz5ccFzP90+
	dIgXiLOmpBnvgFft4KB0bl0IwJ8q9Ho4MCRQvmPwGlTpLsVm9Gcbb1HeMC01UmXQoxCHLZcLw2o
	xEtoCaLQzuaa7u2zxa+OWZ1KYQTmec7tYu7U7MOYqA/hkX0HB4M3gmuevK47/Pm3D1cmeqRU08
X-Received: by 2002:a17:90b:3d91:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-396d0f016bcmr30115300a91.8.1788051023195;
        Sat, 29 Aug 2026 17:50:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/11] open62541: upgrade 1.5.6 -> 1.5.7
Date: Sun, 30 Aug 2026 12:50:05 +1200
Message-ID: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129582

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/open62541/open62541/releases/tag/v1.5.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/{open62541_1.5.6.bb => open62541_1.5.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.5.6.bb => open62541_1.5.7.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb
index 8126132773..10e2e36675 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "cd69ed6f6a4d46966f67794e23a7b7b331f7d402"
+SRCREV_opcua = "d1173ccc31560ffc60c29e24ce8adb19f8c3c686"
 SRCREV_mdnsd = "c1be962b37e4b952625d9b0a873e5ca619b1a35a"
 SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"

