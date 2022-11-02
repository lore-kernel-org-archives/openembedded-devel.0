Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6229C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:42:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.3909.1667378552896849305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOmpW4Nk;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w4so287675qts.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzeaBMTsyzqU073TKlswimbxG/bOTYCEvERI3C0Lygo=;
        b=lOmpW4Nk3ap3yTXoZk3fx6zdvNQtdVlcKFr1vH7tT+d2bU2zDLAfgsj5REFvDNYQJ6
         9hRASxyz9OO2FOw6lrLRkBFF3J4fTKgcdMOHkYeJyQnUGndms7dHhI8H0RRCV3/IWAaG
         4bno+ZY8OH6IyWOPY+m3ZDvEqnJQT0aJsMTQJbZHbngwBUfSj9RU9hGg+qzVBBRiFG2V
         8iUkd+HWyALtb+zB3UKedCBPDM1bwQ4jmWPFJa8yeqQX/aE9OGedU4zBLKv9BG+4ShkQ
         h+rbBaUewaMV0ax8X46kBJEJsj67kVAwThpg4hS4xg90F6iwaWAE0ZSLF2rkJQUqjOJP
         DxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzeaBMTsyzqU073TKlswimbxG/bOTYCEvERI3C0Lygo=;
        b=580y8bOsrp+K/kq8VpxbzsWQU6ygm/WCf4IHHReV76s2YfoCSfliqVIviqt8xeCPUA
         eSAxgE+WKVxde3kbHTy+C3yp8Tdi/1+LRmUejFrv1kH7Ree8rd+cwCVQNCvm3ufRUXF/
         J07BvgG8HdbfN4YDicik7+Z65QzQY2y+pwGeJq5JkAWS8dwjpNpTyzO2DU4DLk+EB8zg
         aRNc2b8DYDVhzyj+b3+jZSAv7IFedMaL1sO1X45znUPXne5YwRD23wTTlONGwdYE2vvz
         VnweOGDJ8q1s5ukii/TcVAuuxbAa5iWi8uV+NmGw6JaQLY97CGd/m4wf3eLCnamuEf7T
         WHSQ==
X-Gm-Message-State: ACrzQf3rR6+0wsxOdP8NXTSAWphPFUfTsD9XmHq/m8PhEZqbNQakWqxv
	oPuHdAPAh1F2Dl3vdQJyTyIZ0MLr4gR8aw==
X-Google-Smtp-Source: AMsMyM56m1OXItbw5rMbxVhzrSh9unXPdPrKf6IGnM4BGYgk0vN3ROUJh92xy0m2Fi78ydWpiNqFtQ==
X-Received: by 2002:a05:622a:4815:b0:3a5:25a0:9b7c with SMTP id fb21-20020a05622a481500b003a525a09b7cmr12630152qtb.668.1667378550421;
        Wed, 02 Nov 2022 01:42:30 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8259:e903:8d8:7eb0])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a450b00b006fa2b1c3c1esm5631202qkp.58.2022.11.02.01.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:42:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philippe Coval <philippe.coval.ext@huawei.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/5] pim435: Relocate sources to eclipse
Date: Wed,  2 Nov 2022 04:42:24 -0400
Message-Id: <20221102084227.1210486-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102084227.1210486-1-akuster808@gmail.com>
References: <20221102084227.1210486-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99411

From: Philippe Coval <philippe.coval.ext@huawei.com>

This driver is now part of Eclipse's oniro-blueprints project

Note: Once transition is finished,
existing copies will be need to be archived
For history referer to related tickets if curious.

Relate-to: https://gitlab.eclipse.org/eclipse/oniro-core/oniro/-/issues/787
Relate-to: https://gitlab.eclipse.org/eclipse/oniro-blueprints/vending-machine/meta-oniro-blueprints-vending-machine/-/issues/1
Relate-to: https://gitlab.eclipse.org/pcoval/pim435/-/issues/2
Relate-to: https://git.ostc-eu.org/distro/components/vending-machine-control-application/-/issues/2
Forwarded: https://github.com/openembedded/meta-openembedded/pull/603
Origin: https://github.com/astrolabe-coop/meta-openembedded
Signed-off-by: Philippe Coval <philippe.coval.ext@huawei.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6b50ce8f07b61d111f82c3ca88c5125192c214a0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/pim435/pim435_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/pim435/pim435_git.bb b/meta-oe/recipes-core/pim435/pim435_git.bb
index f73a0fd54e..80e3cc6298 100644
--- a/meta-oe/recipes-core/pim435/pim435_git.bb
+++ b/meta-oe/recipes-core/pim435/pim435_git.bb
@@ -9,8 +9,8 @@ written in C"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663"
 
-SRC_URI = "git://booting.oniroproject.org/distro/components/pim435;protocol=https;branch=main"
-SRCREV = "ee07a83de4d0ecdf4b5de20a7e374d36a9a6f5d5"
+SRC_URI = "git://gitlab.eclipse.org/eclipse/oniro-blueprints/core/pim435;protocol=https;branch=main"
+SRCREV = "445ed623ec8d3ecbb1d566900b4ef3fb3031d689"
 S = "${WORKDIR}/git"
 
 DEPENDS = "i2c-tools"
-- 
2.25.1


