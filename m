Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.6303.1602218377573469554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 21:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gu/b2JE7;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id x13so3190345pfa.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=omJq7uIgGyC0zlPhJB/mqYOIUdkfydhzkDkGijG+D+U=;
        b=gu/b2JE7sbr0yaa5ezLrf1Ezg8nOTIZdc1dU+PqLjhVZMCu9nDk0kWcef+tHb/uC/v
         trCdBBgyu7xyekF8fbw9FRvZ8LASA1UMXuMSVVqoINq8roxEkg4PHdoFL07N8s2Bfw01
         BKcQzj0NvxmTYMktFBA7g5CBroHgee6rIYOZeeROmBRYjOVCsgcKqqO7J3bWEdqFg2nT
         RS6Gc/OlZSwlBKwcoDLIJfBDJH+q27hHMoGph2Nf5THGXyihV7sb/ereN83+qHfmzgo9
         sIWjYK5RRKqhb9ME1R1N5yeAzzqakmJankt2l+nQ+8VIKiH/JAdZzkAI5eepQwsHnAa1
         zHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=omJq7uIgGyC0zlPhJB/mqYOIUdkfydhzkDkGijG+D+U=;
        b=KufOl5wT+1HfUFcuS8IgaoFwhK1adpQ64F184CnbgYSSpgmvovTA2IJdqSyQVA35qq
         bHMEBQmAxCtKfb4qHQi2l2YFaVjAmoAG3N1K0aqh+fFGJEn3l3684wxN0uamSCdUzoO9
         sM+TGXo1+mvLuSnA8OQk7jFiPKbCx9wmwl/ce2NPsdvTkKWky8XB0DH5bpxw+EqoMPKu
         uH+DZWICjO7Odn5jJ0JJD6zO9otIO3PMNnMLFkQ8lMDhYihrP74m5oqBwlf11XVyEz7I
         mKpPzpCze3lFKTusOY2jHwT1tHxZsjAicfrR0RFTzh7TaJTT9By87CWFwZzrMjZara51
         P+RA==
X-Gm-Message-State: AOAM530D0F3kCxhboKTTqeDUng6hfvgs4l8DbfRMTu1iWmUZTS2gJ43X
	lk6Jk9IE2ycGXSh/rHLw6/EOoImzrVM=
X-Google-Smtp-Source: ABdhPJzOrb/Os38rMB+MIcjEM34/4bZHGAdkQ96YPi4MJGybPlKe5N6A74hP4jeMrOm5EZTHZaihHA==
X-Received: by 2002:a17:90a:ec13:: with SMTP id l19mr2608567pjy.51.1602218376762;
        Thu, 08 Oct 2020 21:39:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id v5sm8412183pfu.151.2020.10.08.21.39.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 21:39:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] add musl-nscd to pkg grps
Date: Thu,  8 Oct 2020 21:39:33 -0700
Message-Id: <20201009043935.18597-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9bfc8ffaa4..5a4375d72a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -284,6 +284,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
 RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pcimem pmtools"
 RDEPENDS_packagegroup-meta-oe-devtools_append_arm = " pcimem"
 RDEPENDS_packagegroup-meta-oe-devtools_append_aarch64 = " pcimem"
+RDEPENDS_packagegroup-meta-oe-devtools_append_libc-musl = " musl-nscd"
 
 RDEPENDS_packagegroup-meta-oe-devtools_remove_arm = "concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
-- 
2.17.1

