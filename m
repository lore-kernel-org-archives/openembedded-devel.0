Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00FDC433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:36:24 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.8736.1639856183485011441
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=anJY9EYx;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z29so21211147edl.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcK7E90ZfJpUxbjW4Am8C86ClTOHGzfijJFk9o/faP4=;
        b=anJY9EYx5nUrrCi6yLp2z0oCXKDtH+UBWHTOVYsZ6fkHDcM9X0kpIuxBzqlbBc3gnZ
         DNPUgphdYfBzTkrLN0IQ5JEqodkibruw2R3CzMpmbfX8YOfBQoIeduEZPW/ZPDbfQxDT
         tiO64QtqE548OkQAURW69fUu9ic0OoMQXxG7POmUxNqS1mYtz4r2wrALaV/YizGbHyEk
         vgUlQ22Afo7JTEiJl9g/0XgJVAmhqneF3HtF3p9jqAkrRpGx7mMzSk7e2DfLj8gYNGN2
         JlfQSbrxa6BazbEgzYdf2PN3jkL5qkzaDJ6Ggu8+Vqr3Hwq/uSF0yTaUaRfJyboiYXn7
         A/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcK7E90ZfJpUxbjW4Am8C86ClTOHGzfijJFk9o/faP4=;
        b=reTb4wwO/z1AA0inFpLWJxtCCo6bBUqlWY7XhlKny4Cs0lwFDZ4ECx/rWNJEp7Wg6d
         CIud4iS8xHFiRhcShqtPInuh0O6xxU4a09gjjTNQi56jtsxMl4JhifcCxqJ9E37fOS1W
         e/NqxDLqwHTNKbEFx8WnEjw5cZ55n1oc6tpcugvvc3zB+UMpe6fU98Rx7/WczGXA8haU
         z+vjSnYY9IMjQ3EoNRS3/OX4wtsbBs3sXzv0tIUlzBSOLYNdxxgmIgowR29+xYcNRusJ
         YlPuizgxse2H7hIjt77sPjLEpNx2Y3ai2zUgaoxbOVRisYWqf7WA6nervOPGoAbK9gTc
         3kYA==
X-Gm-Message-State: AOAM533Uj/ZhokSpjybk4d8/nlHKWMdc9VdSZiOIid7dBDuHVVqHUod6
	o7XdiwEUHDIzcdeyq/xRM2+8FAYuJ+Y=
X-Google-Smtp-Source: 
 ABdhPJxwrEKO9ITK5t1RRmeuH/I93e+hwHBrnoJWfn62+Gavz8869J06B2i+twMoeO6MEdAdorr6aw==
X-Received: by 2002:a17:906:9b91:: with SMTP id
 dd17mr7009574ejc.371.1639856181639;
        Sat, 18 Dec 2021 11:36:21 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 w11sm2021413edv.65.2021.12.18.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:36:21 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump from 1.32.0 to 1.31.1
Date: Sat, 18 Dec 2021 20:36:01 +0100
Message-Id: <20211218193601.2132763-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94438

Changelog: https://github.com/netdata/netdata/releases/tag/1.32.1

test: raspberrypi4-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb} (93%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
similarity index 93%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
index 5b7f43f33..7f99e9d4c 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
@@ -5,8 +5,8 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "https://github.com/netdata/netdata/releases/download/v${PV}/netdata-v${PV}.tar.gz"
-SRC_URI[sha256sum] = "5e066d322f88013cea78eb9bb42bca64599278b9db8d46593777e4258743fefd"
+SRC_URI = "https://github.com/${PN}/${PN}/releases/download/${PV}/${PN}-v${PV}.tar.gz"
+SRC_URI[sha256sum] = "ac406513e86ad24976a66146702aeac960e43908abc51d70e4a073905275d13e"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


