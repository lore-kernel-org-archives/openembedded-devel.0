Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.31777.1608506826003077942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 15:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y10PMTxu;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id h205so19406125lfd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 15:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGWqO3PJGdDhy/rjq5BHwXBa48ELV9ZuzqQkxmKeMwE=;
        b=y10PMTxuLtV8Max+FKEsU6Ildo602xFdqzDYxsQHB0dfpAFoy+XFeY3zmGl7MVfA+D
         S/pSMNiBK5GCXRKUFAF/kdJN0MJBnfYBgWf9mr6Xpx7XLrUXo2lHwwvLuVUHvRLe9Wxb
         JbWePbjaa73YIjXHoaQQ5IcvG5I8LhL+43y7V6zFIF+J3Ji+BSqBldEF7smnvsldJwoA
         Wd1s0Y+gcFN7fTXUZbBLSEBJl75XjNstBJCh9zn/YKHdHgzCHLv9//xvkSigMohwPLlq
         p8+Dg7Vi4wHFFKMY+WdGoTxMy8h4XVXHaIrOTA/Nw6NI5JlciSuXHwxFT/OrZTo6ERdi
         ovzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGWqO3PJGdDhy/rjq5BHwXBa48ELV9ZuzqQkxmKeMwE=;
        b=jHFau6y1xvcenK88Jm0oVxfjS4UZI2/zey1HbRpZlk//hib3j0HAe+IWWYVTz6zNqJ
         ggqdNVvHYiQm4xrfeSafdEX5wFVWWJrBGifP4Nk+e9QTtSN0QvWwgAMkdfTZS/NYJjzL
         xLTPT48spc5ZrKEuN04ukpqcIxGIhS/BpMH2eGW3TjS0VcE+ImCsieUPz4nOFXk/9EBw
         LZMoVsKC2QBoPBZADVjdzZ4dCodz6PHxJFojNKVSQ7rSV3BpBeCt6nK7ba+EPmEMqLrC
         rrRHUZu7gkBqpXtie6fb5aCu6LT/6FHf+tAucOTpnL5u+hUPAbwvvheL4GRJwdbjZTbf
         ptQA==
X-Gm-Message-State: AOAM531PjTGfDSuzCA4y0BNZMAPhMZ8rRZocnd1KK+lboYpT/cHFSuNn
	YZOAJavU6q39zNspRX5/o5i0qO+kK+nBgw==
X-Google-Smtp-Source: ABdhPJyVYSc0TvWfQXse96/f30YWNas1vvyPaDpon6cOGrl33W/r619P7l2cpVmoop1FaoRjRe6ptg==
X-Received: by 2002:a19:4c02:: with SMTP id z2mr5346320lfa.198.1608506823755;
        Sun, 20 Dec 2020 15:27:03 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([188.162.64.15])
        by smtp.gmail.com with ESMTPSA id v28sm1797784lfd.57.2020.12.20.15.27.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 15:27:03 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] android-tools: fix package split
Date: Mon, 21 Dec 2020 02:27:00 +0300
Message-Id: <20201220232701.2641845-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"${PN}-fstools" was added to the end of PACKAGES list, so it received no
files. Move the package name to the beginning of PACKAGES list to fix
packages split ending up with non-empty android-tools-fstools package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools_5.1.1.r37.bb                 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index fb6125e2a5df..fea4f7eba11d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -157,9 +157,10 @@ do_install() {
     fi
 }
 
-PACKAGES += "${PN}-fstools"
+PACKAGES =+ "${PN}-fstools"
 
-RDEPENDS_${BPN} = "${BPN}-conf bash"
+RDEPENDS_${BPN} = "${BPN}-conf"
+RDEPENDS_${BPN}-fstools = "bash"
 
 FILES_${PN}-fstools = "\
     ${bindir}/ext2simg \
-- 
2.29.2

