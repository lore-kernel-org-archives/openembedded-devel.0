Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D583CDD0F3
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.21786.1729612092092051578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZhK70x+f;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2e340218daso526367276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612091; x=1730216891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9fHOnEJV+UVOsVAnsOcMojX7pNNCHG3OXtP5436XHs=;
        b=ZhK70x+fbz8w3iKnMInfym6G8CNra6UVRiBI2uJ5wK6Y0SavL7WgwCsvXQb3Km1QfI
         n8ssFAya5nZmmhtiQvRq8B5eKqloP48UXjD4bIM2ByNMV97Ckzy33kQXTcTAapRakUCB
         HvJ3mk2r4Lp43m+9/UK5YFWyxzdMN9hRHS52LHCpNnlkSR37fk8MDgsoD3kyf6NsIxFh
         L2zdKu709/+LBzJaegn5NFRYOMQIx7ASGla1uV1J9yOG2r4lQ7Sxcm2AwG5nsjRShCfU
         KY+Z3oXiShc0FBdSnsf5qTcrwfrGG/ckO4hBmhfI2+vVtrsh19B5T1gOSy7rF7Jc7XM2
         8b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612091; x=1730216891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9fHOnEJV+UVOsVAnsOcMojX7pNNCHG3OXtP5436XHs=;
        b=GFnhJccvMV1wGZqjHaoDPVoc9tT0WB/UO10CNe+rRizGMuVwsRTIswkwpEv8YS3zC2
         yQk6Wc4yC57wK+6WgZ9Z51a2L1qKj7H6/W4fVKd/zhzvy8lbCbcMes46OKm1lKBRB3F1
         /h7zfg9lPVXTUrNwmeMjWIVp9AXaMc3l/zsMFfiXpdBvvaiQIjm6s1IWlNWuDrXiyh5b
         o6ITlDbJ/SLXIFVUKe3F8Y20C9mpdC5Rgw9J5Eo9lY+mSpwrheXi2ttEwEOsTtQ/TPtH
         Sl8SPqGTy/KtU5nfP0Noy04SIdGN/bP7PaXfjcd5tFPaE48JX4sfodMiM8/qjtHwG+Zz
         Usew==
X-Gm-Message-State: AOJu0YyMlvon06BqIb+HnkKgxdZ56xBN3LcQTx+f4zouDAoGPNPM4wWA
	XEYgujJGaSMv3V3Jyv84GdY08E/X60h0vWwGP/QeYTioCNjnQdSb+Kg5vg==
X-Google-Smtp-Source: AGHT+IEtekwi3G3lEFiDJreRQ+QXQYXqL5KrU93xljEQpquxW/tygHBO3XQSkvsU+EcBX0LfX3nkrQ==
X-Received: by 2002:a05:690c:91:b0:6e3:1e6:d9c2 with SMTP id 00721157ae682-6e7d82aa0camr32004437b3.33.1729612090774;
        Tue, 22 Oct 2024 08:48:10 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 25/46] libmodule-pluggable-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:43 -0400
Message-ID: <20241022154729.20331-26-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113116

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
index 538fa30d3..fac74ba97 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=322;endline=325;md5=086450ce010f6fda
 
 SRCNAME = "Module-Pluggable"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "87ce2971662efd0b69a81bb4dc9ea76c"
 SRC_URI[sha256sum] = "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56dc64e86b9fa75c5a6df"
 
 
-- 
2.43.0


