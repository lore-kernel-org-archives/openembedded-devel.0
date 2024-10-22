Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D37D2CE17
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.21779.1729612087293811053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5HOpyN7;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2f4c1f79bso48281447b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612086; x=1730216886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lukR6Pl3lkO3mwdsqPLGTu36zmqwB/2t3Kk+4wh//V4=;
        b=g5HOpyN7pj/MZLBzmGbHyajyzBGjjN9r5//i/t8FPAhkBghwkpAPxYcarYwZzUXSQ4
         /6D8B5Clxl5CzeGdf2+hooh3R4nXgdGd6iPtZ3gGwz6eJ0Vzp4PJAY6rjZ+WP0ayfOLf
         dURw821hwQWFf2dN4n7nf3iHsfPQzMn1fnnI0ucGKwKM2EMhYbng5vb5WrfG17cllOv0
         f8Kh293q2fQfAXhGvUq4P1cX0715k16vftkg2mW5qBEXx3jjwATvVqh7j61k5Rj9GA4a
         127Gn9fY1d//0PaK5Z+2ukQeLSAVLRc8pLLE5mk08feG0xhV+v5nfmwr90OPpC89itmQ
         yFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612086; x=1730216886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lukR6Pl3lkO3mwdsqPLGTu36zmqwB/2t3Kk+4wh//V4=;
        b=VHIHzqlORi0jsR4WBsc3h2+jLI4e/rB6X1chDZVErGO9NSmE5K6grzE6kJ2mFAiqcl
         UXLmbuMpt+WRtz9VQd0INpb4ttRw6EThqH6EqBKtRhUfqfviRT/pciSd7soNiQs/AnG7
         uHcTc40hWcKTD3TY9W7QnOGs9d1H/tFVDgVXBQlWYKiDo+Jk7ySgxunmKqwts5/bS1oP
         2ZNHILEKMc/hAPFZ8L1pirBL8PovfgAMgOw8But7L2Z4gBHPdwIuGzeJ0L3ucrxtVC+p
         1NQ7Ue09nNbyEN78/ee+cTb3x0pMcYnohhaq1zrtb8fwz7uZ2tZ2YAi3wiOum/XpLwL7
         lPVw==
X-Gm-Message-State: AOJu0Yw2LCFwfqFk6nUU4G3qyBoe568Pvy7GEgC4IkTy450sGkpNnqi5
	0rESyNp98iZvCuH3jlq+UT8lcZ9Yoi3X6q2e2eDHifSQyXHhtEWK8bKOzA==
X-Google-Smtp-Source: AGHT+IGy3Azg+UdiDUd66IAV4gswnY+TRZti5jLMuT2cLD+brO5bT3LLSPRRO0uzqHtRb9ZPUz7ftg==
X-Received: by 2002:a05:690c:91:b0:6e5:a8ce:dd0a with SMTP id 00721157ae682-6e7d82af7b1mr27155527b3.35.1729612085997;
        Tue, 22 Oct 2024 08:48:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 18/46] libhtml-parser-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:36 -0400
Message-ID: <20241022154729.20331-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113109

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index 216d7c413..4dbcc107b 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -9,7 +9,6 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "eb7505e5f626913350df9dd4a03d54a8"
 SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
 S = "${WORKDIR}/HTML-Parser-${PV}"
-- 
2.43.0


