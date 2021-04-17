Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.4396.1618670209765910060
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 07:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPO1cm0k;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c17so20247740pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=PtjktSk9BuSyA6+DV1k926spmlpqmc02tQnYgHUx/9A=;
        b=RPO1cm0knb278Iq6M6DyJRdNstH9mJD76FEIqb60Hx8eVXDBi8NXD5U8twIfnTpv20
         1/ki38Cl53Z1b3+23hol/ky8rInTCHpUXStglzx0GBmYg9RfGHOvSAW/kdXH84FVgodM
         uXQlwWw1XDvOrkT0NjsgU9aIizaTIIvEjD/mycTMBl92m/uEqp58248ocdTIxEEYynme
         6mI4gkKaTnPh7EAlOzjzK2cYgySj+EFSrWlcYNq7Fzc0NrfQSaLlHkC58SEqZxA4nkeK
         oErNvdRlvjzTrzM9umGubGofU9moXr8jgXzQxL+VvAHAyHZdphvApBduwoPytmsT7Zru
         y7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=PtjktSk9BuSyA6+DV1k926spmlpqmc02tQnYgHUx/9A=;
        b=qgy8isjxQLHLiy4a3SIupuROP1qMk7LT4XWGv2WhIlaUgGUUUKKKW8BYrIjHWAYwp9
         ku4wSp6y1Gitd0VMJpqZSZLY5jHrQlbW4PVNebH1b9MkI7frUSKEdoY4e5qphkonzDhA
         AL1/21VkDnoKvq0VewWJadQ1GZLzPjLzfr+/BZ7Ixqd+Un1z5VKm+gATke68WO9mg0LM
         uQ3GHE0stt8/XJ6VQ1BI4FgGqF9fzWc4cX1h1bxNY7i8lPKLb5Zo0vz26qAVFtN3LcvS
         d1uPdew+PSysNUnPdi1eL9ocI1C01E4KswbvT1mDE9P0ZkugetwO5aR3vojNcVfNUPSd
         /UyQ==
X-Gm-Message-State: AOAM530Tq2jvTH7483941y7taFrEYyvgDPOXGXFe//XjcfcI1HCfEkQm
	qEsQRVdp4nZR5SbJXrmtqHOfhka4QE9HDg==
X-Google-Smtp-Source: ABdhPJzT2UsLS8YmQzywdiDEPe+YnTkHErTPo9gYD9foBBWXp+EUxX3glxWxmuhcacNenYWhUNOXtQ==
X-Received: by 2002:aa7:8a84:0:b029:231:ff56:2c7e with SMTP id a4-20020aa78a840000b0290231ff562c7emr12500221pfc.50.1618670209106;
        Sat, 17 Apr 2021 07:36:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t11sm2501455pji.54.2021.04.17.07.36.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 07:36:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [V2][meta-networking][PATCH] wireguard: update to v1.0.20210219 +1
Date: Sat, 17 Apr 2021 07:36:39 -0700
Message-Id: <20210417143639.13914-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

The +1 fixes build issues for the 5.4 kernel.

This update looks like bugfixes

Signed-off-by: Armin Kuster <akuster808@gmail.com>

v2]
Wrong version listed
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

