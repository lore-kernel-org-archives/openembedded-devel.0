Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B1C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2361.1654283984540518298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JnPt9NgI;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id n18so7471496plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xl5hdlhv6YZ4/G5BekzzzhExDxd5EGwgy58Z7aoA4pQ=;
        b=JnPt9NgIlXYLTO9uub3b04VVvanUdHT7TzyYvoxZjtqcKSytwDveJ8dcTqwS1grBdN
         wNGDlkDJ2E0wS6SiMN5nHCDT0yAsbMosvL2e4r26Vl+ekrH70qiFmCfCaCfRumRH7Qnf
         t5PR6cKL4vLjGR2om9Z8+WyEXXoHRY2uNktfhoI9UceWdcKDnts6ZD8duP9CjOdfSnkt
         IoWQcQf+VQY01TLDZuVexG0a9cn4aoEyQHma40rBkvNyN9P4Rqu/H6R1HTfldj+NCEQJ
         UVWdnC7IP7AqUqSZnhEzeHKuWPwRI+uSIQo9UbQmnffawir2Eb469725/mfMDBukZblt
         4rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xl5hdlhv6YZ4/G5BekzzzhExDxd5EGwgy58Z7aoA4pQ=;
        b=HIo3uF8ED6jGHKn8jEyr88sCB/C45q92nIlCQIyPuJhcIjzs9KXWX/Lfo4k6HJVHJi
         GoxBIAnSsDzePj5e8ax7HzpNVoB4XbKm48obFSTikHdQHmEVzUsD9jgTcpKUhJgHU0c6
         VeszK54rSWXuH/6yDYcl5RKFV/hf7Y7pFaOQzcnmrMCF3eMM927RriSOd6IQS/c9YauP
         492lsLnP4shEH3SJmtMDq/H+9bhyI1V9/Oxd0AECvlABm3S8L4QzzP5zLO87WWx4dLqM
         p1pcDjf+MFIJg9LVNFtsi/a5odinPBbypMdQFZWwlBerbFqaCENwsM4f9stSi2ANqVTf
         gZTA==
X-Gm-Message-State: AOAM532RXOeVKUINobbA/OOLLDAM3ZRUPtSaAWzRuAs/EXzYke88qieV
	tPxcT4Zy8bEoxkJk9g+iVh9vdmBqJ/I=
X-Google-Smtp-Source: 
 ABdhPJzytUjeKLvRAb5qz2/ighOlWt70KjbLwNwVlUYtXmAJP0UXZbEzmq8MtFkioaswXN3FA0LElA==
X-Received: by 2002:a17:90a:5a48:b0:1e3:4180:a218 with SMTP id
 m8-20020a17090a5a4800b001e34180a218mr21179254pji.182.1654283983779;
        Fri, 03 Jun 2022 12:19:43 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 15/20] sdbus-c++: Link with libatomic on mips/ppc32
Date: Fri,  3 Jun 2022 12:17:14 -0700
Message-Id: 
 <9a2029553030f3da607c209b50581274e9e7335e.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97404

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>
(cherry picked from commit 366663527aa5efd4e43a62919edcdf9caf14e77c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
index 39f0b4c560..e1a7033a20 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
@@ -27,6 +27,11 @@ EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
 
 S = "${WORKDIR}/git"
 
+# Link libatomic on architectures without 64bit atomics fixes
+# libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
+LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:powerpc = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+
 do_install:append() {
     if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
         rm -rf ${D}${sysconfdir}/dbus-1
-- 
2.25.1


