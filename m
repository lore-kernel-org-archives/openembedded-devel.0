Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D2BC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 18:07:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.942.1652724451887326458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uOVJAXzi;
 spf=pass (domain: linaro.org, ip: 209.85.221.48,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id m1so21589423wrb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWqNKvM1314Q2C8t7UWMLCIRPu0QfeDZpE2eljfNw=;
        b=uOVJAXziCoBH1bSJs5uAzk/JUni7U9qtVKqm0txCKPc4FiynpRHEdR9n/fv00Io6ue
         XZJI3lkMhOpJuemt9wwfZyK49NRd+mhCzK/RwiZwlFxsgaGP5z8DFV+g5Eeb5fH3tfRo
         Rw4NW//GKN1P+HIbLKJget+jeIRtUXduaWpEFOjD9qEVefUkTOSwX2FEMgpZasnMP4LU
         RZJNpiPPRg0qJOynJ/lgtmGIyKSGWqHbNQJjad0e8XTnUAQRLpFgRrNYVuJSGWpnJiVc
         4woF9n8RPK1GEDjeMGjS3FKfKj6dsjevkqO9q4XC1I7iH5YsWZrR7zOpq3GJJWkz/hct
         p0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWqNKvM1314Q2C8t7UWMLCIRPu0QfeDZpE2eljfNw=;
        b=FdlZ6/OYUnFRcrltKpdAzM9M7JNu03VVg/s53SdclhH+QWwbmRMZFkqOQtETw8KAHh
         SilYPB1wg/Vqp0a1XSXmQre9Z9efh5pGXomHJzPIKtM5YyEOHMJ7yOVK1AAJ4IMUbOg6
         s11xVK3caKt1slvj6RJLo/352FpNTdSz/GV/jr6gwXDG+bwJo/6Bi9qDxFeMHpaBSkfG
         bhf34oJDmBpaRvzMPT7s1T+CCcrSXi/n7MViWGiARF3HoaHt25rMiHI5Ei0Gl0gVWK7g
         jDCKIIgadKDujh6XSksM2b+iB6mtxC66DIARI7Vwg/NeFAnL0ZX7S689156kVvRjRl/t
         tIPQ==
X-Gm-Message-State: AOAM5327/V63SnM2V4u1R/YJCkanakdKWXlo8MHpDVJZz12fL6IYIvOw
	cgobcKi6RH8ldcwxqraFmQRnmrHT/73WA7Qu
X-Google-Smtp-Source: 
 ABdhPJyFWEZN5fGph8DqOfGxmd3b5rAa/zcSgYVJ/knmwIAetp5u/wQGYU4fFKPeOWcKDjsCWMMqxw==
X-Received: by 2002:a5d:64c1:0:b0:20c:6ff9:3a61 with SMTP id
 f1-20020a5d64c1000000b0020c6ff93a61mr14905316wri.709.1652724450243;
        Mon, 16 May 2022 11:07:30 -0700 (PDT)
Received: from matterhorn.localdomain
 ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b0039429bfebeasm681673wms.2.2022.05.16.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 11:07:29 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] imlib2: update SRC_URI
Date: Mon, 16 May 2022 20:07:27 +0200
Message-Id: <20220516180727.583825-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 18:07:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97143

The upstream repo location has changed, it's now
https://git.enlightenment.org/old/legacy-imlib2

It's not clear when or why it happened, but the the commit hash we use
in SRCREV exists in the 'new' location, so let's at least update the
SRC_URI for now, and fix this warning:

WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL git://git.enlightenment.org/legacy/imlib2.git;protocol=https;branch=master, attempting MIRRORS if available

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62becef1091d21f487e826df7be7dcef3ab8f94c)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 56d41cd39..869f8123d 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
 
 AUTO_LIBNAME_PKGS = ""
 
-SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.36.0


