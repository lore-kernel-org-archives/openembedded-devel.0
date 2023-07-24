Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB2EC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 21:15:49 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.6200.1690233346488033299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 14:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=GQYVE0nO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7659db6339eso224879185a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690233345; x=1690838145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1uYvOyyGwi/Wit+1Kc02DvZxSz9RsUXoNp+FcYtPMs=;
        b=GQYVE0nOHmvOviy+xxkPIVGAhZoO5/K/HkoKMxqzTEoyJkv5tZYCgzDFgC2r34GVgi
         TGXTRt3KqciOfg1ao0bgu1p4BMDxFd97BW805KZCoG0nvjwyj+GhDyvKFPyJ+GJRUz/y
         CjQecJeewl1nhCr/adgdLwnYmodXxgBI7ZtE1tNlC3tNkqXGy95z00+QicPhlQd4bHNx
         +Wv0hipr/9rrZ0LGqpkQ30Pju4SsZs7J+x1VLMvo2zPuMHMc8Bl5G+s/oaGHfyxp2BHj
         OoexaUBpGz3BjyZmfcetx6THLoz6V/v47x17uewt7PbxQpQhf9vA43amCuumZX3khbrA
         GwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690233345; x=1690838145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1uYvOyyGwi/Wit+1Kc02DvZxSz9RsUXoNp+FcYtPMs=;
        b=X1PtjFMGnAdESparKQpAIUDGJg2PnTKH5esVD878nj/xlFlNc2zG7f+Xq2qW/k8n3U
         gALZrjMhByFLtGnkhB1PdebcG7WEXnaIr9VRe+nrk6u4GvIsJZnYaVBhg1Rjk9jBhdDm
         81gp42Vw7p4XhLUeoKNXlpssnfj9Mo9XcU2XZ9sr+WfXgVdLxdgHxQjUEP4yWs/S8RD7
         75ByaeND/PBXMpZqFKOcoF38N3DjGyf5xyVia2WgRkAomRD67olmsO4GbqkRuI5NxxSM
         s3qn6OuJlEoC2HtPvaBeJ+rDsvEI41p8mFMTFQ+9BguwueD201x2cZLOEqR0KuhK0YRm
         ODrA==
X-Gm-Message-State: ABy/qLZEFo9w8s0k/oWlKiVwrWZHs/gouuiVN5okL8wYBb/HBP8/rd0C
	Gavdpuk3kyBbGpUFquEMt3le6gbqhCyxwJg9FmY=
X-Google-Smtp-Source: APBJJlF4VRwBZPyOF+Os6lvmay8oWBgfdh6KI6tYXbLnvTIWBnTIIhcEeZ/eh8bs4cigKInqtUKIuQ==
X-Received: by 2002:a37:ad12:0:b0:767:f50e:635 with SMTP id f18-20020a37ad12000000b00767f50e0635mr267090qkm.21.1690233345438;
        Mon, 24 Jul 2023 14:15:45 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id b25-20020a05620a119900b00765ab6d3e81sm3228966qkk.122.2023.07.24.14.15.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 14:15:45 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-rdflib: upgrade 6.2.0 -> 6.3.2
Date: Mon, 24 Jul 2023 17:15:44 -0400
Message-ID: <20230724211544.399191-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104007

The LICENSE file's copyright year was updated, so the checksum changed.
rdflib now uses poetry as the backend, so switch from setuptools3.

Changelog: https://github.com/RDFLib/rdflib/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-rdflib_6.2.0.bb => python3-rdflib_6.3.2.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.2.0.bb => python3-rdflib_6.3.2.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
index 282d407090..1b4bb5a40e 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.3.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bcae79bd3c84b857f42a98a7ccf6ad47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
 
-SRC_URI[sha256sum] = "62dc3c86d1712db0f55785baf8047f63731fa59b2682be03219cb89262065942"
+SRC_URI[sha256sum] = "72af591ff704f4caacea7ecc0c5a9056b8553e0489dd4f35a9bc52dbd41522e0"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-isodate \
-- 
2.41.0


