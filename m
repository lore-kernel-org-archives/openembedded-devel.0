Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74490CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.14106.1758625603765295096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBmPX8h+;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b29e8a3e453so381782566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625602; x=1759230402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvtyuxAJOHWQyhivZCnzcj0ZlLQueYe51y7L0hyU+F8=;
        b=FBmPX8h+pa/NOwU7D0NrcLoQ6plLbKjHFSnlwTdDyuASQ2FlCGmJlprWDu8nGa5Tbl
         rKdAzze6P14+PQYsTaAFmWLj/lkFfNxYWSPZusumL7oe/6A+iZZlCKZZF1amnkfQdYN8
         e/w19O9wWSJsATO2cDoaYWR9iTz8/2ZxJA8Yl0b1dV4bZQjUObdDg7QXA1j3pd5aAGaF
         sTkmJFyrJQ5bEkAU5A7wIYhlsFvS85xiMX1T4tneBs/IjivUCVP00Flvi+fjADkFL2mo
         MjumKnTjGQt3GRUDHifulWEg9MhB1mRR1wqvWCBT2kVwwqAxbQ1T2pC6ECsyXtGFRNv7
         nweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625602; x=1759230402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvtyuxAJOHWQyhivZCnzcj0ZlLQueYe51y7L0hyU+F8=;
        b=u6t8aK4mIBh7WFQLp9c8SaF8rskqtoXM/uVwtGckxzZT1FVhuctAa0VYHDFB+luhb/
         Oj40F6QqlRx9GTnrPTjDoXfWltqXENiohvTbBuqIJlCh3DeMDEfhgmhrY0Q3cwI1w/5M
         A1W0vhqWwBEPdZLetHSiCXQ31+1fmIYOURfmyUwQPADVASyd2KMtls/KhaSXrOAhz4uV
         lmSh+mC3O1mniHmzl5qGUj186in4frx1Pzlf3/NWOC8nMEir7evrP0lSrIgT7bYgoEoG
         qkT/K5+gBkZPOied3TbsERQi0EH8M0UWjdkk2teeBZrNoyWzZPs8k3HSWPTFFEMw3TRJ
         QFLg==
X-Gm-Message-State: AOJu0YyvYGYqgB5AckY0AKT84/vfKOJHM7uDANAAnGgNow8VK1/LTSie
	20VPtlScOZ21GZk2Aa7i4b1THlGAO8ClZ2qLi65b4Z7mlu49Iyimh9fau4zN/Q==
X-Gm-Gg: ASbGncsGIKZ/Megn6cdVcAeJ4RWE2xQKRejohJI9Ku83hvB+3UZAQSlQMqHYSEUXASr
	EgjsuF/ohfUztDIXkijo9aGLaHcwLNQFm6ZZypkHNqL0FnEpYazzj1cUaR+js6voG0twM2b+cDc
	DtysbM2uFlxco/qOfEp/Q6mAhcVg5DSg2Iqt0THeaGcnEcWKYJP/6t+vo7eX7y7ZTRCCNRpDUtt
	1zrJN5BKfXU594YRqL1hTswWNmXQtYz09p0CAge+mwFPt9opkpSmA/zVjLNCB5r1rJ6X3UbYP8q
	C0PoAvgXRYH50mHuAQt3+GP6OoCHEyWpUoQnW3Q6AnvQ2RwIJabZopeAV6Ge8aZqICxo6m5FF7L
	KS6DAy6otUUNN5MR89l29
X-Google-Smtp-Source: AGHT+IEtyBRn8coby3xZhVWIF1ixVu2qI3rlKQ1Pf4t9/4T/Iu6li0RHHpzqytlO4hjARv1cZ8HeYw==
X-Received: by 2002:a17:907:60d3:b0:b1d:368e:3ae5 with SMTP id a640c23a62f3a-b3020f1e2a5mr198047866b.0.1758625602020;
        Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/22] evolution-data-server: upgrade 3.44.1 -> 3.44.2
Date: Tue, 23 Sep 2025 13:06:21 +0200
Message-ID: <20250923110636.3413021-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119671

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug Fixes:
	I#359 - CalDAV: Crash on calendar update
	I#386 - e-webdav-discover: Fails to find Radicale calendars within collection account
	I#388 - Google OAuth out-of-band (oob) flow will be deprecated
	I#389 - IMAPx: Fails to create folder with NIL folder hierarchy delimiter
	evo-I#1348 - WebDAVCollectionBackend: Removes sources on server error

Miscellaneous:
	ERemindersWidget: Allow width shrink for small screens
	Fix few memory leaks discovered by Coverity scan
	GOA module: Prevent ESource removal on D-Bus reconnect or registry reload

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5851155197453483eb933601297d94fa0c01899a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 8f5f6defe0..78efee0040 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "6e05a90204a276f99d932097f1032cc17dd1d8e265c7c56727c63240fd4c0ccf"
-PV = "3.44.1"
+SRC_URI[archive.sha256sum] = "2ed72afe4d6bb170f8728faea0907fee10212dfde7a9fab82fbcc83d0f22f028"
+PV = "3.44.2"

