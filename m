Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.4663.1612507135151025879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 22:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hDWKnXmp;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id g3so3076183plp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 22:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=83YSSrMiJL88YT+HTt6Vs/phVqENEJCg08y97etvsy0=;
        b=hDWKnXmpb9qJeUwROvdKB4GfXPbGuVakjMk8cEO4MVDCOudjbbIqAST9yNi3G8d6nr
         +9r8qW2+PtPtEhexKSa9QlqPy0QXu9iIkxZQFmQWUjwfXd2otD2dOr1f9gYVgF9G5o4N
         2qQOmBxM6yXKq/s5WkysDvujoV9bdNJBgdVdRKBGg712A/9ib13sUVf5VkvMvmiYKREA
         jWyV4ek9uJ66gVe+i4H4+wJMVMTx9Zsfo7fpO36UwJB3tj5vuuCIR1Rkq2eN1Ifv0Dgg
         NrJLrDGhN6gJ4LzMOV5FuPpdOPhz9NXX20nZBzbNlq/R4K0oXPFCiMpJAd2pbeoJ5Amj
         Bp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=83YSSrMiJL88YT+HTt6Vs/phVqENEJCg08y97etvsy0=;
        b=An+vdX4FmSvj8dK2xr6CsUikywi6wvYGeaCOOL29R1uj+Cxqsv9Oc9NwvpPC/CyrNj
         EKauRTtavIth1bcWCzPHwUINZ+fCWUHMaSGYgIkLef7cPYT9ZQtEwrJOIazV2AqxAgPe
         hZsCd63wd53Z5F7bxaxUKJUTe25PXQ17E7qOpvQi5ofHuWQbCcqxb4jSNWW4mflMiTQ9
         PjEBNHNAwdorfjWk+AzakZCSlpoBnUv1PBVVj4AYEcXDswXpd24oOkLCR4KPWiPAbBR5
         GpwzcVWAAXBynTqB0eQm35EjV69mrwlkyT0fvpz+vaM3Zt5pJSEMWPLIjUJZdaWW1J6M
         PUIA==
X-Gm-Message-State: AOAM532TOdklNw7CMacZTYxVp8HHcZWMMQBgVr5WYBq4KNlx8Cw6e4Pz
	da0EHyMj+6y+h0sia+spbWU6gJX7tSeAyg==
X-Google-Smtp-Source: ABdhPJyE2czp7uhgk05yZO8Yrpmi6G1GPF7CMmfDw91stCn3OKCWxGRvl88vIVRl7plmd7pWlVwEHw==
X-Received: by 2002:a17:902:fe94:b029:e1:93c9:89cc with SMTP id x20-20020a170902fe94b02900e193c989ccmr2795522plm.3.1612507134412;
        Thu, 04 Feb 2021 22:38:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id g17sm8318512pfk.184.2021.02.04.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 22:38:53 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH 1/2] openldap: upgrade 2.4.51 -> 2.4.56
Date: Thu,  4 Feb 2021 22:38:51 -0800
Message-Id: <20210205063852.3991-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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

