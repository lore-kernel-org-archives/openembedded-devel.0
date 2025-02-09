Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B56AC0219E
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 17:59:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.33373.1739123981562662478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 09:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCvlfn9Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dc660b56cso2579511f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739123980; x=1739728780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRJGVes7amoxu7/FE1DiwTvsNq9uhudQW6fXrD42Kjg=;
        b=mCvlfn9YbD47he7rNL8WmRjfGIyZ+oWTfEVJ6w6qp9S3DcSUExspWGuoDh5BGnyGDy
         5KfdnIS/RzANYJSioEGTdTBVkXBZjW1NEK4iyeFAsMvHEjlxGFFyitTQYL/YdI4FEpG/
         uKLgohbK6A2dakNgJdD3+gjjEbiFiMOvkVV19qHvXTvoARx7ycAuK7ihQKIVpgBCEJib
         20J1/d1l0jnTGFD3uvWWfYdfBGqoQTi1+OXnTc2DFpZE+hXyx9KmGnhiXkL3i7us+9oW
         pjXUfYJipFg9lRGj+nyZ2exLcFRiv9fWKPXZuZoKdyl5UCLm/Ki+b8IVHUaJip5ID88+
         r9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739123980; x=1739728780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRJGVes7amoxu7/FE1DiwTvsNq9uhudQW6fXrD42Kjg=;
        b=Q8v7HHrYfaop0YMreLz58v8NrNAlvOAFK+RaFPTpJ6G2MVHhcX18HND9yFuhuhVYk+
         wE0ZuYeoNj0L85Zjczz1Rt7gTNzdqb8ps6z4Ndp6OXFnHaOAXV5ywOmkVj+if2NJ7WEE
         RBPSLT1l0bR5uNEyyfDagGvd2EuTfiUQkQJiIMJiZb/UKxn6vyoo23q+zyOwsFQsw6vm
         9ApOhPlcSxj5DWb0iKNAca0TLmVANW2PhkskC0e2zFH3rFO35vNbR9bs8Ejv+cHVctoD
         j6moZ63CzMs5qHJ7Xdp/RNUPNriFGAYzAmUwVOuOeRhfmj2cdS+qKEwedTD/LLywQUJ+
         garQ==
X-Gm-Message-State: AOJu0YwSFW3J4n8JEvezB9ZGzMSK8U6mn+eO/SzTni1qijJaIrAJPKLR
	r2aRV47ErdbMUbuPxPiX6fRkgvNP+KarHRIZCcVyHU9fKz76KoYtsANRUQ==
X-Gm-Gg: ASbGnctVXQJc86T5XovEZEaJuvWQQjXL4eSaAvSt3+GfmzxCjExiMOh+Dp1cuj4W+0h
	JeztFxF1D3NV2Owi4RunXwI8aZoNCPFtSS8vEPTbHBamUUQO72n5hWuULlx1y/mZ8T4YxgAwiMU
	GCmOKdAh+hEWSBo2AP0Vfg6Y1SNECgBAWJZcqaynXlkVObRRax5YXvy12GZtsZ0BjiEcyCzrYSH
	4KLNtAMdNXvOww+bUXdDRgYCIJBvGaSj+2XzvfIf3Q5PuvrMMpCz1Z8hLWpc7GEnoewIJw7MUki
	x+Yu0Lf184dOyZw8drDE0NIrIrMnKJ8=
X-Google-Smtp-Source: AGHT+IGH2Bcoz/zE+aGET9moqCYaktXzy72JeoljqSg0pP/NpRWTtp1I5hOhWti0D8ROadGq9ZR3Xw==
X-Received: by 2002:a05:6000:400d:b0:38d:dce1:f207 with SMTP id ffacd0b85a97d-38ddce1f3eemr1845012f8f.44.1739123979600;
        Sun, 09 Feb 2025 09:59:39 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm9976590f8f.53.2025.02.09.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 09:59:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-gnome][PATCH] gnome-commander: missing dependency for tests PACKAGECONFIG
Date: Sun,  9 Feb 2025 18:59:37 +0100
Message-ID: <20250209175937.3947017-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 17:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115320

If tests PACKAGECONFIG is enabled, do_configure errors out:

../gnome-commander-1.16.1/meson.build:179:8: ERROR: Dependency "gtest" not found, tried pkgconfig and system

Fix it by adding the missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
index bb36d59e5..d96371de3 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[taglib] = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
 PACKAGECONFIG[libgsf] = "-Dlibgsf=enabled,-Dlibgsf=disabled,libgsf"
 PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
 PACKAGECONFIG[samba] = "-Dsamba=enabled,-Dsamba=disabled,samba"
-PACKAGECONFIG[tests] = "-Dtests=enabled,-Dtests=disabled,"
+PACKAGECONFIG[tests] = "-Dtests=enabled,-Dtests=disabled,googletest"
 
 FILES:${PN} += "${datadir}/metainfo"
 FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV}"

