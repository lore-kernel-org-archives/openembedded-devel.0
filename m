Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.9113.1621347301632259172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vcoqjliw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id z4so2960329plg.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fiLWH4wJskfFa/GlmO04HSmElVmkrV6WUU5AIAakUkg=;
        b=Vcoqjliwh3xpylaz1JQ+7pAv/gUcbYABOzVfxktnSGfgPkCghtwHYWADQOZ9eTeUUb
         duPy8HsTao6/Z4Ka8R/SEi/HGlIvpEoVMcnoeFMiWLiIJ+40kGI4ViUSV2do17tvNBJZ
         7HC3A1a6Zvgz3DajCVvNgzLrJyCYm3BEUKNlAKcE5/KDXzFiup2sDpPZYz3iMVONmkU8
         UkevDvh2ZVNI0tYeey+nrEWgC0mMU6YscdsWXmxcrFBd8HTOBrLpKL7k9bpWPMnv8kUC
         K4K7r3lF285mEsmtNzQ/l+To4x7/IZgiGrAsfz6rDnKhXVUVFlE4bh0TcH4qHhjvLKRN
         imVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fiLWH4wJskfFa/GlmO04HSmElVmkrV6WUU5AIAakUkg=;
        b=BcayCsERgTYYPJGWA3dpT82ig6RiB7hCCqHEm76NjrX+caHohXDJftGGfEszZor/pZ
         5NOW1irRNZzdn8b4ugVwSK+deCzVR2wfYUWePBmWAnXOiPf2+TR8qHbz19+5zjzPLBQa
         PArmRk/QwpDKsTjEh3xxW9PA+eYWCr5S0Yi9hROP3RxT1b0gzjn4eRZlpIe1cs0PkIWM
         /Uj/TqZcoYoJSrlYMHjnYDy8gTOivfCEXIvrAUGXKB/aE5RC2b+DoaMCM46RBOiP32QD
         A1CKh8LSdPzjyl4yO61hHLTnkgYgus+1YFWF4ZvwqL0NVXwQ0M+ionT/J20NVFGXnXJL
         rfMw==
X-Gm-Message-State: AOAM532JOgEsjivOp1YHWuHKQWj46BdD9EwPUWynUV+d7r/Atw/xye6t
	SBiuyRAP3+IE+sRJgtTxlti/jKU96mQ=
X-Google-Smtp-Source: ABdhPJzId4eDpojweAS9RvJ2iShjJYHrIp2tRX5ROLNiCqXkhyfi8OU9w/C66/ZyqXp+xUvvabxwzQ==
X-Received: by 2002:a17:902:c104:b029:ef:836e:15d6 with SMTP id 4-20020a170902c104b02900ef836e15d6mr4881052pli.39.1621347301056;
        Tue, 18 May 2021 07:15:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:00 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/6] nostromo: Blacklist and exclude from world builds
Date: Tue, 18 May 2021 07:14:52 -0700
Message-Id: <bbf344afaf09c364a992c4f0167c9f486f2f8b2e.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>

Host site is dead.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
index d13ef74feb..deb76ac95c 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.7.bb
@@ -62,3 +62,6 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+PNBLACKLIST[nostromo] ?= "Host site for URI is dead"
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

