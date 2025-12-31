Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A7EEE57F0
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81804.1767167687626392572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KA1VHJmJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so60954365e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167686; x=1767772486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5auHq0rcVblAmFC84/8sogp3MyocC2WnmMe41gSsQY=;
        b=KA1VHJmJjXusHSortypAZ51BZz25pVGbsut36NG7FZ+6kCWSqgnoK5hTZnFBGR8ATI
         wfy3ynJ+jaV2zZzs4MM/e/1A6bcW4xxh2DrYebCJaj/PVrbcSzieV0XBDaxyDmFNJ9bm
         YRQeZbzdJSAn2V2sgVciIqm9fNku21hZBwqSYkO2sIjPb3RB00xNDNK9uB/tXrETAS1r
         gwHtY5J5SJ3GxhvAiD3SjYLVKe/yyK5Q7B++UpwSEWDd28sHItnBP+1aX//a0aG5KKx5
         tCp1PeDQNA4Mtd64x+jWZI4pnXChohDpGRBgCLXo4+Hzj+8/o4qDbZGmfiNzTJAg06Yb
         +BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167686; x=1767772486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5auHq0rcVblAmFC84/8sogp3MyocC2WnmMe41gSsQY=;
        b=blrQ/H9xDDOGMdUIk5sURgnwd0G/4frJj4M5xFo3SERHtCkDHZbXLEvy1kg7I2cF2W
         wUKRybb+/vAf6LkcAf/vl6C/tpC78KMs2ziVbsSuzs47YAfhzDGxBbhj3L+CZcIGjejN
         UmbKKqApTIkF4Ps3oAF9Pzi9RAvN+It1PBPnYZ0geBDO+QbJULt3Un9/ZTy43sjB69QB
         WEHG8xoaqtoyoxL2x+2ZroHUxU5gSuDB3EpWaKToZ3YYV+zd3rfAV5dCx0PUlEk8PAIX
         fyfzqRprjtABy45ivuTiTz0AfSrthABZSs2FXZDPGCYJ5PvNd816+ki9YAOqlpnDCKNL
         A7RQ==
X-Gm-Message-State: AOJu0YzUd+8TTOwjQnU4H53KD2nkoJAAdAjdWG66c7HGcx6tAfmHKesT
	ADlL3zXfgC6P8yANbb+xnQ9PdVhlYv6GHkU1Zl/VnGKpVhfyxHWNhgVCjByz0A==
X-Gm-Gg: AY/fxX5C9aUFRqSIinuw2QC/J00FZWqtyjgX/dOm9ArFcneu/9raTHFsY5Q0a6dhW/n
	+B6HzAc/T4VQUhW4ICsvrQMxiQGwhfcK4pNvhFdSX3hXWOGODtV6kv3+hM/DBqFoKl8xVRwXo9Q
	FY6Mxa36OrtSTpcI+mv/s0qxZHr0WsoAYWfXRay7gj13X4mQQc/ARJZ6HJprl9mogB+lgG7gGS+
	5Lb4CiMs5VBQYk96/hZSn4qOeGBhcfIZKIS96ixd/NPxa3LifzVqDL2kp805e9W5Bd8Zf4ocs4N
	Tv0HNoVQ9xyCEVfwRH8uOSc3PbZe4q2bUpPPHgrCO3f5NBoETHr5VLZSzukRF2b8F7c4yUpj1ce
	PGFd88WhhuGglP7v2Uxs2RyAJAr+i17WR1+9sQFmDQ97VsSCCmel6uuDPFGYz2tds8w8URK0pnv
	rIGfViGcvj0HcFYag/GHw=
X-Google-Smtp-Source: AGHT+IGNcoZRe7SpXekUu3qDMfTssdxpKSlwUQjtETrWbsS9soKwFJz4HGM+68i/c3h4nSuJfwpV+Q==
X-Received: by 2002:a05:600c:35c4:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47d195869e7mr484571185e9.28.1767167686003;
        Tue, 30 Dec 2025 23:54:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 13/34] python3-lief: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:15 +0100
Message-ID: <20251231075436.771395-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123053

The correct CVE_PRODUCT is "lief" for this recipe instead of the default
${PN}, that doesn't match relevant CVEs.

See CVE db query:
sqlite> select * from products where product like 'lief';
CVE-2021-32297|lief-project|lief|||0.11.4|<=
CVE-2022-38306|lief-project|lief|||0.12.1|<
CVE-2022-38307|lief-project|lief|||0.12.1|<
CVE-2022-38495|lief-project|lief|||0.12.1|<=
CVE-2022-38496|lief-project|lief|||0.12.1|<=
CVE-2022-38497|lief-project|lief|||0.12.1|<=
CVE-2022-40922|lief-project|lief|0.12.1|=||
CVE-2022-40923|lief-project|lief|0.12.1|=||
CVE-2022-43171|lief-project|lief|0.12.1|=||
CVE-2024-31636|lief-project|lief|0.14.1|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.17.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
index de54d45ef2..de6390d210 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
@@ -12,6 +12,8 @@ SRC_URI = " \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
 
+CVE_PRODUCT = "lief"
+
 PEP517_SOURCE_PATH = "${S}/api/python"
 
 export LIEF_BUILD_DIR = "${B}"

