Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2D4C5ACB3
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:47:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4960.1700135228215769577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdVpAu8q;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso105741666b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 03:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700135226; x=1700740026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAfwUP0FEw8enASkg19NmxraKKgvmnHGinmlUrqb+Is=;
        b=jdVpAu8q/f30gjMhBFVq5vBxMGPdVuS/8vsUJWNvnqk8fWnoJIA+jYyd99jpjrb+v+
         wqrg84P/XcGh0YN0uoZx9yYMGmEJoG7I9qRqkAqdX4fzRYdnzhiqqxSiAhcEI2+Nnk74
         6k6xJOG8K7knYch4dCSB4lZMXm96kOfm804KOsxleYhm2d261AK/xAvWa2HWoahK6USn
         fNZxnzzz+3LEfvEgpP84BfXMK5Bs7dnsLuEr5+jqgJ3Qqg4pbewoE55wV5XT7oDan+iT
         QVooh3XOYdBEqSiwA0xual9NDhCuh1W4MPlKuJBGdLozgaPtVe5AwKKDqLowrJPgSIbT
         oWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135226; x=1700740026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAfwUP0FEw8enASkg19NmxraKKgvmnHGinmlUrqb+Is=;
        b=o8Nar6UNRBkMqHW/1ltqsfYPAXBbmN4n+hPvv/FEZy+W2xVI5zTHMXYCJle2P+oC1B
         J3zTwW3AI4qWGJbtVrdHL+Km0YkrVsnN5GQF3clYBey5gixewLZB+U05aFFS4RgTuLIu
         HMUE5xarYKOKWeZfQEnwLLifDfUoQ9Or0vR8vnfSnLrg5BHQfi+2JupypXWRolt6Hnnn
         8uyjMlTcYTuKAx7FTS6OLFj93VxN96bb/2TuX7LNbZ60S+VBa4kKyO17ZfGnYvu+fMiN
         IgyhIt7Dqk2gffvNxKUlkb6BRtWbwp+LX+2RqQto7Q7Fg7FR/EdrxScUsCb7/HywbBBW
         8V1g==
X-Gm-Message-State: AOJu0YwwdIzs6jBWbQ+/HKghHVv0ReC1TF1aoHAifs25pMLRlMI92tYT
	vE7WO2V9FAPRCw5PhSjPaNVvvQFRP4kuTQ==
X-Google-Smtp-Source: AGHT+IGmYNIYL1eUUBKHrSDppNaEKu5x7orOdxUNvfs4536mNLqaopjvJ9DHCr2hJ84F2q/elanfFQ==
X-Received: by 2002:a17:907:c02:b0:9e8:698f:a43a with SMTP id ga2-20020a1709070c0200b009e8698fa43amr10396541ejc.69.1700135225784;
        Thu, 16 Nov 2023 03:47:05 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b009e603786444sm8360099ejb.90.2023.11.16.03.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 03:47:05 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] ocl-icd: upgrade 2.3.1 -> 2.3.2
Date: Thu, 16 Nov 2023 14:46:43 +0300
Message-Id: <20231116114643.959704-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 11:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106813

Changelog:

- Add support for system layers
- Implement published clGetICDLoaderInfoOCLICD extension
- Define CL_NO_NON_DISPATCH_EXTENSION_PROTOTYPES for compatibility with recent headers
- Updated OpenCL Headers ot 2023.04.17
- Remove use of __builtin_expect in layer dispatch
- Updated pkg-config to depend on OpenCL-Headers.pc
- Add cllayerinfo tool

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-core/opencl/{ocl-icd_2.3.1.bb => ocl-icd_2.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{ocl-icd_2.3.1.bb => ocl-icd_2.3.2.bb} (90%)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
similarity index 90%
rename from meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
rename to meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index b1980e368..93fac969c 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https;branch=master"
 
-SRCREV = "1165deedb2ae741cd76e60986f7c2cb5023059d9"
+SRCREV = "fdde6677b21329432db8b481e2637cd10f7d3cb2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


