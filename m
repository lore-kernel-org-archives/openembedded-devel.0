Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3962C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:34:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.11350.1651502048505353439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdN3Cxq3;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id n8so12607791plh.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UB5lkvVAybTV31cPAqfefUJZsjBA6bPH8Q0/MvucY8g=;
        b=RdN3Cxq3wQSINDI38nHSMzwfDnxdhGtcOQjWBErxX0UAIsZa3jCUm8ec14jxjGIM8z
         DWU8BrJGue+/62K/Q/9ocuQ0Hy6ZM3Mx+knPCzjRS3r7m1Q4/Q2yPSYQ2nitmuvRBPnR
         jigyMoYYIpcFLJ8Ms7MLxJki7p9YP2R8mq7WO+pfQmtSKlHZKle6tOdF89vX49eto1Un
         ujbo7Tbmz+Z+aYME64f9qIB9HxfalPDXyr2b1QXJe3EW+tSYvTjQXYc3bID1Bl0NprRj
         DR5n928Zm/qKM5LiztSLPgdcrzWg6MBE3XpCZUYMoA0H3GqiYwiX/2k+cMuhTkkDIZ0F
         nkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UB5lkvVAybTV31cPAqfefUJZsjBA6bPH8Q0/MvucY8g=;
        b=18y1AYGDlAjPZPFyeEpFmhHcgdMwLqjorCtWf+omVNZdLbYuhFJ3kXSUrNUZNYQSEy
         IO0e/AgoisAbXLY/TXBJKfhdH+YUHi2B2Rqdp8JpEebFxnFzzWz4Hnja53AFbX5n8u9N
         a8NY4Hlq8vj5Xu9L2fEI5eLol4KoCEVx57gop9VIGaWlfv1s4oTh/EsywIeOiphB+0QD
         e1BXZI9d1acpv0IKYmqSl6r3m/XtLYzhWECY8eY8RjpP2LUWYT77TOQP5JppRIL20j4w
         1+awPm+WXv83jt6SZefeCz/1uCzXFeA30M0zEA7g24i4ZgHzk/1fNmUguzJqe/7FXVd8
         tglA==
X-Gm-Message-State: AOAM530RMpuEFX4D2GCgRVCNmJI/UHyXpBqVKYNot/x6Vb3uhi+Q6phu
	hXgRtwdcIOLjbFGvRqTtOS8xWTnCW5VMKA==
X-Google-Smtp-Source: 
 ABdhPJynHsIphnXJhCCXqrFSG8PnHjVJuR9zYFy2PLcxAzFfXBDXcYpjceqKP1o97e+VBt9xqk+6oA==
X-Received: by 2002:a17:90b:3ec2:b0:1dc:5401:bfa with SMTP id
 rm2-20020a17090b3ec200b001dc54010bfamr6805009pjb.231.1651502047701;
        Mon, 02 May 2022 07:34:07 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.34.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:34:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 09/10] packagegroup-meta-networking: update pkg
 group
Date: Mon,  2 May 2022 07:33:44 -0700
Message-Id: <20220502143345.1500852-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96938

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-networking.bb           | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 892ecc7746..143e487122 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -31,7 +31,6 @@ RDEPENDS:packagegroup-meta-networking = "\
     "
 
 RDEPENDS:packagegroup-meta-networking-connectivity = "\
-    crda \
     daq \
     adcli \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
@@ -49,14 +48,13 @@ RDEPENDS:packagegroup-meta-networking-connectivity = "\
     vlan \
     vpnc \
     ez-ipupdate \
-    firewalld \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python", "firewalld", "", d)} \
     freeradius \
     mbedtls \
     miniupnpd \
     mosquitto \
     nanomsg \
     nng \
-    netplan \
     networkmanager-openvpn \
     networkmanager \
     openconnect \
@@ -100,7 +98,6 @@ RDEPENDS:packagegroup-meta-networking-daemons = "\
 RDEPENDS:packagegroup-meta-networking-daemons:remove:libc-musl = "opensaf"
 
 RDEPENDS:packagegroup-meta-networking-devtools = "\
-    python3-ldap \
     python3-scapy \
 "
 
@@ -241,7 +238,6 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ndpi \
     ntopng \
     nuttcp \
-    nvmetcli \
     open-isns \
     openipmi \
     phytool \
-- 
2.25.1


