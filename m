Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB60C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 18:06:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.6982.1653674755661600373
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 11:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C5+VLvGN;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f4so4532190pgf.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eM3fV1YYuG7EPXepSnLGnghyQy65GehSyBBLfe+m0t8=;
        b=C5+VLvGNsMQiemWvmPmucc0FSesrj9REg0B/jyqIkUPHI9I1tG2a2XSEiKy82jDa6/
         lf0w8OO0HCmJ73W1u2Jd2RpbKsEj/eEXc3WFjrYyVVtuNsLJubRqhzEPKGHM7357l0F0
         QkfvgH6sB1cZnkj2lvsM3pWEyxZbaQ1/uWGWxyLpfPcfxvNTKmtTzlBr5Jag+8Q5A1Be
         dzk5ec3gdBseYRRWZp0lCYps19M29J2QyFA21H6syGJ2Ld8SBJCSvvx02bgjKrxaj8am
         GDNt8S2eUBNppOo2ehB9Et+TeBZle3yUo04+kQ/aeMTVh1FxRKMwKIROWS7mXilLerqF
         jUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eM3fV1YYuG7EPXepSnLGnghyQy65GehSyBBLfe+m0t8=;
        b=RMA3SJJJycGC035/ZhGkjMmlk/INFT4wORY/upa6vUymJd2lniuCzBGV7hhDsRf6yo
         jafV8rMbmD5gD41xA8T79yMAHXE1hltKtAbj7pSIjqTZwx05b25aUHOdwi1wegIAQoQU
         OCBtBtBeXjdVaV80ScZz/JLfJQvNgQtEeAT/9Of0ENbOa8uqEuUlru+BLfzdTt7BO/wI
         Zb+29B4RXo6odfs5yXNepTtGkpeMpQvLk5RR6rulHPax9Q0JOTO5r5nhMtABj7Ld29H0
         cEaIsGNZNGOJdLTLMSB+8RgIpE3X0VzhEzE3uWbYUBzPO90BEZK+X9HIpFr608I2nLsg
         439Q==
X-Gm-Message-State: AOAM530e8q4vtHfgQR/b0szH2tWY/jly/mNvNnnhLuEOnErrRBZrScYe
	JB+U7vsbrLUVjPZ9BkO3ac8osczSjIe7+w==
X-Google-Smtp-Source: 
 ABdhPJyroapXvV0eSZpfSi5C7rUJ0+9oJw8gqghEIdhglrQAgk/SFbtLNhiHF8ScPy4nuX4w/w01XQ==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr38051290pgw.489.1653674754800;
        Fri, 27 May 2022 11:05:54 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:85d6:b47b:4185:c902])
        by smtp.gmail.com with ESMTPSA id
 r32-20020a17090a43a300b001e28531d950sm1291714pjg.10.2022.05.27.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 11:05:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmial.com>
Subject: [meta-oe][PATCH] mariadb: Fix i386 Clang builds
Date: Fri, 27 May 2022 11:05:52 -0700
Message-Id: <20220527180552.3623754-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 18:06:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97310

Signed-off-by: Armin Kuster <akuster808@gmial.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3f246dc0a5..922373b633 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -77,6 +77,8 @@ LDFLAGS += " -pthread"
 BUILD_CFLAGS += "-fuse-ld=bfd"
 BUILD_CXXFLAGS += "-fuse-ld=bfd"
 
+LDFLAGS:x86:toolchain-clang = "-latomic"
+
 EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DWITH_JEMALLOC=no \
                  -DWITHOUT_TOKUDB=TRUE \
-- 
2.25.1


