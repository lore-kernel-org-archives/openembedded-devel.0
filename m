Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.2366.1613440705959937503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ClS9MlCS;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id e9so4995373pjj.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=83YSSrMiJL88YT+HTt6Vs/phVqENEJCg08y97etvsy0=;
        b=ClS9MlCSBwlL4ImrSWK5fgwvHLj2BVaHMHinlVcCOjkSpYWSFqqwwtgb/9UBhr7/RZ
         D8AleAF/F3EN2lEo2jKTjYTykRhQ5XuxGh1VlAoRS2USz8IbPZ1NKv6UqjhqbXt2+K4v
         1bp3kqROp5rnZMaFzAIjGRWFiCRs3nDMBZmZ6R2Uryz4MNbuAOUrIak8tm5pshiXAPtz
         NLiIv2xuDw+lWD2TPZ9aEhtdXZRNhvJ9CMQEMY/R5KcZT29B4klQL5to3e/54hIMUZ6u
         eoP54G46DTr/WdSLxrWcL5g/M0u5Izug7ABtR/z2J4AjpXZ4Ukn2hFdeuh9meIZLVpEV
         3/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=83YSSrMiJL88YT+HTt6Vs/phVqENEJCg08y97etvsy0=;
        b=NRQ55Wpx5CQNmJmyNowprM5M2xtiRSjExPrR6jcRzGQ9a85EulJo7COByOLtVIaKRP
         Y718KMTUmnai80r21MPFUQnD7Ga7kB6+DD7jnu2nkqHEd/G3KqVaXb7GOtNZJo23aK32
         /BSyEPCF43w5iRlc66VZKjtqRKEJmXaDmA6Jkml73IaPuAeJynb+jsewyEy9nAPT+ROO
         nqpDUUoZoSrtw96kpeJUZ7IlRaFIlJuMcLLVgqXwhPkDDACl+sehlg4c63FVKi0UVrU6
         J/8K6nuwcgdYjKX16XvLPjHtwwSVV3h3/5beTlOeh0yoru7ywSvsLVMnuAE1a6GYfhzk
         FCwA==
X-Gm-Message-State: AOAM5333Hk4FJaKDJQDTlnr/+g3v1SuE6FRzx8PckpqObPYxx87H6cxQ
	0RywUT5VPp0htj3LBTnlF8B2SE7mH2nizg==
X-Google-Smtp-Source: ABdhPJxszjjexSBfPoPliYBqvrq3zzNVlRf+HXCiyGkLm3DJMWalbL9WepUjS1XNabsmIvkPf3l7rg==
X-Received: by 2002:a17:90a:da02:: with SMTP id e2mr1681633pjv.173.1613440705291;
        Mon, 15 Feb 2021 17:58:25 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:25 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/11] openldap: upgrade 2.4.51 -> 2.4.56
Date: Mon, 15 Feb 2021 17:58:10 -0800
Message-Id: <0e1ab270eed8ddeb06d489742cafd2d808147742.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Source: meta-openembedded
MR: 107249
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/openldap?id=768345053e83623e286ce3140756036e75c023bc
ChangeID: fbcadc7f563891b4aa489557c8d518ed46de5e9d
Description:

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 768345053e83623e286ce3140756036e75c023bc)
[Maintenance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit e615c6fceff7275d93e462f4cd4a14cc55b2d656)
[Fixed CVE-2020-25692]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.51.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.56.bb
index d2c5746080..4c0f179cb0 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "0d2025896cf1c17af7304ecc57ec9531"
-SRC_URI[sha256sum] = "f490775ea4c6506b7210ee55a102c8f4aacfe9d1c8eaa633c7316d33a714be62"
+SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
+SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

