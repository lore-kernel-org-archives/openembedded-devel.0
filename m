Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D77AC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9362.1788343571415225159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K6Bb+ln3;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6f9e2f681so8829075ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343571; x=1788948371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+8E5jO2+J4F03fqoDzGPqMiN7o7fOgYBv7lxsMcpSw=;
        b=K6Bb+ln3tBbqGymq3fXLrZFyeZrOU1OolyvhpnkFPdOppfhdh+yttBSIxVX8H2SxiX
         Dg3bzM4Xt5twaygvfyxpCK+u4BmjvUTflMqF73LRSiFmxCHeVj927CYXWH3YmjCBqrmn
         diSZqhDPrdXC34KQYx7+EqT24ppgrnOHGaZxYxOnYBEm2aOjI+QbamzJF3Kd5wV0Pq9y
         Y5W7xlPrJTObIQeTKrHYzAyo9xY9VX3YA+B5wAUotkTjGLmCdgky4xyYlbjF8ERMiUQG
         yv0IWHMmd8rqa/L/Q+UUvKjFHGGcsv9Cw2T4jFhgnUeukn0DoJRZ7gl6XdO1ZZsvsISM
         FRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343571; x=1788948371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+8E5jO2+J4F03fqoDzGPqMiN7o7fOgYBv7lxsMcpSw=;
        b=WQyQeMP0f4dtFdOICsJgDUrFQFcPaHFl/NY6xXD7JHHvSFBP4xYuS2wDCIPqOAMSZ6
         HCiD9bQuxJt9/BzxZnNssHz2W0XMTOdwJOaOfUl2JXirJ+1Snf69Jcw2OxUbiLDcc7kJ
         pIMOzV36al/o0LYjfmdtY23/1+NxtBqymqHQTqcg7TDf34hNWgeITgVmKmJytJmi/gLs
         BmOT5sBoSXU2Dn4f1SXL56K9eJnRHccITP9vWcuHC7XJHUNJLqdlcl78GMblp14IJIEN
         hjABjiRMC1hABVpIjFwq7RAMzUn1V5dp2QJawTXEiUC7+KXMoL1iRE4Cnp13n1V3sfHf
         uR6g==
X-Gm-Message-State: AFuF++k56X0GiDWHghOreQROzUV9fb5pokQT5N9MMd4Nb5YH8M23lYAq
	Wk2ja7hEi0/Cn43Tkz0nJ8bvKiT79VpWUA2CGd5Qj6YCQ+oDf2E+ji60oVGOSw==
X-Gm-Gg: AYBFou174bm6XJvBo7APCfopEfvw5G13j6PRJYNHHolA8lohjENBaZ0HrrSkYSE/CSN
	0FEqP7EZHpYSfYjbFgux6Yo595jzU2u70gbXbuz9154SI3doGNcgfR1NlMONgQ+0+SmXw0h0ImY
	upVkNKV0tXBEVURzJQRRg7rNokSOFB+rhDs3OMwIMvJLB+KCE85y1pbtrwJoPLUZM55MR2xOc2q
	xF9T30jX9y/8PSHyMO5Jfqkd7HoHrWCZTjJPV7D34biB7VNRMzibQ4A4lj92irTjStfVXX/nPAF
	wgW6VVRqGnST0APNvGGgLfsrvjtffF5sZy3XnkT+3wKc6bFXPEpbkSTWFqYQ4wwGqxPhHnIyI4w
	h4JbHIyqXKZz8RlRCnNi8HIOWBrudaiFP9bywc/Whw+IwlwFTwy4rA/n92kSGSdBjoH5cS/1czn
	lk7H7r7LQflKKETezdylYu+QUTTTm+79ByTo8lQM87GakG9h0SryYn/dHbnBwgWbIScSlbsJAj
X-Received: by 2002:a17:90b:2649:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39aee249be6mr5294559a91.25.1788343570726;
        Wed, 02 Sep 2026 03:06:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 21/28] gerbera: ignore CVE-2025-23386
Date: Wed,  2 Sep 2026 22:05:03 +1200
Message-ID: <20260902100511.2105916-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129652

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-23386

This vulnerability is due to openSUSE specific packaging issue.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
index fdbd91f9b0..403565b7fb 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
@@ -27,3 +27,5 @@ PACKAGECONFIG[magic] = "-DWITH_MAGIC=TRUE,-DWITH_MAGIC=FALSE,file"
 PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+
+CVE_STATUS[CVE-2025-23386] = "not-applicable-platform: The vulnerability is openSUSE specific"

