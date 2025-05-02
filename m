Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B576C369DC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 01:28:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9939.1746149281275733371
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 18:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SP/BOU5I;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e09f57ed4so11468755ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746149280; x=1746754080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82kTGekdPkwRe4ybVzhMF2+v4y0QpvuK3r7v6c1zthU=;
        b=SP/BOU5Iwrdk5JJhb1E2xIf8/O6pxbY67VK40sr+0q9iE7iiUw7dZRTGSBKe+WByqO
         6LkS7MiiIKSKI/RDrtE7i0Nt/nGzZO8/i0wnosKkx2X5FB4IjugwKWhCiJ7+fCkAsrME
         M2fFyTjT1CaxRZW5C4TP2BRZZKwXv4wEE2s3Jnb2ZX7d7kEIqOA3DiCYT1UMPfgz6b4J
         kQfpCXeE5RF6OSAwgLDT4cyxk9nFjmW6PbBRzoux87XPDBvzWKBLpMWmTWERJGdFa42l
         HfR8LyeCfYPekE15Ti798v0NUgeXC1o082cLD4GIZf79NZxFVrULmSZhlrb+Y9eHM2T4
         j+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746149280; x=1746754080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82kTGekdPkwRe4ybVzhMF2+v4y0QpvuK3r7v6c1zthU=;
        b=lKlWoR77hcTYxVQRbsmQ92d86G6Q3Onb/H13ms76zIw6ZzYv3epYFv+6b/oN58QCBo
         8BMtM4FwPVnISqrXTYwAwCxsHTk8m2/oi0aG6ryt59xTnp6DID8cX0ucxX0rbPZA0+g0
         kdQe0bQYzAffVRCWNVJZi3ftvwANIinSORAjunTYUrDdDMUVdbNPE9sP3JRy0W+cDCPf
         hdE0qrLthCDhOwzSTdiIuEFr2qP1C8tq5iwHfn8ernZfV8ekH6gqvPDkhSgCK/ndTx5H
         tWTvq25Xo/vPuCau1OEdHKOKelrwfkSZA64SDpjfxu8bnkArhyA0n4wBXi4jjOt+nzLq
         AgiQ==
X-Gm-Message-State: AOJu0Yxh8S8UDMhjuEtOmpMbFgNTcIH5q9aS3NE1y7lq42jTBt58j+10
	NM9+p2NO3VKAXy91n2/uKFfGildibz5dKoYnlHM198Su1V8vh7UPolCleaqE
X-Gm-Gg: ASbGncss9kMw23JdQBANpiiKuNt9QcFXNBKfIqYLQtM8bF+2f38RZaCZ6OOyvhD9sQh
	G6Nge5Se2OVgY5YKVp0UIwFecOs4sLTSOUVTDcuYJiwcXv9kTjYTbLevjdgnAmyOdrimOrkSRi2
	RrmIa+9fWJlkRDmoqGrYBeEE6a70zEbsiRfisTPVBIPGu5SoXgKh8iyhJXTbMm+q1D4WGpYUCR5
	/im/L0h4UAcalTcXW1bYJqTOPFpnSUYWMX6Q/F5NofcgyKYt8O5p0cVvSfSYJv53brktTRemnhK
	/OepZqyLpgrcyDuRFa1jwEbqlGHeN3otoVl7gXNc1F8=
X-Google-Smtp-Source: AGHT+IHThHqAM6ct3tnGWCg+VHtg1d+yM7oD/Bh7FXnZlUPQ4hMf00lBNGwkqt8iO9nsDfJyBDkJgg==
X-Received: by 2002:a17:902:d486:b0:215:58be:334e with SMTP id d9443c01a7336-22e1006129bmr16239705ad.10.1746149280118;
        Thu, 01 May 2025 18:28:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::79bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1084da3esm3038435ad.6.2025.05.01.18.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:27:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] mpd: Upgrade to 0.24.3
Date: Thu,  1 May 2025 18:27:57 -0700
Message-ID: <20250502012757.3056877-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 01:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117275

Do not use vendored libfmt, it can now consume 11.1.x so use the libfmt
from system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicpd/{mpd_0.23.16.bb => mpd_0.24.3.bb}              | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.16.bb => mpd_0.24.3.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
index 812437a98c..7250c22a68 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.3.bb
@@ -8,6 +8,7 @@ inherit meson useradd systemd pkgconfig
 
 DEPENDS += " \
     curl \
+    fmt \
     sqlite3 \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
     yajl \
@@ -18,13 +19,9 @@ DEPENDS += " \
 "
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
-           https://github.com/mesonbuild/wrapdb/releases/download/fmt_11.0.2-1/fmt-11.0.2.tar.gz;name=fmt;subdir=git/subprojects \
-           https://wrapdb.mesonbuild.com/v2/fmt_11.0.2-1/get_patch;downloadfilename=fmt_11.0.2-1_patch.zip;name=fmt-meson;subdir=git/subprojects \
            file://mpd.conf.in \
            "
-SRCREV = "b5bd294e5c88c062b1a9c0c4c60397fbf7f3f1c5"
-SRC_URI[fmt.sha256sum] = "6cb1e6d37bdcb756dbbe59be438790db409cdb4868c66e888d5df9f13f7c027f"
-SRC_URI[fmt-meson.sha256sum] = "90c9e3b8e8f29713d40ca949f6f93ad115d78d7fb921064112bc6179e6427c5e"
+SRCREV = "063abb31a68f7ee92a246256eec4234ab8b7ed8b"
 
 S = "${WORKDIR}/git"
 

