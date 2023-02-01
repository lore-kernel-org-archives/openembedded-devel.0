Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C26C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:13:43 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.29739.1675271618422563294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NsRSWsqD;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so2656439pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 09:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0g97JgRa/tlIN8lo4RDfOMkoTJgF0dFAhCP0CAlaBs=;
        b=NsRSWsqDholjD3CoQpSuZpB6hsycHjLO98hG80BHFK8J9Tk1Bk2tsDPmOlba7vVaFR
         jr0By8myaJBlFWhWQyrt82n5YEUb5WrfnGa3e2nAJqEtdCL1VKVDXM6EDUS1sGW1fnSS
         oQUlFnnE1wWPOJLe8ywfUKyfN+RyRDsv48BJIaHCxPdZuSYruk36cI9U/DxMgl+BaeGO
         TFz1NWKsraYLl5DROZ2SDrgnwYSDEo5UrirfF2b8cpzGOUslIUz8+kmguxaO82DOlx7Z
         NRWSNTFGTBA+yt7M+VRFw3nGhHN8L7bUT7ZL8rIkkNYKi+Zs5ZPibOfBdVk9IND0xssM
         7skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0g97JgRa/tlIN8lo4RDfOMkoTJgF0dFAhCP0CAlaBs=;
        b=U/mTTCqKWu0xGDYromJ9FRYQkYbG1WxERxdgbnKe7Me/gq5ddO9aWmN6UaPeIS6gcX
         kspvxYEGPbw6wMl8cl2Bv/HCQySjriAVAnNkKlXphTPl25i08Lg5oslLRErDti4+7zlS
         p8jWcszudtFIuluM/iMEaARRDW7V2+Uc0CJcSa4uVcd/6GpdbR4JxXVH2I/tWFa+Ic+H
         LtUJZlmldZZQwrM9e64uf0LpMWxwvbtxIkDvWryO5QQ66I3r7K9HGGUPlqEKNVwhPUuq
         //vw2otns9ZKaRsWd+wrNJwd8/fU46/6nDzLmTtIOXFNDTh/lJKqw+rd8lUQ5svTv5Qf
         d0RA==
X-Gm-Message-State: AO0yUKXJHtZoFHh1mKSEJQWpsplynhvtMs9nPOnMmOm9x4SRaDKUHAlo
	70jvwDVoQwZntriGGJaoKQ6roBnCvNdRrg==
X-Google-Smtp-Source: AK7set+5S2iCDBbu1QfEMLq4qAk6IeJF10B8Gc5M5fNgoInOjnewj6S/H7StyhL9jEEjx9kLyzl+3A==
X-Received: by 2002:a05:6a20:6912:b0:bc:1748:5ee7 with SMTP id q18-20020a056a20691200b000bc17485ee7mr4014105pzj.35.1675271617421;
        Wed, 01 Feb 2023 09:13:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id b10-20020a17090a990a00b00229d7f2abd4sm1556464pjp.54.2023.02.01.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:13:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gegl: Depend on openmp when using clang
Date: Wed,  1 Feb 2023 09:13:34 -0800
Message-Id: <20230201171334.1195746-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 17:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100908

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
index 335ce24aa9..d5291711bb 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
@@ -13,6 +13,8 @@ DEPENDS = " \
     json-glib \
 "
 
+DEPENDS:append:toolchain-clang  = " openmp"
+
 GNOMEBASEBUILDCLASS = "meson"
 
 inherit features_check gnomebase vala gobject-introspection
-- 
2.39.1


