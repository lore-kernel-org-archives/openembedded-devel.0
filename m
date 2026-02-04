Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FCEEA7944
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 19:35:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3567.1770233712794465059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 11:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MuyZc8AQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359249bbacso838414f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 11:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770233710; x=1770838510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bUKaRVifPO9cDBnbOGvD2pfX4K6kjAd4jbTl/qSDE8o=;
        b=MuyZc8AQW/QT9Iq0oCP7lt/b+oyZxookQhQBoGMbSOqjjzSi7zR7r6hJX0/KmATQAe
         ow5gUqSuq1o/NxNv0bj3A2w5iJzQX6bSRd03iSHN8RGz1rfRiMQGWW71F4GTGJHmGXXv
         Y5oy4TkLP4X0ce0o9nT5uVhhEKY/ACVfyd1iQR2wbuWJLX0xi57zRfGE+5drLPMRnu61
         pWR/nkPViyDyGGSnbS3cq1B/umgMgItdzTMSFROhpBBg7n42DB503il7KQbNawGInu7D
         2K+t9bNmEWoYC43kKCCEmoeB/deSSb7JQiKMx6Ed4RnJJfnUHMzauU+u19920tn+Blm1
         PEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770233710; x=1770838510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUKaRVifPO9cDBnbOGvD2pfX4K6kjAd4jbTl/qSDE8o=;
        b=X+u44d9u8S/T75X9rsNlFQC6VduEA1uJTYmHOE8RY04ktwtCd++Q1VYDCDQX8Yqjty
         2bIcxXLhfjPwkjxQ8pAf3wmRro6xTRauRSW8P8KnzipRr67W6ICsH/kr9NJroV52odW/
         zoYIULIRYFoP5XtIEgnaTbNsNZk8aQYi4TzedXZNI0wXJRNEMtaP9tKJ12MeGUoJ6NUu
         LVUDOOt/n43SbaD+c7Q4fmtuD82hkEkMssA/wNqLaJSyNEh7Jz0JRZt+9ED9G0DvMjwU
         VVGcrnXmFl2VnO1FVfk76fO1Gu6L6ZAf4BnzHfIpDhH1ZmVJCd5kdKRGkHTEaQOYuMwG
         93lQ==
X-Gm-Message-State: AOJu0Yxmbdd4HAKoAT+4iGpP5y/tdXU+kXIWgOEcsq24DbLmT2XPgNbY
	5DeSErssgUrx+HkBHnFyCRGNHzCR0lThiZO2GiPe/Lb377MFdl4FAok/1tzrvA==
X-Gm-Gg: AZuq6aLxv1MbMKIPJq9WP6go0cbnBZpep4CdUbJ3EcaIUoF0x2uhl75CG89yrLl8S3/
	ANSUk/q+ZGHrVM+UirPiDnC5BbrqOsiwc3uzBZL30kaKoRJCrJlhHTLWWnGK1maRsOWFp8E7kos
	yhL0MUq8GjHtZjQmRDiDT/EplXlc6vnEkhn8+GiGLv6qxrWduzo2dEQrClKzCFvaMc83lDbVBrO
	EyRLwT1ir1ui4+0AO1cbO7PlYMyDKBkIMewOTthNAV9P6mpEe/mMdYMlenJFADjMmKpRukbbR+P
	Oowyi2s3gmCuUBBiBM+974uNrGHu+dnVsqN0/WrVBz70qUQx9Pn4sHEBZWyQ35fRmRl6HWfm2Os
	8T70rNWH8HnisXXoxCUBUa04WE6jf8SXY3He2RwjwryuAYjwxHnrpjEw8qmtcxoD6PYdi4Pjvvn
	x1g9MlkR/B
X-Received: by 2002:a05:6000:2210:b0:435:96a1:ee4d with SMTP id ffacd0b85a97d-436213dfc3cmr565562f8f.14.1770233709713;
        Wed, 04 Feb 2026 11:35:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640f2sm7869129f8f.39.2026.02.04.11.35.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:35:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] live555: set CVE_PRODUCT
Date: Wed,  4 Feb 2026 20:35:08 +0100
Message-ID: <20260204193508.752787-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 19:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124145

live555 is an old project, it has multiple CPEs associated with.

Set the ones in CVE_PRODUCT that are still active.

See CVE db query:

sqlite> select vendor, product, count(*) from products where vendor like '%live555%' or product like '%live555%' group by 1, 2;
live555|liblivemedia|1
live555|live555|7
live555|live555_media_server|2
live555|media_server|1
live555|streaming_media|160

All of them are relevant to this recipe, although media_server hasn't been used since 2007,
that one wasn't set.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555_20210824.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
index 1622a97fe1..cd738f9575 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -13,6 +13,8 @@ URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
 SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
            file://config.linux-cross"
 
+CVE_PRODUCT = "live555 live555_media_server live555:streaming_media live555:liblivemedia"
+
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 

