Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01E3D4920F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:04 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11037.1765540684556868213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DkAGmLgd;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so1416945b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540684; x=1766145484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U80qVxHhT2MXMwTnRPgI1Eqb4r9hIHQAX7+md0de3o=;
        b=DkAGmLgdBmYpsJBfE9uftSdcyNjTFIQMvCINcJr2tpsRC6Pw8W69XLMNG4b8rY5EPK
         BIxnkiLdr5VzWcbD5jes+HWI46bXWrBXQ5kXCSJMqFqj+DiWEhbTjF3XkW/H+LQKowvE
         eBv6kYy6tDHzqyREOv9KziW73c8eJbqS5ujxUPNEuST8oJNlb1Z/PSRiCfpTnnwGq+dJ
         9X/D1mzxs9Tl0Zw9dPN/exCsDnufKFrpO0iRQGIFeu6i+yInm7eZ33EgOZTRv0O2Xv8D
         pgxERu5JYWypEpP+lvYlUmKhYUKBuMjxhiEin718njSZHOBuz/wkVTM+cMPV4ycQ0BOb
         IuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540684; x=1766145484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5U80qVxHhT2MXMwTnRPgI1Eqb4r9hIHQAX7+md0de3o=;
        b=IrsJ+/1cIdZW52q+4PPVRA37O9eMM5QYOWHOQxUgGh4SQpKMymm2GLUSHn+Xc0bJ3S
         fgmGdpKp9kgBLGSR25YPFjqGAcWkp0MKM3UXzuafM37muFqzzaLTy5TzIgnX4wrwZ2w3
         /EZmETUeVqu8J7zll+OBDKUmNQ4YQqcsJaLmZZaLQgmBRahfq+/dwo9bTRquVz+JhVf5
         m/ZmPdBv1gXIa0OvmYfgaLUL3rBer6x05UyCucKLUyeEs4O1JJ/LYzZVatsLg6lrFncd
         cRxAnCk7ssNM0oGdDsfAJYOvQ7kFQki86e0wgq5vORhYC+E2uii/va4ncr460OFfQqpI
         O1Nw==
X-Gm-Message-State: AOJu0Yy0Ql7q6swbDGT4sSpI1eUHKhVDsza53lSMIVU6iHao2Y8ZPCk1
	g1YGW1gJxjbrBvP4tVM1y/0UaIV/sYQHwdE5JcEyHQACRVGQutDymQj2oEhqEg==
X-Gm-Gg: AY/fxX46DOUxesDd6VUNpwrNrnPJEyk1DN2IKNUJI7iJCXeu6sj4UC+26yvJWS+7jH2
	oxJMSk5dkHpT4VwKvvy9tvvBu0CflfbWk0PK/i+GOOL9b1DkSFeYquIi7UxY92F9hQxJGsfu4sp
	GH3dPjEOXqLscDptbAfLOA7i1rEZU2garnpL1aRBeZEOwCUzOfmgnaoHPHGhD8ZSGWwiiFa0VEX
	qbEfq6YzsZ+txAwdFXOMm/SSbrmekpkeeB/Abw/rgSVOwvJJTjXg2q6dMSfxnYB5J0uBvVtOpZZ
	NE9Ra7UgHeI6Ug6gT+3DMatE6WXaIJBy64URYxLE9CdhjU56C4GtiLBT64eX/6VHPJoHUEdRmJj
	0HabqPLSnr/ehmuhcmdzhA0fkUYNrVcx5jEbUgXLKr2ezf3ONGA8dbdMEd7vnYSMr8aqUT+0FRE
	/aXUD8ZcNWMrGRohtcgNBZ6u0=
X-Google-Smtp-Source: AGHT+IFaTZVX9QmzrFBQTZMx2Oww38RPiXOvtZlV9dq0fJ3fPDpjt0vNP+0Pnr47p8aN0nStY2TsZw==
X-Received: by 2002:a05:6a00:414b:b0:7a9:b9e0:551c with SMTP id d2e1a72fcca58-7f667936469mr1875276b3a.21.1765540683794;
        Fri, 12 Dec 2025 03:58:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 07/15] python3-eventlet: upgrade 0.40.3 -> 0.40.4
Date: Fri, 12 Dec 2025 17:27:36 +0530
Message-ID: <20251212115744.569676-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122607

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Remove legacy setuptools configuration files
* add 3.14 to supported versions
* Emit warning on startup that eventlet is deprecated
* Fix Python 3.14 on macOS
* Workaround for #1068

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 768580103b8df1bf41ffb3f2f81c141057c2d0d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-eventlet_0.40.3.bb => python3-eventlet_0.40.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.3.bb => python3-eventlet_0.40.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
index 057b73013a..21b1e095eb 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "290852db0065d78cec17a821b78c8a51cafb820a792796a354592ae4d5fceeb0"
+SRC_URI[sha256sum] = "69bef712b1be18b4930df6f0c495d2a882bf7b63aa111e7b6eeff461cfcaf26f"
 
 inherit pypi python_hatchling
 

