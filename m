Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.14515.1619911783506649609
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WUWFgQm8;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id b15so1635716pfl.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=WUWFgQm8U6+ZrYQq0XUM46drhP7Kdp4UKjazpx1QoHDOVOXV6PUslSdRt0zH1vWENv
         /309AU2mxJO99i+r3c+gY4Rw0Pz0QX9TRmOKVjYggbbjWZr40lGnDJU9RCPgkWsiS/4V
         tmL0P91p7q2fTL8RnuVAlUOD2XiVvFDEtJhtfuiJF2AEGGF1HTRu8PZVM8gTZnOX2B4r
         PlIT2K2X6EJEbVtCqOslx52/Mi3kpALr64+U/nkFY1M9Gj7Cz3WHi5KKVVETk7fi4Tpz
         c1+3hjqK92v/GsH6+BgQK3K0G2G7oP/JvzeZlIUaXo8gORlnhmKp5bUapYZQvI0isQzc
         n9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=gNm7kiOAES2wTSsDo9eGgpFLVBcfyuV83gxB77L7rh0chyVAZHvUGML5D0UOx85tEI
         jLgy7Q2ErzR3QUYq/XASIMp+UIaIz0cQq3lbHQsin1gvJ/7auCdtUy81BOzNmWWFM0rx
         1JXK8g60U9GnlMWoQVTooKJScEsRgcTNQw7JGIJiXc6Cb89gsFZhp+ut7ajokwf4uWQL
         MRjzDzTgx49NVkJHkbVflCcfO/8X6cWQbD/y5yBJDUaR+T5X+SBD3gWp6qrqdUmM1CT+
         AHS5kD5/RDreQcQTBveDEP69ZJqbFyqHe0KZ0y7rM+4bHHFR3/aWVU4+RBs7y3nLEZTH
         sfjA==
X-Gm-Message-State: AOAM530BeStCSQgfKpIa+wkzYG3AccvxuRAt2c7X4Yum9bXiPDYANVFt
	p2gdYSuX9jtT99JnR6JWSrb2qYMmUXmyyg==
X-Google-Smtp-Source: ABdhPJzEsHCvec9pouWxeWed10eRZ4h4MB1P4KZwoU55IttHO5TFKhOuylCFSX/hOJXN3nOUvmvAHA==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr11564843pgi.133.1619911782397;
        Sat, 01 May 2021 16:29:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id br10sm13856946pjb.13.2021.05.01.16.29.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:29:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH 1/2] nostromo: Blacklist and exclude from world builds
Date: Sat,  1 May 2021 16:29:31 -0700
Message-Id: <20210501232932.11509-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Host site is dead.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
index e726c9ac66..f1cf59355d 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
@@ -62,3 +62,6 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+PNBLACKLIST[nostromo] ?= "Host site for URI is dead"
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

