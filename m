Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7D3CD379F
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6227.1762976145230680718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDfi5S9/;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47755a7652eso569125e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976143; x=1763580943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+XrwPjIHSCeD9RZulko53nsIPkREsU97Ady8x095d8=;
        b=aDfi5S9/w5knj9ul10pbw8PuksOsZjREiGnNdqknfitMXtnHQVFhOcTKhAnm39AyMB
         XEQBlSa1+LdVJ5B01ri9iAas13nSE10IILppzECyUgG06IzhaETrkKOtB3/BaqC7VXtS
         zhRXn80c6OEfootmn9tbddYlYe0fQCsIrV2wMm6Sr0S3P4aT0nDFHm2V+jnG7FyGDrzE
         KyHpUJ69KanGVjSKGYVhUNx0ozPW9DanHix2vPy9qRfV1NyryBvOJy4VijKVVVF0Rget
         iWECsJ3jWrBWwy1uRC07AB2Httb6JjL6DtdgXqQabqq2rALUmc81uaVEd8Rk9zKBgXHF
         tVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976143; x=1763580943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+XrwPjIHSCeD9RZulko53nsIPkREsU97Ady8x095d8=;
        b=kZPOksuEPvdc6ofOqROaROmZuqF2G+VL1Cdpe28MBq6nCCQzx8iArz8maxt8bzrEnt
         wfYQnQ0LQpaTOviVeky66lXd1daAx/I7oUz4qiHGCex5OSMeu87i2V4Nlsbf/RMUaz9L
         ivPd5L0uBLrKP+JOkJWDNzhjo8p/pTICYTaissACLuUI4jtnDIA81ECYGdrUZA6zSZez
         Y9wnB0d5IjWZ0INWmFmcc+xm+zBbJa/9+JuDTgfL5DCTU0yFTIywGZTce/nDb/PLefuV
         dG//ROHbSKsL1ES6XEkuJ7uKvKSllApMc+zu0TK+m6AfZclILbRP2NYllaYj2uiFBhtK
         ojMg==
X-Gm-Message-State: AOJu0YxMfJDQYatbM9BrZh5RH3x2ne2C5uALveiU1PpcLOy8biIaTA/D
	9BxUOQ1Oz4ppLVz2cBkKaagcyu929sgyN4fGvcDj1p4ba0uQDkw1qGAC7phkVqee
X-Gm-Gg: ASbGnctY4lWpBNixHN5J4qEJFBfJPumPnpy2RG3pAyK6deR7w1+VKFLLP/5PLPUJfQE
	OAz9L8tnIC4LpF3c5wPsWAnJGjyKRU0nQsX85nbTzsiVhL6SU+QOZSvihccQpfg3tFWCz4kDXcq
	c2O04ivivM/qhOGFEyhEAlbDa4wFt/7uIAd6GjVsp7MdAVPXzMI6+jK6CPzp8Dj+sHnpOA8TBkR
	wLYWdgREauV5LZtil+n9chguUHZ3TnjLQuwpfOkhZoRdnCX0T8go3MQtJeJJw6NB6Qun+DCmpHC
	AqOvfmVKM1vGNPLAeRonNBZmeEx8bqGfPk4je85S2FK+I7wUydRVi8ibftRJEXAVN1CCoPSONTJ
	7UtqhbA3FGRePJXpA8e0rKRiKGvDXThdNFLN+hQXo//12DHldSXpRJWBDEJPj3xFyEqiLdMi4PA
	IsC7mSbstB
X-Google-Smtp-Source: AGHT+IEEH8IQS12x8voppOQ32fueX7/wbjY+q5NhFohIK5ug6Hv2olFas1V/Cl6hLJfqrrx32wiFJw==
X-Received: by 2002:a05:6000:2509:b0:42b:3b62:cd86 with SMTP id ffacd0b85a97d-42b4bb911f8mr3115030f8f.6.1762976143220;
        Wed, 12 Nov 2025 11:35:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/21] zabbix: update SRC_URI
Date: Wed, 12 Nov 2025 20:35:21 +0100
Message-ID: <20251112193542.1589821-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121562

The downloaded artifact was moved to a new folder.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index 2793f0ca5f..75ba16a450 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -23,7 +23,7 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/oldstable/5.4/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
     file://CVE-2022-43515.patch \

