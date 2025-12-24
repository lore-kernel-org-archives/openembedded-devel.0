Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB78E78498
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 21:34:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128400.1766612070997432055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 13:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDFMQ8M9;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0c20ee83dso78932145ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 13:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766612070; x=1767216870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84QCCz98qGL+if/SEw2wOd3XUZF+hHVfC5Z9oBzvZxg=;
        b=aDFMQ8M9ww208S9xYGJzqxfpnUbP7CbN4KHpdig4+FTQ9CGps+TIUEHJcCbApwJwGn
         XSf6GKhDuDLq8yQRwQL1JV99hHe004KktJ9IT3VbJKr0akVytybs+yWAnFB9wDnFZJX8
         Cj/cMQ7I+avEqK15d6a4/1IwlX+EisdaoBPDPIh8KAIC6T8J8boFOwX6/Ts27mPHDCdk
         qz2IGXMCHLc+N6pQEfxUUerW+uZMM7OHB1cF0A/IvE4mEgG6AlA3dS6NzZP49h34wGHX
         65I/ApXQ/7czYfA9ZSysLL8CpKUX46pPOB8OiUZ51ZtFpSARRXhBXRgfGK0FIH2iXTtc
         P3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766612070; x=1767216870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84QCCz98qGL+if/SEw2wOd3XUZF+hHVfC5Z9oBzvZxg=;
        b=fjyW9Pj/aoPSohqGH0IAugZjPa9fqQOQGnKYAs0Rwuvzws5ApjVwxXbnON3Owfa5Xt
         NFl4AxqvYnqQiElgbJpaU3jSTMY0MEfMCHQcMmRp09sCZEpKHcTYodkcKmerXw7Rbias
         5NnYZ+VNYGWZZTfZ+nr1Y+CpQK4atFQL3mSUAgi8KqZZQeKSHXjui8UM8nmOAdp/CiwK
         9rWvD15/XlAaye3p+xx5Yy1BhSS4mJ/y4Ttvrsft7X1B+ZhCrMDx/xRT0bxZvxSDvlHv
         Oy1yLapTgzreRj49IHVtEIgpQxjOjc6xfSVbMTJnsJzFdf6hMwJ/s/9+1UvnoRLBJXtM
         g99A==
X-Gm-Message-State: AOJu0Yx3WEb3Fjl6PHo+RSfKwprws+5KMUcZ6hj3PC1YCQ8wu/uhbTnU
	9bnAk0j//Ud122n5W0EIiFrsQwZUT9bUbbvgfM1kYTb+kIiJjsbnO2+v5iF1jjFW
X-Gm-Gg: AY/fxX4GOE8wArD7IOJDsRQQd87EBrxfY3twyGtwfS/6/gzfcxB8eeB3V9n7SM9arqI
	+lUQtFVBHSHd7ovm2Ski5ZrzLWkASC1JN0bT8vhZ/qWTy9978wMa4qgDHeaOe8qQslw855ExNEu
	DJ/MKBZXsplDys7wUvSUXoPEU4kCYHENl/dZF1WnehZaSxfrjC3nlBjTjdYS4LePm+od6U70esU
	LBcJe/HXgCm7C5a8SDPBlT7pAjV434UFHyBpZMEESYcUIvRX91wDZkndLDq/A5EbwjtUnRxRubb
	8VfgrscFstsav3DTmB33hbOd75vgREcTL5TWQz0mvtDYlFgybXvpGOQkDAYuPV4K+Vh5/lFgnc6
	WRKlUjcRmEZ8BnoYjPpLvk/WsdBbV54YmPdQwc6p4FACT6dLaWw47c5KwJWpBQLcziJDFdTXndW
	JDhkcciXmoE5C2gwPJ48jfdqEGOVb7r3PkVjNFSb2dGD9gOipg9DHy+KBq+6ZVPdAlpMSj79d/n
	OXOt0hWo3+gwR+Df3hNemmSZZJf9z7T
X-Google-Smtp-Source: AGHT+IF6UqnG4TcnpIWbRGt08tIFWdYAcArjxl5zgDwVkzttpoEEOGc+vAo7vBMGu4Z/3Ql+dXzA1A==
X-Received: by 2002:a05:7022:523:b0:119:e56c:18b1 with SMTP id a92af1059eb24-121722e7cfdmr22682085c88.25.1766612069679;
        Wed, 24 Dec 2025 13:34:29 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::8429])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm51628291c88.7.2025.12.24.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 13:34:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.4
Date: Wed, 24 Dec 2025 13:34:26 -0800
Message-ID: <20251224213426.2245853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 21:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122906

This is a maintenance release. The following items were fixed or added:

GUI: Fixed VirtualBox VM Manager crash when host was resuming from sleep (​github:gh-121, ​github:gh-170)
GUI: Updated native language support for Traditional Chinese, Greek, Swedish, Hungarian and Indonesian translations
NAT: Fixed issue when multiple port forwarding rules affected NAT functionality (​github:gh-232)
Linux host and guest: Introduced initial support for kernel 6.18
Linux Guest Additions: Introduced additional fixes for RHEL 9.6 and 9.7 kernels (​github:GH-12)
Windows Guest Additions: Introduced additional fixes for issue when installation was failing in Windows XP SP2 guest (​github:GH-142)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../{vboxguestdrivers_7.2.2.bb => vboxguestdrivers_7.2.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.2.bb => vboxguestdrivers_7.2.4.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
index 34b5e9ed04..eb9b81f154 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
@@ -15,7 +15,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "b0e63bfb855327aecf1122cda33390c33734e5ffed72f123f5edf786a8ce1393"
+SRC_URI[sha256sum] = "d281ec981b5f580211a0cedd1b75a1adcb0fbfcbb768d8c2bf4429f4763e8bbd"

 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"

