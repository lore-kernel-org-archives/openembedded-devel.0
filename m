Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B062BC433FE
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:31 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.3795.1640899890423697733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VB82awGC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gj24so22136478pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wEhkkbL3USYDUq/kZjSeUPxfg1PFc3qU6gm01t2lPLk=;
        b=VB82awGCvncwgBBUr14erW/AmKOhBEXOSF50ud/CQ/ee+5g5eKQWpWik3X7bGQo234
         m4WuQMjANtc6Ar5FRrVEXmbmpxO7xu4JKSIeR6OzrvggpcYBex4x1IvleikY4a9UY0ie
         Z0i+brT+Nqh4FYY8M9Br7sPxHG8ji6jEj5QeyTtpHKLTk4RIiJ215sAwPi/V1bZKrhIw
         up5WggQtIOmZVj7xcD2cpdnexCwcVAFNixHGPyZMc9OfQsN8umEhciqWeSX+OKrV9LJt
         CPuUxwm+o+hIeGXVy/uymYFFvc89EHMMRdWwkWwi1vgC9X8VowDKBj2WqWSCIvqtmUiw
         v9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEhkkbL3USYDUq/kZjSeUPxfg1PFc3qU6gm01t2lPLk=;
        b=n2Cj/R4FzJaQmgGJi7qb+iMB0PhEsWGF71m8wIJcf/RFp8i7LNDjWB6Jy6fTRv21DD
         T3oD0AwTjOmzRDdDlaqLtOpMI68S/euc9aDOwn2sDpNGD9kQ9FE8982Rh/WLpMLi+Qg2
         MaeBdS8AmMvA2aYWfzfx0xl5mBAVFW4Fb/45oEb+oHR8Ra0bH23k4SJq6DoIthtzVLFC
         fg+iRJO1A2+0vj4eiyKDUpJbwbPusYrMwIIsD0b1W0+3lamukZxRCJCKm6u5akx+pyrV
         13g10uoDjC8uVT0AGVS5DEKtnzcyE8KrU2pA7d/SEUMKoedndPa2aH2IuUe/BPxEbuIX
         3twg==
X-Gm-Message-State: AOAM5302xJM9RdiREA6JSZlRRr5fKbi3IT96FJS3NRJHnwPrl1KPG+Uf
	KqXLFc7wpEuLLe77c4CNA6VanINmn6Y=
X-Google-Smtp-Source: 
 ABdhPJzwMiYKLiTKgh/E1ET7lFxDaIN4TW/Jx6rXXR4GKL3qj7m4yvqWL4xexFC2/wtikYimqAwQzg==
X-Received: by 2002:a17:90a:c506:: with SMTP id
 k6mr40329046pjt.74.1640899889737;
        Thu, 30 Dec 2021 13:31:29 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 4/7] postfix: upgrade 3.6.2 -> 3.6.3
Date: Thu, 30 Dec 2021 13:31:20 -0800
Message-Id: 
 <550ea1cab266a9a08e28415529af1eed2d78c501.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640899794.git.akuster808@gmail.com>
References: <cover.1640899794.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94573

From: Yi Zhao <yi.zhao@windriver.com>

Release Notes:
http://www.postfix.org/announcements/postfix-3.6.3.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 45fee2d0cec121808c6dda150b0d9ab990c74a72)
[3.6.x is a stable release]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postfix/{postfix_3.6.2.bb => postfix_3.6.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.2.bb => postfix_3.6.3.bb} (89%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
similarity index 89%
rename from meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
index 982544d5ca..98005797d9 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.3.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0007-correct-signature-of-closefrom-API.patch \
            "
-SRC_URI[sha256sum] = "507323d20d7b3f705f49cf8c07d437c6d8090bed07e15a3c0ec405edad54a7d4"
+SRC_URI[sha256sum] = "0f1241d456a0158e0c418abf62c52c2ff83f8f1dcf2fbdd4c40765b67789b1bc"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1


