Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.4461.1618670056263280596
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 07:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9gCyfBt;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso17939139pji.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=XwiyrCECxSUL1txGbusECESoay4ffuQxvOA8Skg3s1c=;
        b=Z9gCyfBtTlxmYFa/alXIuXFFH+4DgjP+74QO0U7Ct0L10y42cQK0gZ7N5o4kGv7t95
         vfriWFfUzmL5GbeEClkiGlXqOjVSQ2qYNIJCREQnvJ7lqrHHI78wd67vzDWTwo/ubsGk
         KexlQOfk8ZWggeqb1b8Fqb2WBR/tNIlG7Ja8IMeRjipAk9KUG2ZqlozI79+IieaUTiES
         N8Z/zDhQR2bdMr3yicZOeM/50QX1xPwBtKpODAAsaK/sQE79w3PCAO/kU+xciJmYripU
         K5gGRzPQR4H81eehOy0L87OvzNz5kzHxTDnKOoj8V3cAVQz11pcs421J54tOwTIfi7da
         7s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=XwiyrCECxSUL1txGbusECESoay4ffuQxvOA8Skg3s1c=;
        b=Jhcro7okXojJeMiwaBs6nUmC4iunb7/1h5NutGCJkXSbr5vaJRuQiTgEDjm+7b/46i
         YcQ/5OHQH08+sSMJNL0mHc/fZVC7XeainLdIijDSwpsL16u1SV30EC95HykwImh38cZx
         g/3qnusWZ954PfinHOIYnuMDK6jac9H+4YNk/MLGrnRKS4u/PMKXDvXRJMPKzUqxHpwG
         o7yKbgy9ZrmJAFzKmEl2KIforHpG7/Hbkidu95T0XyP8cTFqeUd32ieKjIPnGmOx71c4
         m9HDvZ39dT5DkFTdm/NEdAfaIjqseauV3EJHIeQyfiCoSi0suKI68BR3AmJpEzhekRTJ
         +ezg==
X-Gm-Message-State: AOAM533gKfmibv0kmf+gy6FgGCOs9kDNuA5RNR4ozI07CAgjFr+ucfQ1
	8HtaoCjeGaRBScTUkbLo4eVbwChPbIT7ug==
X-Google-Smtp-Source: ABdhPJxAgmTChNrHH2EAqGPX2yoWdJp3UAWWcWfsLEqiUta7SLFWgxbxz1laP70LvMXyS+exqQ6kSA==
X-Received: by 2002:a17:90a:a4c9:: with SMTP id l9mr15141839pjw.21.1618670055452;
        Sat, 17 Apr 2021 07:34:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id w3sm8983074pjg.7.2021.04.17.07.34.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 07:34:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wireguard: update to 1.0.20201112 +1
Date: Sat, 17 Apr 2021 07:34:05 -0700
Message-Id: <20210417143405.13821-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The +1 fixes build issues for the 5.4 kernel.

This update looks like bugfixes

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...module_1.0.20201112.bb => wireguard-module_1.0.20210219.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20201112.bb => wireguard-module_1.0.20210219.bb} (95%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
similarity index 95%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
index 64958a75b2d..0525b4135af 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "fe402261666821514377d06c2c68ed9bc19e7634"
+SRCREV = "122f06bfd8fc7b06a0899fa9adc4ce8e06900d98"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
@@ -31,3 +31,4 @@ module_do_install() {
 # OE-core post dunfell has moved to use kernel 5.8 which now means we cant build this module in world builds
 # for reference machines e.g. qemu
 EXCLUDE_FROM_WORLD = "1"
+
-- 
2.17.1

