Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E772C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 13:48:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.6729.1657892933876167419
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Upg5bJ5R;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id fy29so7945131ejc.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0o7dzY04m8N/GfFiJT1A9mf7i7cQxqNyqQQVyidWJvE=;
        b=Upg5bJ5RaaY2ZMmxf8UnQLKtOeRnb0751IW6cxPyqSAbpCQYDOwd8jlYfKeICwPwAh
         3hbQFCT/OhOWEdARyLOYl8WTngYbBSmgV/FL4P2Q11ErriytguZt9ZeoeDJjGy/JKP/q
         ZxIE48Jaq8m42orTd+y9gpX3v8OywtfC/1f/IlIZVrFQbYwVLinsZ7/vVDaIz5sz56KH
         Rzt+NoVzD/oCrGWA4wajMmAhJBL4yyYdGvUStW+N/s24tojKw9NYEzJHJwswfEGnt1e2
         /xuyxcRFTqYG0ORRqHJ5MwEFPWZogvyNIe3i1HCccjQ7IOyakqY+dllWF4ifnJw/dCCW
         j/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0o7dzY04m8N/GfFiJT1A9mf7i7cQxqNyqQQVyidWJvE=;
        b=bbSqdzbAt5q5OjRGh1ibGRUMYNtk+SQ4X0uNBsndSyuLYsPsU1gMzgQ+GHzmKZktTC
         hA+ICfnGWqFCyH8v+kLJEi4H5Cmb6gf7iElZBMQNpd9rxUhm2Oj8YXT1K0p0pgKCd9vN
         RZ/HfiL/FqjxRxHRXdnQYAcVEo1gmrgxlmqJdtp0o3qpKN7UxlCXKCX2rp5Lrzs6OWxC
         vy4PD/AawCdM5tBndhSqx2skYogp6hPA5Z+3Xh4724V5uB8e8+2yBc1Fu+PJQyCPV5a5
         yiRQhaUcT6RJW9F2RaYQ+bc8BhYHDG6GjoIv0h1XWqrgs/XXgH/xjUheOYCINTyM3BHz
         z1Bg==
X-Gm-Message-State: AJIora8VuoXYQ42xvcoVgNXBgvZfMslWzC/9vl9B0Gj/yEdDntJoNk8b
	Ya8i3AKeZnpIA+rhfkboaeN4v47AE88=
X-Google-Smtp-Source: 
 AGRyM1vrH6hn0qwsfKjtVemzuwzyr/V7dlsj+663/9ncp5xCzbLol1ErJ9kIggb2LKN8+MomEhuT4A==
X-Received: by 2002:a17:907:da4:b0:72f:755:ce3f with SMTP id
 go36-20020a1709070da400b0072f0755ce3fmr1314735ejc.111.1657892931836;
        Fri, 15 Jul 2022 06:48:51 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a170906538300b0072b14836087sm2037295ejo.103.2022.07.15.06.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 06:48:51 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][meta-networking][PATCH] openflow: ignore
 unrelated CVEs
Date: Fri, 15 Jul 2022 15:48:41 +0200
Message-Id: <20220715134841.17082-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 13:48:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97844

CVE-2015-1611 and CVE-2015-1612 are not referred to our implementation
of openflow as specified by the NVD database, ignore them.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 15eb65ad3..dee0a93ef 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -13,6 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
 SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git;branch=master"
 
+CVE_CHECK_IGNORE = "\
+    CVE-2015-1611 \
+    CVE-2015-1612 \
+"
+
 DEPENDS = "virtual/libc"
 
 PACKAGECONFIG ??= ""
-- 
2.34.1


