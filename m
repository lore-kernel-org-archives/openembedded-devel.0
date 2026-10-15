Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1810CCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32829.1792043061164867530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I95wwa+K;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e608cd460eso26541815ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043060; x=1792647860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5nMTyb0vKOi3P//qeXlTLkqofKMU3vrnbV4IpQhFZxM=;
        b=I95wwa+KY50yL7B5B0Rny4v7TkXO5ppOFNwn/ldP/ggGPfYpYmG+cgP+kBp/b+9SG2
         7/E7AighPVImP1U4VgHLzf+97NTMcTgnNBg3rPGe9RYauOxMTgoWnBH3iL/KMBSiSDEL
         4blkucfM+QFpupgkUS2IFgjlLUVnSXRmBN3lKUCswxR+BuhLCRhhEHK7fH4qsP2iDda0
         gzCal6J6DL9Z3FiFaruo7vP6qGlncrbhjZtGczzFq5+stJzSKi7Rxc+2AKUqHseXdXw2
         bWXZudr7+YpcjKXA0GTuvDTGBUmBV0p7BLaLnpumC7XaAHIrr07EkT55/MCyXBpE23nI
         iJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043060; x=1792647860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5nMTyb0vKOi3P//qeXlTLkqofKMU3vrnbV4IpQhFZxM=;
        b=ZLmZEWI19ItZUNk1LDAzvfDzrzpd7Mbu79JK+23wUDZb1RTVS8YaK+pCWhecnoWw6y
         hFAOxSCUwjF8YoJts6MZKAkSKXs3ejqkpABFCC8TrON3RTxa4ORjWfywMpRR5EO2Kbdy
         4XuoQhtC7NER4rXQ7SyaGqxzRIwmKlTHA0mUIgmvIQfChSU1wkmgFyI+JIGuhTNsgkla
         SyRSHIx5B3mxc66LrjfQ/nbVaKi4pqYBBlxAdH2pn0rsfAu3QZCYws6wymYkBGmfMKw8
         0QESZXZ3lUKblraycmn3ugqW+6EbGZBclTRVicOBN0dZ/4xNDwYebT6DHUGUpRDcwhQY
         fNPQ==
X-Gm-Message-State: AFq9FYKVpPY1fLE7lnNjg8Q8yScKdMrHBCRhUrl8K3OE/m722OsDlkGF
	EtbNyfBxLZiIUYZR7mT1bJxQXMe1g7gsnHIQuzmnmTnoTIXzXDakjdLdffyvdg==
X-Gm-Gg: AYBFou2q5ls2qfrA3BOw7ZIOj8xDRIwYpVU4mEVHFNgja1WRp5Cm21mXbxKy4smLu+x
	U5nJQEPA4kVRtH/PCBTer5u7lExRdU3MTYrKDxTMq20L8qKdAma8T06aOZ9lF2xJfmDFWs6V69T
	izyizPeCc2NB6N1AW7l8JbVjHYDqHGDFPF7uJO4yCzehqRFcMacgVXD1Q68pi9GAq2M9HAlJgrv
	TLcb3db0gb+/6RnGlUhIJJco0ICAf6pQ7QZebCpehbf0ba+2++OS67oRsY2pDE1TxOf/HET5kRP
	5KxkYouk/AhRgm/GosiSupVD9KICxPjg4h5skqVV+HTJi2ThL00MQ+JseX6AH68e4/vpo15riAa
	LzeawrSyt9HWcQmQcsPP1UjWjgAfy6sz1DcYdcL0UFTnkrDu7VCrn9Rt7pEEVDjjTIm39E2NYGH
	48RUKyYtA3/0dTDCR+6dB65hUJfoIBZtxsqMCgIqetHJdxJAbBmUKPwPHtBwzIKLjQYFxWuyx3t
	YpOQrSiRLe0xvslMc5nte8=
X-Received: by 2002:a17:903:38cc:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2e8773aeaafmr128851695ad.58.1792043060386;
        Wed, 14 Oct 2026 22:44:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 42/82] wolfssl: mark CVEs patched
Date: Thu, 15 Oct 2026 18:41:30 +1300
Message-ID: <d7ca8eef26b2fa8edba0e395c79a35dc1456f55e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130962

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2023-6937[1] and CVE-2024-5814[2] are patched in current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-6937
https://nvd.nist.gov/vuln/detail/cve-2024-5814

[1]https://github.com/wolfSSL/wolfssl/blob/v5.6.6-stable/ChangeLog.md#vulnerabilities
[2]https://github.com/wolfSSL/wolfssl/blob/v5.7.2-stable/ChangeLog.md#vulnerabilities

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c12fcc9b481d5fcd94db96cd062042301a4f24b1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
index 8fc6068560..a2b41b2d3c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
@@ -72,3 +72,5 @@ CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2023-6937] = "fixed-version: fixed since v5.6.6"
+CVE_STATUS[CVE-2024-5814] = "fixed-version: fixed since v5.7.2"

