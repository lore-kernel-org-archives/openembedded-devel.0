Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B60EF06E9
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26685.1770562312918088042
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nqjlm95p;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48336a6e932so3802985e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562311; x=1771167111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzoHxtDuSO3M9N2LfGgn3FtMPey0BqeZLRyoQ80dBX8=;
        b=Nqjlm95pGTZUg34IjCpVsXZaTIqTWrgF/KM9h28rSvUqYbp1aGFfly5+i8w3D/MaNo
         nkGeVOJ8COPcPGXs1fkX6PVC5fcOpRmDfDX2K2etKAyzxPNY5HmyPhQitmxQAPiah+wo
         AaYYdvGk3wsRhADMtzj4/nAE8hsNw1I8JlCUgvra7HCPzdsule2oR2JeJVkjGpL5Y+Rk
         7COdV290xVptfP2sTN6GFjZajApb84u3jyvrH9Jax/MC93jNYIU55FKIgYPxUIb1bV/N
         5jdTz2foRGV0XdYC3BqnPZh5LUPY6nXuqFubGptsBoZeA5JQMxXoaE0VMPjXmb8ziCuy
         DGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562311; x=1771167111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzoHxtDuSO3M9N2LfGgn3FtMPey0BqeZLRyoQ80dBX8=;
        b=GDKwu5AN6KogAGDDo9Qu71ka3hTjFr7EO9tBOcIxpMPrJZtGz4tbkoa1ZPyGSSqrsp
         Dg5Q8wIYKaClyYLg3Inat3WKWWHWHdM6u9nbWb7ZMlvE5SpofhsC/Hvpz7Duy0fDKVKp
         cia/DnpgRkwlLf0Z+GvMydTNiWQFfzd7R6iHSfgzzFKgj+WeKEneg1PLewTfudndDjHf
         GPn1pCwQhVBGT8xkEbKINBLKzCzlWgh6sn0AbQMTB5drZsemDl3Px2RbF2U4ek2tT7Ib
         hEeYBiYIOgjxP8AnwbhfYs/9QhwUNFyoy4kxyjkTjffsfhyf+iuXn01x+xfypND3wVos
         Dayw==
X-Gm-Message-State: AOJu0YwZP1tg8plMY9ZwRxHUuh/SoPdlUdz0VbjVoRUub1QkuR3YCxf4
	cRC8VOJMMKHgqc+5tLDsOzHePetuNKJ0pO+CLOHFPhC6a0Hi/qV1opQtX0Y3sQ==
X-Gm-Gg: AZuq6aKM8A+htgpT9nhaLf2tSHwWHU/OFKbtL1sBnQ0mK0Mynvl1L7WlvZND8tibTRZ
	k16G6VgfLVmH0/eJZkT58k7cTH0eOfHtLc3XL0vP00bTDa8z67Cbq8FcaTqP9rtxzP3RjV4F2gp
	I1TpXqrfIrW6OrNAmc3DXik+cE5Hmccc9uVvUDnDuK4qIuOMQdRwdb1Azs8c59KjOSP3ekV66e8
	KoucLhUzuAsdZCMIKHV52bgvgEIS2dfQkIbsHIck1nl3zp5yHlgT0sybAu4DWn0lBAU+9hkNNFV
	oTETm4IAnChmeCXgd8WjIs3xj9llGWqLE4eMIrlDk2sk6FgdboSplofkcYPN68pXXRuUPkQGlNe
	kZnCpl2USbNEpNXY60sSqJB1kAMMbkKQS0L3rlDY6AtP0qzprcCSkC4mmChjW4sIB3Uibg7Kv4M
	22IpfHtguV
X-Received: by 2002:a05:600c:8489:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-48320229bbfmr131435285e9.34.1770562311094;
        Sun, 08 Feb 2026 06:51:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 06/10] gnome-commander: upgrade 1.16.1 -> 1.16.2
Date: Sun,  8 Feb 2026 15:51:39 +0100
Message-ID: <20260208145143.20464-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124279

Changes:
 - Fix double g_error_free call in remote_close_callback
 - Fix build with taglib 2.0
 - Set project gnu++11 c++ language version explicitely

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
index bb36d59e56..3cbeba9ae2 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
@@ -17,7 +17,7 @@ GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += "file://0001-Build-fix-needed-with-taglib-2.0.patch"
-SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
+SRC_URI[archive.sha256sum] = "7cf5d56c77a95d828f25407294312abaae20dc6b556ceafd9424dbfe209e5ed3"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "-Dexiv2=enabled,-Dexiv2=disabled,exiv2"

