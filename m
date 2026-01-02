Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A751EFA3741
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:19:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3693.1767354756109640841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhoOPBno;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e89d226c3aso9430654fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354755; x=1767959555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgECHiFmo53DNnATb+5RyOEDL8zHS2YAVnlE2Gyzy4M=;
        b=dhoOPBnoET01VWKHLaKl/HiMvO28XVNmq/YPv8VlWcxkxkGlZejOJ8iMMggCbuagh/
         DnIhQKHftYwU5kSg3FtediWzFP/fn6ENe5kF7rUWmmKPbrWT/S8j4wM/f1H/+BvxmEJc
         iOwhrx5NxN1OIP4BCs5kN/F/INyEIUsU5rLbOw9AA/hTxpvAQ0r6YRa3NnlG/cwD14Bt
         KnaXYKJZbEGv6LbMu4yU1gN4F384meZv1Zf+h1D2KSrG1bfa34yQX+1wUhmQeMh+Lo3x
         YgLE7mqkg5sz7ShV/UcavIFAyJJfxz1rdY6jUyJyBEpmyjze1p8LdlKlGcf8oN7lk0g+
         ABnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354755; x=1767959555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgECHiFmo53DNnATb+5RyOEDL8zHS2YAVnlE2Gyzy4M=;
        b=BNvlPNorY2qbfIIJtnhbR9BQkS+EAWnjsJWZ0Do5Ws55I0pKywnwhVioAmuzOFj7MH
         /szQS63WfpM6FskY1xv6CaiEl+NQtdjncZZWfsfydNzauHLX+TiIhENzaKFjk8Y1x1ah
         J65b8qfTQsyIXtzGhxu2CP2DwhVcU4bM64UN5ZlSA2qsL9xbTNhRso9+SrVHgP9hfMu5
         XgFDH1WYGxnpLZeILR3SLv6gn8GeYXvt7wDMDlLDV7OllnWAKqFxXHDzip6dLz9fNGDp
         eqE3OZmQpE94ZbhOxpAGzGdikgPanX0WoqB7Tq5wAVIj+W27WIbdoGCNFsCWR4oyS8Go
         7Esg==
X-Gm-Message-State: AOJu0Yxvo3Hj5vsEhFU7x7h4poy89kUYE9usRjUgtTPtOIJpZ/YRgX7F
	tQwQghgNcCu0aBjOTVUpfurJKkNodAU9UuvyyEkeqs9iDSwF1ZS4G0pYzTlUVw==
X-Gm-Gg: AY/fxX5VEOEaonLWLkKDJct8tSJNfmjazPtdHl72ku56TTkZ+7WCRMKhblrnOlnCGwm
	uYlAN9l2+3NKqCtNYuAG2jx5Bd4mvVZ6OCWwZN1lEXzSKCI7X1xOLuQvHXmbS/I9K5eXL4BsQuc
	9HJqkZsSXNk5HfeZb3FoPlfIK8jSgeaVwVN/W8GoZEHpAvJtSDgrXpy4FhKPKif6Xs6dhR+AyVU
	gj1tSFvgLKmi8iqKxdXFZnsYyUt495UjyjyFsAGkU1A75r5H2zniWYMMLLeKCEoYdqNsSKEZ2qw
	zHtzJzAyqnVsWyCSEODtC7e7iLvyZzLiZi4WEjmCbWX24HLL4Rg14CHqdp/jALwjN4l053YpRM2
	sRyJr+AKv2bDtbf9RZ/cBEIR+OZHv7MShSG+UnFGRsw0QV6aZ/M3mi2LMztm0j+aPIDg7cF2r2/
	cVUVhqeD2ZMTGigWz0ZT1pIA/wv9yQzpKjfpg6
X-Google-Smtp-Source: AGHT+IGW80nq/jFhiN0idVqA2Kb9CSNi64HnnYLuyfX6Z0raelYbh4KeBq7h9OiTVVQrnhHvYP2Xyw==
X-Received: by 2002:a05:6a20:9185:b0:34e:a801:8166 with SMTP id adf61e73a8af0-376a8eb05a8mr34718747637.32.1767354359032;
        Fri, 02 Jan 2026 03:45:59 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c62637bsm35285656a12.30.2026.01.02.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:58 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sanjayembeddedse@gmail.com
Subject: [PATCH] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Fri,  2 Jan 2026 17:15:54 +0530
Message-Id: <053a302c2c820686b6454ec77e3931f0b339b2ab.1767354166.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 12:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123096

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
index db071a1995..a1a4a3d57d 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "15aa3f832f4ec1874db761b9950617f99e1e38144c22da39a71311093bfe67dc"
 
 SECTION = "base"
-- 
2.34.1


