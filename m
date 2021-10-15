Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBF3C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:02 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.4187.1634338561375517863
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=FREVs5O4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id x192so12702197lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3togumMH+h74CJ9ne3SqIu06WrHjWRGJMfoM7pPzqk=;
        b=FREVs5O4PbJpHltJfl9Bo20GnNR40G8zoPAxEv9f9VHT6coZr41PaHMr3wlPz/mwMP
         VSi8VyUzdMIZzmBcmyysqMzxBL9dTZCpCj/3uhTsr09DPk+L1K7IhE4gHAlLlXFIEREQ
         rypExJQAJRINWymkm6Xplph/lSKbp8y7aywEtWk9yiafaWpxMXzPxqHraTEgjSB4FYpr
         g4KciqVwwdq3rFBuNDqQEF/F7gay2VM28FruJbE2c4QYsC4A5o5iWfcpEW2j9fzPpPS4
         NT6OLYhZ5vSMAsmmgm03eg5F2ff/QNR4De9xfp3XoQ3TSeh65Lh63w3yxlVK+Ewuo6VZ
         ZPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3togumMH+h74CJ9ne3SqIu06WrHjWRGJMfoM7pPzqk=;
        b=JscUQMxtIzksQf98DbKgu8PngHwOXGXkUj2Ji0sa2Vz/OzwCEasdHVPc5P5LCnEY1J
         mTuBhN6/kyV7pSAcHJ5cr+BKJpnAlzeF4zPCbBegk/cgp95xunEXoY3kzhWbitByR5Iz
         tn3F7zXORthLA0m4noM/c/BwkQsecFe0j1d5q6satJfCy0DEzSU8ManADEbZIRs3/Pmk
         zxOPuhA1yry0F6w94/WDYKZwbm1Px4rGScC8hTu+ovVJdsDUHTKFYDRqTKcG0W7FTQdI
         CZN8mLXZnNpdfkaxz5WozOnRqCvkabXwqVD5i8JhspUU3Hl1+2JaH643AX7V8i0T4TNm
         xI6g==
X-Gm-Message-State: AOAM531gXhllS17WSUIl+YofGFrvwEEdR+DJRS8FxHrA+1GEF9gbke2C
	KgNSSWUvKZfjH9Ao6n0piFbT41b8r8btcH7B
X-Google-Smtp-Source: 
 ABdhPJyOexWioanfDY2bTfb+FWW+M4m/21hXBkGndl2Q0cts8qXCkhf6IyVbq+D7Kbdgg0VkzficGQ==
X-Received: by 2002:ac2:5e78:: with SMTP id
 a24mr14612932lfr.348.1634338559388;
        Fri, 15 Oct 2021 15:55:59 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id r22sm718800lji.5.2021.10.15.15.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-twitter: update to 4.1.0
Date: Sat, 16 Oct 2021 00:55:57 +0200
Message-Id: <20211015225557.4162081-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93344

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-twitter_3.10.0.bb => python3-twitter_4.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_3.10.0.bb => python3-twitter_4.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb
index bb034a4f9..ac1dab8d8 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "76e6954b806ca470dda877f57db8792fff06a0beba0ed43efc3805771e39f06a"
+SRC_URI[sha256sum] = "88e2938de5ac7043c9ba8b8358996fbc5806059d63c96269d22527a40ca7d511"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.25.1


