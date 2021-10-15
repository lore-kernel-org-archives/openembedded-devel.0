Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB170C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:04:14 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.4395.1634339054021166650
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bFA6l1Wz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id p16so47978244lfa.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzCkKm68a3McErD10pAlwmg6EoOA5HDwyC1HCYVZ0jE=;
        b=bFA6l1Wz6kpCRxP/pcl1S+SWD6X4vWYwXgmK4RybNO00V5583Ieej3O2bFnnVIeKst
         yOjZSRfZ49HmqfXZ0EBzkDmy5UitS93IVZrIwZSiG0odYWnmLjqBZWUj643KqjZJLEW5
         yqYcviAGTbrh2DMBqyiAe/YKzlNUEIF24t5+vX5t/ZJGRQAJSjdK/5PITfa/28xP9f6d
         xmwaCv3DpGcAtK8gXap7cXx3yb73Z+QjDoqDOdJMoe3bxHRZEopk+Liqga9+j4hUa60K
         c7OvbB43/qg5oqUZQ9xA10tqyxCV8KbGZUd/rUeR0Am+Hv1uswKJCKNlyxM4cAX/FgcF
         axag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzCkKm68a3McErD10pAlwmg6EoOA5HDwyC1HCYVZ0jE=;
        b=2w1YFREfy47nHWk2VyDXrAqZpCg+wvjPY/1xJicyI7oZhf5A5hNzU91v8KPfluK2dq
         qOClFWmlaK/bz1DOuJD2EuT32jxKTcCdVpO2gARASUXcF97C8ZhcotsHQUqiw9793Aq3
         aoOW5SuJkeqbAl3BESwlAFFlGcpQL02zjTREOoFar1I2X5EwxEU/mTYaEOFN/i8HXjgF
         jAwL1A2sIpYMq9y1Y5iUol9fK8+R7xiqx6MjfHzmMs1iWY0ii4yPGNdGwbsroOPyz2q4
         k2LMP1Q56UmHiYXhfvqSzgUngoSnYzJV2r3eQZ7tM/9ZSbvE6d1W0MW+JlMa8+SYo+B3
         1Zpw==
X-Gm-Message-State: AOAM5335cCMCxsts+Ej+Dfslg/kHMs0GNcXmE0NIPVym09IoUyPQMn+/
	N0aT5alcCLbh7jj0H37RrsG91txEXmiorj33
X-Google-Smtp-Source: 
 ABdhPJx2PL0EHKUyIeSp9WevvKclhiNXQe6bZ8GMxU+E0E3SsviWcYEVHnjx9XDW2iLf4q08cVMLPw==
X-Received: by 2002:a19:2d14:: with SMTP id k20mr13773749lfj.56.1634339052046;
        Fri, 15 Oct 2021 16:04:12 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 a29sm155362ljq.37.2021.10.15.16.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:04:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-cantools: update to 36.4.0
Date: Sat, 16 Oct 2021 01:04:10 +0200
Message-Id: <20211015230410.4166668-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93384

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-cantools_36.2.0.bb => python3-cantools_36.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_36.2.0.bb => python3-cantools_36.4.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb
index 632175cc4..ec7d4b87e 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "31bcdd56cbb5e26decab42f0624c8cead9b94991f6ee922512b0acd6ae7d6da2"
+SRC_URI[sha256sum] = "8de959fe61bd1d5c30e91aded237f4273c13fafe5fee4d1d78a15a84c8fd9691"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


