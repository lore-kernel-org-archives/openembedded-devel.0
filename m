Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56543C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24512.1786747598887238613
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CkIWn/qW;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1321000a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747598; x=1787352398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEa92JpAO/O2BoacWbiCOZi2UvqwfX2ozbgo9FwT1lw=;
        b=CkIWn/qW6u49rnJvAIcouFZ+svuJar+qdKi4QCP6fZijUVThB7Vv5Uux43b5V6Okvm
         Dx5j1NelMDwlS5yLS8MpvJoEDkg/R4XgAGKEyKgIg16RneOmwHy75eM/nosZyHW1c0nW
         E8jTGo3en8Z2VGi01oTDkkU/wcZD0qyw/cYagx7zr9hhyoRdtTWyEAk5+jkrwbCJrPPl
         w9t0lafjP42/a2d8fhmdmd11zPmS3wwAri71nMaba0+HC5eG1PpPhhn22E8H03FR2ueL
         3vqxvSmhVbSu0NujI1camvkrOCfWC4DVZV7kRXJpZ0VL6JsrLvx0krVrDsmILf+gQtnN
         TmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747598; x=1787352398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEa92JpAO/O2BoacWbiCOZi2UvqwfX2ozbgo9FwT1lw=;
        b=Zx19gKC3KiEafjJlknfbVVllbr8ZF3MRXnrywCr8iHzbyXBoOtDAt9xGt920Tk8GpP
         fTzVCfz1Ay7fWIBH3CNrgM/otHy4OuZ0AsfCn6B2IOQosUg9L2kFwfKTQnER6c5THE9o
         3XdXkA0qBET4pXpszQIU9vK7ifGq0FH88RmkvcGHFYpOeZFF+FbTqbXeQjHP67nOgAiR
         E9wW8VBw+Di0TpL5Yi4xIYYe1d0RhEAgG9dZvfRKeP3KjKDxQKy3geH6bDR9sJjEHgjg
         /H8n7ohLYwYiw5GrX3AzD5h/XJ6OZotNt9mvUOYsJpG4nmizTwQYeINrfUvfy5W3hRF5
         B/Yw==
X-Gm-Message-State: AOJu0YxIZoVTqJD6yuKdfgNZ3cHLSrFM7R7LiADJ3jfCFOcLscss5DvG
	QKLrKG0pjdUVrUOr5hPXks+OFPqwLerooElrL/TF0DFcjtu5ckTW/g/3dklbRAGL
X-Gm-Gg: AR+sD10XxbFtowR2kArErRzy8mBAf+nifcexJkYrS3jNz4mcpUt6lcc/Yv6vAUsszaj
	zTqXvDPOKIuvQ6BpV1CiA/rBc5XE3hcVqNPHNPD0+Kscf2RVingPB73MtqV0kUF9ySTnSl2D3Sn
	BQJTqU/GcGNeKjSPeebEc7+amQ4RLLMpTOVMV7JquICLpwonTeKDJ2WQ+03bInjsBMUuZB/rRye
	/XpA4S688MoyHCmedPBPl9Iu0our6ZFzPoTNTDhQMtDC2olNLZCsITQe5zJubzwtDEC86ecs+Aq
	gEG1+4458+RKUjB8xcbH/8Y/+ppiGyTWCohYddTpqfzSlC4S/PrLA5Tbr+VOx5vLMtjZaV6OWV5
	nHHyeAoM4Rh0Uu62tKqlXlf8jo9C9yFFjfox0TvM+sWwEGPSnh53C9zr8C88uW49hd/n/6VC7SF
	R1V8I75yUpE3+05T9cZxFnAueBHUSXxPurEb9u6a/H+vhoc9kDJejByvFbw3zUwsBEAglMS11G2
	OmM2KB5Tcd3xhmbIYBppgrffcm5U8BSOLZtb6fvsW/8SeMF/3UwGgQ9H7aYXm6y6zJuBdmyLz1f
	muo6U8v0SWj8BEnrk9BOzDCkrSkny489oF/30XuwsHy+NGXDAiHyKe0zvPGU+W+trx7b/zP5htP
	ZFGNEWsO9THNEHRn1ezY2HIz6eSRyLdA79a5TOGUWqJkCYA==
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr10542407a91.12.1786747598045;
        Fri, 14 Aug 2026 15:46:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 049/109] opentelemetry-cpp: upgrade 1.20.0 -> 1.28.0
Date: Fri, 14 Aug 2026 15:44:35 -0700
Message-ID: <20260814224539.1523174-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129113

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{opentelemetry-cpp_1.20.0.bb => opentelemetry-cpp_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.20.0.bb => opentelemetry-cpp_1.28.0.bb} (96%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb
similarity index 96%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb
index eb108c177c..a07da1c2e5 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
 SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "6175aa0b213eea053247e43b4f35b8d201fa356e"
+SRCREV = "6f65c3eded2bb4656c8d675cad43bbe694c531c7"
 
 inherit cmake pkgconfig lib_package
 

