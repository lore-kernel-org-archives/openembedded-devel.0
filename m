Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA909E75423
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116908.1766562587372258873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKmLtvKA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so5492604a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562586; x=1767167386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsjRLkuS0z1VROVcKbZYeCURH4IUiCTmrPxb6WmiFhA=;
        b=KKmLtvKA8SbwpyU8Mqmlv4sR+64ToJoWG8B9hVJJ5abNy2Ozsl/AHQglmCaG6kKUWX
         TlYvLjK2oRqpZ/iPkTvZLNKWHpTFIiYBjmDtFxUZOGQlqvMsJprTeqNoXEs8V4cvC3pG
         4bW6x+Apct6PtsESaqfZYAvTa0+IG1IB2ToFWoREQ/lXn+WKxv8te+vAzj9anJfaj9AN
         2Lj+B3sGgg6KEgT4j5Yqxw+bz5KEz7Rh/2efbRNN1nMlS290xZ8wKpIm/O5EJWOs3/BB
         fR+3HCt9Q0D75ErntF2ATLE/Qat/g/h2TWr2FExCudU9WJcdTDPjpag6KprSSTJLyq7A
         PEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562586; x=1767167386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsjRLkuS0z1VROVcKbZYeCURH4IUiCTmrPxb6WmiFhA=;
        b=VAuC8uwBqWrggOI3FqzZGhfBuu/cObnT6x/vgoDBCAAkai5Hmx/wWOEF+wkS39vM9D
         L6u4LpXsb9RSYxbDOvhtqtnQwsCeXrJwi14SbZglFQBMVLFSJLM6S+l4zzX9b+MaWKFK
         P9m1Efsx+wr6m+xkf9pV+Xu4easIBEOspNk00dkdXS6hqx0on9LfFXBQqq2WxZM7U7BC
         jO10ixJbXK2IvZJAdvNrJV/IKIOK9bag2tIzTrPjrBkUZ2tR0ReAFUtDwb3N7dUqVrBT
         fmCUU6BRjG21qAlxVz8rjyerhNZQV0Y4rzgOc6E1sDXeFqwGK+yFoLYg9Jo39bR/01EL
         S3wQ==
X-Gm-Message-State: AOJu0YxEQAYaT/cZgpMXgFZbqK1gS/lWyqkY8DK0H4BLEgkUDkUBLNMJ
	UsH5VpwN8/2NR9ja4BTdOAT95fFMkBpmCvtnmsgM/rb21Ae/zNIE2rEO74Ykxg==
X-Gm-Gg: AY/fxX73+gKez4H7xsG35BmrB6VvHWQP81fs3djIXdc1Xb1MDQ7tDau6ZzQUYPgmtdz
	8ACk3tH5qXWnaKpuz8EDw7poivvsJhH/YuEzVFpGEPQsXBSCZ0xTCm74UiCCZo5EZHwI3RzE65s
	J6KuNjiSLUIbvEuiZog2AxxpzV/QPyfa8gbCKEiDnmcFpP/zFjzd6hsMQ+xcyp4vyywIfjOSm3R
	L1R3AmwZLEUBOwuNgPDwLSWiOjT4O2sOC062C7Ggt91Low5j1yXipoE8hbh+94x/VOZGRbB3ob2
	kJ6T8lZC3FKrnq48X/xMIK77k3YlUmerVsISOMDqMW35EOSU4cSl//t0z7Wfffsl3hZA/9QX++E
	D432+Rp57rXaidgg7IydHqkCi1ATNiEfNHDzd88LI1xKvw4cPWJhylG2HMzxUZLV2dw4mgLjQjy
	oAgFkkMGzRn98R21xt3lUrsrDw
X-Google-Smtp-Source: AGHT+IGn9g9jyR4gkvjv3mo14dia0UdnOsP/dMmh1bcTObJ63QE4xWHKIZuN2YzEejIH+gGpWqEF8w==
X-Received: by 2002:a05:6a21:6d9f:b0:366:584c:62fa with SMTP id adf61e73a8af0-376a7af606cmr18357282637.21.1766562586389;
        Tue, 23 Dec 2025 23:49:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/6] libcoap: ignore CVE-2025-50518
Date: Wed, 24 Dec 2025 13:19:30 +0530
Message-ID: <20251224074932.1379914-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
References: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122848

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-50518

The vulnerability is disputed by upstream, because the vulnerability
requires a user error, incorrect library usage. See also an upstream
discussion in a related (rejected) PR: https://github.com/obgm/libcoap/pull/1726

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 598176e1cb6c928e322e26d358e8d01ba9d5af0a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 65bf455d9b..4f5a986858 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -62,3 +62,5 @@ PACKAGE_BEFORE_PN += "\
 
 FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
+
+CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"

