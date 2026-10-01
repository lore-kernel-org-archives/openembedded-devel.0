Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD44ACA5FC1
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:46 +0000 (UTC)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3430.1790823822502318603
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jQwb0UT/;
 spf=pass (domain: gmail.com, ip: 74.125.228.37, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-8867466563eso361816b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823822; x=1791428622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOVtQADykU/ViOG+q6Y3YOr9EwPjW5DUYJ2a/gX8zMI=;
        b=jQwb0UT/MnEGLe3PNoDDH8Xim2pUhhU5xfDBTG77wP9U2AuoWpiNX71T4EQILO0bUO
         0vG0hFAuDiIy4/mIWviCyhHeHY+dAMe3BOB+p8I5rm8retaU8VBBrpr/7YeOcCDPrUdI
         tKBkERIvicjrZLFTfcqxzI5MbJMFkLkp3oc6w5ujQ6xRkM05upnCwxhcTYeykMV20xqu
         mI9AFdg6l7H7pMpAnW0HSZTuGx11b4qNjyFJSEB5i3a6WXCQqdL7TBR89K0aFslNfTZf
         +XoCKzBJdac0u2ikql9CWM1m0z+3aqIcfCEVhTQVf65IPYmZ+0rakR8Oi1bYnldT36S0
         n88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823822; x=1791428622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOVtQADykU/ViOG+q6Y3YOr9EwPjW5DUYJ2a/gX8zMI=;
        b=rLzPj1h+jHh0zoDEjKgB7gYfSYoZHrpoMUzsOO6YwcAqCX5CXZ3W2FT2r94Hpyv2kF
         vZAiwnk20GVfCM0ALWurF5+YXNT3HxiIdN7KQOXbP4yyO1TvfSK/SQ9LArvTnZVPhVKv
         2EYZaeASI4hHzeHUaKOGBxwXCwstrD/0ZYL144g09iWwaTSVNkmmfvfWSqsfJ5WxCw7n
         PZNhFVYoy47J05rRxW4OKYefK3hbmJRb82El7XoMrOHBi7gQDCbTyBugAqOeeeAJMjYL
         aRN1A5mQyYiuKwJ2MZL12kMm762De01ldYDnZ4Rw/Klvb6ZmnFHz5q5C+lbR87jbXxR3
         UVUw==
X-Gm-Message-State: AFuF++nASUqbwH+uaBXD81EwwHmJQNi7PxrI75EK80omkZeuHGh9pGSR
	HbpOfo3O/J90WXsRANJXlDEvdZvd83dJQKYgX0NiPm1PqikOk8z85ZdTkX4Q/g==
X-Gm-Gg: AYBFou39T2/wQEBmbJlh6ye7ND3VPnvROMe+i9X9BJLeWp8ZYghUgp+1a6DvsaTL5wL
	dKCT4pJgo/Vt7I+YghhzHrr6+tLpjnmhzgLv1my6YmshgUkVs80yE9M7RYmg1BCtypsbIdOHH+8
	z/YfJK+rPaigg5K4TpvHe0AV6rLh2QtCmnyK74UbKVISgJgd5khZAXSheljcKFYfqXipgqE1WK/
	bfFKWayskw9teKek6HnuWH4XJQjpjIeMOaOU70DlZDnhYiu1PKdXmqE0TgWbT5bQQ6rEA9WhN20
	ziapJMRh+PBIaNRpUX0RN6pJ+FQGa66+3NReldm/c38X/41G8C92vfMnZ2d+AqRz81eXKGSnCzn
	rIEhoLpxsCvZQGeSN3LfLorgPD0uIDsZs2lJsAnznlQ7YGPgnGdrDeyebPDVGTNzaXEeIJ1WlPL
	kpOv2rmHjg2nRR86TZqw/kuKvOoimYOOCeCpUxXYg7+rAKOAv9yqzSdZMKMUuMZlnysVb7Y9c85
	/f0xJs46MhqEeknX9zC5CQaX7xRNwrhFw==
X-Received: by 2002:a05:6a00:8009:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-887fc77a1d2mr816250b3a.8.1790823821629;
        Wed, 30 Sep 2026 20:03:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/17] aom: upgrade 3.14.1 -> 3.15.1
Date: Thu,  1 Oct 2026 16:03:15 +1300
Message-ID: <20261001030331.1581021-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130552

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://aomedia.googlesource.com/aom/+/refs/tags/v3.15.1/CHANGELOG

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/aom/{aom_3.14.1.bb => aom_3.15.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.14.1.bb => aom_3.15.1.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb
index 49792cfc25..6e82ab0f24 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.14.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause AND LicenseRef-AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "03087864cf4bea6abb0d28f95cf7843511413d8f"
+SRCREV = "44d0a57786f432d933ff64b653347c66f4d0fa1d"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV}"
 inherit cmake pkgconfig
 

