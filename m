Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB09CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:29:47 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.11821.1760110180768852121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NVDF0qwn;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso17356965e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760110179; x=1760714979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=NVDF0qwnrDFQrmcoMG6LBE1g9DZLnV5MyXvDRjO6pGCtK5ZTBH2934OjNNW3p3eRLx
         iKXYRlBJyVdpUX1Pl8FfLrnlYX/NQ94NuXIvcGFF4FRc6Rg3VEVIzVnGZb80qvRJ2Yl1
         gSYnK4/UDws/LVriiPl60dPuwSUvcXpFbdf/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110179; x=1760714979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=T+dEAlLKQeANR6A4+UyfwoFDAIwgV7SdyirfnlAwK3KIwWeilkwZOTGNRHeYhjwtKF
         9utHH50+t+dY6WSqIVXL1sR9MiljFjgDsUmBMyinCqTvVmT1iGi0L4cW7FoSkXtgwSZi
         nAklY2zBQrdH6znLHIx5elshUbHOzCMFoOhY+QB0vEzFTJV0AIA4EvQTVYnO6QpLrZjO
         BX286W4k1aaskyZ2xh/7tyW4/YfJY+JYt5DKjzzsjld80tGwid9JgKCgY0mfJwsB57uk
         MGgi1mWMRCyd5gKhuQiyLaH/cXyhcZRjdHLYbc4Bxt1AwJBV2in8/y2muXSOjGSdcolv
         FIfw==
X-Gm-Message-State: AOJu0YyPMXlFD+yv49YPhlC95E2vQA7GFLd71HQkUg1aAycJ0SfPmHvC
	IJUHh23SLnuEi1e+1h5zIbcvx3pD7Wsm10w97FRN09rgfPBBNvSI7UW41q4BotQ7x6bgDsU29Oq
	7Me+toVEcKIeT
X-Gm-Gg: ASbGncsD1BwCyDNSieYdJsx51YkWgMVH5dExQ548INLp12DRpS3wPEU8t5Y0PjobIXT
	veeqOEBY7qYdVpuq/llEpcPpW/nfearOzmYtSQxqgpIVI2dZUibW89u6yqS4XwAaT33eWiDHWV2
	bxAK3pjYsXcj9NGjjZlT85Hcn3J7cqAQOTZUKphVFoGhrvasvaTGe8aTtPjxjlf1i1tHIeE8Wfq
	ECNy19CsAS3OBGkEwLV9qCN/exlyBBL4w+av6y9/ud2Wk4sLWnXQVXF85hmMG3siIP4dgHIQY+N
	gd4BRT3TzUab/0So0d/XTW5fGcIquX7YWRdQoLB6ODVpJGNenTiRaZyQsRH0YvDrtWloSGS3cBO
	ik559DdOPcQFw0zfFNSWMEHic9C08Vj+c2PfBimyKwQwofzyn2ZoAhd0cFxJOOhukOgZqySYl/F
	TO2N+fOIIfSFo65DmYXLFHf3sS+1X45ydpdmYWRnm87ld3e6nglHf6W3JB
X-Google-Smtp-Source: AGHT+IFO3NA475bKuRlOWB6vxD0IkL6xj0hyxrpRJQAO8ECB5U5tAGJNhXtCd35r9HEJEDtyyN/SjQ==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-46fa9b0e7b3mr86334035e9.30.1760110179128;
        Fri, 10 Oct 2025 08:29:39 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm4539431f8f.35.2025.10.10.08.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:29:38 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH] libblockdev: improve reproducibility
Date: Fri, 10 Oct 2025 17:29:35 +0200
Message-ID: <20251010152936.780704-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 15:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120479

The --with-smart option behind the feature "smart" relies on the drivedb.h
header, provided by smartmontools package (/usr/share/smartmontools/drivedb.h).

However the dependencies (DEPENDS) miss this package. Furthermore, if the
--with-drivedb option is not used, the configuration step will search for the
file first on the host's rootfs. This may result in the wrong header being picked,
or the --with-smart option being silently disabled due to incomplete dependencies
(causing missing header).

The header is now guaranteed to be present due to an added dependency in the
"smart" feature, and its location is specified by the --with-drivedb option.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 48e6971d1a..e4078d6862 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
-PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
+PACKAGECONFIG[smart] = "--with-smart --with-drivedb=${RECIPE_SYSROOT}${datadir}/smartmontools,--without-smart,libatasmart smartmontools"
 PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
 export GIR_EXTRA_LIBS_PATH = "${B}/src/utils/.libs"
-- 
2.49.0


