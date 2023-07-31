Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B445C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 10:33:36 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.4344.1690799612863014762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jul 2023 03:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=n4thtaCl;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-583f837054eso51036487b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690799612; x=1691404412;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ0ehO4FezxR5GygQk+n7FVXgThWXTrwzOpZc1bsoGo=;
        b=n4thtaClin3znouzdvwXzQ1GnsNgztleWUs8lF6WtEgCGmWqXaCa2/9BkkRA4Tb9lt
         Ts1o34PktI3Pidq2iUr2RKsccyCzS/uiYhQc4GF3EUuwLRpQ19C+nR1NL22GCkF2sj70
         kr4T3UIjcolkOiQaBgB6b6biTMrPBIytYQvt0yrh1SrIB9hEkTqvFnrCTBFw7mX+Gog+
         MvjStmtmMj2ZZ6NmqZeVV3H//ql5p8Rm7p+pI8frBk5bov6/E6eiebgUKNp2jIRgiBh8
         hZDELTb4k7JsMyVNIDDDfCJ5rfaAz9xbkcrTOV9Bq+NgiN4lAxELE/BHUj9WwFj30nLB
         guYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690799612; x=1691404412;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJ0ehO4FezxR5GygQk+n7FVXgThWXTrwzOpZc1bsoGo=;
        b=YdRkPp541hXjWWyhZfUikYeNWxryM2AfdH39HYOIoZfzlSHTeAPCyrF2FIMjRmECr5
         9RNr+hyb1ZD6+/GCe2GeZpqBq55ytg3WNskJmt6XTgqu+/t/PMYPxOjmi2knIhSkqTje
         XPBv0emGntlBBb7rucVVlhqyeSW2N2fEW7EJwMaYNCZnzUh10ObGfHuWnesVkeaP2oPa
         EjtoyBMJZURcauebMtkawMetj6TK1jzAyTNPiQi7cOBA9IazGuTDiIFLld2Q4bfgUJBZ
         r362QLXssHYxvQqUfKqBQJfbjWKifza1pTAPTOhoCtPc/rVKY+wlrLdibIoiC6d7VwRF
         PktA==
X-Gm-Message-State: ABy/qLacSaB7jzjika06tL/GQ8t6W4+2FBeVH4b1aYDFiErFd44sMkCJ
	YnRB+o8LVhkBZ9rJFuJDApM=
X-Google-Smtp-Source: APBJJlGf2AzHY9LIbv8LeffTkV9BLGaErTvrncrrMrc2L3uSEM+7E9k0eIG/Jbv0pSAC3guGCivGYQ==
X-Received: by 2002:a0d:c0c5:0:b0:573:8567:3bdd with SMTP id b188-20020a0dc0c5000000b0057385673bddmr11037573ywd.23.1690799611811;
        Mon, 31 Jul 2023 03:33:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4bc3:732:c84f:6e7? ([2600:1700:9190:ba10:4bc3:732:c84f:6e7])
        by smtp.gmail.com with ESMTPSA id d79-20020a814f52000000b00583e52232f1sm2900737ywb.112.2023.07.31.03.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 03:33:31 -0700 (PDT)
Message-ID: <211582fb-9571-aede-3aa3-0af6b43e1390@gmail.com>
Date: Mon, 31 Jul 2023 06:33:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: July 31st
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 10:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104160

The following changes since commit 346753705e49a2486867dc150181a1c7f4d69377:

   webserver: nginx: Add stream Signed-off-by: Luke Schaefer 
<lukeschafer17@gmail.com> (2023-07-04 10:20:46 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 4da92ed9be41734f6ced46b981958e2e868cbff2:

   python3-gcovr: Fix parsing of gcc-11 gcov metadata (2023-07-25 
07:24:25 -0400)

----------------------------------------------------------------
Beniamin Sandu (1):
       mbedtls: build with v2 version by default

Jasper Orschulko (2):
       yaml-cpp: Fix cmake export
       python3-gcovr: Fix parsing of gcc-11 gcov metadata

Narpat Mali (1):
       frr: fix for CVE-2023-31490

Polampalli, Archana (1):
       nodejs: upgrade 16.19.1 -> 16.20.1

Urade, Yogita (1):
       libyang: fix CVE-2023-26917

  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb   | 3 +
  meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch  | 160 
++++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_16.19.bb => nodejs-oe-cache-native_16.20.bb} |   0
  meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 75 
-------------
  .../nodejs/{nodejs_16.19.1.bb => nodejs_16.20.1.bb} |   3 +-
  meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch   | 40 
+++++++
  meta-oe/recipes-extended/libyang/libyang_2.0.164.bb             | 1 +
  .../yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch    | 117 
++++++++++++++++++++
  meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb              | 1 +
  .../python3-gcovr/0001-Fix-parsing-of-gcov-metadata-601.patch   | 84 
+++++++++++++++
  meta-python/recipes-devtools/python/python3-gcovr_5.1.bb        | 1 +
  13 files changed, 409 insertions(+), 77 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.19 => 
nodejs-oe-cache-16.20}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.19.bb => 
nodejs-oe-cache-native_16.20.bb} (100%)
  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.1.bb => 
nodejs_16.20.1.bb} (98%)
  create mode 100644 
meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
  create mode 100644 
meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-gcovr/0001-Fix-parsing-of-gcov-metadata-601.patch


