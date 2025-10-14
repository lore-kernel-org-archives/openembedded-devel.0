Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A651ECCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.348.1760475250637625464
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bcxrX/px;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27eceb38eb1so67356995ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475250; x=1761080050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfSba3QntZwva3rBV3aLv7uR32+1ejhntNnWxQzS4rk=;
        b=bcxrX/pxRdUmancg+MwQb3u3ql6bBaGmMgUYu/bZR0SrqndLmBAAkFPpSzfHji8svw
         UoHqWP96fm6kLkRAOV4klUEN1AdrMysTQKHF59rrq8+4bseH7Frpzl1kHI7bKXOev1zC
         qXPbV5HWUXTmmE5G+hFpFFoV3M7uAptp4A7hcozNzi07mso1bbJ/DuSX1RA/SCkGTlzh
         lZgokzZYyOfkgMTeTRIfYq91kFuMuENTM9o67E2cNVH/kDc5lujKJWQQFM9iTE/TnM6n
         vryqo1aEoFTDBgdOkWK1/V/7opIO1pnAvjsJfeQIcvLzz5d7aKH3W96NpGHJ72LPxZGG
         U7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475250; x=1761080050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfSba3QntZwva3rBV3aLv7uR32+1ejhntNnWxQzS4rk=;
        b=PTcGIqNwTQI9tt+ByByBFCOcvwf+dUrkyMjIABPKwmHCwMMsfoJq4J5prl1cAvZh3F
         HzVtshFHlDhnk9lkBNiDYCeYwxjYtsWCQasZDsQrobbu1zERbPh6MLLEh7VO5dOZlI2/
         BiFYHPecJNflb0pC1eqAKkCVp0pIPOW9cxu2OYwobWoo+D6NlBJalg4zsYFysG/kgNFh
         r3ZBF8Hw1cTytMpui1NfmiSsq1iLf6oI1RMGQeTvgt4mXwvmXcra5RZEiXZGHia3fVNa
         EkOAbn6nEcMT3Vmu8ztP2fPoPKaGc/b3I+otgUxF+ia1Xl2uxoX26WcnfaFdkiBzeRW1
         r3UA==
X-Gm-Message-State: AOJu0Yw20i4iCJvZpSsXSZGKyMSJYWPV1sSQQgHItBSSFYytWRDA5XCz
	azCSeBfOw8Jgj0GPj5oNbEqjsmlQYWFSE4GxTM5tGH+n3HxNw4D3lacGhLyjeA==
X-Gm-Gg: ASbGnctoKjDVrPr3ljc84BDE849A3ci5UczTODAxK1jjwDIsLh/i4VC3gI9lVaeHJXV
	Sg+PT1cYb4MV0t7/zRi1VSfwNLBVFZrHp5ZACxw8XmwNr/hrDno6OjCWB3WeyscyRPuqgNj9q5B
	u6WFKtXzvup9XMygCig7oi1XrQLh/PsYg+nWzJR6kSw9/PQpD6+ZZeLutey4HkuecHzazwHSuPd
	lOnw4uG/RKe8tKQZcVOELewasud4+CmKGrB/fph2IsaCC+zH2ahU3bm86+HRQl/BFG4LZR1mELM
	PrLOPqWzzU5g22eqc692iag0PLBcTkMk5xqhIlEPyV328eXw+nvyCelrfGmsy+aSQSZpLG2AU83
	El7xcG+VNJcKfjKPT9fhCtUTh9id+bCFcjI8YNwyj/nELGgX6AywQf7PR6Bm6btUl8Q==
X-Google-Smtp-Source: AGHT+IH3cog992Sjw/LhUFe1UYR82a062KVKIOfzNuLCCwZnWfxZp4pq/x4egXyB1+4Y+AeqJMpQVg==
X-Received: by 2002:a17:903:2f4c:b0:27d:339c:4b0 with SMTP id d9443c01a7336-290273edeb5mr331503585ad.35.1760475249861;
        Tue, 14 Oct 2025 13:54:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:09 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 01/18] dash: set CVE_PRODUCT
Date: Wed, 15 Oct 2025 09:53:44 +1300
Message-ID: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120634

From: Peter Marko <peter.marko@siemens.com>

This removes false positive CVE-2024-21485 from cve reports.

$ sqlite3 nvdcve_2-2.db
sqlite> select * from products where product = 'dash';
CVE-2009-0854|dash|dash|0.5.4|=||
CVE-2024-21485|plotly|dash|||2.13.0|<
CVE-2024-21485|plotly|dash|2.14.0|>=|2.15.0|<

Our dash:dash did not reach major version 1 yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1427013e01df44b9275908f7605e8e25fc3fd83)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 947ef702d7..1bf3625760 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
+CVE_PRODUCT = "dash:dash"
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"

