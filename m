Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.18037.1590941823410144063
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HB/29VID;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id o6so2375110pgh.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IYnzTeZ4dY2wHhyZXFvpCRmzvVCnWyeBPi4PC0hVhMI=;
        b=HB/29VIDEQ5VRbJ+BVg+W6Veaa1P6tD+O7GF7TKvcNie4HX+M4g4VvjQ5KeWueNLka
         VsanELkWsa+F5qM7cajCMlLJbm2Ew2d5KljDQoPPiGgPvPtA2sbh7686H2734rHvDxk3
         ABiiPXQNzBLZSW1E/eJKRPw+z0JTI3lPimKiiGZr1cdBvloris2CtJw1vSuzB3YS9yyM
         pCYslPCafAFfkhvpWBhBydCzwx+OqRwZedQ0RHwiFtEJKP2yHhkHND0lV6PEwoKrzmPO
         JrZus/s949o3LWKILKDkGMgz0FRG3INlFFVUfztcBzsstFo0SBzx4vmd8J4tScf8ruej
         QFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IYnzTeZ4dY2wHhyZXFvpCRmzvVCnWyeBPi4PC0hVhMI=;
        b=UzyH64kpK9+4eqsEbNzsPArVUrgVlZdvLCjnS5vy3vuTR5c9A/vDQkNnXpxYv3+ftM
         CzcVLTJWRSmIjLIAE2fyDMxQbOaPMFXL2OyxyconEHX8AtZwihD8aHk6ekGuV8WyCufg
         P9KjTD0hk9aAsoxYromJa4NfCrdYVGxsoVk9mmbgRjaji/HmjN6UY7jYkcjN45Q/J6jO
         lh+mfdw5DEVIv0ILShmipJFrEZ67shDteZsnsGQEml62k/8odKee2TU5f1NfSM4dMVym
         NifhOMs3j7+5SI+QUXSmodUJfgf5pFJEOgn1gkAP/vzCgtgBcsHqlPe9csOmkrWX8f0Q
         6jOw==
X-Gm-Message-State: AOAM5327qwMa1RxBQHKdzkhD5zrg24NqdOXRXINVyoH9jiwJBGuVguF6
	Xdz8YaJ4mtZLi6p/sM8572tt+dcq
X-Google-Smtp-Source: ABdhPJySpfFVAZv2W/5UoaydzY0NKU1c3CSDbNWH5j3MRdgtcmvnob2hIJYc2sFKNijXZpbdSqA6EQ==
X-Received: by 2002:a63:5506:: with SMTP id j6mr16125116pgb.121.1590941822841;
        Sun, 31 May 2020 09:17:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.17.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:17:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 33/35] ser2net: upgrade 4.1.5 -> 4.1.8
Date: Sun, 31 May 2020 09:16:20 -0700
Message-Id: <6a44b89c82e52719d3db1fd361226325b2e55337.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ace7342bddc68b486d16739f431710bb4edca202)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
index 05d1ffed5f..4a91fa4f4d 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.8.bb
@@ -9,8 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "52c5e56d2d54ced0cdeb764a7e8fec92"
-SRC_URI[sha256sum] = "df904d271eb161c265c956f0cb938dd0a375dda4a919a344f73b08bc50b9f308"
+SRC_URI[sha256sum] = "cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5f51a72"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.17.1

