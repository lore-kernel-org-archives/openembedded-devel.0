Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269AAD3F299
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.30092.1729278822311272396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fc2qN3hr;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so2351272276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278821; x=1729883621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j46u4kupMBynQRIYiefkxL4AImafU4/uoV14TDqjF5k=;
        b=Fc2qN3hrRcfjCmIt4e7/CP69WaqClcn2bYt3BXRzLOyZ8kGwVRsmI4KTqnWPq2qFdF
         lR5zBmqjwYRw/M1HD4H5tQviZq0ESghMhggqCKgLH3/N8MWGZvqLKpth2bU2ywLwYmkc
         xuY9MeOX50Fy4roaVeAsu6Yu+G2GqSTljlcZAUjMKVnOt39QuuKcmpUU7YrFYa+SP8GR
         4Idb/DRIT6aajAoXivXM/nei95vvpgecIpH+iniR9Xmg0uuEGBI7+0CmP5lxEbekcrGD
         lCiUtgnDpR4Urou4dyiL3r8MhdS14JYuCAXBdb4YDGOpuyLlfGnLuoQDRBdY1ptCqGbY
         Th9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278821; x=1729883621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j46u4kupMBynQRIYiefkxL4AImafU4/uoV14TDqjF5k=;
        b=JIQLVaEfQ7JE+Wx3O+YGafwIDKhqwQSWPdv3DCANNt/rov2nVerlX5xF+iLzmtPk0V
         2lAHQjeZnYp+kWP5LL45GgnuqcNzFnIDpNaQf/K5StJeCvx+Fj/5lFmy8/lDzaH9us6T
         It9uGy71y8XMD1hH8dBUrU0a8ZWbyKub+E6nuRNnusS2K3ZHw/wOTpMfFo6CRbfgEM97
         RhPiiW+v1nUOBBEel8vqSNKW/ConSRdLQ+zWn6epvXFnCZ2BPYcBYDNFH/gNL4JyE7PM
         9eW3lW0dTBuD7fVT6bboc5iDhMGAVM041GX1qKsc18rZpa4cLO2N8tylv1TTXrYlqHUp
         jmgw==
X-Gm-Message-State: AOJu0YzDH+Cf+LYgduNrAv2ifxkNGfkYyXs9x9NlluK2Gx8Ab0d564UQ
	FD6av9RIeIxryuOb6Oi2BLKcxeXq1j38b2jpT80VgHOZ2j42o75ZPHLeeg==
X-Google-Smtp-Source: AGHT+IH5aOtCemvN7Wib42b5WNUlsTHKn95KRaS/zAbT1LZ+/b5dwR41SMeGNwkkUCafFqCS2F3wgw==
X-Received: by 2002:a05:690c:386:b0:6e3:116c:ec0c with SMTP id 00721157ae682-6e5bfc0c7f2mr36407227b3.30.1729278821099;
        Fri, 18 Oct 2024 12:13:41 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:40 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 47/68] python3-pickleshare: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:34 -0400
Message-ID: <20241018191101.25184-48-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113034

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
index bb16c78ce..8eb55c460 100644
--- a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0"
 
 PYPI_PACKAGE = "pickleshare"
 
-SRC_URI[md5sum] = "44ab782615894a812ab96669a122a634"
 SRC_URI[sha256sum] = "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca"
 
 inherit setuptools3 pypi
-- 
2.43.0


