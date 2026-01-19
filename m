Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAFDCCF2DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:28:10 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32481.1768818486150600303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BURqULys;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a137692691so26895355ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818485; x=1769423285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JiM4wx44sc1k7RNi+PcRYeQzlLtELnm2+a83r2iZmI=;
        b=BURqULysHqbT9SdnDTe1x3Yht0vLlBzHGjDriWONW1RO5K7jsmCrAKDdUtZQdmrwOf
         tnnuU0/rpe88bHJoYREWsV/4H++0bx/7VdJLX6Xn5XYLcRBjLUKTAwQ5Hu6Mim1pWbLA
         KsGSaqWMDgysOkKB3k4EjYABAZZChsPXXchrOeVMy763Z/f6Ba+Z+H48yCafsIr0H+1k
         V/MP20oBWUQyLNuulxxHmk9fkWNfW0w8LVFvR/sNXDLy9HLCYew3Sslm6UOWmdGzO7XU
         +pOgvsKswbc7XQcjS2yo6CtZ+FQdLA4nEKaQFp60cZQRoEY0TKTXCL6Vg59g028Wable
         U5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818485; x=1769423285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1JiM4wx44sc1k7RNi+PcRYeQzlLtELnm2+a83r2iZmI=;
        b=FOl/Wpx7gwAjK/CjON4Qn0+axSaA1SzMc0uT2upfsi/ze6SwJSrZeBfBnRMpz0acEs
         pxfbfKqNkWqPr1YpwjfoE3RLP8MedcFZsJ8Krvbt46EwPdyr+ArwxmQitYM8D+KgMR9g
         U3SAU9IRBMRz1u01xSQ77loCi2c8749gg8gn9kdYtzEWBGc1z2XUoGZZTW7i8dFaiGrK
         DoD4V0pSbBk4q6seZM/6s+ne8yKAQO2eY4srSCoIW1UCUhmNCeO2UpnxQVOPDSoxbYb/
         zdwEpHwP2HeTxgogwOLogCb8nLzW1+tcUhOvfB1g/L30LA4NXfrGpA6I2df46lluhkBv
         fvIg==
X-Gm-Message-State: AOJu0YxQyRd7QKohvE8sCk29keE9NiltUNxz5yUIpTiMdpg8jpo8HNt6
	QzjaUWEoCPJAMVOeaScIlam9/FRHNCp/6pVrBUzFx5EQUFN7CKjXqmQ5eL63kQ==
X-Gm-Gg: AZuq6aLjjVTRivjluZSsE7Y49F7l1GwGS40ZfeNWJorL+JTLBmNhmnZWZOMWlb8QbWV
	vfxUYvJzcly0yqYEOOPp42WkYEXdlvvKKc5X53X0/Gb9XBaG4ZaLlq3fJ6mOjglqmEwJrbrxidA
	pCuX52I5CS/GwQHBCP9fKpPMbb4RvzwuEvhBAQ3XBjvmuGqZdR2XbedI+snMyjKK1KIp5iaPutJ
	BXRwc/FSGItQmM2FYY3U21A+bBwxym10ivUxNtMqAkGP8nMKPXzo3kzLoFPniPh6GnSf/pbBYQI
	h+jPWndJlQNT3IrJqVUwNToOe69j7R3sZm/c0+q8EG0Ap2w4LferALtxv+YE3a1MO9gYarVdv8m
	L+ttXk0Eujfd4RA0AFxqnl1vjOQEQuMvG8QRKlg9qPKsu+z9Wj+DMbATrcpeRLit6bWXbqXj5TG
	ORGadfIdxztEeMsTBU6j456+4=
X-Received: by 2002:a17:903:2341:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a7177df9bcmr91892645ad.55.1768818485343;
        Mon, 19 Jan 2026 02:28:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3b6sm93628465ad.97.2026.01.19.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:28:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 2/3] nginx: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 23:27:46 +1300
Message-ID: <20260119102747.125302-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119102747.125302-1-ankur.tyagi85@gmail.com>
References: <20260119102747.125302-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123631

From: Gyorgy Sarvari <skandigraun@gmail.com>

nginx has a long history, and has used multiple CPEs
over time. Set CVE_PRODUCT to reflect current and historic
vendor:product pairs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d25aadbbb53d54382b4b82b1f78a69d4d117fd28)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index bcc384bd8a..20db23d6c0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -202,3 +202,5 @@ USERADD_PARAM:${PN} = " \
     --groups www-data \
     --shell ${base_sbindir}/nologin \
     --user-group ${NGINX_USER}"
+
+CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"

