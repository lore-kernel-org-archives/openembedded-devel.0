Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16531D40D09
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.30649.1730838988884594607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qmw4rOkG;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea11b32ab4so1651947b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838988; x=1731443788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqMQqofRvZcQmWWni+2sjHwwoO99PmS1CfAmHnyS97o=;
        b=Qmw4rOkG6PgDP7PtRBT+sLBzYS1w0ago5t3zMAZOpe5sroqkDBuZoua09VQbdPelLT
         ukqiy9FT8QGZZHe0PTeKHI3VaKaOKXDrDVjn3ZZTNlWnBCe5aKulb9z6JI+nTrg8V7QM
         A6rFpbhiSOPXwthy4aFldBLNP94dT8E1Oa53UNIMhuxmVTrhKUvFs5lQxgG+beK+VJTG
         2sdDCPElfPqeCqxf+pm+GZocdyGKYHFhpCPga8X+RTFlYbLBQwJOSUHC664kuCOKYp88
         pIMTq322QCWw3DTd8H1c+k/DwNjj2aMrKo6OzaI7mOTCzjcJV+75PJnPOTUoorXZiLvP
         3Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838988; x=1731443788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqMQqofRvZcQmWWni+2sjHwwoO99PmS1CfAmHnyS97o=;
        b=tkduMZ9HQloFPq+tvD7f2+U4khJhGZKJOs9KjQVzUhGoz6ys8zMXELiMM5djwUmPzy
         lzmBz9X8r8whdu/sMfU7IEJpse19vpBcb9ruSnfnpvGW7ErPHmmgvxYuUCcePLeOjUlB
         TT0RJIeyXYWRoNjsY45XpT+TZgEbtsO2tTTCuLnChBu5Dm60xgPAiPlpWFz57Z489jA6
         AY1wjRq7bic4/R44fNbwvs4009zEhlNMPEr6RY2KauGJ5/2PeIvEQgu9Om9Osn8bIHQ7
         fyUa5S4gKG4GoPN3ErV+S1dUcv9DAD4JnGiCpQxH83KJ7ozFLXRWzdCnA3tgV1XdYUNS
         HRkg==
X-Gm-Message-State: AOJu0Yw6QfyDNkPOjd7D9IUJa2KdouNVCEeJ7Alpp/0hpk0AJoqsX2Q6
	A9oy4AhJg0MIQiU3+UN55TVBDqa3wYtZqiAIorbModucyiPslPeOTSOd3twQ
X-Google-Smtp-Source: AGHT+IFKSJLftniCwV3Leu/qaq7rNcnxT0rBabeglo/UDc37WQ+ySwVVvRJiLDE61JpTn0d85vNb2Q==
X-Received: by 2002:a05:690c:6c88:b0:6e2:41fa:9d4 with SMTP id 00721157ae682-6eaa16309e1mr61140247b3.15.1730838987553;
        Tue, 05 Nov 2024 12:36:27 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:27 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 134/161] libraw1394: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:59 -0500
Message-ID: <20241105202827.3104-134-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113651

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
index 15e1ee243..97eb105d4 100644
--- a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
+++ b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
@@ -5,7 +5,6 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "45031ab15ca93e50c19886a38bc1814a"
 SRC_URI[sha256sum] = "ddc4e32721cdfe680d964aaede68ac606a20cd17dd2ba70e2d7e0692086ab57c"
 
 inherit autotools
-- 
2.43.0


