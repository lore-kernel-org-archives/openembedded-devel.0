Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.2825.1596016859355531877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 03:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=jB5eQ31Q;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id i80so12660540lfi.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24bwsMJBXK3XXJ1haMsDbnrdCCkcJRBNbAatF9UKX3k=;
        b=jB5eQ31Q1wLPn3L61GiobBJv+2GWHIlUkUKkNU2/HZRnHZNE0PVbgj4YhQ2tSdfgqp
         36gIMPNcAMXPgV04ZE2g2WSds0rPdkdQUPBXFUurX8YGdYqCrLdps7iuca09GITIp5Me
         tw4wk3Pdg6agW5Ft7PfMtT5g+ZW3n6BGuqPCY3CDu3jE6QGBi3yZ7XmfR5+I/V3wr1S5
         l/3Akc+43EJij0rqyey4anDJo6JSLizfeQICr3SjaW5p6fmb+5quXCTAuFdZEcjeS/+c
         xajx1B1OqZ41pxj02oqzPsvumRidfRpyakG06ymaMVnjHnlRJEF9+S9iZcnnfqpuOKi6
         /SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24bwsMJBXK3XXJ1haMsDbnrdCCkcJRBNbAatF9UKX3k=;
        b=FV4ZvTAIeL+unVA4GxBEs2rOnss6SFPUkog9ldlHzcXQ0tipAGKU0wWBDa+jL4Y9gA
         eF4gKZqRm+3qcISL/+q4PHfGT0BUn0DKLMhEMMM+1YZxCfVvmV9pd3pzH9BQelOyOmK0
         lOSvVi8ZzGibExcbtnQ/4o4G8VsPK87iQkuVgkAZ65PauwT8oFutfpsfYXuZy+z06kmo
         2q+Vp4Tek/r/RAOBfATRXGCTVB2IJvXBKG3beE2ORq/ySd8/DX8wFljSoqK9qKKz3aqc
         CdWtAqhGv9fM5h1fK2t4CUhqeiln2mDwK615KK3aA12UncBMEeQ6yccIrTrZByFHE+Cz
         3e6g==
X-Gm-Message-State: AOAM531KOON6vUscCBWPYtcgPcPVAtUospqbcwwyQ40IHT+RrppTN6xf
	jWOk64g7ld9CAwq3pZ5E8/8IB0tNJ40=
X-Google-Smtp-Source: ABdhPJwZveUcSdAJ3cktT1XQEAFCCgrisFs/Tiu2bIPs1Ba80zSjj/ZJq7BlqvpmNLeYhgkCRMONAw==
X-Received: by 2002:a19:2256:: with SMTP id i83mr17291854lfi.165.1596016857184;
        Wed, 29 Jul 2020 03:00:57 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 29sm363369ljv.72.2020.07.29.03.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:00:56 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] ncmpc: update to 0.38
Date: Wed, 29 Jul 2020 12:00:54 +0200
Message-Id: <20200729100054.3313751-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-multimedia/musicpd/{ncmpc_0.34.bb => ncmpc_0.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.34.bb => ncmpc_0.38.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb
index 0c99c7c69..ebf5d290b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb
@@ -33,5 +33,5 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-SRCREV = "79cf9905355f25bc5cc6d5a05d2846d75342f554"
+SRCREV = "2c71add42152072c5e0490de2870315dfb3b71e1"
 S = "${WORKDIR}/git"
-- 
2.25.1

