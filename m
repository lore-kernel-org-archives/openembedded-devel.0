Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EECCF9F0
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 01:04:33 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4847.1761872664194438777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 18:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWKnO5W3;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340564186e0so1365137a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 18:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761872663; x=1762477463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EHvxo3BWA6eeaMnkwKqIQMcpuLKhYKPmvsA48kq0So=;
        b=gWKnO5W3zb4zQ646VAL2PxK5mAgDn5vEAIevK9QNMMVEVwQVgx17bD9tAwTJPfyCBm
         ixdkZO03iwVaMmcuadKB4deRRS7kAtQ7FxdXssbgoVZZVZkyg8LlHoCJowPRDU/qPavb
         EFWBrZo4bXf39qOrP6D1K8J12HQ78z/j1Z5jm4sXgpeggjQ72/J/vimhghR3xmV7RiOY
         5lQx9sOIw2/i5eY0wVo9DsGCueZr/kbJH946j6mu9Ufn+oLxAWIigS0JUAa3WJpOlv7z
         kNq1GOTy9VgKp/fbg8EOv8eqakHHnuR9AFFCKSgGc/P1Fx1gxJI3tudZ4hml37SgEIgJ
         k+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761872663; x=1762477463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EHvxo3BWA6eeaMnkwKqIQMcpuLKhYKPmvsA48kq0So=;
        b=VYleyAHSUGncbMupE7bI5RkofRvbpj4/O8CsgAQIG5VzY4yrZqIPYgaEBw4p0RwQja
         rbABN9mG1a6t0qyNMYp7/gGcA8bBw52XzZsoufGuTAE+bhQm07Dgy1g76tRAX9Qf+NJn
         VfXmYRoRszAGDUoMFb86HFCkDlNeNgNw4AOoAYQ6U8TFYIOu5NhQzcq3bbPjv9tPte8C
         N6+KVqCvbpehgT0CgfB/8i5LOrrFR8pWMLbIY2tF8pnMn4Cec/hKDEHNWuujqCcEWq1n
         Sw4yp/tC0m7aLaJW0Q/C4NNiw7cB146Zikkzqp2OjMo3QWPQI2xdqwIeINwaaQVY3VZD
         Tvjg==
X-Gm-Message-State: AOJu0YxZlAp61ZSVk93Df4OHqTs/CfEYxbYcT9byvF7LdY3GiERppd31
	Xyi2wCF58v1pV6FtY+3CD1ZdwilCG3KAXuzDe5DgDkgkWGSCb3Z+bMCuVJlJU3p38B4=
X-Gm-Gg: ASbGncvNr5U/rl+2N/g6X7eyINkJ//ODyyM9g9eeHLAwydqDh0y/9oRwzR0p2/I9iUL
	0bGZKbSXiXrtu026nFPQqEFxlr1xQhlNY/5N0Pj3pl7U4OFgQ8H3t9Lmcv8CVg5gk4AIJeyvGks
	pn5tP3bTk2b1gL/kGg5Jz5KiBC4LyIweSVJ9wHlJwGtVRLkOX1OUzPdTKCwBU6PQWRuy7IKd7oq
	/qpwBh7tamp4/CUxW0Jcm8HfvSBlgoz5vPsAS7i+LHjG4fN3BmSZPqoj5SjuZZ60qLb3ZF0oTwl
	oj3Lhf/+H1CFiU8JLFV+MRnx2t+GWucumWH6LBzCo5hUyQuUnf08f5MCV9CqobvQdEfztYy7b5G
	s85qsPtKL3fj8UIyofXxFHn0MYKsjaGOVeT3Zk0a1hyAbMWEBTDcmYQF9wxeeanqG9zrZXsh+vf
	U3RR6jJ/O+tUIeDbTgTX1QkEuZPHCpmZYe93c=
X-Google-Smtp-Source: AGHT+IHHC3/8d5fj9A0GcaWMB/tK6lASqz57zyFjdwVChMYhmDRMW0VMApG+xZAJn0JoGZ85gBDgdQ==
X-Received: by 2002:a17:90b:2b83:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-3408309e96bmr2030574a91.36.1761872663319;
        Thu, 30 Oct 2025 18:04:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34092d56a6esm246581a91.17.2025.10.30.18.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:04:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2] mercurial: set CVE_PRODUCT to "mercurial-scm:mercurial mercurial:mercurial"
Date: Fri, 31 Oct 2025 14:04:11 +1300
Message-ID: <20251031010411.2877600-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 01:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121215

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Other product "mercurial" introduce false CVE finding like:

https://nvd.nist.gov/vuln/detail/CVE-2022-43410

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
index 2451a36be2..3764832b9a 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
@@ -34,3 +34,4 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
+CVE_PRODUCT = "mercurial-scm:mercurial mercurial:mercurial"

