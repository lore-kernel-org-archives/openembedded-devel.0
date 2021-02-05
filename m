Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4844.1612507136727295332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 22:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n2ZcmHFJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m12so3084182pjs.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 22:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2PODdBf67AL+khBQ/0KY0F66H9VTTF5XFgzthkzQz2U=;
        b=n2ZcmHFJEIb5PERH6gi3p7SU43NSkQRKHBgJVAmLTNI/bHZvRuJ/mgEjPNC0i13dRG
         Verh3KCxuX7E5mGMEwZMtavpV4gHUXscAbjQb7IKNPBYAalGFE9fmlOJ7bdRPuW7Shj5
         l6h1TDsMSc/4dPlUEltz1GfMugwryQWd19GeIEYNdK8At78dvHZ8uzyXnKa9AW1o4h3y
         3DhSvo7oww3pGZESVHB6px7TtfCo77gmBGob+WuRwr5IaMMsvULVmVi4U1WhZMf3vF8v
         cTnRG41sa/fyaPvtnIGkYMVzxQo4Ys/fOMkkSHMn5VcashiDyIPvBr87tgv53MrUyP1t
         rtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2PODdBf67AL+khBQ/0KY0F66H9VTTF5XFgzthkzQz2U=;
        b=pybUb7rIs/P1fcF8FlSncotkjPFv3g7zVCqE+h9zBCEFlfGXtZPhXx8yqDNA5YYrzi
         3bnUUpMH9LbYKtdJONStqikJNrDImImQE2C+9pXebx4H4b/gzsyE+ZP6yDWI+4gLjYLx
         S+sN/XE9cIBjnMQaHdWnYTGtAXXW1Lxv4Ds1fDQmHaPMO7DRl9E5cEIve63nnMvd+P1J
         Jd+XIPFrV2FHZXtdZFAdtBW0e1Fv7QoyhkslAcUpV8wqnPte6WGGZO2GFOqeNbLQQ+da
         /BYbbV5KvjwJB+tYXPJgzeKL3DR+5F7yJhXknNAS9Rtw6HSDUIs2KsDwEDjl86nVz4ND
         1WDA==
X-Gm-Message-State: AOAM531c0HKWIpbdZyuPtavMP0BLb10iP8Jl7lOPihZQND+9AJSohA6t
	ivHAXSQ9+I9ZdV0YJoDk0HK8Su5s93ZmVg==
X-Google-Smtp-Source: ABdhPJy8CjcnIvwbWVxL+rdVwyTI32LvJ9cn3UXs64Gsca+erlB9K5C6e7EWydhP7eLTcGZ6VKAyvg==
X-Received: by 2002:a17:90a:5208:: with SMTP id v8mr2731736pjh.224.1612507136002;
        Thu, 04 Feb 2021 22:38:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id g17sm8318512pfk.184.2021.02.04.22.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 22:38:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH 2/2] openldap: upgrade 2.4.56 -> 2.4.57
Date: Thu,  4 Feb 2021 22:38:52 -0800
Message-Id: <20210205063852.3991-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205063852.3991-1-akuster808@gmail.com>
References: <20210205063852.3991-1-akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Source: meta-openembedded
MR: 108384, 108398, 108412, 108426, 108440, 108454, 108468, 108482, 108496, 108510
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/openldap?id=0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a
ChangeID: 0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a
Description:

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0282b8ce6a5a5f082a37cb0863b3e62ad8e56a5a)
[Maintance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit cef93b7b00e620d90a610112ee574fa60b691cf8)
[Fixes CVE:
CVE-2020-36221
CVE-2020-36222
CVE-2020-36223
CVE-2020-36224
CVE-2020-36225
CVE-2020-36226
CVE-2020-36227
CVE-2020-36228
CVE-2020-36229
CVE-2020-36230

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.56.bb => openldap_2.4.57.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.56.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index 4c0f179cb0..a282523a3c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5391b559d23a2237bdb21e7a62dae7c3 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
-SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
+SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
+SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

