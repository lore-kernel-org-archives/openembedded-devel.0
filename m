Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA5AEE0AEE
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3877.1770467010967659725
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KB6pP1lN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806bf39419so24520125e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467009; x=1771071809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esZc30tR7wibdRACLUEJg3Xn6PBgcyaT+7wc0WKBx7Y=;
        b=KB6pP1lNvdBeB/sqrDNPnhggAJudWrqx0s22RlwTSUV0v38jq4p3FbVAt/IjIBpVMU
         ekLzSkWdpE4K66Atc/1KccFRwk5RYjDd1WowUU+x3fxPmraD6DexM16KvODAtCSIbUvc
         kyw7BC5OMhpR99VsGt6pZXxrJMwVWTImhDb/QOB3/WQbuakaMAVgB/U8PdGNQi4NVWuE
         E1oTeqJM6skLCYNkPqIUuNuBSP8z29vL3U08bLDNd61sRmidywkP+/TxerE4R9f2GHem
         5JBWuN7SEj46Sb/gp7CaQej63z5A18ksUmcwFjtb5daq8ql0QG528HNzZipaSoBHa2Q7
         sxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467009; x=1771071809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=esZc30tR7wibdRACLUEJg3Xn6PBgcyaT+7wc0WKBx7Y=;
        b=gHuyewNKOlDPROdrgXnN64IChpR/ibjvXm5cTNYHrJ4mxhc6xscM3OSU9B6fLzVqY5
         TeGqLG2K9I1bl+kcHcdYbXqwDitcEieQs3Jupfa9x+5lR/rFlJciveQ4i7AONnb2ydzB
         NHQfxKUpIHwTpP1CpwfHK3F6S4tQiuTO/HhUrnjM3uAN+Pagtgkj3gSVLK1K58XtcjZZ
         WYcBH2EvYAFDTLJevx5W41NTWk4tNzl3Cz2rsh8v9OE8CCClsg1QW/EMHDO2bhnuofuR
         xrct8x94YyIRRvYZJNX3oyoZ0uu+XUBNcwtEQhgPfi4w4bR//8fq7nylZpK16YJeBxSi
         YIrg==
X-Gm-Message-State: AOJu0Yxlr9p8hZ4IEbiKq2Kju46IrwQeejVUq6TsOOL3cjQximOs4Hvq
	fDA9DOIDHNCGCUoHrXvUIWAt3kHLdlFUHvDXROC4CkKuSBLQ8PxX3PWq3gdAbQ==
X-Gm-Gg: AZuq6aKNc8h3C7dy67MY+5fHAGI91Yuyz791obF07uwPF8AS9Fg8qNd0nbk/MLDi/6J
	U0ah2sOlgkx8Wsn3Mil3zDcL7LbJc2MIejdRgAAxweJ8xE2JUJH6ObVYdFCu7fB34dwMFeSurgv
	tRJqIjyX0ZQER1XY4kmsIvZd1yeTVWQnLb6vPfoZJNKYWSADQudaWKzL6qnIuQOb1WlGkUbAwty
	ZI1KeVwjqV363Lr8hG9XEUYSz06ea//lyuzCrvFAT+NBGHzw+kK/3rw4K5ZxaGpFoPNZZ0xYj9H
	EVm6Dm54PxN4dI2c/EZ4bUcQ47h3jMphWRIWFdvWxpmCfeOLvm1M4MlbPn7IdSS53BDoOBPYuEc
	4W55LMpZkmqCU8rQPKjRQVhj1y7JXVftNWkVWr0TKeXpaOsfg7D1vvCqwPy9I012QVbUm5yZ5ob
	yNOtzw/aU8
X-Received: by 2002:a05:600c:64c6:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483203d0446mr78604985e9.9.1770467009198;
        Sat, 07 Feb 2026 04:23:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 02/12] gtksourceview5: upgrade 5.12.0 -> 5.12.1
Date: Sat,  7 Feb 2026 13:23:17 +0100
Message-ID: <20260207122327.664604-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124258

Changes:
 * Update documentation links
 * Specify recoloring hex colors for Adwaita-dark
 * Improve grid drawing positions slightly
 * Use a weak ref for GtkSourceView backpointer in GtkSourceGutterRenderers
   which fixes a potential leak of GtkSourceView
 * Fix a fontconfig check for Windows
 * Fix section name for elixir

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gtksourceview5_5.12.0.bb => gtksourceview5_5.12.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.12.0.bb => gtksourceview5_5.12.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.1.bb
index f3267acbeb..2130b89c03 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.1.bb
@@ -24,7 +24,7 @@ inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache go
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.12/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "daf32ff5d3150d6385917d3503a85b9e047ba158b2b03079314c9c00813fa01f"
+SRC_URI[sha256sum] = "84c82aad985c5aadae7cea7804904a76341ec82b268d46594c1a478f39b42c1f"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'

