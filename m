Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209C9D40CEE
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.31033.1730840589513898143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BdxOPxvT;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea7c9226bbso36793837b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840588; x=1731445388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHfNeH0cGzG87lhiLG58C/BZGMNHt30LGrBGK6Vwchk=;
        b=BdxOPxvTOmPHMvThD1cQcS6aTY/TS22Ds8VTwE9kRGVzYYfHH2GnGgrx0BJM0Ns/oE
         Dv0R/dIULsDCntmsx1ZNiZ4wYTOXwEJz8v0y/Dug/hcAKfzH2u53+3fcZ1+zMsoZ4dLq
         mZHW6Vp6j8p0NlcVrdCsGqol9FFcLCU6XKj7A6FGMlqV656TSS5xmN8AIIYHkB6bRWJl
         R/2dQpqekjvfiuCrLfSID7oo/JiHYuoFJNlzZvwYpH/sciRIW3+fYRyF/YCs3F+m2Q3u
         7ilQDYH35CPG6mpQlvGGVxgnMhpCe7AiLfro/hvjq/pnAkKOMPzJH1xFuxd5u4Vp0qTG
         fCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840588; x=1731445388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHfNeH0cGzG87lhiLG58C/BZGMNHt30LGrBGK6Vwchk=;
        b=nB9406ghahZSjRNdzNekzLsO3MnYak88/hVeWS9l8BVUtQsK/K82uxAooIC6lqfEsr
         6LYEq2D5QjU1QBz05kFqjdCXdnTLEUuL/9U2J6toLZmU+o0Fe9/SV8Q3NSE7yCyxKrUt
         +N8L5/76AGOQdwu3f11CO8+fJQ+ly7DyZmuv3eetpwoutR1lrNsoWcSRpmSxop34BitR
         3HsEkYowmYhpyVmWKwg/JqIMJNvFE3256FztNXF2xQ5U134WZvpg8nhY4Y6Q7fLvsDUx
         9WXuGN94MRMBzNON4yk8H6jd5vXg3sMDocxCXgAAtGXYj4Ir+NScOE3SNKQr+UDPHpju
         Q+Pw==
X-Gm-Message-State: AOJu0YxdgIJDZkDFNDnasr/ejr1vhYpVsi+KkPKDdlndLqczwKlxkNH5
	21gsXUGpnFgIb0A5jZ4MD6En9VJWa8RTljOjpXGE1I2WIM8mfWaGEnjC1FHC
X-Google-Smtp-Source: AGHT+IEmdEfwhN75eeJP/SSlc7OLngMaPWSejQIyMiu9VQ5+KS7ZCmC5eMQm4nEONvtqFHvjLUrhGg==
X-Received: by 2002:a05:690c:438d:b0:6db:db51:c02d with SMTP id 00721157ae682-6ea3b8c363emr170033887b3.25.1730840587917;
        Tue, 05 Nov 2024 13:03:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:03:07 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 159/161] cppunit: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:05 -0500
Message-ID: <20241105204707.4155-159-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113675

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
index be8112565..193bfc000 100644
--- a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
+++ b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
@@ -8,7 +8,6 @@ SRC_URI = " \
     http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
     file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
 "
-SRC_URI[md5sum] = "9dc669e6145cadd9674873e24943e6dd"
 SRC_URI[sha256sum] = "89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7"
 
 inherit autotools
-- 
2.43.0


