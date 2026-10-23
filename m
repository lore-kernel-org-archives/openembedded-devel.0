Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1653.1792738463791895083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H9Crtz/q;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06210b29fso220481b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738463; x=1793343263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9p0nx1cGMRTOal3FY2YersRMac/rjlumKX2McWSbEGk=;
        b=H9Crtz/qJt5zYR3ctb6TH79CjQSKxjUBIV04SPXU9pYR3YHana5DDTXON/LvhSJlIA
         mFGLRietTTZROBhlmwYZCEq1yV385ZsLT76T7PGB4q+/ICY0svWUlsW39k8eQEbprM3n
         arXtwsJmdLrhtIFvePllcSKriKqXnCOlPmcxD9SMQA0dBS83RwwLEWYYCKtq4WSrHorU
         dXJxrvlGtBUG+07nGS6R/cFClcwNjlRlHz6xgmzJwHuRBW0qLWWSfSrr2d+Fj9nzCkYI
         5p0rcFvRicpPRON7BwwmTK0B5X2qjooWW+kl0Gm0w+P3MndpnvsvqAxsfkSBduQlZL1r
         +ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738463; x=1793343263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9p0nx1cGMRTOal3FY2YersRMac/rjlumKX2McWSbEGk=;
        b=snhjOZD25rneRQb8BwEqtvdZ75K49qWXPMWRSbfEm8zBbBReWaJ5pD+j5aoieyqHZ8
         q5oy/bw4rWDFsNjn6Kbaq3ayMGsYZkKubXabaan7P7BIdWRYuxHIaQmttHM/7o+X0ren
         eCMfaB/pMwkHa51ymVebs/kPhE5LpstHAg3oPXwAqsvhXLnBt4fUyuoAlWB3i9pf0dqR
         qDSin7EXs2tOPycixHF8dFzWQhhjNpLGnOzwq6ns6CvEGxWwcQEcp3IvCyR/SJU4fj1z
         humk1X9fEnW/x3HZmJnHcD0XmIfNtQZScZW1BiyMhA6OAcEw+B5/0zFV/5ipwrqmxnVw
         OQLg==
X-Gm-Message-State: AFq9FYItLXRMMnPTY4W1LqxWQOCjGbPUTLv7410aZavHWia+UYCZXR1a
	fck6LWGy9zg9urWcmb/b5nHjWATWS9f+27Uv1ExsGYUde4qij3NWINkh+SJ0u1YoGLU=
X-Gm-Gg: AYBFou0FO5YYjXI7xO+pw5W2JO9YvryIYCgSrTvRzsaZBv1bqmt+X1AippqHljl2e3N
	Q2DEY+ZC3HuplMBdzbxyp3G5zPcexsHwM892yZ8DoXF4wtSl7bJVvMdMwW7j3zM6u8MGvTrMMob
	7dVmnH66TTmNEAjnth52kMvWAgKYG2iPPcGw2RZIp+w55tIBq7tflB2NSatnW6Xgieb3xKbcQWA
	UaG+sx/wcEMMwOutkU/mQMGL6dn3Ovd+gDgQPKGPB8jR9ihWXkNFhNtvS53RheVC1q6sLWDLJF3
	ar5Tn+Thd3ohZZpTBNFxFbbX8rcn7/moVSX5SJ4Oyqu1PTd1YtQE9kkFtjzC4uhUN1ld3USXihh
	Dtmo7+K1JkR02oU5mLznMVAWNWm4MwOZB3x44iYWobWCTEnhnV6oHAN/TtpNVykENS2ZZD/nHNh
	aETcUP2+vuqs7YcZMZMLahCfTw7ZXG8Yyf6UAppv4aoDDaz9VEDmMSxPJ4KUqgVZS2V+EHyxBJl
	WNYw9F4htj/g/uKn8pv3CmbVgwHYhD/IDGgh2+/qlVqWmdc1pvv4st1SuJwDOC2Z64l0ujxQ5YB
	2IjwWB9uciXf0VUcXwquQHOAWVxcxbkoT4FY7H/mvTClSiel9cQngb4WpsGtd4ViXH/KAntIOEo
	Ti8ssqVTJrlykh97RAHNMcO0zmgUJwCLRQrsmtCiK8nn+xQjYjSJfoT7jqq8SgiVn3kwJ+h+Bvs
	kN2HzrrAIAVz3CkQB3z6jfahOCnfcEQQiVd2OUbg/qIJSM/X7LR4c+ybwhQCysCwr4GB8Dm+1j2
	FIQd5mmdqO/ldL1/dvHR51axS0tFTQ=
X-Received: by 2002:a05:6a20:914d:b0:3e2:a412:4f1b with SMTP id adf61e73a8af0-3e36934167amr992572637.27.1792738463170;
        Thu, 22 Oct 2026 23:54:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 25/29] gnome-shell: Mark incompatible with riscv32
Date: Thu, 22 Oct 2026 23:53:46 -0700
Message-ID: <20261023065350.3228996-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131349
Content-Type: text/plain; charset="utf-8"

It depends on glycin, which is not available on riscv32, as it
requires libseccomp, which is not ported to rv32.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
index e8873bb2cc..ae803b7da2 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_51.1.bb
@@ -102,3 +102,5 @@ FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"

 CVE_STATUS[CVE-2021-3982] = "not-applicable-config: OE doesn't set CAP_SYS_NICE capability"
+
+COMPATIBLE_HOST:riscv32 = "null"
