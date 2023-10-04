Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4D7E8FDD5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 07:25:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.13140.1696404355705086616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 00:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y0i1hCuh;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bbara93@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so295456866b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696404354; x=1697009154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VgCFwOBwEUHXMwCYFyyUtmBNRuXy8jb8eZbx7MP0rQ=;
        b=Y0i1hCuhKlBBt+/8S3JKxAkMwgmdvIZVTk9IyNRV6wlRIVYvAvsMfZfJJDB7KqSq1x
         WJNGPRpqKDcN0VK0LSxsgMTWwAq5fheKW3Zalu55KCY+6wexj6DwdUPtiKMnKtPs4X4b
         1gHMOhIA6EHC3z7LwtHiEEp1N7Qsou9jZWqI/URTEp8bWnu+TTGlzZfYn73b6/8kjzoF
         YO3R+ELw8uRr43zwDmW4OnI806zy5O5DHvWj7VUpU+7F2bCFZjOHSuuNqW23mI58D05U
         esYlVUIrXm7uqHnBMIwP9g5Yz3e8hUW+sQ7hKA7dZRYhwgKA/+iq7jhOsHkuykZSs4mg
         ZXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404354; x=1697009154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VgCFwOBwEUHXMwCYFyyUtmBNRuXy8jb8eZbx7MP0rQ=;
        b=Jbo6/jVsDbUymrwxdJbNmnFyMycNGlD7o3+N6LDd7myxeugQz+UY+iPoWN8bZRwjdm
         f2fOPOb4oTLzdNgIrlP61qpaTvjqbHif7fnR6Thf5UKXBHOfaLaWXnkLN/GHHQlxLvNT
         GRMV0mWWC6n/o013p5dC/FLNvSUSnHX2CmF4J6AkUR5DHBwUQvXDCSCoicmW+1XObvXP
         2yHu4gI61OG0eVcjWOBBdKvtOBuSMJItkAzzNK90WS5Jdk7NQ38hX1t/IQwY98MSSKoy
         ALZtAnyf9Tq2lAwqgOCUzoo7S5QvtgD1ZdjwO5RScqKjmWfWHvymjn7QeB2y/VlWjJIt
         bnGw==
X-Gm-Message-State: AOJu0YzD3aLO5hN9gTZqLdHvgVkmTv2lekVJm9JRq5iUgJshMaf1o/Ta
	hwlbXgE5ExJfse8jinT5kYs=
X-Google-Smtp-Source: AGHT+IFcETFj/oKRRFaJskEtRT6o9HH2LTa6JD+haJuFS6IARBFit+gm4Kgmo7zEcdxR4ZEIIhMPsA==
X-Received: by 2002:a17:906:7389:b0:9ae:406c:3420 with SMTP id f9-20020a170906738900b009ae406c3420mr1136945ejl.30.1696404353820;
        Wed, 04 Oct 2023 00:25:53 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709060d8800b009b654751c14sm2270190eji.47.2023.10.04.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:25:53 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: [meta-oe][PATCH] libvpx: upgrade 1.13.0 -> 1.13.1
Date: Wed,  4 Oct 2023 09:24:43 +0200
Message-Id: <20231004072443.2870686-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 07:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105329

From: Benjamin Bara <benjamin.bara@skidata.com>

Changelog:
=========
This release contains two security related fixes. One each for VP8 and
VP9.

- Upgrading:
  This release is ABI compatible with the previous release.

- Bug fixes:
  https://crbug.com/1486441 (CVE-2023-5217)
  Fix to a crash related to VP9 encoding (#1642)

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 .../webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
index 558b448ba..eab5546a1 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "d6eb9696aa72473c1a11d34d928d35a3acc0c9a9"
+SRCREV = "10b9492dcf05b652e2e4b370e205bd605d421972"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.34.1


