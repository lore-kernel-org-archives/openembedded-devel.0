Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.3845.1593162264791681855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 02:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=JpCjd9rl;
 spf=neutral (domain: qtec.com, ip: 209.85.208.196, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f196.google.com with SMTP id 9so9534432ljv.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2020 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y72kfAuZlDqRVfc6wnZ4eUYqcXsVJ52/a0JxdY2jz0=;
        b=JpCjd9rlbJXyQT7gzcqKAJhAQmIiVXWtSOwjnESTM7lsOMnWLkBGCwD5HYnra7+Q74
         LOGCR6WNuuarzmOWFuQ2iPgGlSrTT/C6CRRwDnnFTMzYGiTYHnXd6KQOkiEPMr3Sp4Y2
         JFvbuWsFuWtAUgQaSFpJeFZvO1+Swe3BQ+Ghw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y72kfAuZlDqRVfc6wnZ4eUYqcXsVJ52/a0JxdY2jz0=;
        b=QeNtx0NWkYsdbEOByWgZfS9HykYKriq/2+qX1mTb8Qkr+Mce2gpDk7EloDOA+2dewU
         QdGX5htDvKTnAT0njQAmSJKiZrVenqnG728uYhG5RduxQXuDe9xUufKVN+xPjEcZPN2G
         c48/SaobbgnoqWmpdsiQJB6RovqHRcRPwuE9yJ6oFpdzfrtzJKiSXOTpeeof8ebY9Vcx
         dPshUjvR8AkKxiqPp+mo7uVRflgk5DyLWJpKdMubgzPil30c7RdnIS61wn1PfBTLQiJ/
         ptmEg/RDPH0q2HbmU7npZ3SMffIwHmr/qBgFus9XelZTM1S5i6RcMrPQ47oG2+n8DERi
         oMCw==
X-Gm-Message-State: AOAM530O0imZAldVNHjMhFEknzMRso7j++TbvzTwJ1nfKHb3xhDsu1tf
	OIpzFqxtsUEaZv6Buj41UVWT21pyZlFX1T+QPCE6MofeP2tFtRFwQBnfaz5cFnf4rZvhgDVF70N
	y88DrAcvd4EQQ/5WtvhnG8dwgXNw9nVxfBi80OILrA9Xk7Rq52m/5yuKzxirHVAfqLcDHsTxMC3
	rm+k2fnNbSu+A=
X-Google-Smtp-Source: ABdhPJyS+GWaDDC5OeR0ODaI+ipLVcPL92Vi+EtipMZT81vaxRVBDQ7MnLA9fEj24gSmw3RKyzNfBg==
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr1012606ljj.304.1593162258279;
        Fri, 26 Jun 2020 02:04:18 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from turia.fritz.box (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 5sm5371385ljr.64.2020.06.26.02.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 02:04:17 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] ttf-fonts: Update ttf-ubuntu-font-family recipe
Date: Fri, 26 Jun 2020 11:04:01 +0200
Message-Id: <20200626090401.83942-1-daniel@qtec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current version 0.80 is no longer available with the link in the recipe.
Update it to use 0.83 version.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 ...ont-family_0.80.bb => ttf-ubuntu-font-family_0.83.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-ubuntu-font-family_0.80.bb => ttf-ubuntu-font-family_0.83.bb} (65%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
similarity index 65%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index d5d1b9a17..b8aa4c01c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -6,10 +6,13 @@ LICENSE = "UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
 PR = "r1"

-SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}.zip"
+SHA1SUM = "0cef8205"

-SRC_URI[md5sum] = "a1fc70f5a5b1d096ab8310886cddaa1c"
-SRC_URI[sha256sum] = "107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811298e4c"
+SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"
+
+
+SRC_URI[md5sum] = "c5a5059d6856b4ddf79d824dcaf5ad32"
+SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"

 S = "${WORKDIR}/ubuntu-font-family-${PV}"

--
2.27.0

