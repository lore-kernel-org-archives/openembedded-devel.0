Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBA5C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14735.1782634329326311774
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cSRQRnjD;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13810b63a1aso5454756c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634329; x=1783239129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADR2K42UqaR9+WSdpRMnzD5YSB/jan2C6ngudIRLC0U=;
        b=cSRQRnjDtCgYe5L0YU8/2gS1hOSuA0m4qEWtQ4BWWnNR2PE62TyTc9xd2s9C9Ch+lU
         pyawMhsgTmSqq5bh2cJTGjez7U+00wpU1z7W+WiCN8tcSHcsf4Pu2JVilLYVvteGlIQP
         7Ix6pBDrBXIkWSabLxRc0emLFprl8lmLPFVyodFw/n6CY/dRHPaE3xeuWp1Iplq5HVvX
         w/GYeN2ICGfH6/QHwQ1uk1ZrybWRSdZ8uhczypau/uHRxatm2jEzjz5ytLGHoK5i9Jfu
         IPHAxH8ipOB0xo38p5yX1C7am8ag3umRk5BOfklU2iVMfY3vKo6a5+OjDsRZ4zGxAhDE
         PmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634329; x=1783239129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADR2K42UqaR9+WSdpRMnzD5YSB/jan2C6ngudIRLC0U=;
        b=hAg8XflhbSezLvBTeua9A4b6ojdVIAktjLaS9yoOVzQXfht2m3logZf7uvGFMdueoj
         7NyQlayK4MqEjZlOQKOcPVmSnHEc6AbpvkdJHFwzg8+6zj4K1s8G3+wXXwr6Vk3Je7Df
         AIWBAR+RqyDt2K0RD9GHuDf+xtFvw0qUI7dxTujx1Vx0gNBzAd29DYOhZek1PlvtN1fl
         ccCBwiDfp1i1Ck8OPM/sodBgQM1X/zyUPtxnq+qVpPMrqojuTanaYdxeV9HVwi6MN/XH
         dIBDMFMecsE8UAec9lSfryd/vBjQxQlnrMLEI+uuQvSiCoNoqP+XAoBexLyZFszK5FJj
         rYgQ==
X-Gm-Message-State: AOJu0Yx0GdvkooynpU2J/2OnPU2/fDsySTpS7yltAqYhp5Gbee8C+GqB
	9WOTWrhfFk3gGU4tTdYaPs0wlAQQour+sj3VjMrh9H6s5s8pDsWKrftu/+DnST0nvBF2Jw==
X-Gm-Gg: AfdE7clfKLD+M7zHK7k4mbbWgPpNkdM2pRVi/gdh3ExI5j3WQrWhaehjI12sNG0duty
	AgHx9hF/geIElfOjpw/MCuLMbIvatlGUzzTcU7X/fxE/VyNeOWFTPS26UEQpMYbBjMiE48DTord
	jXlLPdefgiCYTv3DShuEv14wWb8QdhiCiKwBB6Uf2y99gbTNbObx9rc93+1gvEQHwXQvW/2OYMJ
	kOYndd3rGr+UYInCej0pVFwcNvhzt1L9nTWobjP2w9EtnobMpTfLsZpLeQ8XjyS/bdI33vxQLLm
	Vb5cfqnsjFUjPRt5kqu9qB5n9dZT7pbw/GssAeJLw8ZWUrEeoZqzN6jVVlu7dSMEkW3SyDvFtiP
	7kMMfrH6FqMJRzDvxvYnLLjQuuFiOkAIe/rc+2P5GyWfEQc3QsPBjDVDL0kxE4H5U+I9f15CxVl
	nfaRanRvR+A3SsYhZYS77jt2oJq6wp4L4xf7ph4tk/UjzBcygEHHN5NtIMe2InxUr02thh8n817
	xgiIR0uQ4K37ZhqveFm75V/3PYYtDZq8Iv/BGBet5mi0p8Rwj8r1hsD+JsZgJ4A5Eore07w/cV2
	n9rNWZDHJzLbFCG7Z17MvLoYk2O+IF4cNLgOyuBT
X-Received: by 2002:a05:7301:3d17:b0:30c:9f31:b614 with SMTP id 5a478bee46e88-30caaf550c0mr6164413eec.8.1782634328575;
        Sun, 28 Jun 2026 01:12:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 047/128] msgpack-cpp: upgrade 7.0.0 -> 8.0.0
Date: Sun, 28 Jun 2026 01:09:58 -0700
Message-ID: <20260628081122.178348-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127857

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../msgpack/{msgpack-cpp_7.0.0.bb => msgpack-cpp_8.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_7.0.0.bb => msgpack-cpp_8.0.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
index 5b296a20cd..87f11d279b 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_7.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7504b7af7e7b9002ce529d4f941e1b7fb1fb435768780ce7da4abaac79bb156f"
+SRC_URI[sha256sum] = "4a3c0c0ac55ef4456c2d0b93c21b5d105aa3a8f21ef8fa9758550feaf989b92f"
 
 UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

