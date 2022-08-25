Return-Path: <atanas.bunchev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4286C32774
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 14:56:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.25003.1661439374236883338
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JBc80Qkt;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: atanas.bunchev@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t5so26433330edc.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vsANSsCL1F38oFH/dwRYVLhIk8FrOlQZpUaNBpBC7U0=;
        b=JBc80Qkt8GAifqkPVqyx7Z3AaQiQvjN19uCPcrfQa2EwCo6pDiKQP6iCPWin+Jcsng
         CuoKG9QWGuNTElJIAxlz3TABNeLUoFsqS1eHYfz46m3ptZoGRctHBIKC1bkL5zDhHq1m
         7ad2jKkN4qo694NOjYtIZvMpVm5Ff+/zcHQIIbUnNEF25E2SPxyeKWtUlvHUFBIFjBVD
         DHpWjT97DdMsbQepzx+BsuBgyg/JwzZghYcCTlNP59+3aT4nDb4OC6cxgY+XrYzCXQk9
         vzslDBuQn3v6nhLFJ+UcS4wGXNM/tWUJkuOK0a9PE/OOxeS6IwEvEC6y01OCSFBrPMuJ
         27UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vsANSsCL1F38oFH/dwRYVLhIk8FrOlQZpUaNBpBC7U0=;
        b=SwyyIjtLAvR4UPaMRCokAtiflmnSyAPIzN5u8+43u1LYVJg4pjmkOVJbcL5sN4hQmr
         F0DNKo9+uUOME88fOo368mzFk+lMlOA8K9FuHW8H8TSCFzLTK+T+qn4YLSPXoQr0NLHu
         80ZBDdkEAxuDlKQRKgZpGzGOBRdJUyDubZV6i2SKzN163fV6W5/fNPL5OwFzI2NhRiFI
         zyfrO5mExPu0PjkFEKIK9qFvgPajgGhIinJVkC7hBR/14mHgozItskVmJQftLm06VkML
         kPVDlfX2LaJ/aXocCQI/6F33dUzRG5Qf85wS/0YiAhiU+qTlluicRDKhNEkQ1vXVu3dD
         0Jng==
X-Gm-Message-State: ACgBeo1MrQRGxtn1lyfxCAXqY01CIzyIAdvmUBQN01YqLA6U1Vn0uRU5
	FVy7J64VCRrU7o/qsLzf+fsSmJUPPOM=
X-Google-Smtp-Source: 
 AA6agR7nVW8UJib6gjsjy5+w9DVP04mhxfoopDFBr91warPbw23/EooqZ1K70gjcY9+gOqG0C3S8Rw==
X-Received: by 2002:a05:6402:5489:b0:43b:b935:db37 with SMTP id
 fg9-20020a056402548900b0043bb935db37mr3643981edb.347.1661439372646;
        Thu, 25 Aug 2022 07:56:12 -0700 (PDT)
Received: from localhost.localdomain ([195.214.248.134])
        by smtp.gmail.com with ESMTPSA id
 b25-20020aa7c919000000b0043bbb3535d6sm452927edt.66.2022.08.25.07.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 07:56:12 -0700 (PDT)
From: Atanas Bunchev <atanas.bunchev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Atanas Bunchev <atanas.bunchev@gmail.com>
Subject: [meta-python][PATCH v2] python3-twitter: Upgrade 4.8.0 -> 4.10.1
Date: Thu, 25 Aug 2022 17:57:12 +0300
Message-Id: <20220825145712.26477-1-atanas.bunchev@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 14:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98435

Upgrading python3-twitter to 4.10.1 and adding
missing RDEPEND requests-oauthlib

The license line in PKG-INFO was moved from row 8 to row 9.

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


