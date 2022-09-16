Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73357C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 05:25:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.2679.1663305937311132291
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 22:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YtaUDqWq;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id s18so14461395plr.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7S+EoXPaWoRK5M3eq8RMsRfuHfYoXVNmPKi8AgnoDx0=;
        b=YtaUDqWqP9W0RfLW6FmSoo/FjJECHQP0QDmJJvSkPhagBgr1yWOcc/JwkMwvotE0ER
         It94g9j7gsqEbw953iVhJaN5akVUs92SZWKbBt1ach9sSE+7Q2qjNej3LlbamPviS2sL
         cqh8KX4XhFVaihxrpWxBwDL5tZZBU/YZWSzW+fXi9t+IBJKcpLkNk+uY3XTrRcL5TxFv
         kM6nivTV96dQl+DMTnkIOGdTYEnvJXIyNU+BVp8Jdb1dElQDoE0zOIMzOrG3zeg3S6uW
         m1isk5jCq1nqwoSVIitYY/M18UlTiOpHTZQ5qEgOQLZwLhI0Jeh4kpTeCJrFNzANwQWN
         94Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7S+EoXPaWoRK5M3eq8RMsRfuHfYoXVNmPKi8AgnoDx0=;
        b=NG5aKhJbj12xqt3BBik8TDHj68ofPC+uXEOE9+CyKTe8TTsnauBaV09Abo0Nuu3w83
         3nhhHMpAb136NHol4p0jOgWz15g8RqCFAFxN19oQZPOOIcIwKNeaxrES6GgRxAUs+8Js
         vsJRQkWIIG4Dv26ngz7Daxgdi8f0FEiC4Zp+oeuGVMUMo7ArbhrsFWWY5lxD84VIrAWW
         NPDiHCdrxPFVr0BCWUeELbV6AKmMJeMQHqcOw6wd7vGDodw1R3LlEFxVllRYJFFeyeZ6
         a+v/s2R3ZcMmFlIe44iZsDjqMMDG9DBprh533zpNBj9XZmjX0kJBkOfpI72p235O8May
         12Nw==
X-Gm-Message-State: ACrzQf21ucvOxleBdlOwZ20SwOLlI4Lk6zvrEcNvldi1RZiGOXsCTSn4
	5wKQsID4eoW+9B0s3l8CUYQTkN/Hg1S5qg==
X-Google-Smtp-Source: 
 AMsMyM4T1yDnaqJVtXSwM4Ot+Fnate4GgRUohomFRWrbY7m2gpR/4mcWoKjDq3NPiSGgpwTVZ71C3g==
X-Received: by 2002:a17:902:7c01:b0:16f:9649:be73 with SMTP id
 x1-20020a1709027c0100b0016f9649be73mr3090385pll.70.1663305936423;
        Thu, 15 Sep 2022 22:25:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::fe04])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a17090aa78e00b00200aff02e90sm561039pjq.18.2022.09.15.22.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 22:25:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] wvstreams: Add missing dependency on boost
Date: Thu, 15 Sep 2022 22:25:33 -0700
Message-Id: <20220916052533.269620-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 05:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98828

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index d73c64661f..3453f3e964 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -4,7 +4,7 @@ SUMMARY = "WvStreams is a network programming library in C++"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "zlib openssl (>= 0.9.8) dbus readline"
+DEPENDS = "zlib openssl (>= 0.9.8) dbus readline boost"
 DEPENDS:append:libc-musl = " argp-standalone libexecinfo"
 
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BP}.tar.gz \
-- 
2.37.3


