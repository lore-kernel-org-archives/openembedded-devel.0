Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D08CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:00 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7535.1790849214483012895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dMQkSh46;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so25935775ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849214; x=1791454014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYAoE9Qmnc3aL6kCsKahueN3qjceU6Xl3X7qcAUoiiU=;
        b=dMQkSh46ZxwjcaXOXR4p2wFVmrrrIH3VLGsUJNYLzrYoGy9R7/tY46rv3tdq+/0trO
         5nEZ08gM7LmH39peMUqxscio/ngE5Zn14DQ4bTKBYRp88GlixsJVDwOVsKAEIfUNn2Po
         wItDhpmKgF4Whc1BloKHrO1cHyXgaSjhsDTBN8yuc5jcwayEheUgKYxZDuQ5o2L2I4+D
         658fZPz0xR/l7WSyUkF4R6wuEstaRUNNsf4suwW6kCk3nZAZ6yJO+7VQoI6ZJ45HcLcu
         0SFzSzMiWqwZzklo4f10XW1K3+ocAILtYVjh0UeFNZ5oSBeTCNrmA05IxN3QcSsu5dDz
         EdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849214; x=1791454014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYAoE9Qmnc3aL6kCsKahueN3qjceU6Xl3X7qcAUoiiU=;
        b=0cdTud1yo0NtlZOwJe+QIfB7Zn76AxCLKcpp99pO5OQvWpqlOvZyzwZ+ztZO03Q9+I
         DKASXQqvoBwGQBpPE8xP6XD0ewyp+mhuhcKSdN5L9sCBgnmrHuMwUb9iyWPc1oNyjtjn
         XGiSTLi4HCacrqy37k2b8ra52ZiIia/Y1WvHi3I3WY0ZCNNXmp9Kiosg6ha+d/ctDP/v
         Itv4p8qJ5FXbULgOSGz4QsKuf5genpZPZfMQ9JFSZjN3EkPiBTRCrL9U/fVwr3oW1cND
         nWbjLIMgib0ktEg43ohOK3dHODXE30jUpgoufxujmWho4vxZWDVGYZL3ngyg7GkreyBw
         LR4w==
X-Gm-Message-State: AFq9FYLUyJ+9GJnxrtmE44sY+xEoa/HCsYD0f1Pyz2Ez89dL5FeLwuG7
	aOaww/z0L09KfhsYeiKAEpNjUVidnBzAE3TwbO2B+/X8nL4/c4W5NptAnV5Xbw==
X-Gm-Gg: AYBFou0IkkawC4n16Bi2jvcRBTH4VeMf0gCyxlwU+g/aN+yWwDAfF3YD+7yq0EiCX59
	yxwSLC7QkQ0GV2CZrHgmsjVo1lr9kJyFn9oHELCvxLYHsP4hJjZZsrMyZb4mDtPYo2DlQXsPk7D
	+/KqpV5rJUFK6OH5Yi0iokaFR2KWKvE7bgz17RGc/uwMhgy9hQBZYyhMXul6cxDsqmDiCOfuwX9
	S8hqgoEpCiOygBQAWeKk/VApjb4gqZABELz7/kS3uiT2/LJAlHXcv5BCEHi9yzwDEBaQXCOzinx
	M32zmoPO20oFPwJ2UvOz8a5Gz3GglNTau4H4LLTwNkItOUTme9DUIB8I94fzWuZcI7HgWgxhu24
	QEHJGr/+JFFJFx3fGgRtDjQtRJRL3S024y/znuu+WS/xSSnXGcKchosP08S/IdlIRwu7K0SyE52
	qXM4xHvfLgDThbHJfVSZD58X5WDKzXuIL6MxEIRGttQGY0ZZrEsKQQ1hml7v4HX+Q609y83SdTg
	Cu41aN+A6w+0KuYGpptiJp86g==
X-Received: by 2002:a17:903:2ec7:b0:2dd:ad73:5b6a with SMTP id d9443c01a7336-2e2e49ba28bmr36182955ad.26.1790849213794;
        Thu, 01 Oct 2026 03:06:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/11] libxmp: upgrade 4.7.2 -> 4.7.3
Date: Thu,  1 Oct 2026 23:06:29 +1300
Message-ID: <20261001100634.1992725-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130572

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libxmp/libxmp/releases/tag/libxmp-4.7.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmp/{libxmp_4.7.2.bb => libxmp_4.7.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.2.bb => libxmp_4.7.3.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
index 02fb8ee9d8..1600686229 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "a13276d27feabcf9ee4f982913f718ee05a65cb7"
+SRCREV = "1e0812137e4f9e15cc026c0c75af82d71d3cb5ad"
 

