Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.20637.1595722191463777131
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=xmC/JEN2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id r19so13531618ljn.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2eEj339j/xI4vupvJgY0HPr88KexIWfzTKVMSx0G3Qg=;
        b=xmC/JEN2z8hTXYGWLiwmkCIf4m7LScV60S4Le52U1VUkZ1vrvu4JA5+0CB21yN5g7G
         cZ9e1IARJatfFipDUNKzi9XY6wk6/AC8zWe/GR69F4548aSZMf8rcIsUTTQcnhl/NZYz
         mid+au5HD+i5CXdAHMAM0DbMsdavHiUr3bO1T5fF3mDVUHgTvz0CGv7XzHQZxtc2G/qs
         oLmbhvPXKdSEJ0YGow8lcoVeFxj8rEZxun61TP+Zi3pZ3+KlQU5KIOoSM4KChGyWSNR7
         QEcgPWvt6owugv8IFrU8nMP7YBZRloExVe17sVK7HtzHJ9zDEmYSMl1ACf6RfSOzcEJA
         pXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2eEj339j/xI4vupvJgY0HPr88KexIWfzTKVMSx0G3Qg=;
        b=W+toDAXin1Xdv8UkuLhh8ec14KKLB934wC/ioHBYeRiHEmP3qINSLVZa8DJ+25xx41
         cssiizBrZn2xT01HkUrAGXA6BQVSzbzI4EyjS9TLkI9346ixEi7b46kbwYrTL2ZwIm8d
         Gt+LBUDJ9HwlXnnc9Tom+iZtb0dRB3KFdOBSVWHsTviTC4auYWnN1ulf3pymL8cMa/tO
         dtFNImgBAAuBqJI/CAtsYbaBD2TXie7fW6Tj5reVy4Wum+YS8EVWW43zlQxmmMV5s+RO
         0y49SyxuAH5B4LA6tTkCvK24w3D8qCrdkPL85hL8LxracLvUukdlQyhlriExe6sykXM1
         /YIQ==
X-Gm-Message-State: AOAM533WcyOh8ljd8rAJ5h1bEn+dnHjfCJ531YAM8jU/lZLwrFrUxHRN
	IcAFl9nF6JcRq6tF+d1nxxnACyp2FdY=
X-Google-Smtp-Source: ABdhPJxOkCOp4xYdikDcx8K0mKi4QFswmT4xHfmGDcrdMVgRaSZPZNl2UnAiwzmznsF/RyQRCzjFvg==
X-Received: by 2002:a2e:8210:: with SMTP id w16mr7038946ljg.419.1595722189260;
        Sat, 25 Jul 2020 17:09:49 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id j17sm1821680lfr.32.2020.07.25.17.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:09:48 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] dctl: update v69
Date: Sun, 26 Jul 2020 02:09:46 +0200
Message-Id: <20200726000946.2892313-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v67.bb => ndctl_v69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v67.bb => ndctl_v69.bb} (95%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v67.bb b/meta-oe/recipes-core/ndctl/ndctl_v69.bb
similarity index 95%
rename from meta-oe/recipes-core/ndctl/ndctl_v67.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v69.bb
index da0c6563a7..396da4bb32 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v67.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v69.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
 inherit autotools-brokensep pkgconfig bash-completion systemd
 
-SRCREV = "637bb424dc317a044c722a671355ef9df0e0d30f"
+SRCREV = "ea62d6d53bf6f806c4841e97a370201e18446860"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
 DEPENDS = "kmod udev json-c keyutils"
-- 
2.25.1

