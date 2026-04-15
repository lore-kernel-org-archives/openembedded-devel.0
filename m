Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0992DF4385C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 17:12:16 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.354.1776273134329050704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UGIlX2Y7;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c156c4a9efso9588894eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776273133; x=1776877933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ZZ11rGeH54jjV1rWUcrznidbqeQPfm/vm+RCuCRKU=;
        b=UGIlX2Y7wsxVeuXNde3N9Pen/7RuNvESLdyTM1smdk5vTXKdG35C8wyLwOf2+ZPHZT
         /R6ZL/OCP6FZLAoqmzvddaWVdC5c499BcS/JORkH+xRmd+IDh73iUk7ZzykQ+n+sdf+n
         jlgqEX0ZOiJHQC22iSuOO/Jwr/s8GCa1Wu7wuwbPh+bYcXjK2MAL/FWr/Eo0LhbJ9w+O
         VmdxU9v7ogyofrco0ZMyxt5dGEciqTmhgN0jVMFPIeyllx6hucea04hgCp9RLzhUlKxY
         jS9Jew+kNCvcFTS/jnkkSc2R4YwfsIok1/jWTcoO50W7ba8emvr4MSkhCjOLpUKm57lV
         GtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776273133; x=1776877933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7ZZ11rGeH54jjV1rWUcrznidbqeQPfm/vm+RCuCRKU=;
        b=lSyHzWvcOb2QR/cMB/BQ0W9KKV64wLT0j93e0DklCKF/imVD+Ka0Vz7iYvbGtYRjyu
         BGPVOzZjG+KYKGYwbGCZBxpzySf8A02IpIQ1lA0ZBO06jNd7zNcas1SrFKLDYDBnitr3
         GGFsVl0i0zdvgL4SWgZS6VckCPjhkFqPNnTnzPwIBNCPycvoN6EaoseEjI7CwHKCKbwN
         g++VbPlfWWRQpaZD8GxrAvI9vMNcZktlyTwVfY3WoEnPig501xgqdVDgB453py3xAlXk
         wJjcqg/sx5aBTbFoovn/HIMqR/Wq5TcxOMBBIWHvYj3s6cLS44i7YFOi0qZe3kKuAxoH
         xL2A==
X-Gm-Message-State: AOJu0YzEWEydcSdjs8AcOjbzMazNOCGiIMN9W+jiuJrbKA30pKwm12E7
	rFlKoWy70jxqNhFvY9DpEfhx50uIDfvuWiDq5Y28jB3FgEZHDem3ovwtLL52tA==
X-Gm-Gg: AeBDieuQDHzQHVj0MRpk+GbzO90mWzfMcKI+G0td8c8eR+c3w05oZ7RdmyDUTT9aV4I
	1jEZ4e99lepEqtybtNXColkekAjfiR9owkmkvzpyhOPzur8tfGkhAyU3YbR9l+KiQeyImfUG4a7
	1d6IRoRhNz/W/r04BRhRk3Z+WforF3y8wcsvSBnUOIwztJIFOq3byAJFg7N9iuddUPmAl+o0ooi
	2XHDrNvNUJYU77gGOm2FxNOmjFOhp+bBGz/KDUFOV+dQuqOb4Q55Xa12Yh9Z3DVGMuGgl9LYMPl
	xGKqnT4LbTsPWcRYwZpTqA9d6ElJ+TibkSicAAwtsLpZOKdqa5WoPn7LCAKc0zz9qW2mhYmYd3S
	QogylHt8lWFiT7LbKV9IiqozhjGjDTCwSKT/QnGyH9dPNVHuXRDuMsbu7mNMNNfgq0BZeFPz41y
	azV8IwqbfJdCk4TWR8pLE6nOnegxlxgsEY4PGdnMplkXykTIHxuoXp1Branufnaz3qwBltr1DWQ
	XIP+67VJKcRhpbRvdq3ZfTzM/VZ7Ee2f+/YLj1EdWlg8P280vM+ZgTohxVYs6ShX1jZwctLaVBg
	jk5/x5CAkbz7yPNORC022602cghjSa68yE/QMbCMBYesggtMP54=
X-Received: by 2002:a05:7300:d704:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2d5890795cfmr13223012eec.14.1776273133091;
        Wed, 15 Apr 2026 10:12:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606222sm4329527eec.8.2026.04.15.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:12:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 1/2] cheese: Require x11 distro feature
Date: Wed, 15 Apr 2026 10:12:08 -0700
Message-ID: <20260415171209.1502882-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 17:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126364

libcanberra needs to be compiled with gtk3 and x11 support
otherwise cheese fails to find libcanberra-gtk3 package which
makes it hard depend upon x11

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
index 8e78162991..62073ebd13 100644
--- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
+++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"

 inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gsettings gnome-help gtk-doc

-REQUIRED_DISTRO_FEATURES = "opengl"
+# x11 is needed due to libcanberra dependency which does not compile
+# gtk3 support with out it and cheese look for
+# | aarch64-yoe-linux-ld.lld: error: unable to find library -lcanberra-gtk3
+REQUIRED_DISTRO_FEATURES = "opengl x11"

 SRC_URI += "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch"


