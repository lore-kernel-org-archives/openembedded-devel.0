Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7DDC25B78
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 01:03:33 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.2796.1716944612777531535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 18:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4ksntZM;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-248f7fdc323so817174fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 18:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716944612; x=1717549412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBOxeumOVFiGBrkk1JEbK1m3+9yD0vRUjWqoV564pSk=;
        b=V4ksntZM9JDWiWN7rMyYMXANXgAAGwiXlk1Z4FdfHMlGvQUcZX0w951SgV7NnTKrzQ
         aWR6TPudFhtnvJT6BbiwH6piHXbk0bnHmPC+zjk/nanDb9L/JhULEUXubO2JwXXRJ9rC
         XuvCrAMQCdJXYVLFSS7S6G6xqCspIxvcCn9sZw2IyzZFZuk0DPDWHgUZH/sxHi89553Y
         Fo/pKmpOgqk96FYRBzsC/z8I6x987KN8Q9q6Wrw9co/l2XF7bD81SKraWIl+R8JPaQoM
         kxs1NRvooD4cMXzyqs96wrol7Lsew4i2azJgyUbtusD8TdXIJjGKZUgpiy/09/YZ/+P0
         EzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716944612; x=1717549412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBOxeumOVFiGBrkk1JEbK1m3+9yD0vRUjWqoV564pSk=;
        b=FmiGiV6a6Yjxdfvzeh1I0WzVSGVzgaSMM6+5P2zgU03J/c644AclH6R8X8+y3Pugyh
         swI6NknSrbocqP2S1GdvunPWgbB3DhAlKfhdmf1hw5xctwruX67NcO4XLyoaKCfkOCBP
         kOHOWgOSk3xN39q0Kx0AIBaYc++82d5PxxIphUZEDAZ+j437Z0FJtnHfzxEvc/LK/BCK
         ajv+8hGv/Bg6OmYp8URUj1gMZD3rPBecndicwfq0FsOluZ1jqQ4Bi9adyjRQAloo8/mm
         Jj+cLJI/xlgcri6wa1T1WO4zb4Ik5aXJPFUAPJEoj+yEVuFu4k7iNCNbhNn9/nxZJpDt
         mC3g==
X-Gm-Message-State: AOJu0YwgLXhjBrQ+KE414Njchhm6W+VK+rfM1H8FM4Favv960AGgOLqe
	QIli3vcP9+sSxpPM2BbbhqhhIPhJ2XioG7ERE855443Jd68hoc/sQoMiBRSZ5ws=
X-Google-Smtp-Source: AGHT+IGBGTYuWDNTX0pbj/3+KaFstzpXCtrckqbJ9lT8OPJFky7wtKnWzwrU9vXAXE9YzfkVXi5m4g==
X-Received: by 2002:a05:6870:315:b0:24f:cf39:96a1 with SMTP id 586e51a60fabf-24fcf39be57mr15022200fac.12.1716944611536;
        Tue, 28 May 2024 18:03:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822189197asm8050321a12.20.2024.05.28.18.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 18:03:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] catch2: Upgrade to 3.x release series
Date: Tue, 28 May 2024 18:03:28 -0700
Message-ID: <20240529010328.2079536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 01:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110598

It supports C++20 better and newer compilers e.g. clang19
works better with 3.x series.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../catch2/{catch2_2.13.10.bb => catch2_3.6.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.10.bb => catch2_3.6.0.bb} (87%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb b/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
similarity index 87%
rename from meta-oe/recipes-test/catch2/catch2_2.13.10.bb
rename to meta-oe/recipes-test/catch2/catch2_3.6.0.bb
index f8080c8f97..52045bd144 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
-SRCREV = "182c910b4b63ff587a3440e08f84f70497e49a81"
+SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
+SRCREV = "4e8d92bf02f7d1c8006a0e7a5ecabd8e62d98502"
 
 S = "${WORKDIR}/git"
 
-- 
2.45.1


