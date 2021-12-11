Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFC8C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.25368.1639249085804817277
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=iySBGWWw;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id 13so18104199ljj.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6eEPURuTvDqUsxjiHSUgote4iX/Ak7DQS+Tp14qM2s=;
        b=iySBGWWwYZHH2em47uxfcu9tU7hLf7WwIn7grJLujGMtD46BtDCL8/ubsnFqUc/BWv
         hVecMFxeXmO8Obsyyp6rTC02T2FQPnhnJpSvQPNBMVvLEgUWtk1vneHf4eneHeHxBCuX
         4ApU29y2M+VEFad1+/9vkjwzhRAMU0KYV0giRbHuJIPA/93LF6RgiGganmx7l34t0Ror
         GkRUe9JWi30lE0a6wu5WQ69sHrEKqeyPAJcp0+iaEHa2A5cLNVT+KfNMcQq863kuD6p+
         4PUq0nIo6RT4NKq3nDWKwcSFQSkghGnlyPz6QnoIkFm+woNpRJSfH8+eBp5oLSRgLNoi
         1k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6eEPURuTvDqUsxjiHSUgote4iX/Ak7DQS+Tp14qM2s=;
        b=pngQQ32mRnpdrXSF2StQ9/o4bw7nvKwOpDP0h+jkzZULdVFhbEAtJpcmSIPvX9Dzwh
         VLyQghF4740LrxPMB6sDo6AsQCO451xDyB7WH/lvGNZYm5rIPQfsdaaF7LW7dKPDfyDa
         j408fwA6b+rYeZIi6R/vZdeL0JUeHhbagwyKZqVO26Bp+Dsxd+ZxVXCFgp4Rd5u+KCts
         A0qMpPvqFwh+jgGZDLmkE0EMR4VzXh5WchDC0HdqH67nMedKcTAuogfgHY9xsTvAxxRl
         p6LDyxUWqMPaO2zoC951Xr+8IbWsre8BTfc9w4JEh8SnAKgu3BBXYA/8U5Vd6sW1wkR2
         UuhQ==
X-Gm-Message-State: AOAM531KLd3ILZx0FZfxihj66DZjb1fIu9QGzVPQpF0UTaNThk97V3uC
	iCznt9oCzQoMomXbaS/mc/AZH49qkh5lpwU9
X-Google-Smtp-Source: 
 ABdhPJzFxJ9UkwS2K0gauWAEabG+8vBVr5ED8F0hdPZ9OS8Gn35Fljo4yavqFt8vDK8C8J+19XPVFQ==
X-Received: by 2002:a05:651c:1791:: with SMTP id
 bn17mr20066691ljb.525.1639249083662;
        Sat, 11 Dec 2021 10:58:03 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x199sm726081lff.284.2021.12.11.10.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:03 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-redis: update to 4.0.2
Date: Sat, 11 Dec 2021 19:58:01 +0100
Message-Id: <20211211185801.2545674-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94289

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-redis_3.5.3.bb => python3-redis_4.0.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_3.5.3.bb => python3-redis_4.0.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb b/meta-python/recipes-devtools/python/python3-redis_4.0.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.0.2.bb
index 92f6e3ed2..f39a72c60 100644
--- a/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.0.2.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[md5sum] = "7a00d4540374f34e152a33faa1fcee5f"
-SRC_URI[sha256sum] = "0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2"
+SRC_URI[sha256sum] = "ccf692811f2c1fc7a92b466aa2599e4a6d2d73d5f736a2c70be600657c0da34a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


