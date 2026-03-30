Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CD3FB3D19
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:40:00 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47985.1774867193138804173
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZ+KC8Ko;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2811455a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867192; x=1775471992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pGmrH7pq9TNM5BFiN9nacz8JwacxmdgLotOv+2zkSY=;
        b=CZ+KC8KosLrsfddoI0kiII/XFMPrjVfTq+Kxj1xsMMMEPTv9A8MNg+9e3M4zvBXODf
         VO7f2Nf+arJU1OpZfyYhGOeGtYPeSPBvlTrQvZ3Yynmc84FtUNWoUl6dDNep2G0V5ag7
         yTF064JkSGB+R/9mj3aEvVDD0pmFztN/n6bfR0hgc+03Umh57pe7Vi6uF4uByPZ99cN1
         PoYcFy0qDjp98ivJ/RZ8Gnjn9SbUWsT/n6G5UZxA5uobYzfYOd8pgRTzlQfw/a+v4Kzi
         EMaMCFKni78pCoZqFljUDPqoOSgD4MzJwjFJV7WmKYCnf1Tm3V/457dMR+QTEExrK/51
         8yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867192; x=1775471992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pGmrH7pq9TNM5BFiN9nacz8JwacxmdgLotOv+2zkSY=;
        b=j8vr08IlIMXK7z2h+uGqrwA/uLE0vV+eFI8Yfet6wTJM7s0u+5IvNqatFMPrkJydaX
         HheizLrOLBKbALj+omGDsIGi7iBrL/0nqGUzzzIlHxgiQY1azO9eoHjfDRAz9KEdcMHO
         pryLpt4w5mNcIRuOwtcIXsDBuVkQ9UJyjAKL2ebvB1RrXknJ4Hsk5+Cs2F2G7V1LQ896
         DlshfX7ihsH+iq8idiFy/I3gMyC46ImAE5HEH8sa8K3Xa+52W00SW+1RgqNTlDojJ6b2
         S4JF23LzQY2Di9fFAbVm3NRpAnZMFs3tYN6pQVy5PqB2JLkk8ULFCraiDsCQQlJ5CW53
         XFoA==
X-Gm-Message-State: AOJu0YyMea0zqvjlqbVGXpyxDVUgIBN10fErj554IBTY9+o9q/e2+5Nm
	gRGK4RD21fQrTw5lSzjWm8j6F+5krKJeI0rpFvSEAz45rtcok14fvMTiN1V7Aw==
X-Gm-Gg: ATEYQzzijRaTPqsAbwnyj1ulk15gTBHY+UJXfakbKDiDuoc+jfcXKzxPV3aXAROPANr
	nhFUDzVrkdaAKk9IpN5/tvKZxKTVmwDFoeU9TxdTINmJIp7cTr8Ihs2YJgpY7cwS6PkCJlEDvrH
	dSuBwdFHCA9hBHn8+PljsJCPuDGj8ty2xn8j6aDiBoNH3F2+cnw8fpIPxGuvn4RvpTrKl7wppu+
	SlX1zMFUsZblsPSNRiTRtSJeNnvUatLe3nDxVCFkQhjfUkWpGl98pldkoNvNHOStL0Dh94JF947
	SOLZTofLvnUy4cQVOx8T5M5PyTOdeo3+qQ6m01dkNbQuXNA7DyFg27T2RT+eyhhNv1RLMfpL/WB
	rWG4EShlOUd9zshU0Auiw+D6QtoF3sjrlfNo+nfy0FGLMOIb1XgC1IQBOuWz3DXHZw9ubr0bOIJ
	mNNNjZKSeQpr8pdKHaGEqt5icOF3lU+xYjEDo=
X-Received: by 2002:a17:90b:4c48:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35c2ffafe4fmr11775643a91.4.1774867192207;
        Mon, 30 Mar 2026 03:39:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 18/19] gvfs: upgrade 1.58.2 -> 1.58.4
Date: Mon, 30 Mar 2026 23:38:45 +1300
Message-ID: <20260330103846.3381644-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125861

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Major changes in 1.58.4
=======================
* Re-release of 1.58.3 due to incorrect release tag; no code changes.

Major changes in 1.58.3
=======================
* CVE-2026-28296: ftp: Reject paths with CR/LF in g_vfs_ftp_file_new_from_ftp (Ondrej Holy)
* monitor: Do not load monitors when GIO_USE_VFS=local (Ondrej Holy)

https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.58.4/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.2.bb => gvfs_1.58.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.2.bb => gvfs_1.58.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.4.bb
index e3b90950d6..546cb59a0a 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.4.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "ad9d5bf0b45caf232520df0adee51eb650200b0370680f80a350ead9d1d61ddf"
+SRC_URI[archive.sha256sum] = "e7124bec724e265ad0ee00baa27d8d515cf1dddcf102638be67b9e259c9b040d"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

