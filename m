Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600C0C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 19:42:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.739.1666035735389270873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 12:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BA65hY+H;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id k2so27333478ejr.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5QmzZ5tmohFT43wfhsW0Hpg+LCoLfgIeqlbAFpzdVI=;
        b=BA65hY+Hk7VjN9HeQ3k3EF44g+VOGp0KE/BMahwWpj5AmGy48UkMcmkW+M5qY8gu5S
         4UlOa1b1KtdRcN2kloS+cl2wK7qW08Z0c1s/7ubI4fgevTh6exCDOwaKgPaRXZq916iC
         shcvWXG3cBZ2gvNR1k1Ov4UE5/aP2zgMLKehgL57NtwMv19wZfAjAIBOFOpRVEICKrCf
         33h/diYC6f7D13GvW47Zzx4RoDjTRZf1YzBD8z1w3mmIjnbXche9N9pAN27UrGHRTQx2
         epbEB0Tsc7wdZ7fUj8p9YpjbncTOSu8E/tv400M+VCCMv5PgZdPBHKFTfYEK9BF4nCRk
         /fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5QmzZ5tmohFT43wfhsW0Hpg+LCoLfgIeqlbAFpzdVI=;
        b=0kpFlMnMMAoISDISLNt0DWFpBTz3Fxj5kmFe0ZhSwCl5z3e1rC+qf3P8qrG8vaUL3g
         79evIv+RUeb2o65MKbpI9JmWrIxX0lSk0awWOCU09J3SOHAEZ0i0SG84xvAmDT/YRyRd
         Gxwxocv0njl3i6obnkTLu7PqaizIKDYF3ZLkWq0CawrFDS/yx9U7efiykpAnTnovtejd
         mCg67NFzAUF7vmbpFfpsVjvctZ4U27z4mmD7t0P6/wPetsxg6wBFcp/F8SYW8zBEDp/W
         INAcnwCzfySZBpJCIKYqxTMORjXCyaA3HYsvNNkeq9nwQp1i+58U6jNbUsu1b6SxpMDM
         wYHw==
X-Gm-Message-State: ACrzQf3jS7CxojseLPeXarS9/xov0Kn3ZhAMxeRSOS1eSiK+b+cUmD0O
	YB709zUFjF+tMdbol4DZ0B8PUb1dw0A=
X-Google-Smtp-Source: AMsMyM4Y0yoFa3Kyjx1Pmetgdrx5tylEKneYYJuadtZr/8Hee1HbYluzprMHejCVVlQnYD93ADfdEQ==
X-Received: by 2002:a17:907:8a23:b0:78d:b042:eece with SMTP id sc35-20020a1709078a2300b0078db042eecemr9509151ejc.494.1666035733375;
        Mon, 17 Oct 2022 12:42:13 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id j18-20020a17090623f200b007417041fb2bsm6499306ejg.116.2022.10.17.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:42:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] uriparser: Upgrade 0.9.6 -> 0.9.7
Date: Mon, 17 Oct 2022 20:41:58 +0100
Message-Id: <20221017194157.21646-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 19:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99205

Update to use github-releases for upstream tracking.

Changelog:

2022-10-05 -- 0.9.7

  * Fixed: Multiple issues with IPv6 and IPvFuture literal parsing
      (GitHub #146, GitHub #150)
      Thanks to Scallop Ye for the report and the pull request!
  * Fixed: Fix symbol visibility for -DBUILD_SHARED_LIBS=OFF (GitHub #139,
      GitHub #141); thanks to Mariusz Zaborski for the report!
  * Fixed: For MinGW, use size_t for inet_ntop declaration and fix macro
      checks for both MinGW and mingw-w64 (GitHub #131)
  * Fixed: Compiler warnings (GitHub #132, GitHub #152)
  * Improved: Use name UriConfig.h rather than generic config.h for the
      config header file to avoid name clashes and also include it through
      "UriConfig.h" with quotes rather than <UriConfig.h> so that it is found
      in quote path locations (GitHub #149)
      Thanks to Gaspard Petit for bringing this up!
  * Improved: Document need for UriConfig.h in UriMemory.c (GitHub #136)
  * Infrastructure: Add (support for) Visual Studio 17/2022 (GitHub #152)
  * Infrastructure: Drop (support for) Visual Studio <=14/2015 (GitHub #152)
  * Infrastructure: Update Clang from 13 to 15 (GitHub #143, GitHub #151)
  * Infrastructure: Make MinGW with 32bit Wine on Ubuntu 20.04 possible
      (GitHub #142, GitHub #144, GitHub #145)
  * Soname: 1:30:0 — see https://verbump.de/ for what these numbers do

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../uriparser/{uriparser_0.9.6.bb => uriparser_0.9.7.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.9.6.bb => uriparser_0.9.7.bb} (67%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
similarity index 67%
rename from meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
index 0d45a155954c..421263e62b72 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.9.6.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.7.bb
@@ -5,11 +5,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "10e6f90d359c1087c45f907f95e527a8aca84422251081d1533231e031a084ff"
+SRC_URI[sha256sum] = "11553b2abd2b5728a6c88e35ab08e807d0a0f23c44920df937778ce8cc4d40ff"
 
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+inherit cmake github-releases
 
-inherit cmake
+UPSTREAM_CHECK_REGEX = "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OECMAKE += "-DURIPARSER_BUILD_DOCS:BOOL=OFF -DURIPARSER_BUILD_TESTS:BOOL=OFF"
 
-- 
2.35.1


