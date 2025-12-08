Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF385D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:01:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.648.1765220504146418586
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvplwUcf;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2953e415b27so56375085ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765220503; x=1765825303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcb1iBRtVhQgbIOuozrlnfc+uzKcbNcc8w7yAjY3hO4=;
        b=IvplwUcf/yLVeH0jME+/HISXWQJdSRinKV9DqWtB7TgQiLpKMPxyUWGubqUG4A6EI0
         1di+sl7rtWZn8YGkk8sySoS7NKxMXoZ3HwVC0J9LMMv1zfEMbY4WNUOFIpc9KPpJbla/
         FQom9BQyp31NVISxbvpQrhE3tAMbQcVSlQGr2ARSGT3uZLx1kkCyK2oszBJxOFTLSSwU
         KuvFNiWh+GDB5ayls1i11NYaEdjZHk0ydFMstqnIg53/BfKoBWuuivIecCmKwWMfU8W3
         Xz6QotKVOznrmBVeoNjw4EDrZGrhiB3s0If1fCN6eUawPDMWcSzxK75TtF7xJc88OqdU
         HcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765220503; x=1765825303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcb1iBRtVhQgbIOuozrlnfc+uzKcbNcc8w7yAjY3hO4=;
        b=rzGR1CvBWcpBw8Gv2CvqAjIzj09bEccEReBdvNr0UnMrHkM+9mhrMQcodkHmH6V0hy
         ZrO4yzSEMICjOhKZcLWbBN6z6EQ1X3JVIwe3Cb1SqDJYbak06rsZXYqSCeuewW+ZkWe0
         TuT54MLdTIUaIjwigu9n7ztz5ntStZDSxGPoDfW5UVyUVpO5HZDa9l/t6sRQi11TykSD
         TIPNthXKsV3xVe8tpk0nctXZZb/vJQX2bBMhV0NVt4SEmoTP7ClLiIqMHvOS7RhXRGBe
         FOTQKqztLnjuZM50kt+indp8kvKtvIiv/v03afbt93q9X2QGuGDa1X6Qq/xTfC86rzE0
         4khQ==
X-Gm-Message-State: AOJu0YwPmq84krn/jyhIE6szb50JdU5hkRE9dd/OGEJ7rYLFjQ1pWEfJ
	ndjrLmsWAhriP2/soyXSY+WIh6UG/WvWE29QtxlACJ3Tt1jJKng0UJFq6owLcg==
X-Gm-Gg: ASbGnctlIU6WDp8FxM99QtUsxcepfba2T1sM9ST+eOvAQ9PmXoJioFDSEg1/oDPD8mx
	5xu9sAMNgvrMCvkiYgZuoEkFs5uVH6749g8sp49cMVuOB1maO82703B58/QsjleVbJiashYpKMT
	9btB7gckAjMp18rdfJRHyRp2JPLgZc2uJIZUrtcRcpB8HQoIZCoCEfMzSP/Y0++8O4V0Evq7Cr4
	vnk6BM2FspyqQfBp1doesmadKG7I9o0xrXVTJyDiA0o8Z3iKcR1FLy68JhryAGqbcHXvxv5Icl/
	bCz6baOKWMdzd/PZnT2xH3KKikLu7uxizbGRiK/S6oElbDfg4hevQN3DrgZhoPuloSo9s5DijWb
	eOjVQYO2wDHibKpsGhiyVTCIJh7EokLXtu19koySblhYGWVMf4q630I8Br6aJkaECYcLRMSO0W1
	RA7Sbf4NHVcPVk/y/WVr9m4gXA
X-Google-Smtp-Source: AGHT+IFzYVjIsySvy5J2XT3ve7iB82YE4+Fd+B/KaurKIAESwnqeuKmPGtESJ48agYAEIbj+iERjbw==
X-Received: by 2002:a17:903:2f84:b0:295:1626:6be5 with SMTP id d9443c01a7336-29df5dec90cmr63565415ad.44.1765220503273;
        Mon, 08 Dec 2025 11:01:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.250.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6b47sm133318535ad.94.2025.12.08.11.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 11:01:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] smarty: update CVE_PRODUCT
Date: Tue,  9 Dec 2025 08:01:27 +1300
Message-ID: <20251208190127.3119741-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 19:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122387

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
index 2f29cf00c0..395fd77722 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
@@ -24,3 +24,5 @@ do_install() {
         install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
 }
 FILES:${PN} = "${datadir}/php/smarty3/"
+
+CVE_PRODUCT = "smarty:smarty"

