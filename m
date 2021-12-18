Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE7EC433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 20:16:03 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.9202.1639858562423191114
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=tf5OQB2p;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id m12so8981242ljj.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Og1kQcAPd5341VtY+w23HWs49C8LnjIdi9OFriSJ4w=;
        b=tf5OQB2po2HKGbKvHEMaXQOCu5k5pPz5U+02E2xU1ljWPkdU+qc1azA1ESzo2VgTUU
         zCPvfq4yUm3uBTxdz1AV25nx4n+kB0g42An4e1nclaSkuH2W4NOJCO99IgSaSgfC+F31
         WMLGiEbJLhTZ6w4oi+zyMwyuLBz2JHwaJvppxa8YdKkcHTqEISfQdqha5SfJudx7VF6W
         Izm2F/eDdMXRTAnAEQnICyWhPVsWJcD3gC+Y/K57/S1279VrYq3C7ZXzIP2OH8nrXPJc
         /u+9UXgj+9LuuCqZnZfSPTIcseMfyZYpRdTWFNFrX4TOGzuEHMS0Hb4/g5w5U/FifZ64
         yTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Og1kQcAPd5341VtY+w23HWs49C8LnjIdi9OFriSJ4w=;
        b=FHUVkgC1YaOYAt71daBrfv/t5OPMSHkCA98X6AEbhZ+r28m4au+Y6hLZnUT3cuOX2l
         NtA6uogtXk9rmf7UpZ+j62qqWsG0nlvddcbSZZZOecnFvtNapOgwSE7K0GvFunJ+/hnL
         dWnLTM97FZpCKQta0u+hAC3zEj3Kh620DBXXCGEcU8QUkt8FQNWVo9WvpoqVEUVvnpf2
         piPXvT4ju+ch20+8YCvLPmCgq/V8oiXgRLha11LH14rpEe0PH4MoXSSOQdg/KQOWktg3
         b9IttQvqI4T7ERypVAm45JDhz/DFD6F5jENwNOpGtPMTQmzugCMTEWqhqb/BOy8nCp7N
         U2Tw==
X-Gm-Message-State: AOAM532M7DfUZku/1zksANREaek6n4VkFrWesUvTVyJnF6f3Wx7D9Ft+
	WuS/DlQSOHZYR5kCzDlBVEzVjNnhXfccrom2
X-Google-Smtp-Source: 
 ABdhPJwLU1M0qtojwb/Ntk1eWyfPfYu68r++xEgqkQjz9Hr4sQdwjxfHfoyJeW0jUt46yl8kJrpfwQ==
X-Received: by 2002:a2e:b894:: with SMTP id r20mr8039346ljp.304.1639858560106;
        Sat, 18 Dec 2021 12:16:00 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 o18sm1477815lfu.139.2021.12.18.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 12:15:59 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-contextlib2: update to 21.6.0
Date: Sat, 18 Dec 2021 21:15:54 +0100
Message-Id: <20211218201554.371995-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 20:16:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94439

License-Update: note on external code used in the project was added
(see @e42cd73fe9857366154d783e2a85e3d8a72ce5e7).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...extlib2_0.6.0.post1.bb => python3-contextlib2_21.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-contextlib2_0.6.0.post1.bb => python3-contextlib2_21.6.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
rename to meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
index 2eac0ad27..f9900b134 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Backports and enhancements for the contextlib module"
 HOMEPAGE = "http://contextlib2.readthedocs.org/"
 SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
+LICENSE = "PSF & Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d2b6be100f1002194122ec9bfee7b8b4"
 
-SRC_URI[sha256sum] = "01f490098c18b19d2bd5bb5dc445b2054d2fa97f09a4280ba2c5f3c394c8162e"
+SRC_URI[sha256sum] = "ab1e2bfe1d01d968e1b7e8d9023bc51ef3509bba217bb730cee3827e1ee82869"
 
 inherit pypi setuptools3
 
-- 
2.25.1


