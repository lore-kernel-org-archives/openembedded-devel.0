Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81323C5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12923.1787485954877902464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O8BzcCK+;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso19029595ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485954; x=1788090754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCvdL3DTloOHanJHRb82R2ioKvNIbTj9Tt8xqaqvvDo=;
        b=O8BzcCK+tgXy7bXEnZn0YscC+xGCGS+f9ADzUIslb4OruZSKW5sHUq1noW42FsjZ4+
         XgQaMQrrkmsMSP9WOIOkdQ6WeJga2gns988T7DKyT7HiKncth3o8q9JcELCGxawtCIAY
         aPmTsmd+Xko/NYstCI5CwlxaOk5YOQRWzP16mz2fi1c1Htad4JhWnsnsV5kyL/IohFAc
         pHxldTsJiayIfdXJHrFm3nOtVfDbGKDX5qqEjLuSyf9+XM+tOMkpWZr1gmfxPHQKm/3X
         Pnf3Ga2W4dmdbllASwBmdoKMrPWTW/BEfDEUHrG/J8p9/M8QQExbAXpXbsnumcZCtzBs
         dHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485954; x=1788090754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCvdL3DTloOHanJHRb82R2ioKvNIbTj9Tt8xqaqvvDo=;
        b=objvIyD24De0E1VmoV76AEa7PpKS1+Njd887Xmb4ntoSMK03hyjFJFLmGt9xvuwJav
         plZTM1fUf6TP6UyVdWHgP4ZkhNDE4+TDixBRQDZ1JKY3a6KymYxKOXqXDA4UnrMtNmte
         DAPPNDnGSWEPrh6QX8HLqn9c+faBhgh2SrOiMNeHkQDG+Zvu0NFdkdEShDAnZXmLS5B4
         AWbpkzKrpEyASqOjUUdq58YGwZdUuW0yhod6tAg6xUmFCTnwwy6g8fZm79b1wBc1HYts
         JQ1h3IKyFitngBEyHU2Vtkwq7yx0GHt0T2EaY91aAPcTw0jrAzZHd4h81kcqh+39dZ4B
         1VFg==
X-Gm-Message-State: AFuF++mCWEogjJm22/r6hzXz1G/mO6vWz8EL3M7Mzvkh5flUm9jtgPGy
	Iz5HFFnNusJAeHnXoYJ9fcfQggK3Lx+Isdtc0qg8ttOZT06cdsnYasw3dg3ijg==
X-Gm-Gg: AR+sD13uEkkSPM/AJD3UM0jIXeZQtj4knY+7QFNNCKHfgICd/h0y/lKEAMKGURX7pgh
	yAEgEbYNbfFSfX2w2n3Q22vCJI/EjpDSusT4GLPDMmT0xzdHJiNkT6nVeZ9LO2eSDqKffQbNEtm
	zyQtda+hiS65xGW+zbrdRVCWMgDZlsI9cZHEME5WQ6zVgq5HqVne5Ru9GH4X2JlmJRO2sI/V6NS
	jp80S2VHvOBZOY1bztGhHhcOSF0KKYtUZjdv3p/m5OzzisgYa+naBz/nAO5eJLuAT7opYenW7nt
	WjQXZk3Y9jDV38wJ2Juars1TJvJh7zt487mjbd3UEaPhfvOXzjHLwKwmoU7HnRVn6/nNjz33e8j
	KFoBMcc9/swWxAqHdxr+d5+B/L84oxBu6YoizIqH5opsmS+v6qb6KQhjKJvninBpUMu6uxrsqUH
	oZadsbbZn+oEJXfkycPJHQYqq0dcRrpy7iS8jtEl72onqw5cFQHfyiGw6wUYgAYnQl+SbV8naXL
	g==
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr31366419a91.5.1787485954310;
        Sun, 23 Aug 2026 04:52:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-gnome][wrynose][PATCH 11/20] gvfs: upgrade 1.60.1 -> 1.60.2
Date: Sun, 23 Aug 2026 23:51:49 +1200
Message-ID: <20260823115158.1582363-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129445

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.60.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fde27648517c9754f6f56187e0139780e9324345)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.60.1.bb => gvfs_1.60.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.1.bb => gvfs_1.60.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
index 7dca3cd3b9..bdcc331712 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "90eaba333ab7d31a7fdeade45954a513c3661ccebbd9a138aab3fb481dfb9e40"
+SRC_URI[archive.sha256sum] = "a8d7744615a488a559302fe0cc8f418d5b44aba3c2ba2163e5a9e6f607c1be9a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

