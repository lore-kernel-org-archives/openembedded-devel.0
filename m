Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DB7C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 08:35:28 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.70032.1744101320214730311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 01:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLkaKlI+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac29af3382dso860974566b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101318; x=1744706118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yry5a2a501pUTH2j/EW70Vv2l0JXkdeAK4x9gOlCuaw=;
        b=HLkaKlI+qmJnXCiS51OnwlKHUmkHAHPNq6t09zqE14expXhOkVs3dHNhM+sGrhhBRy
         HdP/dXvrZ+fwAjnQJuGfCuBvjh7lra1VvXIvlM6L6ueYPxvySVLhiYiplrYjdlVrdNVt
         pq2tjbkd4jwYnyOnip0ukcgYGUTUDlwRJqhZ7jaAe+VTUxwa7YGC1tvQhcJkigIWdmOZ
         BudSn2mmkN8p4kwmptdlvyGDjR1iwhKbYb8KAM9XdkzCteu8KyECpfUyl76DCpXFzRtB
         JjKFf+Zxeo3NjPiNMEO/VK068+ToZh03P8ir6uXzt1KH+GNl84zEI4cYYONNUyDxgme3
         2FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101318; x=1744706118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yry5a2a501pUTH2j/EW70Vv2l0JXkdeAK4x9gOlCuaw=;
        b=abnglBxVvIZjMB2hPSt9R1r5X8MNNyd+4tzKwRStopL2R+DRWq4LJwkeFkNKSdWwyf
         VBI+o1PY81oHIU/cb4KJuko2h5u0zrUhx/cC+K/t/M4wPlR2zTKV2F6l6vyZJL7HqH96
         S8UW6fL0lfky8LiI3Ef2BNQYPQ77kJ2i+KeqW9uvXeMJR7dZmzvLD9+0iltfO7arNtbl
         52sTqTvQ1DZ8OBj7Oz6Bt1DpmxpHlL43hSGjY6c7cv/J19ztysr+cfxONCcvJm3j2Z+o
         v+DnwWvfKfsyOktnPWYl278CTBFwXcj1M1Y4O8o4vfG3lhn89xyiJM8M1RasHXYJfaLQ
         BWGQ==
X-Gm-Message-State: AOJu0YzP0TYUFUzw7oVPzYBT1r2v4ZqAP8b3tz+zfNdMsPnFtdGM2mBF
	8wHz2bJzEdYEXH8vlj261F1TG24qlcuSO003W6Hk3i0C09+r53SxIhJYc5kX
X-Gm-Gg: ASbGnct2IW2/r42JoJXLjtyNluoO6UYm6JXQIJOiX0j0whhjQfqj01exyaG37qAKjwS
	v1nOqPPqzgXKAJs2iu86hNDpm5gMJKjqWtbpg5Z/RC572Xu/zxFTCpEHKc8OxnUrK40H92EDK6Q
	lECoR6r6veqTaxOPpFkSdNbjAf6q5n3zMyK7fblsbVVEAPCGSVHv9/N975lAKN1/mhP4+d7g5Ey
	YK9tHch+QS4d73rXp7DmIm9VPXoXdJ9ungTLi51xES8K/YJzleYZfXK7lov14VYH2G+LTifK2Dj
	Ml/Kql6HfaXiGqOex0iJ6ym93VXsvq3mD/Ceq0Jshzc9P8c=
X-Google-Smtp-Source: AGHT+IGUy6WyYuQF36ZXpdsIkmJB6pipkU12GWmxt9x9cdUhM84kdkZOq1xSLVlvbsMwDVtpbQYvqg==
X-Received: by 2002:a17:906:6a05:b0:ac2:d5c6:43ad with SMTP id a640c23a62f3a-ac7d6d64902mr1230100966b.30.1744101318211;
        Tue, 08 Apr 2025 01:35:18 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c01bf898sm868758166b.164.2025.04.08.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:35:17 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] icon-slicer: add x11 to REQUIRED_DISTRO_FEATURES
Date: Tue,  8 Apr 2025 10:35:14 +0200
Message-ID: <20250408083514.70920-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 08:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116695

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ebb0f0f810..4b61548486 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -238,7 +238,7 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     grpc \
     guider \
     heaptrack \
-    icon-slicer \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icon-slicer", "", d)} \
     ipc-run \
     iptraf-ng \
     jemalloc \
diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index 8079f871d1..f9ae4de0fb 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig features_check
+# because of xcursorgen dependency
+REQUIRED_DISTRO_FEATURES = "x11"
 
 BBCLASSEXTEND = "native"

