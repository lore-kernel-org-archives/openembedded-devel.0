Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32038E9DE43
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:32 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127032.1775718570296722172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sNUCm3Oa;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c742b9b7727so187270a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718569; x=1776323369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yavdsP0WlJ8O7eGBp5yOFe7k4T9Xi1LDmp7BTWtm9vQ=;
        b=sNUCm3Oa8ZdcLXDNSS2FB+X4pzIjdi082IBO+8DSaa1MhKS0UiEvpLifqNj2NBirBI
         lMfe+fc1uKPjLYuJK3vOi5FX40/Qy8gD6+PxEcvoSIlt6EnnoYIZ5bJYNOUK6QWAk4e6
         SXjke7ZC4iDv1QMVmE7KEPo8CKrbhZIYd9rjwHwoqQJsiSc1OW46lXVtG5XteotqB8tj
         Go4ztvX47Mmh2V8UqHLZKJK+yAA3MVbLDHnKocobYyPwOtONgwFNgrlaUuHTEPI4dz9L
         SydHh+NoS4/HRIjbEe3cg+XyBaIR9okdeEDTKr1CPjMo9pusg01+su5sxNYEaG5Fqlo6
         Z6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718569; x=1776323369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yavdsP0WlJ8O7eGBp5yOFe7k4T9Xi1LDmp7BTWtm9vQ=;
        b=VdhbzQjE4C7UYFu3/+rd13uSdxKdrVnVy3KlOChlxbyfinn/Tu/rS0Y1v20KGXS9pH
         hJykTBoZ+xDqumyx8x8P7Dl/GH3jYCSesL5D/Lk8WHu5YF4SdjSO2CjXdrSOtzFc7wp8
         495J0iOplENu7z/2C0pUnzDsaAK6vber0hdW4D/JguZLi0cq0xXRVEJfw7KW1rhgsd2F
         VwUFVreh8QLqxpwS28HKQ0UPqMRXvkuqEt397o4g1+t7LxBtnMfyQTve+z5yJ1/5dNSf
         B/3g08f7OnlieixI8Sr6V6ni+3nTmpKeL9opigDJ5rs7CnX+oC41r7waTrksOUjA2b9z
         BBLA==
X-Gm-Message-State: AOJu0YyFmmndrkWUoLbd+EEClATXdPfPIrULF/38bBF0rRwbxnf/4Yr4
	t4xiFChAQa9A8AF038dd6PuEM0ZGkLMGr0M/7tNSFIa1J5GCdaLjMeKGHQHiNQ==
X-Gm-Gg: AeBDietZ3oFHHinPuipSUW1wiN8zpWSwQEtdmGTSR5HSwsUz91LX2YsV9RNVJV8Qx2z
	fTPTTd55Yu2X085MkDW7OaZAH3T8QQGV8LzrWBCVS4D4qzcr+VJ8vLIgVy3SwL5QoXHDg0Qv4y7
	wT3MGdelhz2SAu4se6Kv+oNl0hvEOa2unA5joe+KUQQ7QSjBMS1Vnl9auRo0NLJkSZUZnQFO9A6
	6/UmFf/grtNCAs+Ri0NikahX4RtpcOO7MCTGpHZOcnbhVMPP7AhhPArAJuZ09NkbfxSxF78F8N2
	LamSsXeAWFHkTfEbrN33u2iR8MOhCvwhzOCA+dM7nVx3tPdN469IDf0NdBYI6rzHuP1BetcV3xK
	AgHcdGIPBU7e0i5B8nW88j8MjB5RRcWCzFBtoAXhdin9iMZGnEucOU3fYkUlNLpq44MbbULq5oD
	8oO9gomsWiPooofjPcrlJFPgHpaUiV33lX64o=
X-Received: by 2002:a05:6a20:1611:b0:39c:4a6a:fa8e with SMTP id adf61e73a8af0-39fc9461124mr2580084637.21.1775718569270;
        Thu, 09 Apr 2026 00:09:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/22] abseil-cpp: ignore CVE-2025-0838
Date: Thu,  9 Apr 2026 19:08:58 +1200
Message-ID: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126123

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The commit[1] mentioned in the NVD[2] is part of the current version[3].

[1] https://github.com/abseil/abseil-cpp/commit/5a0e2cb5e3958dd90bb8569a2766622cb74d90c1
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-0838
[3] https://github.com/abseil/abseil-cpp/commit/54fac219c4ef0bc379dfffb0b8098725d77ac81b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index a11b5cbb53..ff5aedb9c3 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -53,3 +53,5 @@ python split_dynamic_packages() {
 ALLOW_EMPTY:${PN} = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-0838] = "cpe-incorrect: The current version (20240116.3) is not affected."

