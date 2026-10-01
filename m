Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD11CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:57 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3434.1790823832709480069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H2Zfe6jg;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso1323141b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823832; x=1791428632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgwoSO59Oqt4Q89lS1VFn8jitaIJKbY5UVdA5s9GdAA=;
        b=H2Zfe6jg3UrxsxMPc0K/WHUv5oQfInK41IL+KkmfMDZpIMuIwLbKav/pMJ8EbvMSK6
         3IxTWX3ge9C8jgwHmqJloNkxQtCR2rCfsjjmi00As+XQlZeyXGs1iP3R0yADh3rtUDdb
         JfI8l/FffZdT4kHQ7F13Tb+WxzJJkQ8VhwIT/JZy+W4CYBUdlMSfd0U9qoc7D8/8OL2w
         m0Mn9NiiyQee3O5Vlh4pYZDACCH1f8sPRbDnEym3F+Za1wlROP6njuZZxV8FqUGzPeSG
         EY5VhGmtyP0pxRsfoZxevK2yt78xaBNNUVKjBmuOJ1mobDKlp/7RPIXlapeKGoC+p3S/
         2JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823832; x=1791428632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgwoSO59Oqt4Q89lS1VFn8jitaIJKbY5UVdA5s9GdAA=;
        b=QGbbLmxx7V2wcTFCvYNOB46qHdTXEoEL/NiBtWe67uJ2bODvD81HVYpipqvnRtO6nS
         RPh5JPnul4FpmgM45iLeTjQO78jQ1/yznctzHXbpGaAECJg+UDMPM94QJ19Gz3R+vLWt
         80gxEXQnOyTNdqzCOSSf3H12l/mVbptHw3pm1KYtDkICbkXTc+s0pETXZ53Oo9bEN+QH
         3AxRgzXX8vwvvhFUAqoxpJ8O5SkD67n1Pz7jP0Obl7vtkaYv5d4JVtUw4FAVY2l1V/3+
         fsIceTlI5DrxHEA2iscDNz5WW+R++S9UPzkdWzU06cyhJkxlbyHQl4lI0yx8MfbIiTo3
         OUrg==
X-Gm-Message-State: AFuF++mA+12UUsgPiTWRS63LEHL9b01Zj2RSnK2enNPhEaqlL0DhYHvZ
	4nfIKptn07V7oJ4uwI+TqiySHU3HosmbMZDWloNEJe7eX7QiYUNJMHOblW4zvg==
X-Gm-Gg: AYBFou3erXgtToiTAIZLUSgfs0PKxlZ2O/gitLHwGtWQokUleNtthvcZmkcAq/jDNz7
	w78SKdJ2dNQem5htiFTiXHyF7mrFfM5tELzaYVp2BX5tLdsAw/z2uQK8AYlq1t1tZMqL4mJ/c6S
	MVAm2rnmJ8qT4VggCSFxmKf3oSnUSe8M/blAQDpl09P8OPnLAW50J1Rj3yY3iT5LQqC1Y84QC34
	NOh5zH8G36mV0DvmcpkJRw3dh5nMAtL7/YYq+w8DvS5HrYe09N2wRHSWNXc5P0lq07EG2k1FBLf
	R4PXCjbvrXwzr2G9vaazaG9DjSfrFhdTm0pY0/xhZHWa5eaFhri6scyeYJseFYsBo6/jSwm++Mu
	TEGmAnEkhtkRt1nE6rPTQZuG9iDMKywPVXu70mvBNhYRifvUGCidtcHlMiR2qFvyoPrrm7qT0w6
	FUS3MwYRdGzAAlqqPNxcL34iW3v5SZMywWOOTZpAs6R95FcaTK//G3fo9BxNEyMCZoOGvVRFaal
	/f/h+1e/UPgEGycKnqb5Dc=
X-Received: by 2002:a05:6a00:945b:b0:888:8c9:457d with SMTP id d2e1a72fcca58-88808c95d16mr664519b3a.22.1790823832046;
        Wed, 30 Sep 2026 20:03:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 8/17] vlc: upgrade 3.0.23 -> 3.0.24
Date: Thu,  1 Oct 2026 16:03:20 +1300
Message-ID: <20261001030331.1581021-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130557

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/videolan/vlc/blob/3.0.24/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/vlc/{vlc_3.0.23.bb => vlc_3.0.24.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.23.bb => vlc_3.0.24.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.24.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.24.bb
index 8f728226c6..447ab42baa 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.24.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
 "
-SRC_URI[sha256sum] = "e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0"
+SRC_URI[sha256sum] = "e7cab503d1d7d5849b89d2cf0e1ee60d0ef6d012407791b644b9cfc0cc225fdf"
 inherit autotools-brokensep features_check gettext pkgconfig mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"

