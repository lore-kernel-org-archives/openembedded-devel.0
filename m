Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5E4C47091
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.21975.1649623577365204283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=r/5Rx/O9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id d40so15860686lfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JTrRuJ2E7gLUv5IN6OYfIhYAxNy8epQ+FaHirC6oyqo=;
        b=r/5Rx/O9A4iTYnW1GEoRkvT7EHv5/ibzJtn4OWCkS4nWhXjgK+k8zcnh/s6shHAKQG
         CZau51gJFTMr0ifkdYSz3seHZTP+00AwWScpGAwK6mRWJUBDVmsFY4mum08GP9mbLdiN
         T3ur+RWimiIDgby52Epm2k442+1Q1UAp42WMLpr9+m8ibSePZoowTFFxGq79PnjQGqXA
         CyWA3oiJkF6Qj5/3hBCI0Zxqdb5kVv6PoaUOLvKrOWApoHLjJE9rK043POMxUjIoNtGb
         XVdFcMWG6D65OlaypZj8/yN+ybpdEmwuxKs5J2llhXgssVy8py3enL7l4qavm/okKc2O
         44Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JTrRuJ2E7gLUv5IN6OYfIhYAxNy8epQ+FaHirC6oyqo=;
        b=Q9WdDwtmd7x+d+Gvd4RlPLA/cV2RaXMrmQf4prWwumn4ckzAU9AD/tGrLvm62VBsx3
         PEqL+p6bJjd+Fzb3EIpqGVJKWVxncR5OUXsNqOPthIax9AxEmSS8ObBhpcrl3t3qE/U3
         JclHTxE3UUw0H9G6VhkIw+nH8Z6kM1rO6GWOkqZyV1HZfpBdTSXa0y0wpHitdNDd7geP
         nYheC0vxgVGZl55YzoWq/d4XU2nDZvATFdQfmIQwkhMxWL0j6tHV//L1NoyTIXasYYbE
         pVvV/zdJH12DDDVCnJ348/LZx3lh41LJA/ENcFOGbcYrap/ZLfs8wsC63gcyhEBEXJPC
         tyzA==
X-Gm-Message-State: AOAM5319bQ7Wng1MQ/yT00U04POQhza5lq4qI+Rl/op8IcJK5qaPZM9W
	PSx5rCcg5ta8bwoCyEdfTUyHi/m5uXp/wNT8
X-Google-Smtp-Source: 
 ABdhPJxIvWaPyAuTfVLk529dEXkLux41QvqioKZs/oYpvGl5aq/f+dK8231iR3TnuWjWsqVpNgidUA==
X-Received: by 2002:a19:da12:0:b0:46b:926f:d34b with SMTP id
 r18-20020a19da12000000b0046b926fd34bmr5715765lfg.646.1649623575113;
        Sun, 10 Apr 2022 13:46:15 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 s12-20020ac25fec000000b0044837422334sm3111760lfg.154.2022.04.10.13.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:46:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-beautifulsoup: update to 4.11.1
Date: Sun, 10 Apr 2022 22:46:13 +0200
Message-Id: <20220410204613.4048887-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96534

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...utifulsoup4_4.10.0.bb => python3-beautifulsoup4_4.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.10.0.bb => python3-beautifulsoup4_4.11.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb
index ba89e9db3..3037ea83c 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.11.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Screen-scraping library"
 HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=15a76c7c51ecfc5c094d04f3ccd41a09"
 
-SRC_URI[sha256sum] = "c23ad23c521d818955a4151a67d81580319d4bf548d3d49f4223ae041ff98891"
+SRC_URI[sha256sum] = "ad9aa55b65ef2808eb405f46cf74df7fcb7044d5cbc26487f96eb2ef2e436693"
 
 inherit pypi setuptools3
 
-- 
2.25.1


