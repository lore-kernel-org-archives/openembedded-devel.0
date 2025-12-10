Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949FCD3C912
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:17:03 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16394.1765376215593083394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=govMazNb;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10547767b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376215; x=1765981015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0gxwnA6xwdz4ugGH8nwGjz1HYZphIdlxsskvppEVyU=;
        b=govMazNbjzWW4uXpmY6D6zzL8+ybwFccYBuso1NUwiNe99QSyiKAl9Wo4Kpeq5NZ3w
         5k1eC9+krcgcDjBVUcKjlo0Nk8qlpWHBV1r3qmSqdA94C4bheICtYOkC3sUQrvi8qfdT
         hwd1O6Y7Du0dXVo8QMPX/JcUB9PbsHXGdVgtaULUgdM1cjfx6eH3XaNJ0Mvbn4aZzFUP
         /x4tAEEV3MqmtWQKt2ndeKgjqp1YBjD0C63/LBoIWGu6bITnWo3n+XRaIO6g+P+tt+hI
         AhIlxuz/haPn+Lr5ZTIDmJkR7L6irIBxlZGkYd3mUuyJAJGliV1WD2z5eyslJtdFRi2X
         Yr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376215; x=1765981015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0gxwnA6xwdz4ugGH8nwGjz1HYZphIdlxsskvppEVyU=;
        b=pFUon618anjEbSDzFlc0fZAUmlIZc7XaeuG6gUGtKqRwC9BbazSGO3IK+sgKJPWMhU
         ftkid88m271TbAC2FVSwNTFnrCg20Hb0tXl+KnLW2175WYXoD+FjcCLWx4CQWsZMDy+7
         OMdKR+DWhSdb1lSmC83R6d5jfeSiUM4cxsvbrCtw7pGj01ownWt9hfoKyjtk2sP3zMsZ
         b75q87/kxLb7+8I7DpySioaI8KUheHRExbz9exxHIGDy3fSy8clRt4BFQl4g1IIO0GjM
         PqZfZzm22scf29RRywQOQmDluUVlt4CnMVgm5Re4YbRLRANzJUB91dMZrXh2damf5EtY
         36ww==
X-Gm-Message-State: AOJu0YwfFUPAz11G/82DRu/6FvCP71Lx+4xsFzmADgbmsyeGS1OmFZXE
	/CGXuakVKaKKdvvo0kQ3Uo8I5xsAOkzkn0UuG6LorAbQFaZ6EjceLHENmeztHQ==
X-Gm-Gg: ASbGnctzZH77zx3xzBeAMGcQr3aVLEirVtXwR8Bwiw+/GB/GAKEY0ImI90RcGurOzQZ
	lIOO5pCb2bVjqlxXQ10vEV9vAfy49Kz7s8D1yh74rnajQoIh8aiMXE/eqP84trciEDlGRxd1cR6
	hqtzz9NJiIfe+OvHRAMpk/lMiTr0Fdf1229dNR0nk8G5Uyoi4po9Ee0Um91rRcx7f9IlIvov49D
	z2U5Y2Cwx3LxMTP8O86NL/W7m08drr0XzMX7YxaU0Fwb3RaTA9qw5qyf270SpcCxHoG+4sd9yyk
	d8XiVI9a9aKBQYuJ9ilJbtPoPKsmi9kLWItRN0IBMjjEnqnFfKQPnMP0OcToKFwNmcJxrNaRida
	9Y1PONVULk79qNQTNC6kpa3jhmJAgYw18a2Sbtn3RmBrVNS4GOZ0KH+XkDyrTKGBN+IZy6OOb9L
	CQXpCmF/N8AuY+qY6v4sOsVj8=
X-Google-Smtp-Source: AGHT+IHyD+KOYlEFUV7ZoMVkkUzzA4u070npU+aqu8dtodSzuEmOeJRebByIaNMyPRYhbcAl4IQKVA==
X-Received: by 2002:a05:6a20:2455:b0:364:8ab:ef45 with SMTP id adf61e73a8af0-366e2eb3752mr2875677637.57.1765376214747;
        Wed, 10 Dec 2025 06:16:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 4/7] webmin: upgrade 2.402 -> 2.501
Date: Wed, 10 Dec 2025 19:46:36 +0530
Message-ID: <20251210141639.1397030-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122552

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://github.com/webmin/webmin/releases/tag/2.501
Changelog: https://github.com/webmin/webmin/releases/tag/2.500

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 350e4a7c6230773b72aa8d6573a82e36eae19642)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/{webmin_2.402.bb => webmin_2.501.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.402.bb => webmin_2.501.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
index b2b1b818f2..2c807947e4 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "ced99a948411e255549f4ce8b730820387a50379d755e802ff90ef6ae5deaca5"
+SRC_URI[sha256sum] = "0f2772a582d4c4cf24085993729cfc94df2a64d619cefede5400c24b02efb08f"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 

