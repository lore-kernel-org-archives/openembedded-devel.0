Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADDAC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:26:42 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.51941.1711373198835199530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHCGMRDk;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: jhatnedap@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-366ad40144fso11449315ab.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373198; x=1711977998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MGAO2jiJhNKmecWhn2joVcrS9PZHZO8QykQc1HGPkk=;
        b=SHCGMRDk0iWiPj+zx4QgHyN1Twk0GRH/c5PL1vG7kniRHX4CJ+YxAOOOzQWua16UUy
         dmdNIsc20cJiW8bGixKLjftDo70I+pERFK2Pp5fcKvu0nhEAO2FB4NDQ5KoZbvI7yCAp
         q2dkUGtjIVo+7jAJEOU3ZghaSqaR9htYbNEZ+EHoT/812jyggPBvxu/RgUktd5EVJ2mm
         tbvS+/DfCvjLveppYqcDt/b729T33nd9DEN9hTMfTpsGTBdJyxbSr2SThHQF/3DSBnRE
         SsyVQkH4a/2Nnx4F97LRHHBglkT0OXgy3DGt1vQF8w/bM/37grAELOCyywPPtdTpLe0F
         H6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373198; x=1711977998;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MGAO2jiJhNKmecWhn2joVcrS9PZHZO8QykQc1HGPkk=;
        b=asKYOW2K9aeIo6R5Etrz621EnG6Wy4Ofj5NUAtBn1xyNait84uqdy8cxma+bJLE4lR
         GRublAKjx127yM3O3c1Q2Jj94XG59AJD3739xHzvlZHDoDMJ5tMG4B0VG+RgSSKIEL5a
         SyCd/RzyvaJEjKzameEskxGrJ7lQmdZKZTFxKDubNatXk16CVW1innfWZAwwcVVuuKoQ
         OOpL6EqadePZkkowzxV2zmryGiF53ZtpeBWOwlZNX49Rfh+qmdJTw5VNTUMst4d3De4f
         1siknU2zV6oUEmIaBG4nNegTh8YWAbKoi8aSfHBhdC+q002PO/uZbe8NuqpUj3HBk1Qq
         m4VA==
X-Gm-Message-State: AOJu0YxU436ZQ8m7ruWwE1Xpv4d0qy3P5KN1QKOOdLFUPT8pC9HXhW/g
	nZ9TsCmwgGZcp2DjgWZ6hFpUX+ZvfgLNGfnHYWkntgP4Azm/4s2gqOor0MDO
X-Google-Smtp-Source: AGHT+IG7soIEJFxyxbC91f6RnFgD4rQsNKqz4eTdr+A0PFi11BvcTQdlmHsBd7gDUvQB73gZtVcXxw==
X-Received: by 2002:a92:d952:0:b0:368:71c6:a30c with SMTP id l18-20020a92d952000000b0036871c6a30cmr5051171ilq.8.1711373197987;
        Mon, 25 Mar 2024 06:26:37 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:26:37 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 1/7] jamvm-initial-native: Update LICENSE to use SPDX identifier
Date: Mon, 25 Mar 2024 14:25:56 +0100
Message-ID: <20240325132603.2477-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109579

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/jamvm/jamvm-initial-native_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
index f0348a4..7773409 100644
--- a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
+++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specification version 2."
 HOMEPAGE = "http://jamvm.sourceforge.net/"
-LICENSE = "GPL"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib-native classpath-initial-native jikes-initial-native libffi-native"
-- 
2.43.0.windows.1


