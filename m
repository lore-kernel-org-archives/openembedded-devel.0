Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD8DF3093E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41965.1772708840341375321
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eq+5f8gC;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso85643415e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708839; x=1773313639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDI0bW06nbyMTWrCjrUOfdg4P+Sg+1qIIQxOksLBg/A=;
        b=Eq+5f8gCkZGIfm8q0oD6rj/SV9EAOBRs1J+7NcS77ka46HgkBqzTRzi1hbBfrqTmRi
         EP15aB6llQ/zoUv6QBU36dwdbxJEC12lnFhWWAQTaf5urGdz189f49uJqU/uRfffHZ2X
         cI3pKaU3k1wC+6A+xEiFTZGo4GqF7WwVfEraJzq4lo3ySYtZ1Z3rh6i9cadbkakrsm8I
         7Sx085CRaw8jdEhnOI8tMSVPYNIu79cZ+xbJ9ZZWlcHM0w8E4Ul6jbOIXFhLNwRt3z5t
         kWPIbYZPKKGJcXwaDMFgcJDJ+LNdnSxWsuMBofq0RBg68GUmvV/fxJ6xLayZ83G2iPmU
         nArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708839; x=1773313639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDI0bW06nbyMTWrCjrUOfdg4P+Sg+1qIIQxOksLBg/A=;
        b=wigVfU91dfOEbghWIQ8IpXBB9mwAM+SEUWvvMaB94NAG5wjd/qCr2TORTCcTX1oCgt
         yL7s+ZcGgTLcasW9nAtzlapOzeH9HtEXG4X1bddYQjTM1wYnnND4jMHFla5ZexW5LsUo
         DC2H6HLAkAPwaZ5bD89WTDgh2DbdxjeYOrY/NsVFQC4nVIPQ3BOW17jlAlkGerCgcZoB
         6sCEQexerK5/l/plQkTzVdSe11hv5REBK4iUqs2VnZNCf52RsXYk/Tw+gDovd6nU7NJB
         FDOPHMHygiqaUsE0tMyAkp2WrRdripFH6BYF2bEKbEIrRPpPgE/X++gPNes20OXI+niO
         jSBA==
X-Gm-Message-State: AOJu0YzUuzx2fBdniu0rsEJ6pvBaBfNzN/XsM9LD2OlmkfIFqLDuRNnf
	dq56D4WupqilOBIRUMFhVYzYJoqe+AtXe/QXpiO4UROumQINdaociQYxNSd9wA==
X-Gm-Gg: ATEYQzy6fbpFhZq168cAWd0wejJYG2fS/t1ccu6/bpmrdObhxUw8/2NDHM4Q4gtvEGY
	jDJ6oPbPnPLY5CnQ0yQqlVCMdjv206zNazQpYyh4rwgavKwWOj6//y/MqEuM2h01YaAseqaI5Ij
	Hk6zLJROBrFKm+Vw8Xgt/+I+vfxMJrNQxS7bSrmplKtd3h3gvDcC86t5hNcsWej7EY4qzlQXYWa
	/cchsPpdvQfmD8WlvCDxigR9GSzXlyFiwhE+cTQtfCsohypejtLuql/NPKeHGYJ+wddbY3kN6YW
	d1kHCTCU9ODTTvMpYwE6DYTz6WHTUJr0HhUrlc0N+id4lsJURlgoF8t+/LCPCVMWSYP64tanTfF
	rWqqBVuvwe3sr4FyDDlVwdRBakO3b+DvXTp4e3vKMHsBsjmdeZQOFCfE9C6MgLCX63Gp8sAER9U
	VnB3Xb/hmlNWw8IHjpuB9F
X-Received: by 2002:a05:600c:8711:b0:485:1744:6651 with SMTP id 5b1f17b1804b1-4851989048bmr82477255e9.25.1772708838490;
        Thu, 05 Mar 2026 03:07:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 7/7] gimp: patch CVE-2026-2048
Date: Thu,  5 Mar 2026 12:07:13 +0100
Message-ID: <20260305110713.2893128-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124872

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2048

Pick the patch from the relevant upstream issue[1];

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/15554

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2026-2048.patch             | 84 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch
new file mode 100644
index 0000000000..e0d506b0c3
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch
@@ -0,0 +1,84 @@
+From f8c00176788240744218e43664cba1cec4092822 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Wed, 31 Dec 2025 14:45:15 +0000
+Subject: [PATCH] plug-ins: Add OoB check for loading XWD
+
+Resolves #15554
+This patch adds a check for if our pointer arithmetic
+exceeds the memory allocated for the dest array. If so,
+we throw an error rather than access memory outside
+the bounds.
+
+CVE: CVE-2026-2048
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/57712677007793118388c5be6fb8231f22a2b341]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-xwd.c | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/plug-ins/common/file-xwd.c b/plug-ins/common/file-xwd.c
+index 8ab11c0..c84d70e 100644
+--- a/plug-ins/common/file-xwd.c
++++ b/plug-ins/common/file-xwd.c
+@@ -2103,6 +2103,7 @@ load_xwd_f1_d24_b1 (const gchar      *filename,
+   gulong           redmask, greenmask, bluemask;
+   guint            redshift, greenshift, blueshift;
+   gulong           g;
++  guint32          maxval;
+   guchar           redmap[256], greenmap[256], bluemap[256];
+   guchar           bit_reverse[256];
+   guchar          *xwddata, *xwdin, *data;
+@@ -2194,6 +2195,7 @@ load_xwd_f1_d24_b1 (const gchar      *filename,
+ 
+   tile_height = gimp_tile_height ();
+   data = g_malloc (tile_height * width * bytes_per_pixel);
++  maxval = tile_height * width * bytes_per_pixel;
+ 
+   ncols = xwdhdr->l_colormap_entries;
+   if (xwdhdr->l_ncolors < ncols)
+@@ -2218,6 +2220,8 @@ load_xwd_f1_d24_b1 (const gchar      *filename,
+ 
+   for (tile_start = 0; tile_start < height; tile_start += tile_height)
+     {
++      guint current_dest = 0;
++
+       memset (data, 0, width*tile_height*bytes_per_pixel);
+ 
+       tile_end = tile_start + tile_height - 1;
+@@ -2241,7 +2245,16 @@ load_xwd_f1_d24_b1 (const gchar      *filename,
+           else           /* 3 bytes per pixel */
+             {
+               fromright = xwdhdr->l_pixmap_depth-1-plane;
+-              dest += 2 - fromright/8;
++              current_dest += 2 - fromright / 8;
++              if (current_dest < maxval)
++                {
++                  dest += 2 - fromright / 8;
++                }
++              else
++                {
++                  err = 1;
++                  break;
++                }
+               outmask = (1 << (fromright % 8));
+             }
+ 
+@@ -2296,7 +2309,17 @@ load_xwd_f1_d24_b1 (const gchar      *filename,
+ 
+                   if (g & inmask)
+                     *dest |= outmask;
+-                  dest += bytes_per_pixel;
++
++                  current_dest += bytes_per_pixel;
++                  if (current_dest < maxval)
++                    {
++                      dest += bytes_per_pixel;
++                    }
++                  else
++                    {
++                      err = 1;
++                      break;
++                    }
+ 
+                   inmask >>= 1;
+                 }
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 8b3dd4aa5f..4e0dd76744 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2026-0797.patch \
            file://CVE-2026-2044.patch \
            file://CVE-2026-2045.patch \
+           file://CVE-2026-2048.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

