Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D029D3E195
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.29956.1729278802128667823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5/S7kjJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5a5a59094so24463177b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278801; x=1729883601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONA+861w2SdU33AEavMvC4gTUWN4u4w2ptUs+RbaR3c=;
        b=C5/S7kjJQ98L40M4Yw3kZvgN4o905ho49z7hE7rTprxt8oqhXPsqeLOa11vWfVCgmS
         H3LPgtefwWVOfVqWv5LkF3IegrzYa9Im3lU0maxqHezRC1ezPZtsfC2w823/VpqaFazi
         fKmoYDj0EvQuDSj/pNCtFkFvYxJfeQ+HYNz+1PV/+sOykKViZdt8eItQC/CeJEkiPcLW
         1ReMT4kaEU9KeBiYZCtCvjZenNnGZMt2fxL2NiGOu8BOyRORoOTWSJdipU2qzk8v/xcn
         TLLE8/JTQ+2Yt7w1OMtGBgcx7Vl51X1MjXWtSSDynvdveHHgrqjEOqmsZflhAFyAl4pO
         cEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278801; x=1729883601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONA+861w2SdU33AEavMvC4gTUWN4u4w2ptUs+RbaR3c=;
        b=WM3CS2p2Wt44Op2fru6rs0hkqZYfKi10dvsTQ5yf0pylAHtnhq3p7puOriMQ3GeVWb
         GDnOVasTzH4/rEDdBObSLF+SXCEIXTNSfqOm/IwN58eqDYzWbN7ABtq1bGlh1PoHaR0i
         t8ae01VTWLDHb5nnPmzo7DpraAp48y8VLXrGWByVVTdH3d9PtfPanOe7QcjRu5wx3HST
         M8I7qbmT/meqNMl3Os6oTbbI90nDdKcTPEFJogyDIcRf88eMJ96WFyrC7RzmSwbi/KYn
         yv5d+o5jOOXszr9EU2Q87pkn5eRwRXiGXkghKFKHTj6b2sA1Ql80emcx42X74f+si7hO
         LQNQ==
X-Gm-Message-State: AOJu0YwMJ40UNvuQ6Z29aOpGw5l2GzbjxdDLaglqujPYLw7uz3ZjxRm5
	rUsb6uRKGxGe1lC+idepm3W+ai/AtNKLSMTZWNDTStSEV8/R8Z3Hn3Q6MQ==
X-Google-Smtp-Source: AGHT+IHwYwTD8UN0FRvkUuzKuLPt0XynTpMJSjUKnpYhYw0csUi63Km0U9/4URPSaPRPl6wlIrj4QA==
X-Received: by 2002:a05:690c:2c0b:b0:6d5:7b2f:60a0 with SMTP id 00721157ae682-6e5bfc0c7fdmr29785767b3.34.1729278800576;
        Fri, 18 Oct 2024 12:13:20 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 15/68] python3-click-spinner: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:02 -0400
Message-ID: <20241018191101.25184-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113002

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-click-spinner_0.1.10.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
index b3e1328c7..7f19cc345 100644
--- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
 SRC_URI += "file://0001-Update-Versioneer-to-0.22.patch"
-SRC_URI[md5sum] = "ab68ed404401421819c81cc6c0677a87"
 SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
 
 inherit pypi setuptools3
-- 
2.43.0


