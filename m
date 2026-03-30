Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D51AFB3D17
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:40:00 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48217.1774867190280075046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b3kmH1UP;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1090553a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867189; x=1775471989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nkfN4sUQEl7X/Rx9sKAuS3AJQGolQfNHCn2Cfojf0o=;
        b=b3kmH1UPB/FxF5HVymAZF+LRc3bFA6BpSIV2P4riqFyhtVR0hivuG7b3sNvwvGxVqH
         awvbMCnt/VA+fPRaxs6mSp3nsJd9nMrx2tvW6e79N85D1MQtrdmirF9x2EEN78Jeqgpt
         wbmf3ojdRwZhGARoeANwaPTSl0yVYeteIDhG42Ch40qCwhDxBngtw3kGHXm2sj4NSZR1
         ngxO4LCZPjIhgFUdbPOSK6Vcg04eIgkWiJwc+fAxzvUevfs+AcD+HfCCOb7Yv92d8s3a
         o0r3sU1aCTTA9YXqcWOIopLjyqR88Oc82ckQsQoIfaBV2jVt3OXVsHzFRDiPA0dEXe1j
         THWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867189; x=1775471989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5nkfN4sUQEl7X/Rx9sKAuS3AJQGolQfNHCn2Cfojf0o=;
        b=fXztS90NsuxSdojLIitAyczQil4KwdiQwVVahUY/kr5fEE6abGq3PL5T0PmH1ikeqV
         kfOSLFIJf2VzMKwwcNWp6d9UwI5vXG40xda7oZxFRmKzIAK6/dQ6GCrNlI385WGe9L2r
         laFYZEQKcGP53+56NMwcG8sUkG5b11sCQVNuoEqp9Jovu27tZEkJ9Ks6VnzJXQFrxVjI
         4EdI5RQALuj/1e/CwyDKg2/if3ifde5GhpSVe5/7UlHOYLrupqc+VJ+1g346jMVpWsly
         lGcFxYpwC5RLdfnwbk3t9nraCqF6Sfe2SLJspAKkswVRQYAExtyNS1LANxX4p/5WhJNH
         DtDw==
X-Gm-Message-State: AOJu0YySPCkHuf5AH0Lt526bEXqCNNdTDw6k5YKXVbt6hDi7vqaLf64g
	mK8ZkSlBPTdiVPYBBc4tfdUPOApHHdpB1SkDkEElKCwbw83x2K4gdI7HIBsntA==
X-Gm-Gg: ATEYQzwM4mAbLS2IJoVg92Ysu+2hXxIVPqH/ZauGnU85pBH5JK/DKi9qlmgzytJYxxe
	872MAJsKM2vHWasQ+Ddny5TSDuH+ouAO30Ez7tCBd1FrF9yRB8GvCip5J++dtMzqYQVuP87DR5r
	gC1zpo2Nj7BitlIrfor15UvwnxzNFNt65cZLjAPzB5WQBkQZeqYAGHvY//BJwdMMh+JQZHE3cBf
	ckK73LTWYWBSaPhXk/DTYVpXksMwMG7yAhNp/y7JcaVSh0NjmS3+bJkI97zqeFrPP0OHuJqCP8S
	yvo+sFCkOVv8+jd+LPKyt5x+KzFacr8447vAy+iHSfSZ2XTV6ypTYs1EOB9a6DivhpCynszlhrr
	pcoG67amxgZsFALlsC90Xxfp5utChPSnlH8OfhmWDr0BIIo1sqiuamRmBq8PspE0+8Dq/Hmj/U1
	znk+l5GV2d3/VY1AnnzmZr+VvRzqpnheugDxQ=
X-Received: by 2002:a17:90a:710:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-35d95eb8b32mr4874182a91.13.1774867189521;
        Mon, 30 Mar 2026 03:39:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Zhang Peng <peng.zhang1.cn@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 17/19] gvfs: upgrade 1.58.1 -> 1.58.2
Date: Mon, 30 Mar 2026 23:38:44 +1300
Message-ID: <20260330103846.3381644-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125860

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Major changes in 1.58.2
=======================
* client: Fix use-after-free when creating async proxy failed (Ondrej Holy)
* daemon: Fix race on subscribers list when on thread (Ondrej Holy)
* ftp: Validate fe_size when parsing symlink target (Ondrej Holy)
* ftp: Check localtime() return value before use (Ondrej Holy)
* CVE-2026-28295: ftp: Use control connection address for PASV data (Ondrej Holy)
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters (Ondrej Holy)
* gphoto2: Use g_try_realloc() instead of g_realloc() (Ondrej Holy)
* cdda: Reject path traversal in mount URI host (Ondrej Holy)
* client: Fail when URI has invalid UTF-8 chars (Ondrej Holy)
* Some other fixes (correctmost, Ondrej Holy)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 57045ecd657e9d50fa891b4a7c0c91aaec94b7e1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.1.bb => gvfs_1.58.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.1.bb => gvfs_1.58.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
index 6dfed59d86..e3b90950d6 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "fc537d6bbab1ffa76972df7d4a1819b0c0fe19ebd1dfe82421d1f32e14b5dc3b"
+SRC_URI[archive.sha256sum] = "ad9d5bf0b45caf232520df0adee51eb650200b0370680f80a350ead9d1d61ddf"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

