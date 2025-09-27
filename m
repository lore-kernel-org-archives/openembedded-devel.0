Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBECCCA468
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:56 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.6901.1758954771425448372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=md/zpUQk;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42480cb4127so33427685ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954770; x=1759559570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KauOMv1a2oO3ZaPkgkCdH1fhv4XnYA9KIzKMEoQlgY4=;
        b=md/zpUQkGXFozWk3VbsLdeuYdLfMn9li1pBK34x4wTjidx0p/33KNM+Pkbr4OLLA6T
         /kitDGh5Q7prJdJnHzdopXYbfX1z+I8L8k+cu3xa5LHm9KNAtBoa6CBoaqwtPB7oe20q
         gIdN+tojK+sWACL9Yc2Blh+knl7kl6eVBulsdF4ZnjQv1NH58El557LmuAHKCN424DiE
         FoTZ/07KLVTqYhbILM+PqOEK4WZ62XJ56KpthaRzPfhPk+sHDlyJFf/4wEcr2RsGOs8V
         vpNxt5s55dBUtHPeaJO8YVAtYM9eKs+iF0RYOT/SVlqqvZYPgXxjaYL062+W7JjqnEWm
         nufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954770; x=1759559570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KauOMv1a2oO3ZaPkgkCdH1fhv4XnYA9KIzKMEoQlgY4=;
        b=Qr9eGWBWr/+YpfFxZYNyaM3hxQ6U1Il3tw9pqAQ2PPKSf62jrTIBaaEyla+Z1nVIDm
         HCDruPMhrM2gOAUb4szHL8tTHNZ/QjQCSGe94z7+quXHY7MRwmvpcdikNmtEEyuhevf7
         +GcP/9UD/Pu9uc5CMxB1JOLGO1AvMlI5OCfWS/0T4OG5slJassGC8SfmSiNn0qmlLSSr
         S5kTJn1aT/rOMgo+wPK6CK3/VU6zQCQM+1poG/a5XfVyYlNgRUtYe44l5cg/KSdgOhPA
         +OrEMQw4JT+AVHfMmWqTL8iuaZCZAppmtr6nvxRKOmvEFCsCjlk3eJohuHwgrnSdGRJ1
         pSSA==
X-Gm-Message-State: AOJu0YxZakyjogxBrmosjeLz+tz82hpnhl9KjNKKfZxXl0ZRrunbEXY2
	gX8DhFqvQl7J8x8KEqOwO13YO5ynJORL+jMwXa3r+xVogviOc43B0dyU2+XZqw==
X-Gm-Gg: ASbGncsw+ANbqY+eaCwf9Vf1bDbRNzrRVfpUg2fjd97R8xGCZZHLKdQqzohcTrnnA54
	5GDal6P2JkQxonThWMo7c7OWEAxhNwcUiz5x4QVXNrr9J0RIM5KpLWUxp25KkIkvq3xnGju530U
	6P9waM1nVHlHZJk+3XHdi61p+EycQYtECNf9A5/GoiMEkRVV8kgc5esUJdfndPIPwk2vjV1xbXC
	Ysv0nxTD76458qdfNbnpHj0o5mcmUt67ofmBnXTU99YUL+OPfOuNyq9dJHCdILLxWsUDnthwKI/
	S1qH13mBABoYK3dAH1BaYwoQdfHOM8032/CBUwy2n74Rga8dDHEd8ARW4FiUwu6nnvSqY0iu+mJ
	fqFRaIsOID59Prt5wGRnT7WYPgIBKQe8jgiMW2mCazWEr+nddQc7DT/sTgkpAzEe+MWYlRQxQ
X-Google-Smtp-Source: AGHT+IHelUYWanTy9sR91QhFto+9h+MpmYvKTIpbXJNP1uTkkea0D3l0eJBqZFQ0ARDK2tGuOGDSqQ==
X-Received: by 2002:a05:6e02:2509:b0:427:8024:750e with SMTP id e9e14a558f8ab-427802475fbmr59465435ab.20.1758954770453;
        Fri, 26 Sep 2025 23:32:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:50 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 10/21] tk8: upgrade 8.6.15 -> 8.6.17
Date: Sat, 27 Sep 2025 18:32:05 +1200
Message-ID: <20250927063216.1865627-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119964

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
  2024-12-19 (bug) [844c0b] Menu entry underline does not consider
             activeborderwidth
  2025-01-03 (bug) [13ac26] wm iconbitmap does not correctly set the
             icon pixmap hint on macOS
  2025-01-27 (bug) [080a28] Aqua: tk_getOpenFile crash
  2025-01-28 (bug) [c99266] console menu zh_cn translations
  2025-03-17 (bug) [159aa5] MS-Win: Incorrect system menu entries for
             transient toplevels
  2025-03-17 (bug) [91d0e9] MS-Win: Withdrawn Tk transient windows can
             reappear in Windows taskbar preview
  2025-04-26 (bug) [111f66] Aqua: cannot iconify all windows
  2025-05-17 (bug) [7231bf99] Setting ttk state may change the variable
             passed by value
  2025-05-29 (feature) [17b509] Win: support PNG images in icon files.
  2025-06-01 (bug) [5d0bc3] block cursor size on a tab is too large
  2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
             leading to broken floating point
  2025-07-14 (bug) [d25b72] error popup on ttk::scale with invisible
             trough
  2025-07-16 (bug) [770fa0]  loading windows dll's in Cygwin doesn't
             work with high-entropy-va
  2025-07-25 (bug) [3d13f8,e90e8c] Aqua: dark mode improvements
  2025-07-25 (bug) [e94c8b] interop with clipboard managers
  2025-08-11 (bug) [dc38c9] Aqua: NSHighResolutionCapable should be a
             Boolean value
  2025-08-11 (bug) [4e1e10] Aqua: CGRect/NSRect type mismatch on 32-bit

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3564ff8f3066b87370be867e285fd17ec4a698a9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
rename to meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
index 8518fb8dfe..daac62cbf0 100644
--- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
@@ -24,7 +24,7 @@ SRC_URI = "\
     file://fix-xft.diff \
 "
 
-SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec"
+SRC_URI[sha256sum] = "e4982df6f969c08bf9dd858a6891059b4a3f50dc6c87c10abadbbe2fc4838946"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"

