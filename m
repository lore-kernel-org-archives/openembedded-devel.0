Return-Path: <atanas.bunchev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A8FC3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:41:38 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.22399.1661424096707869591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T1wlngBd;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: atanas.bunchev@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id b44so5273527edf.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=3Y/33vQADTxTJ0a3viFLw+ue7Om12K24Dq4LfTcUkTI=;
        b=T1wlngBdP/08vYpAwlYvhBpz3f8Gz744Y5sTeozNT+GqcZcd/6/t0VYD5YNt3Vcpuc
         ibDKwNs3DXK35/7yUztnEIKea7GOObmlSIAalbmYc21S35lppBhVX88PBkfHML2k7u2Y
         vqTZwSHpEsoF5vJ+uronvcxoqox20Bb+6QZR4ebABi9yOBykakkZDEIF7PL7D7QEih+p
         01QITSgzw+yg8LbPLouewFZIZsfALIBc7wgXyFPj7rZHA/D9uuNjISDaniWvDQqPCbqE
         XjAhIuHQ9hre05URUq5HLGcr6ezeLzUrNaYsHqn8mVguE0Owt4SaRseJNAM80Z1a3zq5
         fA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=3Y/33vQADTxTJ0a3viFLw+ue7Om12K24Dq4LfTcUkTI=;
        b=8HNgbMX+gC58eRy7JEEGVsSJ84Pd8WbDlwo+aMpEr0uFetrB/kmZ2ZmmPl4dBaZ0qO
         dqdzimceoP+bG13UEL0qVPLhQcmeYWICgSKa8sCE+GRRFPGqZzaPkn2cT2o0KlIHR7st
         +WJpSQ4AJZQCBSChbYkdzrxtCKY/M/zBrgwLEW29doITmNPGeImhoiUSNAnlNFHO8xvY
         RMTL1mlI+MpaOswVtBC6frELE9I6SB1NC+mvN8w11ujlzGWolmVkk2wq3GUnJ+iw27bz
         pfeg46gBfeY+5/eHMgh+amlicE7s81UxshH5wY3pp9ExaZ6LHZEkUqFd4hB9WnGCzw5k
         3xXg==
X-Gm-Message-State: ACgBeo0H8ysL8Pr6hjmmOhy+JPjMzGArZkSSCixW6XJDHDvcI7c2IUA4
	4/GM0Iu9ZWumgculnrNC2jHL9iKHjRY=
X-Google-Smtp-Source: 
 AA6agR4EDntLEePf25z0krb9/Sj6rTzu5ZP2JcvHlN+pWhkW2OA4+jIU635+I+e9/cak6KERK0UZOA==
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr2696835edc.86.1661424095162;
        Thu, 25 Aug 2022 03:41:35 -0700 (PDT)
Received: from localhost.localdomain ([195.214.253.141])
        by smtp.gmail.com with ESMTPSA id
 kt18-20020a170906aad200b0073a20469f31sm2277546ejb.41.2022.08.25.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:41:34 -0700 (PDT)
From: Atanas Bunchev <atanas.bunchev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Atanas Bunchev <atanas.bunchev@gmail.com>
Subject: [meta-python][PATCH] python3-twitter: Upgrade 4.8.0 -> 4.10.1
Date: Thu, 25 Aug 2022 13:42:23 +0300
Message-Id: <20220825104223.12730-1-atanas.bunchev@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 10:41:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98429

Upgrading python3-twitter to 4.10.1 and adding
missing dependency ${PYTHON_PN}-requests-oauthlib

Changelog:  (https://github.com/tweepy/tweepy/releases)

New Features / Improvements:
 - Add support for Direct Message typing indicator
   and read receipts
   - Add API.indicate_direct_message_typing and
     API.mark_direct_message_read
 - Fallback to "detail" response value for HTTPException message
 - Handle "error" key of response being a string in HTTPException
 - Add asynchronous interfaces for Twitter API v2
   - Add asynchronous.AsyncClient
     - Add async_lru as requirement for async extra
   - Add asynchronous.AsyncStreamingClient
 - Add support for reverse chronological home timeline
   with Twitter API v2
   - Add Client.get_home_timeline and AsyncClient.get_home_timeline
 - Update the User-Agent header based on AsyncStream.user_agent
   even if AsyncStream.session is already initialized/set

Bug Fixes
 - Fix AsyncBaseClient rate limit handling
 - Fix handling of StreamRule when passed in list to
   StreamingClient.delete_rules or AsyncStreamingClient.delete_rules
 - Add support for media_fields, place_fields, and poll_fields
   parameters for Client.get_list_tweets and
   AsyncClient.get_list_tweets
 - Ignore AsyncClient method parameters explicitly passed as None

Twitter API Deprecations:
 - Deprecate Stream.sample and note deprecation of compliance
   messages for Stream.filter
 - Deprecate AsyncStream.sample and note deprecation of compliance
   messages for AsyncStream.filter

Misc:
 - Use setup.cfg for coverage.py configuration
   - Explicitly specify coverage >= 4.4.2 requirement for dev extra
 - Use setup.cfg for tox configuration
   - Update lower bound for dev extra tox requirement to >= 3.21.0
 - Remove tests_require from setup.py
 - Stop creating universal wheels
 - Update and improve various documentation and tests
 - Log text of HTTP response when handling request error in BaseStream
 - Update Requests documentation URL for Intersphinx linking
 - Correct typo in documentation for StreamingClient and
   AsyncStreamingClient add_rules and delete_rules methods

Signed-off-by: Atanas Bunchev <atanas.bunchev@gmail.com>
---
 .../{python3-twitter_4.8.0.bb => python3-twitter_4.10.1.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.8.0.bb => python3-twitter_4.10.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
index 247b4e584..b283aef56 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Twitter for Python"
 DESCRIPTION = "Python module to support twitter API"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "8ba5774ac1663b09e5fce1b030daf076f2c9b3ddbf2e7e7ea0bae762e3b1fe3e"
+SRC_URI[sha256sum] = "310193775d7fc381abd6f37021a9af27f7e9edfcce5ec51bd73ea5f30c21fa61"
 
 PYPI_PACKAGE = "tweepy"
 
@@ -14,5 +14,6 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-pip \
     ${PYTHON_PN}-pysocks \
     ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-requests-oauthlib \
     ${PYTHON_PN}-six \
 "
-- 
2.35.1


