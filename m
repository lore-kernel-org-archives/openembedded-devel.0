Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3D9E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:08:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.33029.1733476125471189271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=U1HTXD1b;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a8640763so12774105e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 01:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733476124; x=1734080924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+E6npn8ZhQGdwEUvCOSqe7oGfXVHPDaNHI6LBq2RxyU=;
        b=U1HTXD1bCJy/cyU2qVhQ0ZcDXJB/PoiSqBoYuDfug4GNiK/Rnd7xdcPcsQMn2sUbWE
         h8R5JgKJpVWUJrAHKIcRgAchc9n0yiNixqEiVtDFN9rSb8+d8DffZxBzdmJvIUiCkq7P
         96iTls6emIYNgvu39H1JyrI2o9K0FJ7gjigO/zryo80UdQOifgDsuTLn/wgUPSLQmnjQ
         v5hpPEeQSc9FPlxSxGF1VJkCb7Xum18aZdpJkU25T+gum/roVOq0eWQoi6CNX4mMgfda
         5/S3fGvSGirT4r+vo7TwugqDXD5bpYGPjF73Rg08zr05i3nj6PMYtdbBcbPH9vwVhxAI
         yvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476124; x=1734080924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+E6npn8ZhQGdwEUvCOSqe7oGfXVHPDaNHI6LBq2RxyU=;
        b=TjJdAZZ3IwVap/v+w4bjBVpWxv6sdF9jsy6iRTIOykGXQR0v2dVBwQVxFGiyQKn3W1
         wu1RieAcQc0No8foU3KbAhwmgrLu0SpcGxXp8mfk+4VBdTXmVSi7nJsI9jn3CKIpKqij
         a0+66GKGuVXqp8h7Y9AfzqfQ9HuZ0Vr3ZOt2Ke7gxpeVVP0rzEKA8Iv8SxFEGwBJ1Vsn
         AT8GXw1b0kt7QiWCWxal9UKl6b2VkXYWfXXbr9eVCix1zrdCA1hk8h+cDg/9a0oelaov
         fXrhhsXF/HZ6aJD8AR5kPJPImY1gQNGWkb1f11FrfYGaQElz2tOLmly20SXoyPeSr4AZ
         HggQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8bOwkTHikbmUdVmEMevPQG/e27aL+HCMRsHx2RDAEZc6azI9yvNJxcTpHPNwC6WOrrdAQDBrYCVcrdChbDMBGxbU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTaq0+XMGx3H9ihZSAz1VsPOsUssSphqxQdaAq8wsngIW7iQ5/
	G3OtNtl+P/HNS2gEqrvBiSw2PWbp4CYaUIbP1BQuRTjqohcW8r6Kz+gFm7R8gi0=
X-Gm-Gg: ASbGnctGDTJXZPO80Z311lz+cWi/iwgdqBvYzjXi9IOniqsWzloJY+NM3W0Jqal1l/l
	laRnv0i8S/4if2NuVRyr9bwZVPIo4HAyZJCTTbIMtkWFwYxNIE2bfL3kY7AWvZ55QLnrMSxUyNo
	Q6J16mW1BWkIL1SY02DaGPNVfs2xsoQckPg/vpzbqZEqFSXtNfYy5da2m99d781r50W+nKiUfVh
	/+lFSwm0PK9uSZberAXy13Eo3QhWql0RnIqeIJyz4Op4K5GXA==
X-Google-Smtp-Source: AGHT+IFLDPb8Nr0RdKzbqLI/oGoYKt3WS6gZCxwcMFcjxFoLYNKuE6lp/cLESumfTIxB24RBOdIA2Q==
X-Received: by 2002:a05:600c:1c93:b0:434:9f78:17d2 with SMTP id 5b1f17b1804b1-434ddedba79mr16962135e9.29.1733476123743;
        Fri, 06 Dec 2024 01:08:43 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621909952sm4013081f8f.69.2024.12.06.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:08:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-filesystems][PATCH] xfstests: add missing run-time dependencies
Date: Fri,  6 Dec 2024 10:08:42 +0100
Message-ID: <20241206090842.13692-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 09:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114213

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The test program passes command-line arguments to hostname, grep and
mount that are not present in busybox' variants, so we need to pull in
the real things. The recipe also misses mkfs and findmnt programs so add
those to RDEPENDS as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-utils/xfstests/xfstests_2024.03.03.bb            | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
index 8d997ef643..695d81c2b1 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
@@ -36,6 +36,11 @@ RDEPENDS:${PN} += "\
     xfsprogs \
     acl \
     gawk \
+    util-linux-mkfs \
+    util-linux-mount \
+    util-linux-findmnt \
+    inetutils-hostname \
+    grep \
 "
 
 USERADD_PACKAGES = "${PN}"
-- 
2.45.2


