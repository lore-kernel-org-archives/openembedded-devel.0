Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6B6CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:00 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7584.1790849216528781657
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K8i2nU7M;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so25935935ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849216; x=1791454016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8L3meQcrSPTmwrQbd09hCEmeErVyXxUwAOXf+YoxDo=;
        b=K8i2nU7M6BnDp74Z/WizB1mKHYDxPE3G3NKPuOxT/osSUBwReFno6S+KXk9cCLZhl8
         elFjzgnquM99cOw9FjDlsbv6q8Zml+iWKVc08JCLyrVQl7Ob0On4y5WiaKtLEHLcR2z5
         SEFOPLW7NuXVm0vC1ELx614TMYx0+YuMTGZTPWsb3qlSLaE+Gc8Rm8iUh/MfhhIoVu3j
         WQ4XsM8xYWimsz0Sg1Qu6jCvWwE7vF3BVSrZ+m0eWqCLb0KC6lzVAkdhBqvycv26xgI8
         NYD/D1e+XI/MrM2m46QZ96BlWjgnnn0kEcgkEcrDrY/VOWrldUZJmeqzDv6GQHjqFurU
         IZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849216; x=1791454016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8L3meQcrSPTmwrQbd09hCEmeErVyXxUwAOXf+YoxDo=;
        b=Vl3ZRr6FxABva4mTgEGBrnXlr4nX0JgZOzgBdpnNOFQsS6ua2u197C6mwmywbgjSNe
         ja0GJ5ETI4m35nJ7j9VGxu3+u4v8F5J1MBukR4NPois7ZbXoGG4ukEYC3QOKM57ZYENb
         WbMd3UVxMztDUI7fn464XIz5EIDvu4PrNjUVk9cUcwF+Zrk87Ubt6X8zQTFg+dnmjKzV
         7C4kS5I1OC4KQuG5IvaqfV+R7eLNxWFjLpHNLWTFaPPeHcq73VWRS1AWt6TTNmTFo8B1
         QyRvai74yMYpqMQ6bF9D6aDRAIhlc+fJxQe/AlgcjThCSdbbamiMGSN1bKdGZOqoAtEf
         bZUg==
X-Gm-Message-State: AFq9FYIZYIIeeLBrtqdj5Vw1nULBB5Kj5lbPPx1Ul6LP7YkX1Hnv3Bc8
	BzhuI8IdMhQHy9+KA72ABAG+7l9fMxOifNmAg+wYiX+rEi0v5DeLx5QFNi4TUA==
X-Gm-Gg: AYBFou2mLqfh2Rn/XVcAIv4Xk/t3i2vDC8EJ1uFFKDVQOYfQw0o85mjln2cL3xZZDOG
	MGuj7+jh8R7BVkoNHIpYNrTdJKBL1tPQaQBGehrTAkWQrb3TjGC0ipohc/Bj0/a/CSRGbshFdVi
	ipkpP8uIt5gFIOh3eJk6MYhNE3BBDJlbIDV/JRoLAjqeK65+Ni6iUupaVWV3Ds/i3d3AJqxdVDS
	7akWrQtgYOSJ8CC6Y2UrNuWqmmVhgxVDi0xvTAJ8aS9m7IATiDGMdh7lEtxNW7bGTSC8dYxF+aM
	9wx38EJeH/RWRjIRORpctVtfQnUVRqOM/T7wotJxez8vZEk4xRcvklUkCc5NkoLo7uC6w8b43+J
	VQJAhYce6Hg2Ksg5nW80OjKOu2FjLaE3Em0OcwLkb4jb4OA9q0ycCvwqOrZhdjG52Entvzwwpk3
	Bq3c7GtZi/mRdSqTb4J633+N9n3N0aoW/2c593HR5WjyHslMhK/09eR6I5rRvkUwYsrFbI9rW1D
	T7UOUaD4k2fABIwheqL5v1IVgM8k9onxH0pA+zGhsX3
X-Received: by 2002:a17:902:f606:b0:2dd:c100:7cc2 with SMTP id d9443c01a7336-2e2f6b76994mr23730275ad.62.1790849215751;
        Thu, 01 Oct 2026 03:06:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/11] libmikmod: upgrade 3.3.13 -> 3.3.14
Date: Thu,  1 Oct 2026 23:06:30 +1300
Message-ID: <20261001100634.1992725-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130573

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: update license files to latest FSF versions[1]

Changelog:
https://sourceforge.net/p/mikmod/mikmod/ci/libmikmod-3.3.14/tree/libmikmod/NEWS

[1]https://sourceforge.net/p/mikmod/mikmod/ci/aabc498206be2c19052f7562c4d9a6c02df2f3fb/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mikmod/{libmikmod_3.3.13.bb => libmikmod_3.3.14.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.13.bb => libmikmod_3.3.14.bb} (82%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
similarity index 82%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
index 8ea6c2f227..2468943349 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "libmikmod is a module player library supporting many formats, including mod, s3m, it, and xm."
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "9fc1799f7ea6a95c7c5882de98be85fc7d20ba0a4a6fcacae11c8c6b382bb207"
+SRC_URI[sha256sum] = "dffd82b8f254c3489c32098da831f33eac7136843d1e7ccb802f1254ad5b4219"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 

