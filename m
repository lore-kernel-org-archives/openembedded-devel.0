Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD46D2B941
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.19540.1730817418054290641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=etsfgH1+;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea1407e978so52005957b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817417; x=1731422217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4wra12Ggmo116pSaexXYndRT9gUx+bHtMudt7ajjQU=;
        b=etsfgH1+tQjAEPuAXEVh0RKGQO6268aFW+pbC7VbMPf5M46frRiNDX8dBJ+VLTfc+E
         ATzRMbuWuntZZXnsfe3l55WsDkLuPIcRw70qd2f3Cd5Jr7YUCsN+U5pbmcYiBBOYjlXc
         UO1dMXWVRgUffBmzCRe2fn4MOePcT/Jxr/06IHvmJ3rjlibYhE/AvTSWAw/i9Hl6Xhr+
         N38h2D4NPifLCWNHQr8H1pmHjm5iUM0RgMLS7CWcYCqOqGC154o/27wuPRNCZwK1dRTS
         xLGBk8WGHh5T/gyXSW4ays33D8lipG3oG3GO52YWw7IwBW+a9HU00X0sBYQYX2jiZNen
         TT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817417; x=1731422217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4wra12Ggmo116pSaexXYndRT9gUx+bHtMudt7ajjQU=;
        b=oXP9fKWXkc2vxGNg74PZbMRwyDhCklao2XTvRPchRWydKHCMCuPV2L4PvroL6rxuV5
         njrm3BtGK4zPZ6aJDNfQCM89MUQzWdCz9KNgN4REiDk4Jq74YCvoFe5KaRIaNgP02gQy
         S+JcJm0CzQwWlnDTN/qrOdevqbhbKUynOAmcwra8eQcHpkpFCTn7peqmz1ILoQ4bv5tj
         5l0gTkw8AkvTIxkhYSrEQhIdYpFtLuN74zapUwtweNzLO9HfYTHZPvWxQAxUauKP7S3h
         gwLrSJiDFiHg0YgJJP7Ma+vll2rmCYa/EQDX8VMiOve+m7k03AizzoJH0vuXv+9o6K1T
         /kIA==
X-Gm-Message-State: AOJu0YyFM/Ol8UylL9zr+/4GytlLw1Xl8dqykwh4KtGPmLs5leHg2Mje
	/mxOABiGEyNTM3vlTscaNAITlndKFUcm7Wx6PQN5A3bqCh9v1+2kbNtYEQ==
X-Google-Smtp-Source: AGHT+IEgZ3ppKmJTj+7IhWLVSLIEgyntVMnFpl89FPTjXzeZyz7i1kxt3pPMjg2SksBsWq2SNexHhQ==
X-Received: by 2002:a05:690c:610e:b0:6e3:3275:8e5e with SMTP id 00721157ae682-6ea64bb2408mr170044727b3.33.1730817417133;
        Tue, 05 Nov 2024 06:36:57 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shinji Matsunaga <shin.matsunaga@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 39/90] audit: Fix CVE_PRODUCT
Date: Tue,  5 Nov 2024 09:35:04 -0500
Message-ID: <20241105143638.2301245-40-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113457

From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>

Fix "audit" set in CVE_PRODUCT to "linux:audit" to detect only vulnerabilities where the vendor is "linux".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "visionsoft",
which are unrelated to the "audit" in this recipe.
https://www.opencve.io/cve?vendor=visionsoft&product=audit

In addition, all the vulnerabilities currently detected in "audit" have the vendor of "visionsoft" or "linux".
Therefore, fix "audit" set in CVE_PRODUCT to "linux:audit".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index d6742c9eb0..6bb8a2c703 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -99,3 +99,5 @@ do_install:append() {
     # Create /var/spool/audit directory for audisp-remote
     install -d -m 0700 ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"
-- 
2.43.0


