Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1957C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 18:46:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.1019.1645814798100721772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJUST1v4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id m3so8609566eda.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9pqfD5/i7xb/C5BsD9ckFA6az9D6pwANTLLQzYdSbo=;
        b=JJUST1v4AUJBGj8qyoTp0Bn2AyCe2N2F2Ol4MCcMobGnEBpJsAURWOO0jS/El1yD1d
         YwD1opve5ZMDpguxkv5JgVllbYzF4MkhQVCy9s8pTSoFB97nQ15dLikXAfvGx3UfZ/bP
         qLEbuZDHLr1gHz5o37bQHO7U4nxwwPRcLVekYs3CWLl/pCTc5HoeazUb/oaoiy28VTby
         YX4G5eeIQ/XwAwTJCJwvLG1OxIqzZ0ALmAgyBB+mzr6KuNPP262PDNXnvLe7/6lRKNUr
         XTSwDfq6fehorX2UrQ8zOIU+3gDNVb2hlOQjC+JmRfbZIGkqWEjdhFSmKLi0GTfPgCu7
         eD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C9pqfD5/i7xb/C5BsD9ckFA6az9D6pwANTLLQzYdSbo=;
        b=Vu4OHrtVaLZo8kUo5gBjoeiAmKAhYE32TaNXIv6SMnkQFAsQJwpQUV++Me08aK/nce
         K6BrnvQoKmAkTGyi5S9ZWxu574I2nKK5aAWt9b4UgMO+MFg6Qfvz1+nJRPElZCaLRFvO
         2j07aDM4tKluV3S8amqxYwQwEywHSYuGpgSDIa5fEDtKZYiyEmKJQtjN4EWe+I8OXqcw
         TG3ho6JstX2ej8VkHIin+InSyLtJte6JawAZdNcLqseZvQ4xQ6GJS0AFetK8W6/F/9+i
         h+AbrQAGMwSN2DF4wXisyyn7LRwr1GbMQ48PpDrT/DGw05vvomouhW5zeN6XeuyphBg0
         Wv+w==
X-Gm-Message-State: AOAM532TdsWdf/79GDTAoZzgmf36S6LTyf3G/FvYX1dGH1QoF9IIBNyU
	9Gizerqh8xcg5ODlhsxUyiQQtuK8HfU=
X-Google-Smtp-Source: 
 ABdhPJzv16DUAHYjV4t8TP3CXDGkqUvSrsllje419qGgbTzSljXw6ICe2xASpiEdjuAC46fvT6Vb6Q==
X-Received: by 2002:a05:6402:51d1:b0:412:e72f:c6d3 with SMTP id
 r17-20020a05640251d100b00412e72fc6d3mr8458002edd.61.1645814796196;
        Fri, 25 Feb 2022 10:46:36 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 w10-20020a17090652ca00b006c605703245sm1316675ejn.43.2022.02.25.10.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:46:35 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kas User <kas@example.com>,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: added enable/disable cloud config.
Date: Fri, 25 Feb 2022 19:46:25 +0100
Message-Id: <20220225184625.2092491-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 18:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95524

From: Kas User <kas@example.com>

The json-c dependancy is only needed when cloud is enabled.

Almost no inpact on the size of the package.

Default disabled.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
index 2004670f6..3336b43c5 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
@@ -1,7 +1,7 @@
-HOMEPAGE = "https://github.com/netdata/netdata/"
 SUMMARY = "Real-time performance monitoring"
 DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
                Open-source, free, preconfigured, opinionated, and always real-time."
+HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
@@ -41,6 +41,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
 PACKAGECONFIG ??= "https"
+PACKAGECONFIG[cloud] = "--enable-cloud, --disable-cloud, json-c"
 PACKAGECONFIG[compression] = "--enable-compression, --disable-compression, lz4"
 PACKAGECONFIG[https] = "--enable-https, --disable-https, openssl"
 
-- 
2.25.1


