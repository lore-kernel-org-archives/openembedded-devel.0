Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A42C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:51:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.52994.1690217476535231911
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=2ySdymUa;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76ae5b44426so203940785a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690217475; x=1690822275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BLjeR1xHfOMIe8L80zp/E5bgxEbK19L14Y3Q7eu0WU=;
        b=2ySdymUa3fK3LcDeAzqudspKeoZ3rGdFwDCWK/lODJV9RwOKwM/fajiVYZN71XowAS
         9SRkC7HK8WKOA9smROzKu+8EVkmlRZuIXvGUtRe/RTkrrkulNsfI1J6n16tdZbHi7V3Z
         GlSe7N/fsOvsptR31mibaewdBQZaKFOBrOllFjVPyaZXhoZwCmfDgrYbnGoQaM8BqPd0
         7rgD0mzZaeIE00ZGMv+Tc+X3l1DAXxKiq30TyyTJ5+8CQf6Rz4CZZmVFz+HxK7J2ZME0
         QlznBM+zLq3xsC4B6oxjswJzpooWD3HIqU9fWQkinOj8tYJjRSuHGbg4NoKOzhx033mV
         7RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217475; x=1690822275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BLjeR1xHfOMIe8L80zp/E5bgxEbK19L14Y3Q7eu0WU=;
        b=Afbzl0l2Au/MFZqrZz1ax1GRRqmt2Kfnm6r3LwyWJStFta8t3SJ6sH/hpZrmxAp/Fa
         zc91tS/jb6ICOzHHaHI2CKu+akTkDk21y3y6I8i7P2zFrPJeKanIEgyMQh4PrHy4ITik
         fhSlWLwOwHz4HEc2nDqq3Lp2CBOygc+ZecVVG7FRbat8eZot441A97xV6qk/0ZacFsqA
         uVNawcng0iYjPLAlcPM5mhWuVeUytfnUPGnHGbG7hWOWwxiVV9bbI8iuaJ1rDXSqQ6wu
         UchXEq1FQ3JNfVzJxoBop12ZgHRQo6Kg5NBgDtYw1fmjWucscPfpYoku43Gx+7JaIy9k
         jUdw==
X-Gm-Message-State: ABy/qLYwgH4lJnZ+iC8xHvCG+zhx1jZAwmNajkJWwHN7QtJMM1c+TqI4
	XtH4HQt+Oi5EbZjEg1m4AL5Ku7/goZEtiQtfAcQ=
X-Google-Smtp-Source: APBJJlFQmOrf6sVKESDcVOmNY6L4IykwtAnUpkJWPed+OS+dop4XV4tfB14k2PHV4IQsv1+uDh1UYw==
X-Received: by 2002:a05:622a:180d:b0:406:940d:2788 with SMTP id t13-20020a05622a180d00b00406940d2788mr339311qtc.44.1690217474924;
        Mon, 24 Jul 2023 09:51:14 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h19-20020ac87773000000b00403e80cad67sm3451551qtu.41.2023.07.24.09.51.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:51:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-humanize: upgrade 4.4.0 -> 4.7.0
Date: Mon, 24 Jul 2023 12:51:12 -0400
Message-ID: <20230724165113.2925-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 16:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103994

humanize moved to hatchling as a build backend, so adjust the recipe to
match.

Changelog: https://github.com/python-humanize/humanize/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.4.0.bb => python3-humanize_4.7.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
index 7bb03b75f2..81654af875 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.7.0.bb
@@ -5,12 +5,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c"
+SRC_URI[sha256sum] = "7ca0e43e870981fa684acb5b062deb307218193bca1a01f2b2676479df849b3a"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
 
 DEPENDS += "\
     ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.41.0


