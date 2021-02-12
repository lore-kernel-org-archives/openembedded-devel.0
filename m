Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web09.503.1613110633569858844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 22:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=L+nWjD4H;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id b16so10236475lji.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 22:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxLvObVFSE8R9wZpGYomwta+E9jWIdf515umy4UY98g=;
        b=L+nWjD4HgiIVMuHUzu+6Vrx8sWBtTKjjlZVdZxm3XK2oukINsQlqy7USgCiVzM4bd5
         eOjNpG2p/4ofFwOKZxLOd3QjG0I623urc+pQ9Bm/Yw9jj9fEPf0h6ICwZL5SZjjI+o0h
         PZ3f384/KHPW9W16V29jl4ntxyXVj/cL3UPycI/xrE9RfseWaX80+VvjtHk3G9YIg9Za
         350dubIhxzXRlFy92TIyi+d9sgP/JHQhMaQ/Vc2f/C9McQLK3TdEM/rLAUjZJlNyi+iH
         pZWcJ+rShJv1U1OUXIHvYmjcPSFPymSy4LP4Nx3lM4SXhvXDjUhIDb9YLO48auyq/2sh
         c8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxLvObVFSE8R9wZpGYomwta+E9jWIdf515umy4UY98g=;
        b=kZ08x4fJTRgLnRSM1Y1JzKAgZ8xeOYvLAyBygQ576hFRSg0YH2QKHLPX+zo/9/+jcu
         PCEWd5bNuHZzWWxdND7yhmmEW48VG4jymdsfkoU7bXCFd4T0cZZrm/6Ce5UyfIusOWwC
         u51e8u31Mxhp/YsOLm7SIHIU8COzXw3MbmELL+RXiZYlopp1VeKnmo3muDbsdQAUJHSv
         aDmBw41ivF7SQIG1wEXZid0muqrmmwHLsJe0F3XFRZqoGGa+g9JDlpY2vfhp/EZDAEgp
         fcUZOx04Vell048C5cEB3xh146HdEj+iyfcQ9nZMd+FCZrBOUSKa0Y2JSOhnph+ClQBs
         xG4g==
X-Gm-Message-State: AOAM532LoPpzToXekzhUq8dqKlsqUMIK4tdYcjR8lg4k3W4VgzEal73B
	+mNrKPEDZ6KqqLrZkY5T4Ye5w2FvUt0NFoRo
X-Google-Smtp-Source: ABdhPJyGjePorkTIdPqzwtQ/eHQZkYLMjOF77hiGopcRdSV0GGd5JL9J9OMPihQebd5ZNVSK4W4phw==
X-Received: by 2002:a05:651c:1386:: with SMTP id k6mr335783ljb.51.1613110631387;
        Thu, 11 Feb 2021 22:17:11 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o16sm798256lfi.194.2021.02.11.22.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 22:17:10 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ttf-abyssinica: update to 2.000
Date: Fri, 12 Feb 2021 07:17:08 +0100
Message-Id: <20210212061708.2409723-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{ttf-abyssinica_1.500.bb => ttf-abyssinica_2.000.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-abyssinica_1.500.bb => ttf-abyssinica_2.000.bb} (61%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb
similarity index 61%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb
index ce003e922..d3dd417dc 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb
@@ -3,15 +3,13 @@ require ttf.inc
 SUMMARY = "Ethiopia and Eritrea (Amharic) font - TTF Edition"
 HOMEPAGE = "http://software.sil.org/abyssinica/"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.txt;md5=1694c7fc245cdc85c9971db707928159"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=80cc8cdcdc3f8ce96957bbac946b70ae"
 
 SRCNAME = "AbyssinicaSIL"
 SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "a3d943d18e303197c8d3d92d2de54d1e"
-SRC_URI[sha256sum] = "e48a77d5ab8ee0b06464a5b29be70f292aa25dc1e73eb39ec933bd7fa47bbd86"
+SRC_URI[sha256sum] = "274204a53b30f64cca662d78c7199e3c0325ea95ad4109886b47af734c92d0f9"
 
 FONT_PACKAGES = "${PN}"
 FILES_${PN} = "${datadir}"
-
-- 
2.25.1

