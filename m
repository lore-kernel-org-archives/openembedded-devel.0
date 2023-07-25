Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158F6C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 15:56:25 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.24051.1690300582772978942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 08:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=h7ZNhgFd;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76aeab08625so293750585a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690300581; x=1690905381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqx6+ZaqijZd9OxKWIADKJU4x583e5/+gbAJmu6V1Qk=;
        b=h7ZNhgFdmexrskVpBj8RWM0PNNBzweqbtUR1l5nzl6FhJnsFfq1arVGpnJRkYKTddb
         C68lEQcxaHMu0Dhm3tyt1pkpPlW/O8Cd520dTS4eF0L/SraYz6nuJZ8bJsIWsy1+zpBC
         /RtSliU18m2haFz+lJ0KCdsktRDNKSJ4MDunkkjbsouM1uKMdXxTTKIQPLSgI1OS8QiO
         od4O+i+76FfIj59El7KxkDsO6a7F6jahEDr4AHj+N+1Sm/93i7h2ibsW5FQa23I2/gOO
         WaZuzARyQxyXQ2L85Psw6IwLFHkxyg6sK+FM6gc29OGs5J8co+u/r4mETZvUw6wYzsFR
         6VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690300581; x=1690905381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqx6+ZaqijZd9OxKWIADKJU4x583e5/+gbAJmu6V1Qk=;
        b=ilx8ww2uOOS8G5b8v+EPS6qUVH0iDB1HlyyINcrwFxszGDlW7SY3Nqw5BjHkSDtVgV
         ftYB6UD0bkxt4W53HD5gpFWebHSVu2PMFLSQyc5EIGbgQvv4pnRUB+K+zMLeLHe6dhpM
         9xtxtpr5oS+I3Xb2a86MvqGSgHMn1TzvdqRPoank84zZICu1+aOC0Nmj7Dd1Q6SUSOZY
         rbwbe2NEV+otPuto1e8E9orm/XM0UN1LSC7F684H2djWzkujkVxf2LawybVyTJlrSpg4
         M5J6M4A62VvN/5mecDnbkq3TFl2UmFxBJxDBIbqGvW+kjWOaJ90qSxAbi9fcL66pxhSX
         Htsg==
X-Gm-Message-State: ABy/qLZxMRK7CTWmZlEvVjOT4hao9reUdptjhtDAjsHsVURT1NkWles0
	W3FWcZ/rFap8PSUgzOTzhKjrr81NakKOaM1fHag=
X-Google-Smtp-Source: APBJJlFvScktYPkhIFdn/BNTQdURYx3P3+GjamDfh5xmv++yFz2DUjBprGvApHYlBcV8uorCbP46Yw==
X-Received: by 2002:ac8:5c01:0:b0:405:4734:6913 with SMTP id i1-20020ac85c01000000b0040547346913mr3552376qti.0.1690300581247;
        Tue, 25 Jul 2023 08:56:21 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id s21-20020ac85ed5000000b00403b44bc230sm4096038qtx.95.2023.07.25.08.56.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 08:56:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-beautifulsoup4: upgrade 4.11.1 -> 4.12.2
Date: Tue, 25 Jul 2023 11:56:19 -0400
Message-ID: <20230725155619.244018-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 15:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104017

beautifulsoup4 uses hatchling now, so inherit python_hatchling.

License-Update: Rename from COPYING.txt to LICENSE, update year

Changelog: https://git.launchpad.net/beautifulsoup/tree/CHANGELOG

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ifulsoup4_4.11.1.bb => python3-beautifulsoup4_4.12.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.11.1.bb => python3-beautifulsoup4_4.12.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb
index 3037ea83c0..7eb2d7c345 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Screen-scraping library"
 HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=15a76c7c51ecfc5c094d04f3ccd41a09"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "ad9aa55b65ef2808eb405f46cf74df7fcb7044d5cbc26487f96eb2ef2e436693"
+SRC_URI[sha256sum] = "492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-html5lib \
-- 
2.41.0


