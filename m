Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37592CAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.9937.1758801831340410776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNxsN0Ui;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b346142c74aso163653866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801830; x=1759406630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xHwLpIf4YzT/YEXvNaVtNZvv2zKydjsCv2QGrg9uF8=;
        b=jNxsN0UiPVIBVG3MLZ4r2dU5GW/G22x8mYGdITGjLk5EKhX3fWRX/IP5z7aQQyGjH1
         9auUVFTIaHT+ut3KVgnP+lkcNd8fIWyWkJ0VeqoOIyWE8gTmpPsn2DQU8ICd8K3xsme6
         VRbhlX630Ts6u76mP5NYNiBO57wKbFVYb4OTrJ0L6sVUUhMNhEGEMY9mO9+a1td2kprF
         dEirIrZq/8ZMNQandkzWtI7Q+PcdE9vWUuz/ctocbffQ9RK2NVkO5WSe9e6rhCSk+B4g
         bTJknKBp8VfRZwIYptOI9qO1g1yyOe9FkTGgXcPideJ9oaFK1JYzBJD5bvIi+MxCgyd+
         HsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801830; x=1759406630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xHwLpIf4YzT/YEXvNaVtNZvv2zKydjsCv2QGrg9uF8=;
        b=f22J7gBI67MsfSU5CATGOwMYCIuuo7S/iiZ7MKNO1p7smTnTERiQKWRCE0Yv0++XI7
         JQH2JIwp7ce4ZpK9IS0x0ujNqgTPWlTndVXboTG6sTkRIdPT7JtCTLxAFH/9OA7jtI6e
         HosmoiTVtcqFl9Qpiv3rOSRo5zsfG7AVJ4zEfle2xA9+c/CA+TPD8FHJddaQNmmRbwWE
         3ovh3YnLbXXFj1CBi0o1uVv8L2/z6qZb0XyPiiODPxvTLSvI3BK0Xu2lbTb8n78Q6wI2
         IUbYf+dgJjJmFL4yM8/MbRm/ogCF/X52iI0ILR8Nz9TgMa1ZaWQM5RTK6kQcMlPYzg7/
         3TfQ==
X-Gm-Message-State: AOJu0Yyu1IG0F6bkPYbrfG+Hr1olPTsXQyFTK+95aZAaZ1PvJ/W5Pl/z
	j82Wtuz72+AMESRlH6pC5YAgSAovX6rtk/ho/HgVgpPK9uh8a9qdpMLaxHPDVhdN
X-Gm-Gg: ASbGncuiHKaII05KJ48BdmhFwMSY3DWjF6qYYgZmNdoFQg2/F268SzcNSiaDJgXVpFu
	fOApvP6tEvCztwzu/W0DO6x3JOK5yCnqAJHdLYqn2sn0sw6PmK3hF1kc5fAT5ti85PKaaal6MhX
	gIAIDjr8+iLLKRHw+0NVP66MjOgWMbF4uhZ6Hnh6TrR97i2mAPymauujGiLAi1Uq/3umbjT02X/
	0W6WXIabe+BWRHb9lZtwozeEn32k9eTeYSawVLyaGhvy53PppLXPwtm3jopuIQNQdSxkvvw4hn4
	jC47a92vTSad34sQSJv1HmrKIfWvFGiCG9rC6v4aeP5KGj1qMMApoeVz4n/XQV28HcqmpGlEhZm
	raPQ+GiYa2F1i1s46SVyYf4zzgM+SLVo=
X-Google-Smtp-Source: AGHT+IFNRyPHZVoDVXxiIUBFcqzYeAweb3+Pwqhdvwk3gM8gXMhMkPOI64ItcWDE6HyGiXWvO8BiDQ==
X-Received: by 2002:a17:906:c143:b0:b23:32d9:d025 with SMTP id a640c23a62f3a-b34ba450e42mr347203466b.30.1758801829544;
        Thu, 25 Sep 2025 05:03:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 07/21] grubby: fix syntax for ALTERNATIVE
Date: Thu, 25 Sep 2025 14:03:19 +0200
Message-ID: <20250925120334.1670367-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119866

From: Yi Zhao <yi.zhao@windriver.com>

ALTERNATIVE_${PN} -> ALTERNATIVE:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ee4b6b21133e089fcb62fd82c1b058ff9a4f7227)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index 7c40c52cf6..cee5cdc561 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -39,7 +39,7 @@ RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest = "util-linux-getopt bash"
 
 inherit update-alternatives
-ALTERNATIVE_${PN} = "installkernel"
+ALTERNATIVE:${PN} = "installkernel"
 ALTERNATIVE_LINK_NAME[installkernel] = "${sbindir}/installkernel"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'

