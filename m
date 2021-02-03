Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.3587.1612388864924371726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 13:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=F2gcOUuV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id s18so853811ljg.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnr39qEHQXmprCpOkXv++SCxINpKhrXutce0v5+SmvM=;
        b=F2gcOUuVjzwPlhGMDDjPKHCSC6DC3FuzxEwdgh7vTnBELX40JwD2MnA+85pX+sZQ/5
         LP5WJwPUWFoWLUTRXrkDocJyEQ+sHUmBXKSVlBGimponKIhjDGN6VnhRbcWCol8Q2aT9
         yLMV7+ieS3CpFTHXEK9WSITvH+s2ZwFcVjMTZDBRUhzfFoYz4C/fHZ8QquWcfaU51qKE
         qV+1fdaEn021r+4gKC4TQup6TJzE7fDvaULU1G7Kggq2I7PqaZI4cosOF/D/B3AIIqXh
         yVWaCrjVvCiymzIw4bUvnbL0ONCZyDWiXvabfuBSpqshRIYoxye6iGRjQbxAcT34ptax
         zctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnr39qEHQXmprCpOkXv++SCxINpKhrXutce0v5+SmvM=;
        b=eoz+Hkd/xOjL2PvXnQi1nyqTjKUDg5gztYOQMBy/BEBmC0/JbgUrxfpbJPp7j5ajvi
         rNOv2Y/h1v9kw0J8Isywc4zY2dlMlg9455R1cFnbVtpy+/h0UZQVcFXFaxLm6hNYuwF2
         iuIaBsfRdPWRcoTLFzUk5gon6JOR8/mJiQD9Oafe+LCrbEAOvuOx74I+KlVKtCdhby3m
         kJgbJ/kgi66AppeyfsSvwG6GCX6fDjllSQsWwUKOQRQpSOio4lTnzltvFgFOMdkQsn10
         Z+bj6/dEdwY5sHQ8aCD12mmYn7nwfeJM6C1WXb2j4tBkxYULrjtWsLy7GUlX+lP9AYsb
         HSfw==
X-Gm-Message-State: AOAM53006CWpS80Hjoc2Ww0LAGE91u+JwVqOgX9TQZrbpYzwJ4BLkUfy
	cHxTYL16M/OD9uh1xWX2RpmFhK2dnASRTNhK
X-Google-Smtp-Source: ABdhPJyYfySVpl541xF3sYC0y3Pyj982updy6AGXhzVJtVyJyWRdNirl3VEq7tHpCSwj/684srBArA==
X-Received: by 2002:a2e:98d3:: with SMTP id s19mr2883561ljj.481.1612388862494;
        Wed, 03 Feb 2021 13:47:42 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h189sm356691lfd.201.2021.02.03.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:47:41 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-extended] libblockdev: update to 2.25
Date: Wed,  3 Feb 2021 22:47:39 +0100
Message-Id: <20210203214739.1934905-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libblockdev/{libblockdev_2.24.bb => libblockdev_2.25.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.24.bb => libblockdev_2.25.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb
index 99cdee5bb..2c8fdc75c 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 inherit autotools gobject-introspection
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch"
-SRCREV = "f5a4ba8bb298f8cbc435707d0b19b4b2ff836a8e"
+SRCREV = "c50869272b54bf4b4bc3825e8c3332a54678b43f"
 S = "${WORKDIR}/git"
 
 FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
@@ -37,4 +37,3 @@ PACKAGECONFIG[kbd] = "--with-kbd,--without-kbd,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
-
-- 
2.25.1

