Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCAAC6FA90
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.19284.1663590829949256404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m2n/gTdY;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id y9so21684423qvo.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=SVYQyxL4AsrcVL5XeyJWufYlbxinHZtQmbPbiPNSroo=;
        b=m2n/gTdYQsVDXnFMEvzk7O5dae/lCl4hPH5gqApRNyOSxqP54q6ggdAeYLQuNrIsPn
         8K6qFLyiykyNTx8fSgrkpLqXN21KzFbTayqTPhgFwMbS3EDrEoRgsTdhOVwlqht5jY4q
         4Or9UKGjjFDRb1NGnuzj74cOSHVex5O2Wa6AV4i4Yezx5bEuGXTCCfmVHROKjBoUptsk
         juYiHEBFb4ld/Rz/GWL9GvSwb+kFORmVOIM3K8Llziq7VzYjmkwUdXCB5qx+r7S/1xC3
         cZvYcwQ+JRh/8e/fR2iMuAZm/1tfT2XtJc5EtnJ1ho1PeNaPZSZVWeQmi5aRiZT4yH2E
         fsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SVYQyxL4AsrcVL5XeyJWufYlbxinHZtQmbPbiPNSroo=;
        b=XXfy0duxYQ39VkvMzLpoadGzvtpszMdnRfILsPRFpyz1PDsGaLFJfQJRmusaMNMkZ9
         Y8fzirx9elSPQDmBl0nf2e8UFSCdb/QTdpMLx8q3/vX0kJ04f/jvHDp9jyudFW6blILI
         Zf69/KNC5UiJjno6l+LGti7Ol5s+GZ2ismI2s/givhtXwKUJiLCkbSgg5iMCF85ySN9i
         T7N6RvWjKjn+adWSXbiQRLvxVEBuAJs06FdF2ZKLgOz8DHthnnLNnBLzIeJtU6hPD5p7
         wTjbakZmAIhN+VLauvisEGCWLEzrekSD0cNxDOE53IjwrmkJeeVnZG+5mYfMiMBSJeuk
         jh1g==
X-Gm-Message-State: ACrzQf2DC86xq5hFPIHRwiQlICZ3i6xerLRaZYCWnBWvmjIBJuVcayCY
	lNmUoZv6vA4OdhQJ1l8qjO/v0OD4/mM=
X-Google-Smtp-Source: 
 AMsMyM68WG57/i3V/WmNHY2mzqT0Z801Z8rjD51SoCejbR62YU7xuF6EuQywbzYTzJi0Ekf3FQuAHQ==
X-Received: by 2002:a0c:e0d3:0:b0:4aa:9d28:6603 with SMTP id
 x19-20020a0ce0d3000000b004aa9d286603mr14180885qvk.91.1663590831310;
        Mon, 19 Sep 2022 05:33:51 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 09/11] samba: upgrade 4.14.13 -> 4.14.14
Date: Mon, 19 Sep 2022 08:33:36 -0400
Message-Id: 
 <b19f3f8c40de3206566cdf092dcd8f329781ef7d.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98860

From: Yi Zhao <yi.zhao@windriver.com>

This is a security release in order to address the following defects:

CVE-2022-2031: Samba AD users can bypass certain restrictions associated
               with changing passwords.
               https://www.samba.org/samba/security/CVE-2022-2031.html

CVE-2022-32744: Samba AD users can forge password change requests for
                any user.
                https://www.samba.org/samba/security/CVE-2022-32744.html

CVE-2022-32745: Samba AD users can crash the server process with an LDAP
                add or modify request.
                https://www.samba.org/samba/security/CVE-2022-32745.html

CVE-2022-32746: Samba AD users can induce a use-after-free in the server
                process with an LDAP add or modify request.
                https://www.samba.org/samba/security/CVE-2022-32746.html

CVE-2022-32742: Server memory information leak via SMB1.
                https://www.samba.org/samba/security/CVE-2022-32742.html

Release Notes:
https://www.samba.org/samba/history/samba-4.14.14.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0afcb4be77acdb7af3624278ebd5869f0e88bdfe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/{samba_4.14.13.bb => samba_4.14.14.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.13.bb => samba_4.14.14.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 49e93fc536..cb3678d7b6 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[sha256sum] = "e1df792818a17d8d21faf33580d32939214694c92b84fb499464210d86a7ff75"
+SRC_URI[sha256sum] = "abd5e9e6aa45e55114b188ba189ebdfc8fd3d7718d43f749e477ce7f791e5519"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


