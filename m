Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A681C6FA92
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.11494.1662276890485940857
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fjdvm4Y2;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id v5so5765861plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=sYIpfubg7/K5TysU52HQCDQuZSLPK9TIc8fMLeE8+ZI=;
        b=Fjdvm4Y2BB5WKCxvcfXDjT3NzFW/8k/p56X+wy8KYTH1SqIBkQaJN1HgEjYLJ7fyj1
         ANAvaZkVHOur004Iz68Xp1a5kjXXzxBCGqK0VU2W3g+JdS/VEDGLi0wz3y1COmZGgiK9
         Rw4O6ZIYyNlBPAdX5fg/Tp2E9h7NVimeilA/PR6lktMFb0Sewq+1WV2DgEineJZJS2mV
         /SD2MCTePxYsQbraDMnadytBmNYXdNbcR4PMuu1imxMrHVO+1cNGVeUgd/pHClN4Q76G
         Zkz5xbpCqeBe9msyIjiaHUe3tJeHUycNiiUocVjUm1vdqESf8jEXaXltvrGKrcE2p60Z
         6FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sYIpfubg7/K5TysU52HQCDQuZSLPK9TIc8fMLeE8+ZI=;
        b=Bw31gqOFzYlQrhsZGNVpytvSxbJjsjeKVkqlYE2bQq19E/iPfnA0PI/JU/AM0FdhDs
         /QqgkZH9F2zLdkbRDV2ChxvxmU7gXtMU7gyFrVZOYbnhKShm7ZwuUwz9mMYP4B7UurBZ
         T90qEBV1YPityPUSqvvfh5tJHo/ZAYgKWLhiZvKPLiilnu+SNFZAZxZVWKxvYrwMMaek
         LyhTN+ENOfZkvCORcYWGaZepVWhLs9vOu5E6d+RaJIgJ6BbexyPApIQne8fFN1V19O//
         wgmaTBV1fsezuBWIDUFoz0gAt7UxVcM68IDO5819X0X7CWG5hU2CiE77MiAGjx00Exkv
         1HIQ==
X-Gm-Message-State: ACgBeo3jo6kZI3/Ddg1BxXqUOADUxt7J7hNBD05WoZaGTOEpS3PZOicW
	yswkWT3wzi+0mDcPJyMcMwvXIsrXkxLFsg==
X-Google-Smtp-Source: 
 AA6agR5LnjT5EI8FDRrIXz1jSFPUjMoHIeWchyuEz9nfNFgn9uY9pHamvQkco+eds5iXDap/4Zh7sA==
X-Received: by 2002:a17:90b:1e42:b0:1fe:ec3:924f with SMTP id
 pi2-20020a17090b1e4200b001fe0ec3924fmr13800954pjb.34.1662276889614;
        Sun, 04 Sep 2022 00:34:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 28/63] raptor2: Match reutrn type from
 RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE
Date: Sun,  4 Sep 2022 00:33:42 -0700
Message-Id: <20220904073417.3251865-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98622

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch | 47 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.15.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch

diff --git a/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch b/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
new file mode 100644
index 0000000000..4c1afb46eb
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch
@@ -0,0 +1,47 @@
+From 97b5dcaa6b221eb403cc92e953225d38aee18f70 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 14:48:39 -0700
+Subject: [PATCH] Match reutrn type from
+ RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE
+
+This ensures that integer type 0 is returned and not NULL
+Fixes
+raptor_serialize.c:243:66: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
+  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
+                                                                 ^~~~
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/raptor_parse.c     | 2 +-
+ src/raptor_serialize.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/raptor_parse.c b/src/raptor_parse.c
+index 26911f4..0091e1e 100644
+--- a/src/raptor_parse.c
++++ b/src/raptor_parse.c
+@@ -257,7 +257,7 @@ raptor_world_get_parser_factory(raptor_world *world, const char *name)
+ int
+ raptor_world_get_parsers_count(raptor_world* world)
+ {
+-  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
++  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, 0);
+ 
+   raptor_world_open(world);
+ 
+diff --git a/src/raptor_serialize.c b/src/raptor_serialize.c
+index a1f29d7..2bf4ab2 100644
+--- a/src/raptor_serialize.c
++++ b/src/raptor_serialize.c
+@@ -240,7 +240,7 @@ raptor_get_serializer_factory(raptor_world* world, const char *name)
+ int
+ raptor_world_get_serializers_count(raptor_world* world)
+ {
+-  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, NULL);
++  RAPTOR_ASSERT_OBJECT_POINTER_RETURN_VALUE(world, raptor_world, 0);
+ 
+   raptor_world_open(world);
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
index 577c6ee00a..22306a5c1b 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -12,6 +12,7 @@ DEPENDS = "libxml2 libxslt curl yajl"
 SRC_URI = " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
     file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
+    file://0001-Match-reutrn-type-from-RAPTOR_ASSERT_OBJECT_POINTER_.patch \
 "
 SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
 SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"
-- 
2.37.3


