Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F334C02195
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.10683.1738150845495761357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=keXM5WAD;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3903744f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150844; x=1738755644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcTZ91OSzTx7MOfEX0UiCrXCoiZp/AIHDhvREl7Lnag=;
        b=keXM5WADxLFlKLIOrTbGzscDNsHn8GAuiQJqwLa7seKeoQwQYEr13oqUTo59Pzu+hg
         POGIlA/J+kQ9Viop9SW8TjKhT9OreAxM1hewWf1fEPDEI/cuL4d0qV6mWbCR4kCA2Jur
         Rm2CDIDmSq2kLFN4N/HF0MBW8zacfhm/IqfwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150844; x=1738755644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcTZ91OSzTx7MOfEX0UiCrXCoiZp/AIHDhvREl7Lnag=;
        b=C59/gB862gvc6pFtfNjL3AevHwD2EK82UghK4mPDKM4hv0iCb4KidN0vQE1aeBJ8/P
         2bb5BKuAx3tO5QzYiXTKs2hiWx51kOKy0yS33FmbGvGmriEptHXEAzEt0Da8g6BqXA7l
         5j1PGYEpt8wUxrbnIEAx5cQ89Mgbo7zatHmqIQwmiAlCpcVa7dbKD9u9X8HjIuU223UQ
         xvQbNJYkJ8NI/AUWjLR14KFeUe0zEG9cD6t1QydXalxqFWhX4tjIZVYIaS0qaCY0LFhq
         rNhTxmqfdBxWSJU/K69zwOinGo/UftZKLhkjY2l5BuoN7XQvsk837DHQQH0umTYrj90I
         eXOw==
X-Gm-Message-State: AOJu0YyrSIWKNF7zGi1c7gFpyHR77b+1kfyUiMs3xb+R42pAcB4e2YxH
	HetDIJIxtNV/sLegTwPDUoe1W5zpGUJWNYNtneO+XXWC6wmeZhsdRIkkE5+eoOEeLnhspnbT39u
	u
X-Gm-Gg: ASbGncs/Ga6C3RVwvVP+v3I1rkKATH7qNRPPHkOU+Lf7uW2ZR1VAZPJQtV8mjEQ21lp
	4YOYPA5FqVHp0EgzR8AutatZOLwPwAqYrhI9pt4c63ec5ahSOrWiLDaxxJVqN7BlWTRStMVO4k/
	1/68FnO1g3yPe8PxjKPJjoZ12d2V9b0igpQF0tZiCf3Af52Xygsl4euFDbyjUfiNbzzDGOPItuH
	CIo7Bhyfb3fPM2BNr9aV7BMWF+1a05s3+4c+ImW0T9FmJujp2aEjK8sJrVmVSyGd+J614nmApS8
	01HGiemdtErCb+mVtTqoAV1EXh2pweyrSalFwse/
X-Google-Smtp-Source: AGHT+IFt3yYfOnxJqqf+SdoGQEDjeEu8adhnqRIrQDcXG7LxSzNhLnYtHMaDKzBOHolXif6urLsVKA==
X-Received: by 2002:a5d:4ec2:0:b0:385:fc8c:24b6 with SMTP id ffacd0b85a97d-38c519602dbmr2082148f8f.27.1738150843746;
        Wed, 29 Jan 2025 03:40:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-tzdata: Add native and nativesdk
Date: Wed, 29 Jan 2025 13:40:35 +0200
Message-Id: <20250129114039.3562870-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115133

To build python3-lief we need python3-pydantic-native.
To build python3-pydantic-native we need python3-tzdata-native.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
index 20e9715dd5..3d0166d20e 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
@@ -16,3 +16,5 @@ RDEPENDS:${PN}-ptest += "\
 do_install_ptest:append() {
 	install ${S}/VERSION ${D}${PTEST_PATH}/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


