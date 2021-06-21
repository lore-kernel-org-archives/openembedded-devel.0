Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.45129.1624270651171558986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=PsqXGnXp;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id a11so16224861lfg.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jun 2021 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AbLjQafSDj5it/SfFNrJa6CuUu7k3nAitzOWfZkhyPw=;
        b=PsqXGnXpxWaDbji/F21aJTCodo7pLrnp2y46y1Ye+DemAn/B8YjOShuMSwY4sF+DC/
         FJ/xFIgVTWDtK4TObDLx/D4Fn5SKVBU1orqOKJ0l1jKfarA2kA8/5gjZ5O/TZpzgUhhM
         Ki1eFZYfVQZestT0E5L1GMhcqv5MDROMwSGluNxqx7pXbsAG/xH54kvyv6ZTFSoAGb95
         g/F97bVWuTSE/cQ/4/AF5T/nKQkPMf8IVJDbeCYH9ITg0ZmIxwJtzq3oJhWkioAbuRj9
         zxEhqeKxS/+5EGaai+WDPzEWzVHhzLpUUYjwpyXJKQuhmvqB7/wwgUCx3nwzo3pfoKjh
         7G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AbLjQafSDj5it/SfFNrJa6CuUu7k3nAitzOWfZkhyPw=;
        b=emgaYfhKSp0N+X0bumDWN55KCaVTkGMUrVPfsdB+ktY05/zzqLiZY4BP5AhZaYLa3G
         n4Z6rZXku33zmhF/0fBDpk+GSISd1ks1apQlgsnzxoC1z8UEUMjTdS8aEFQ/rPf9KnDD
         dCO60hCAxJ4yOPkmO2pX6VN0xY74a9DXFTZIsdxH/b8DVP5M1+V748H1IjleaCDMG+rQ
         yV/Z27Lex3cm+gXXNvGoAsHFjCN+LSHLVrYgildhRdmsCe9saOjqv545N5KuoMwne4bp
         v76kggj5IrjbKuiXogYoePJBfFNVvxWgtsoG6Hv1ZhotxrcSY1fr877B/hK8cnoxUols
         jIOA==
X-Gm-Message-State: AOAM5312Ayu/rljI0viCQUuhFd0j+t/lxrOUjE+NeZrqvsM8OkYOe/Fr
	R7UPsBem+X8CanSp2nMqDOtbCR0Usu64zg0w
X-Google-Smtp-Source: ABdhPJw9jHzjABPAkBP5Q69moKN+J6/8B4cJoxCuSi88l24PYMsGhLOddoh8K81m1Mt31WfgHqXYGQ==
X-Received: by 2002:a05:6512:b8d:: with SMTP id b13mr5134663lfv.524.1624270648353;
        Mon, 21 Jun 2021 03:17:28 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from lund.local (c-921f524e.018-147-67626725.bbcust.telenor.se. [78.82.31.146])
        by smtp.gmail.com with ESMTPSA id n10sm1833501lfl.104.2021.06.21.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 03:17:27 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: update to 1.15
Date: Mon, 21 Jun 2021 12:17:25 +0200
Message-Id: <20210621101725.1858709-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Add support for FT-over-DS procedure with multiple BSS.
- Add support for estimation of VHT RX data rate.
- Add support for exporting Daemon information.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.14.bb => iwd_1.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.14.bb => iwd_1.15.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.14.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.15.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.14.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.15.bb
index dbcc319dcc..9a5256f94a 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.14.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.15.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "21be6ad59ba666ba1e50e01889d647472b9b2f96f4941123db036fd33c257f0b"
+SRC_URI[sha256sum] = "a7ab8e80592da5cb1a8b651b6d41e87e4507a3f07e04246e05bca89c547af659"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1

