Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B43CFA771
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:54 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.14004.1728009618840334305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1htGYEj;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-68518bc1407so17415397b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009618; x=1728614418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG2aKY1u2tC5uXi7OeGwda9R4YYEXe8hEVf/TUTCoYY=;
        b=Z1htGYEjqstOVNafNl/FDYM7ds8+DBhQitjGsKCesQra29EqLYyiNQMM3WsHqjkybs
         0E/MqqjeaIB1WFXuf6hAE2Ink1huhhUs4ndjm71+9W26cDie13ZjN2jXKOpMFi4Fqv3t
         /EEo7nizGBHTuqWCCcjVF5ABsrsaO89iDneKyu+ou+h0h0rbrkM5tq4cXgDc6Rb9YUjl
         Gaj/6C/hgCka13W4xaqzvxEcKSuwWMYs/p17Sv5WX98g8sYrgKjO1nV2ZbQn30uTAxcV
         /qklwuuzIPKpiy+GYJnvMSnZ5Ly8MT3txgnq696m1cKFrDd7gdfuyJ97f+Ts3KjfTL8v
         K5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009618; x=1728614418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG2aKY1u2tC5uXi7OeGwda9R4YYEXe8hEVf/TUTCoYY=;
        b=JgIa5nl54f6FEY2XUyrsrV9QSMnm08fxUwTHUy6pgq5dCgP15RPptGm3GZBFG320q/
         /IfUvJ/OnvrIl4WorKfhnFQatbxgfJA5iccmprUJkVUsmmtLn1F1jIlKAxbBn0YkRipL
         zr0+mPb8pPSHjbBllFkiPyqcVKcBcL8t0A/Nd/fLlplvA3WFqg4QK06NSNUdbX+CVENt
         Iy6p1V4KFzSQMLmU8ujf/Q3yj7s90/8fVOdRf4TGHGYl17Wv7LHv6tLDoWz4FbY1JH9g
         Z5+HO4LH+xIZQUaLH4TgunF/t68TJjnthFRDQo0oNvPq5daLUGte+Hr4njiIwPeDi4Kk
         +AVQ==
X-Gm-Message-State: AOJu0YyspPZ98edxoXGUI5eDwjZneHNPLep/wh2zt84dfn5mKv0s2e9y
	m5GyC0OWRu6RZwEGlrgtiGiJKka5Nr5j8i/6lWNvbqutYA+CXXN+MdsR6w==
X-Google-Smtp-Source: AGHT+IHVQT7sirnEvl/q7HW29dmBfgLTy2ZPnRfYo8fFtSUYaKAtUe4/yNTbE8E/9z11j6t+RrdKQQ==
X-Received: by 2002:a05:690c:438e:b0:6db:e55a:1c88 with SMTP id 00721157ae682-6e2c724128bmr8906637b3.23.1728009617393;
        Thu, 03 Oct 2024 19:40:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:40:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/5] rodent-icon-theme: Drop unnecessary SRC_URI[md5sum]
Date: Thu,  3 Oct 2024 22:33:05 -0400
Message-ID: <20241004023842.14172-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004023842.14172-2-schonm@gmail.com>
References: <20241004023842.14172-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112660

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
index 532980d96..9d8cf7a45 100644
--- a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
+++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 inherit allarch autotools gtk-icon-cache
 
 SRC_URI = "http://sourceforge.net/projects/xffm/files/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "4b097d344a160d6497c6498985c8df15"
 SRC_URI[sha256sum] = "6ed00d16faa1f55b3bb7b13862de1d7f5cfd978b93e42487ded21595d0dbe208"
 
 FILES:${PN} += "${datadir}/icons"
-- 
2.43.0


