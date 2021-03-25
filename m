Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.382.1616693140443278940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKGHp0Eq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a7so4247007ejs.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QAhPaIkXYKAlSa+HVxbeY644/yk8QjvuekdYCBQWx4I=;
        b=FKGHp0Eq5HiHNqcQvDDIuWD/TIFKfla1kO8Bo74k3nqNrONlj/t9ZIUbwrprm6G4FU
         /NNjo3JnB9jE00LRNlFtBntit6dCTo8zA3g1xkBQf9+Br+CFk162xbauHZJlBfNzuRDT
         T1gzjnVoJrCSpBaU/ycY+bkV7mZ3vnEf4jR4w9hNqzdqbxW33VXZ3cADRLjLWLll3nJI
         krqhrk5hlz01BnQkt1b6C/2+Wmrr6zbpQp2arxZMJ+/sE41Aq9M6wyn8iXwOYf+dPDV2
         VvuoGaOflAdywgL4CCTYcm5X0sVqcka15r9+u6vDOva2uai4Nk/84fqxnZb02jkMG8Ml
         9+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAhPaIkXYKAlSa+HVxbeY644/yk8QjvuekdYCBQWx4I=;
        b=b1ArMhMvCANl1OF8esXpEci4OSse6IgqZsNMEqleitVTSK93+lAqICgGO0m6udQnu5
         2s0Nz/qtCkqmGDJ2ds9FNGGCAw02C6RpOU3bX8LBZ0gw0k1/0qRyh+pZyZykdi3pb50h
         lIbTmkdHRBHYPk+CoXcr+fJi2J75nkc2k3G0kveIO2gFC4L35DouN9d7x/j0/AI3cmyK
         DEg6mKGSz8OiG5tGpF94rRFg7bMihBLDVcJG2NdwZhYkZ9ab/CmnLI6emh+zg9toLI42
         96DkFcX48G0XwARy/Q5DV304BJivGDYDwuTlLuAwK9XtEGD+1FgvpVRFsJqTUugplyNj
         RDZQ==
X-Gm-Message-State: AOAM5336cb9eDC1uvFgxyP3vpaW8X0hypg+8C94E0dcFpjzD8gfLghv4
	EnZjN1GuF4rbbL9Zca+oILptlFq138Y=
X-Google-Smtp-Source: ABdhPJyhuhLcQ2NG8g6MjNrn19rD6wQFN2vNIijHSLWpbSeK378eHBK9HG70LONDdcRTRFtp3+bCWw==
X-Received: by 2002:a17:906:4dce:: with SMTP id f14mr10471554ejw.349.1616693138976;
        Thu, 25 Mar 2021 10:25:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jx22sm2684293ejc.105.2021.03.25.10.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:25:38 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] conf/layer.conf: include .bbappend files in BBFILES_DYNAMIC
Date: Thu, 25 Mar 2021 18:25:32 +0100
Message-Id: <20210325172532.1099941-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
References: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* so that the following files are actually read:
  meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
  meta-oe/dynamic-layers/gnome-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
  meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
  meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bfba7e7b11..d3aeaba3d9 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,10 +26,14 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 # only activates content when identified layers are present,
 # to ensure yocto compatibility check pass
 BBFILES_DYNAMIC += " \
-meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
-gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bb \
-perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
+    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bbappend \
+    networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
+    networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bbappend \
+    gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bb \
+    gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/recipes-*/*/*.bbappend \
+    perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
+    perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bbappend \
 "
 
 # This should only be incremented on significant changes that will
