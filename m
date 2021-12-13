Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D4C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 05:11:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.7616.1639372290251353960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 21:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RRa2Vxef;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so12345994pjq.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 21:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDO28p2QpOs1S4rnDrja5R/J0vADm9x3CeHYOxkNA8U=;
        b=RRa2VxefmLW/LcxybfewhtRZam26QnF9l1H70pTOysHQGZkhTG+K/DyAQQ2r3BXud+
         UAt+r7+VCmv7knlmnhmL/J9fr0mTttp0Tg44T0NkYTbUYVAKSAhYJqLcDmx+EpE7wnmk
         57cE/Ai8QstHYe+3YxwaePsAEmBNQRm7FnP6YTBRHm2hZqTFb7pIZ45MWiq4h1nGm5T/
         RZtVznOfClG+6L07LmCq6hioj7hOtZyUPAy15fKUVVsh3Kh41bOiLxUnLVQUjVF+QHWo
         rTyVf1kfefsqNLJ+RpUze8NezgWGjKGtlTMuWlEQWtptSGm2xb7qyORK9p+Uye5EQBNx
         TQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDO28p2QpOs1S4rnDrja5R/J0vADm9x3CeHYOxkNA8U=;
        b=c+J/c5kKebNrzG4MYCJiRPWY74H8n+n2KrmIr9YIv6Qq4qxok19cd6pWCXiGGZNcFr
         fUk6q62MCFKKQdBEonJB8xYCdWFbEQun6Z9KyeuobEuGkXOf7G++znQuOzFmBfaN24FT
         8BnaVEx+d/O1dCXCJmOjN55g60cf+9w0QYTFU6ICm6RBwmCpiiSqEpEUozjZFAdTGsQh
         xK1H4tvmDGG+9ejGvb/CBAmiG1TItg63soCkCDNIbHSzQm6DK32E5PFO6jI+5VPSprBo
         wPADP7xI4OZJMB5P2J3QKzYtszzaD8XkKb0qVBZToG6Tp0H0Wk2THJWKHxBHwa4k5mLS
         Hgrg==
X-Gm-Message-State: AOAM531+0ElOkR4cb8wnrQuZFjyH1VKTCiWH6GS80/yAJgf5HOym0+MS
	5HP2ElM6GvcjLqVcJuBbNTWRpGcNQNE1rA==
X-Google-Smtp-Source: 
 ABdhPJwpkLNnP1q4Zp4zHI/lXZoYbSJNA+fVCV/MmIhCSu4y+3WjbyS+SUcPZJcrocmHe1OuDnrgLQ==
X-Received: by 2002:a17:902:c407:b0:142:28fe:668e with SMTP id
 k7-20020a170902c40700b0014228fe668emr93155346plk.31.1639372289502;
        Sun, 12 Dec 2021 21:11:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 x18sm11281544pfh.210.2021.12.12.21.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 21:11:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-oe][PATCH] surf: Add soup3 patch conditionally
Date: Sun, 12 Dec 2021 21:11:26 -0800
Message-Id: <20211213051126.1743546-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 05:11:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94310

This patch is only needed when webkit is compiled with soup3 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-graphics/surf/surf_2.1.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 710ed9bce9..51c14624af 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -9,16 +9,20 @@ DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+SRCREV = "bcd7d74e613fb8af11b40c351f0a6c1a771b2d2b"
 SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
-           file://0001-config.mk-Fix-compiler-and-linker.patch \
-           file://0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch \
            "
-SRCREV = "bcd7d74e613fb8af11b40c351f0a6c1a771b2d2b"
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://0001-config.mk-Fix-compiler-and-linke,ig.ml-make-compatible-with-webkitgtk-2.34.0.patch', '', d)}"
 
 S = "${WORKDIR}/git"
 
 inherit pkgconfig features_check
 
+PACKAGECONFIG ?= ""
+
+# Enable if soup3 is enabled in webkit recipe
+PACKAGECONFIG[soup3] = ",,,"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install () {
-- 
2.34.1


