Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03218CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.176.1781623210660281810
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iHBGpi9i;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so30683245e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781623209; x=1782228009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JscM8PCqD/beLFvhLCvZlhYkcJWgUc8/K9bGBFSyMC0=;
        b=iHBGpi9iklHGnsCtumSs6HzoOCVLorxsJDdDkGtrwZwID/jpY5ahTKj6Vv3edBwdF4
         RvrzuChHZpjopYYtQSo9S5lDo1Z/9ZGHlxIGT2ylVmv03EuSLjPOjwK1Lvp6Aj+K6kkU
         O4+fQxw89/HaYyy1zNW+ez4vP8z62r5QGSKj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623209; x=1782228009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JscM8PCqD/beLFvhLCvZlhYkcJWgUc8/K9bGBFSyMC0=;
        b=q9Z8/4a+hQ8N5u7l6N6EUv7BjJDG+8F5MOKE6ie7xgBo2z3YaXznlfTxc1rPoC66mb
         rwi3DsRWL80+MawDdhut+3n6LayE4WN+eUx2/tM1+X2h6PxTgnpMYo9u/yHnXPMv+8wE
         vAclMtOq5xLjjot8WbC66umYobJs/aFD12MR4GNysi05wGIQqDr2SDSB4ICQ56c2ssqj
         LqChKvcgPq4HR/TO/ctAlpdr/lNiL7gzUa6kTmfqMFhvDqgMbTWyiQ0njtLbWpdc2fJs
         AqZF7eUuyylLZ0Ou0nPZsp4anGx31ckYkl6nzGcsiwkSkJPtrmiE+O8sJ2FtdOvHoARV
         XFew==
X-Gm-Message-State: AOJu0YxI7GEMl6W1U0G+Wul728vWZCGzDMTCwIgXmfnbzKpTNo5TJRZF
	Kt+LNlIoHsGEtlI7lnq8Y5D7iqHYNF8mV2+auggdkEykKdmKsx1Ea9dMpickj9jmp4HDt6DdwPv
	viOjc
X-Gm-Gg: Acq92OFuszrL84oLO1RUtQXGjIiTKcTAwCsYlrDWe5tlDgEKFCbRn1Spp02lS29FzMT
	A2MUTkTYQLlWLgUokFbZt/47g6Kr1phnxM3YsxdoLbjbEB9qtYBSvrEvJcxOo09IjD0ttnQablx
	sxFrLbE6jRPiINw9SStHSLEOfMv1P/BtwriRHq230YE+TTR8rGoeNUjS8LmrfJZcAlM52MOFpM/
	dLxhJHRT76zoKkCJShFlm//d+rG1I+S4ZBVb4cmnnl00j6Ln9pB8zdep2LhquEC/mJtGihaoifY
	5jazAK6FiH+M5jqKlRSTbD/iptjFQyww+fuu8nnn2XiDe/me0NMglvjNjyYs22NHa/Okisbap2T
	MAmDXyozJF30PORl6lD6f6+H9QR9dvTwGMhd6xveUW7YX8jQ1f+axIJrgLHrwz/EJxnF6KuPU8W
	/N6Pbc4ya34yiWpkl5Lz94dQFPHKPSjLZDRNSD
X-Received: by 2002:a05:600c:5253:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-492200851d9mr199630985e9.6.1781623208433;
        Tue, 16 Jun 2026 08:20:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm17414212f8f.6.2026.06.16.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:20:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-filelock: Upgrade 3.29.1 -> 3.29.4
Date: Tue, 16 Jun 2026 18:20:03 +0300
Message-ID: <20260616152003.3841838-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616152003.3841838-1-leon.anavi@konsulko.com>
References: <20260616152003.3841838-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127623

Upgrade to release 3.29.4:

- Verify inode in break_lock_file before unlinking a stale lock
- Keep the read/write heartbeat alive on a transient touch error

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-filelock_3.29.1.bb => python3-filelock_3.29.4.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.29.1.bb => python3-filelock_3.29.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb
index 6a45c80fdd..1510e89760 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb
@@ -6,7 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "d97e6b1b9757569626c58caa07dc4beb1613f4a2938b1e8cc81afca398906c9e"
+
+SRC_URI[sha256sum] = "10cdb3656fc44541cdf30652a93fb10ec6b05325620eb316bd26893e4201538a"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -26,4 +27,5 @@ RDEPENDS:${PN}-ptest += " \
     python3-pytest-asyncio \
     python3-pytest-mock \
     python3-virtualenv \
+    python3-discovery \
 "
-- 
2.47.3


