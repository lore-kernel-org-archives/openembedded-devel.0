Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676CF30942
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41963.1772708838931057632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jOYiwgcX;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so90093295e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708837; x=1773313637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFYNgj+q4y5Uu3WkTr7jwQhukXovHOwqJGOQViiG/0I=;
        b=jOYiwgcXTaR7sj9wWeJGpR6MecNBe/Y1vrB8nAj7PS0HQqebxKDOIij045/ajbDEek
         K4aop7qdpaA2c7/U8vtwRx2Nn3JShCWMB18KKO4zM6UjOfjkWYBrfod/wT/WtPA3tcbT
         iBeqwbBh9COuZ4ZNHrisu1eL8eEui2u9/p6whEkh4N76xdujvYYznLBwtNa9TlWbsK98
         +7wWt2Y+F5tNWdZ7bfwLbicKXOMCiQra2bG2xKEfVRwMTBKqwvGqy7D2XOT9uIxeCsMv
         fwvDP08Ept/NKdvtof0snKctUY9Dew/EbG+WvWBjDVgdTAK9sTDViaFDvg6dFX9WyRFZ
         lvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708837; x=1773313637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pFYNgj+q4y5Uu3WkTr7jwQhukXovHOwqJGOQViiG/0I=;
        b=ufLkYJOOgYKpfYapgbUURuAP595N6Y/1i5GMp5QDQEbTGMA0aiIdGzB3M5sKAXsIOO
         zGpxkyWji3VedJmtudvMLzXEM0bdGtRqguJBANIQqa6kMQsD/++2jrth6xkkhA24Bjx1
         aN9IIRbnl/svTx3YDz7bMTmulrd+6IWGj/ISpwGP5jNX8hialc1e999J+eMSO/aFnplW
         XXnB4tDMJGu4D2qxNn7LpKeAcgxrRAYIgvKImjfJQVB9NIMJHFiWHo/yxjK797t4b9Ya
         I8wTZjuTkH9qa14FCHfPpiJnAo8mha1D3mybpGWpEjzPNogl/KWa3aT3Y5Z9chhC3mm6
         C//A==
X-Gm-Message-State: AOJu0YyXhX7gFVekWsiMf92+3zF30yiZRQEbussMwhQxapJ/hX/okLud
	LWQS3tK6tsWaAB34Og5WdXEiGz0N/XbV6oj5gJNrROcbC9aTfhAZJUYthOEyoA==
X-Gm-Gg: ATEYQzzC1mSn44wicPo/Lq93soT/ZDD+z40roYfAX8EnNq6/11I+aIkm1lK15INwmzq
	J6JM255qaEfIJ/SgVsxuzm52+yEGfBkjwJqbYMGy31XZ9c5ZqGDSDMuQUoejlv5lLOLlNMOgRwL
	8fJNhoYxTruT0v9qF2jesKR+1r2cnBOh2SwKz8WLlXm48cdLO2SNZkO4VEKyLJf2sXf0iyU3Wsr
	tsBa9pGMvb4QXZwp/Bcu11qfq1YxWpEQDyRoog+tj/a5Z8VqrKLwq4pcXgYXB1KBWn+C7sfvGSR
	FHkotJ163qfvYaZhzMFLbqXBN6c1zNTb8eHWN4KB/S3F1w6vPk8NIo+09eTJ0wQBQNvjj4lfZHD
	4QkL1bbN/qSEXoETq2luBw2HkHZG1opz0OtzxS6P2FtNn8kw2q4jg8G3DMUr8wxDYBr+l6/eUC0
	7yHyGgSkZ37jcl1hDnLPxArSXoabMbhtc=
X-Received: by 2002:a05:600c:c166:b0:482:ef72:5781 with SMTP id 5b1f17b1804b1-48519895787mr77804015e9.25.1772708837231;
        Thu, 05 Mar 2026 03:07:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 5/7] gimp: patch CVE-2026-2045
Date: Thu,  5 Mar 2026 12:07:11 +0100
Message-ID: <20260305110713.2893128-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124870

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2045

Pick the patch associated with the relevant upstream issue[1].

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/15293

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2026-2045.patch             | 36 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch
new file mode 100644
index 0000000000..c084b5704f
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch
@@ -0,0 +1,36 @@
+From 584e67bdd529ab37b50eeba7e62e975af8c6d617 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Thu, 15 Jan 2026 10:12:07 -0500
+Subject: [PATCH] plug-ins: fix #15293 security issue ZDI-CAN-28265
+
+Just like we did in commit 4eb106f2bff2d9b8e518aa455a884c6f38d70c6a
+we need to make sure that the offset in the colormap is valid before
+using it, before using it to compute the RGB values.
+
+CVE: CVE-2026-2045
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/68b27dfb1cbd9b3f22d7fa624dbab8647ee5f275]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-xwd.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/plug-ins/common/file-xwd.c b/plug-ins/common/file-xwd.c
+index 53e4cd2..8ab11c0 100644
+--- a/plug-ins/common/file-xwd.c
++++ b/plug-ins/common/file-xwd.c
+@@ -1624,7 +1624,14 @@ load_xwd_f2_d16_b16 (const gchar     *filename,
+ 
+   for (j = 0; j < ncols; j++)
+     {
+-      cm = ColorMap + xwdcolmap[j].l_pixel * 3;
++      goffset offset = xwdcolmap[j].l_pixel * 3;
++
++      if (offset+2 >= maxval)
++        {
++          g_message (_("Invalid colormap offset. Possibly corrupt image."));
++          return NULL;
++        }
++      cm = ColorMap + offset;
+       *(cm++) = (xwdcolmap[j].l_red >> 8);
+       *(cm++) = (xwdcolmap[j].l_green >> 8);
+       *cm = (xwdcolmap[j].l_blue >> 8);
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 4f273a7cbb..d38160a864 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -56,6 +56,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-2761.patch \
            file://CVE-2026-0797.patch \
            file://CVE-2026-2044.patch \
+           file://CVE-2026-2045.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

