Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D82EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:01:00 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.9915.1689692459399872255
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=YPAksq6w;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-767ca28fb32so300902485a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689692458; x=1690297258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SZb7L5iOtsqd8UP7BeCI3mPsgOSe0U3VBQWbf8A7jA=;
        b=YPAksq6wGYV8Px/lOQ2qijUV+olrfdlg+EobF+i1Ldt7i80h9tVdDBfKyepZoDUz/C
         g//Q5uDc/o3p3sbO+eYoCaub9mBaYr30AG0UatP7S/syCrdC3mp70s8ntvRfFBYuixaS
         yn6uNOu7plC5wlbmVGdIkN/fN6leDftu3ofjFHRiWd7jkSl3DgPi28UGSsAtsduPDd3I
         J9L7p6aM7jHQolP8iBV15s2WSzfNny0LyWYs7dJ8+K/ZMRX3qdga+CIsbTNxcN7FvIJA
         q5WSSNt9kShLoRQ2/cksT0I9/2CUspqnaB7tqkLpL3TkFbSOvoRiQelYkV2hvO//LOLN
         AFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692458; x=1690297258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SZb7L5iOtsqd8UP7BeCI3mPsgOSe0U3VBQWbf8A7jA=;
        b=VqDeK68V3IUWDfGRc1p2FoTu4w3trNRWHzHLqxvFv/0zXQ7Q+DMmgVhz9HKLyWXtDM
         fUteHl+VwPuQSs2Hzs3Y7gP+DQVyE8gKN7PNfpOuI4+YWxzx4S5c5hcCP7QQNqu8rSww
         PXNsFVHdsymloupDjri8HUeBdl00Zd/ztf3QjrCLQy8UnsaOTL+qRJRV/zew7UNbd1gw
         Rdh6NY1oFQwiPZvBrikcuw8XajiaWoUXyUubOkE+gusL6P4+fcpeEiALYBROpquGSzFh
         uLEXE4b+ydKfVn7u6pqSBrF77sQDK80C4UtieLeXv5wfL/TV4UZDdyErKJxDWguaw4dC
         ZQvw==
X-Gm-Message-State: ABy/qLZXUj5PwldZiwWJWHMsPloSbkKTYfRa9Yt8DzIsroVNtsJt9kXn
	+1e8Xq6k0dtZ+aSDjX9qTq5rhs98STKTN/byOcA=
X-Google-Smtp-Source: APBJJlHBlUzojcssWfH8VtL4Wdy9rl62S4p8bGt+THK2hnMBeiURAhtmDKKjKJY95VqB7nsW3i+pfA==
X-Received: by 2002:ad4:596c:0:b0:635:f546:83d0 with SMTP id eq12-20020ad4596c000000b00635f54683d0mr12656726qvb.11.1689692458334;
        Tue, 18 Jul 2023 08:00:58 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id u14-20020a0c8dce000000b00631eaf8b9e5sm765565qvb.138.2023.07.18.08.00.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 08:00:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-ipython: upgrade 8.12.0 -> 8.14.0
Date: Tue, 18 Jul 2023 11:00:55 -0400
Message-ID: <20230718150055.2501513-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718150055.2501513-1-tgamblin@baylibre.com>
References: <20230718150055.2501513-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103946

Changelog: https://ipython.readthedocs.io/en/stable/whatsnew/version8.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.12.0.bb => python3-ipython_8.14.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
index 0cfc80ec9d..83af99a4aa 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "a950236df04ad75b5bc7f816f9af3d74dc118fd42f2ff7e80e8e60ca1f182e2d"
+SRC_URI[sha256sum] = "1d197b907b6ba441b692c48cf2a3a2de280dc0ac91a3405b39349a50272ca0a1"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.41.0


