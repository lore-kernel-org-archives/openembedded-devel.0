Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AA8C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:15:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.14051.1713777325551827621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HK3E3tvd;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a523e2888so4668615e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713777324; x=1714382124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ41j+Pstk+V9sMSezXc2TxONoORT5aZKIycLeKUVP4=;
        b=HK3E3tvdkQ7Z4FTBNvaLIr6EgL01VDGxcKe4IkTL9cQU1yR2IWLXSua7gmBP2IQ9Ey
         +JQT5N3M66KbBZNhvn91J8tzBgTB4w0xCVZxfQKUd6OavrOnSGYp4363/0tVbGB8mO1f
         a2xpsapi6F9dE+6KML1s83KOONY11kigHNv7pAAnX6/y4qk8h5rXzO+kQCjdyOFFJFp+
         0pXiWtxSg6IDix7vBuKUiUDN6o1VOpFGhnJQyI0YTSre7Bzn81oytYpVSefz/NYNuW/w
         fzoz8D2P3Lj6ZyY9sriABoI56nKcNcpRsOB538jFIKItjGdWNxNrlDU43qTN+qikuU/R
         /Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713777324; x=1714382124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ41j+Pstk+V9sMSezXc2TxONoORT5aZKIycLeKUVP4=;
        b=ZCmX/mpepUEP2fIw6Y5KQo63ceOhA1T4xsACXqpBgThJ2EPzmT0bo5IAAbwyq7NxsY
         ZhEAzVp2Kge6nrKTVUAMS0h+7oaCJvy0pZig4vKVcyuP203LU/QayEiZaiBodxCc8OSN
         lUauk08Pi2t6O5L6ashGk5s55JfJ3WgqpVQC+ND2DxxPftXjhwQWKoGu0MXdaLme4gpM
         EDUIwWTsr1agYRHkTAZNbpl7ndBhOFd3XwMWPgGmbgaU7khwu5Zo22FGvvd3GhPmPKjG
         jSkxIZzvtBdodqpd9oopFV23L18S34KPSdhHFLSSOP5K+CUU+SdzmBkWHr8D1ynJGcc/
         VbSA==
X-Gm-Message-State: AOJu0Ywe/ED/pfduzCsWouoXwvbGPxVrCqR8KN+QwI/VXQvTTPo15v/F
	PqNTZN7RHBbuWBT+A3bPQY2MJR6yzwUn2UUHeRhkeq9p0I9XCUzzFH4PfA==
X-Google-Smtp-Source: AGHT+IG0HnV6yp+cBXSdSx7hlPFSlOkooCc9OaHqtr+rT3+LAwYX0BNPh73aIPXsTyr4DedErjW8rg==
X-Received: by 2002:a05:600c:190d:b0:418:fea2:ed94 with SMTP id j13-20020a05600c190d00b00418fea2ed94mr7583810wmq.23.1713777324025;
        Mon, 22 Apr 2024 02:15:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c450d00b00417f700eaeasm16011653wmo.22.2024.04.22.02.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 02:15:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Perceval Arenou <perceval.arenou@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][master][PATCH] aravis: fix LICENSE and enable viewer PACKAGECONFIG only with GTK3DISTROFEATURES
Date: Mon, 22 Apr 2024 11:15:18 +0200
Message-ID: <20240422091518.162075-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110083

* fixes:
  ERROR: Nothing PROVIDES 'gtk+3' (but meta-oe/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb DEPENDS on or otherwise requires it)
  gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

  and

  ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1 [obsolete-license]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
index b5d7772e79..a4386e809c 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "\
 "
 AUTHOR = "Emmanuel Pacaud"
 HOMEPAGE = "https://github.com/AravisProject/aravis"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "\
@@ -29,7 +29,7 @@ GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
 
 inherit meson pkgconfig gi-docgen gobject-introspection
 
-PACKAGECONFIG ?= "gstreamer usb viewer"
+PACKAGECONFIG ?= "gstreamer usb ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'viewer', '', d)}"
 PACKAGECONFIG[gstreamer] = "-Dgst-plugin=enabled, -Dgst-plugin=disabled,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[usb] = "-Dusb=enabled, -Dusb=disabled, libusb1,"
 PACKAGECONFIG[viewer] = "-Dviewer=enabled, -Dviewer=disabled, gtk+3 gstreamer1.0-plugins-base,"
-- 
2.44.0


