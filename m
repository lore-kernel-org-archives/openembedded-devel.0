Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.4840.1596101996559965516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 02:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=bPgRcirs;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id g6so15537117ljn.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loVJcwg4zJDx4mlPcaRBFGSzwEB6JLx40VdkxJ5H+88=;
        b=bPgRcirsHltNoE07SlZkHRB41Ih7KNxC/QQkRuuAZ6HvL5jL6TkzN/Ecw/3cxnHvMI
         cMCRWHDkAcK/G8ha7tb0PwZtWVhVqoHc4DjxaMAS2MEECYCy6weYUu1EWwefGfqpshZ8
         bJwXFFnQTK7vZDoaDdVrUbD6zXZVGmYQzS40eC7UlSoxlJMyRpYJSslBcawL2/IIaTKC
         S19CjPVVqK/LYBuYv4hClkAw1fw2H2cnhrVo2DEO37AB4G+0bpVOgo1IrY3wbdIRG1f2
         tQaNVeSn4yIbRRhNigLldOz94Ip5SC1t4ytfomR5md0aRIvqTK14lymHLKP+pJJ/F4ul
         pLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loVJcwg4zJDx4mlPcaRBFGSzwEB6JLx40VdkxJ5H+88=;
        b=PN7vYmQSOIMKyNA2g7f5SbMq8Y31rV+vyS2Im45/83mAlKieHqeDnXh/2XkU47WVzC
         zrDgZhr009BxoBgHAzxpVW209WU5YKKeBT3fyZcWTxCWnli0JWCXG0CghPHzkS7iBKLg
         iVNRS5gYEfAV/868rUPZJxsBm1Y4Uc9ByReK8kX7UCDG+GbsVow9V+qDSKM03UZaOUA4
         /pqCuyHYygk6OosugGDQgiy0tSx7NZmkRmF2UcLWyW7Pft5PNUsVbkwzLXFpufxqfkGH
         6iDoGS29erND81zYqJdVTOMbpjG7bJaOJoiDfmms4qTx2Gi5KhoA/RtxK88PbhLA+SZ+
         rJzQ==
X-Gm-Message-State: AOAM532bsRxcqoWfj34RfKuaXWgvdlX7rfFIBunkGnnVGrXMal797XrX
	7jT9BfsjD61tDTXDilgo8Z3dBgPwiTk=
X-Google-Smtp-Source: ABdhPJxRR9zoVznx8BtWeK3H1CP3lg6lSx/n7AP01A0LSFMP/BRFiqagS5zkqhh+f78jpy3VR6etHQ==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr1004793ljc.115.1596101994236;
        Thu, 30 Jul 2020 02:39:54 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h26sm931358ljb.78.2020.07.30.02.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:39:53 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] nano: update to 5.0
Date: Thu, 30 Jul 2020 11:39:48 +0200
Message-Id: <20200730093948.154666-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_4.9.3.bb => nano_5.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.9.3.bb => nano_5.0.bb} (80%)

diff --git a/meta-oe/recipes-support/nano/nano_4.9.3.bb b/meta-oe/recipes-support/nano/nano_5.0.bb
similarity index 80%
rename from meta-oe/recipes-support/nano/nano_4.9.3.bb
rename to meta-oe/recipes-support/nano/nano_5.0.bb
index 645b07b4c..e97c01f14 100644
--- a/meta-oe/recipes-support/nano/nano_4.9.3.bb
+++ b/meta-oe/recipes-support/nano/nano_5.0.bb
@@ -12,8 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "52137a960ae8b3ca6d7dab6767fe6e5f"
-SRC_URI[sha256sum] = "6e3438f033a0ed07d3d74c30d0803cbda3d2366ba1601b7bbf9b16ac371f51b4"
+SRC_URI[sha256sum] = "7c0d94be69cd066f20df2868a2da02f7b1d416ce8d47c0850a8bd270897caa36"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1

