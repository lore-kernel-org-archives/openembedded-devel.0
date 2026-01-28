Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2F0D46BF9
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 19:54:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3655.1769630068536072779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 11:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdNVzHOx;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso2163275e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 11:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769630067; x=1770234867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix1gHIfcGYo6Yu+Vs/U2FGV6PHqDqH+nyOLn/zqCWRE=;
        b=mdNVzHOxSc3w9/rPEbOvVZGD3jQaMAVS+QdvwmS/A8pZtakRy9RKx5NBY2hHkN/IlJ
         garYBF89AoBtXrpvCSfhV7qo6btozies7B6OPqHabU/RoTP20nVBqaQwO/2KRJKXb/Qi
         P0TbeGFAXQD7fQbkXto7SAVSy00Ag21DSE690GO66wkGMUUwsamlGrPGW/8MHwfH2mWa
         utzaX4LK4pPIr4GHZRQ1LFUzChzll6Ho0t1uIliZdXh0PS8Q07s2g8NUQJAMPHn48AUx
         EvLNTbMOFyDhyjYMMbI8SujTqrklfSHmL8aRsQsdCbmr0rqkuDh6zNP0yr0ECvnz8fH8
         tNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769630067; x=1770234867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix1gHIfcGYo6Yu+Vs/U2FGV6PHqDqH+nyOLn/zqCWRE=;
        b=lzjlM/RFVj8Yh+1/knDMSfzu7kSd56jPyMtqjh8B3YUpj8uQ2z7XfoQRrup3DS7Zes
         dNsNQyg2pT2cqv1pybqUy8z91Lg6SgzTA2ttW0s61LjyEnByxV+yp9Ibi8BeRPeCM67X
         OV3Lk+rlm5lzQ8pDcnim7367f38+A7sRRSl234gnrGMYmLI2U01ZiuacLwxlaYwkxDH3
         yR0SYAjDjrWtpvKPWP7vnhpRjTEE6wqQFMHwVKXoQEQ/PR1RWgcduTHPhMnEQhE/npAo
         BnYr1/YSi6xdUiRlvTui04I4+bGCLlZnR7/Zn247HPJlSdG/NaxjfUrO+H0lEiWwkcMM
         g5Eg==
X-Gm-Message-State: AOJu0Yw3FY7fkWpdkUt1VrzNq6/WLXFOrcHMKN0sdf4OsSOUubkGq7f8
	V4AqUtNWN5AMZkH3regur6O3KYL5TxIkoUOWsI/nsJOM1Yeym6/tefnneT6uAg==
X-Gm-Gg: AZuq6aLNeYeBniAt35Mde9ZzZv5pOnaQxa2ShCNpbhNgVszZtN4lzSoNuvLaowx9141
	6pCnl2xIcdPX0OrJqt+AAN9yrDEtzTyerUCY6bT9mzfVQiE916YpLsI1K2HlUXyP6kHJ9AtPimi
	OsrxCehkIIR17F1bHvzvf9CbZxsVBt0niGqeXWxuL1oz2aCo6SaODon4k7SiJou9szdRuzrqtx/
	/REIOMWpNuyL+XjBeWnKongUpza8K4BF96CBy7gCT25yNZtSvI88IduZ/ciA5C7Koz2EKBHurFY
	1tEALkkCi46iCsD8R65aUT1A7q4dAKsOtjiJUa/vUir0ryAVfIlsW1svSN+NtJTQwTGhlKLTbA2
	DjHS4orXit5jHieujBa8aMEKwG+7JBRlP4t3alOt+knPHNvps36gp/j1H5Qr9CBmTGoAe6Errru
	bkTEVm51Fp8Vpr/ZwxRpQ=
X-Received: by 2002:a05:600c:190c:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-48069c4869bmr85303415e9.21.1769630066742;
        Wed, 28 Jan 2026 11:54:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm98996975e9.5.2026.01.28.11.54.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:54:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] freerdp: ignore CVE-2025-68118
Date: Wed, 28 Jan 2026 20:54:25 +0100
Message-ID: <20260128195425.207546-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 19:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123976

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118

The vulnerability is specific to the usage of Microsoft specific sprintf
implementation. Because of this, ignore this vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index a78724b925..9b07c94169 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -95,6 +95,7 @@ python populate_packages:prepend () {
 }
 
 CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"
+CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: Windows-only vulnerability"
 
 # avoid http://errors.yoctoproject.org/Errors/Details/852862/
 # fixed in freerdp3 with https://github.com/FreeRDP/FreeRDP/pull/10553

