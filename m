Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E196C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4271.1634338569441560436
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=3joEpGt/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id p16so47912620lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XeYGDQWr4Y8OJlle16G175xyZ1cGecVd4fysNBRStbY=;
        b=3joEpGt/w9+OePL4BQb8TFgPp7w4k0IuikGi47C3QnygcR7C7wE6KTMSgzV44/iDXq
         oN7IWFjsQnX3kl4wIoieusV/KVPx9EHULbZ4FngAp8Au4hIFvIpww9HOcOx538m/pD5E
         cuuYwpmyK5RSw9FHU3yiv42umXQMu1pSBfj09WPOkMDPFzJcfLOe1A2cN50vEFkbha2H
         tOgxQVrXFReINeXNFLdpMMLsPuLyWVOFmpCiDXByu23/rDec47UNQhzosLbBATL4+iM6
         vq5f0dj+j+dtuGsaG9aY5K6cngpPAJ3aLAIb/U7QPdCeAqkkUxDei5iZ2vByEsDFvrmD
         CcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XeYGDQWr4Y8OJlle16G175xyZ1cGecVd4fysNBRStbY=;
        b=wmG/aMItD1uUJum88L+Ae9f1GTzhOPrXL0tR4CckuTAmWkTzmSw0Ov7VMMzt1Q6G97
         foWIjyPgzti/q/45yHz0ZQlUC8FMy6Z/yxyGE56lISBzfWEFu5mR7T3g5Qwz3Lz9MPq5
         Hia8tbFkyMXQC66dRc35IlcRAWego9hUgYuKtzle3Ki8NDsUfqRh1aeR38yESkh9k4Yn
         0LRJI3+3t/QQ2RafsBOSWmaAahv8R07dCUJt8zDTBIFAWznDv0liYjvUE+dgMuMkt7OE
         r8Emfcbuo4HvvXbqJOi2a5AARo5UvEoObydj3P4TbefjCtZZyZSInZBm1NSZecFOxa/c
         1GzA==
X-Gm-Message-State: AOAM532bxL9aOk9MSvz1VLv1OEe0Xj1wNJEgik18BFnK95UvscURZWdU
	xFGUzpsAFfpJZyiz0HnYb2Nad4twdIqjyprH
X-Google-Smtp-Source: 
 ABdhPJxuhsTxZa3WliDA0e0B3iNx1DtvzJ4jj6GlYNbhc63Fvh117QmL09BRtSUE0JnMZwC3ck+DWg==
X-Received: by 2002:a05:6512:2184:: with SMTP id
 b4mr14429896lft.288.1634338567531;
        Fri, 15 Oct 2021 15:56:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f21sm705051ljq.116.2021.10.15.15.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pytz: update to 2021.3
Date: Sat, 16 Oct 2021 00:56:05 +0200
Message-Id: <20211015225605.4162306-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93348

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pytz_2021.1.bb => python3-pytz_2021.3.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2021.1.bb => python3-pytz_2021.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb b/meta-python/recipes-devtools/python/python3-pytz_2021.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2021.3.bb
index dc5196690..119342a4b 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2021.3.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "8c849bdf95414fe708a84473e42d4406"
-SRC_URI[sha256sum] = "83a4a90894bf38e243cf052c8b58f381bfe9a7a483f6a9cab140bc7f702ac4da"
+SRC_URI[sha256sum] = "acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.25.1


