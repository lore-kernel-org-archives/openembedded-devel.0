Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE214C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:45:55 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.53010.1669920355239543020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oXIt9weo;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id b11so2690298pjp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fb76YrnydlCba32kFFcuxYOUmH27JlA1hiPQDYCWHc=;
        b=oXIt9weoPkoeDmkg/Tz3r+e6cFYOryItFJGHtm5NXMI2pEWe54NplZV6aXLAY4hwmG
         BcPk4Ozjd5yYU3uicbHiS0phlBfKA4Xbr/DUt1lImPRsifxVMOtWrzGioLSM9Q/GUP29
         qQaspgZaLGEzx54dYPh9dJqCJScPbLYkHv+Fe170HqnJXtMF7P9laxjyheaN+7GZEDs8
         TjlTNGKxK69TOd0m16i/TO6u/lm1C//kX6YG9KV/CwYqjIcOoJiX+wtihmDXZAhPXcaf
         INqsBNvAVkEI7Goz3WtvBskhY6PwJLaTAnni6YmFEyOIinFmGKcs/JE3cFI8iCil+qU+
         YGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Fb76YrnydlCba32kFFcuxYOUmH27JlA1hiPQDYCWHc=;
        b=vAOQRQt9gMNffx1VAHJxcsGqgY2CY+Of1uyQjD8EPUwc4xEq3S8wG2rvrR2rmqE23W
         HvTMix4nfHgzMEq7IB4MmO4hFJ2TL1oKqKL0WlK7aWfyBNHVOnXzXfJ/z5tQTWL//GoM
         IzWK33rx1baLjR/QZtkIsfBw+NtIHZyZO773zYuGSwRf/tSpqGTeggAxobfdbjIaeUZD
         gddfOxZ+y0DGPL4pwKjyu+kk2ML6En9Qy6VDrQtc0QA8Y/ewbWBq0ymuuIdSoIlsMgpA
         yrKCS/IjEOz5pjndp6nyJWBqjio8JldoV3XR01+8zTzFEdyZAksrcHdASZniel+tgfFF
         5MIQ==
X-Gm-Message-State: ANoB5pnEAL2CtiicCeXc5kPab3Zvf9/OiEdKXgepGVj7YfTngKtWR5eI
	tpCy5ZSaTQR2B/UQHjPVb4H4nmICd7Y=
X-Google-Smtp-Source: AA0mqf5esfq1jqPFIOz7MKr0RFO5N9pw/eUuo0NHecnBjm2m4Nm5A/JQUHl8r8bDc/LYHhb4hmyYKw==
X-Received: by 2002:a17:903:32cd:b0:189:76f0:6787 with SMTP id i13-20020a17090332cd00b0018976f06787mr28360458plr.174.1669920354323;
        Thu, 01 Dec 2022 10:45:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b00188a1ae94bbsm4018120plf.23.2022.12.01.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/5] amtk: Add missing dep on python3-pygments-native
Date: Thu,  1 Dec 2022 10:45:47 -0800
Message-Id: <20221201184551.35272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99897

Fixes
  File "TOPDIR/build/tmp/work/mips32r2-yoe-linux/amtk/5.6.1-r0/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/highlight.py", line 27, in <module>
    from pygments import highlight
ModuleNotFoundError: No module named 'pygments'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb b/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
index 8cb2fa79b5..fbc8f38454 100644
--- a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
+++ b/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
@@ -8,6 +8,7 @@ DEPENDS = " \
     gtk-doc-native \
     libxslt-native \
     docbook-xsl-stylesheets-native \
+    python3-pygments-native \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
-- 
2.38.1


