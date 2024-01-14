Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8783BC4707B
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 07:20:26 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.34968.1705216821613786188
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 23:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOdnVDJA;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-20503dc09adso5119236fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705216820; x=1705821620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZPY9Ej3mkeryWREiBJi73znzcMaGzyYbGlbx3gXF58=;
        b=VOdnVDJAue8KAI4CVkURUiWolQRov/R2Mz1QBUmzC5zT4llhkwf0bfbE/MOLpEqdht
         KAOfrqaIlfZeBFwestawraOexERh38rVbNX1wo+TNE0mfCN3Nrx3c4R8YfaP9juKPHFc
         7ZwPg/ZsVvejZ+DEBIsM6tb83uIgylQmU9NfiRoEKxT5GrpsO1YhbfHljJ8GCYD/QkOV
         s2Vyuh0sJ3yc6G9yRXjrIAphjZn/7rN2x+zCQcATasdCHdB/N755u8cXxSmSO9FCP/LH
         Hfcs7l3MzJ+uCCb4auJ38QltTWIUGQfML7W6Ek7n68In6F1uE6kIf8uUvkwFfTGN0MQV
         x3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216820; x=1705821620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZPY9Ej3mkeryWREiBJi73znzcMaGzyYbGlbx3gXF58=;
        b=KimyGUuHG3/d+TC+5sr+61z9MBfxk3onBwVet/z4RhuGK4QkKBtmV/M9ISyRzV+O1U
         Pw/BH/Y7SCqAdKWxrlHsoRHJt9WY+5F0uTIUZWNUQnTAXT1+OWlDIRajddzHBjw0v0KS
         uD2AjKKVpIlID3eCZl0SialxNaJYuxZuKAnbHaUPls+PXcYQonPbYTQsz6sxPIwgPS15
         GinmoaTKLGnV8JFKPci4LkOUVXN+ACVR2HrP/28o4vKfaIp+7tKWcGtOIrxcNLkoLR4y
         vcxjUkFT5pYGlgCAbGJYdjyDiXjXUdmw25SuVnkh5+m5WshcNnCxlbxhK54TWrtv79KC
         c9LA==
X-Gm-Message-State: AOJu0Yxbce/h3xe2n7ZVW0SI7E6BVLuzLkZqZ+IicT/lM5maaM245NMU
	tg+u+ZPpD2HW0WgWuv4z11vCKduMz5JDPg==
X-Google-Smtp-Source: AGHT+IGN560tI6AMtUg6tJrHN8SSbeg4OOm/HbVEqx9dO61i6wBSsHp+9dXZXAD/8oJ8vPLaKE10yQ==
X-Received: by 2002:a05:6870:b523:b0:205:c427:da16 with SMTP id v35-20020a056870b52300b00205c427da16mr6048584oap.101.1705216820489;
        Sat, 13 Jan 2024 23:20:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id i63-20020a638742000000b005b458aa0541sm5864020pge.15.2024.01.13.23.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 23:20:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/5] schroedinger: inherit gtk-doc
Date: Sat, 13 Jan 2024 23:20:13 -0800
Message-ID: <20240114072014.601505-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114072014.601505-1-raj.khem@gmail.com>
References: <20240114072014.601505-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 07:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108272

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/schroedinger/schroedinger_1.0.11.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index c78e008007..e8f6df6348 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -19,5 +19,5 @@ SRC_URI[sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8c
 
 EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig gtk-doc
 
-- 
2.43.0


