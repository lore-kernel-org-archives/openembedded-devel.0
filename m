Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F00AC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:14 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.4191.1634338573338050751
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vMerbk+1;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id y26so47870264lfa.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBJnq6QliWHR04PvBQSHhQk1WHTetx+2TKl93h8WOhQ=;
        b=vMerbk+13UIA+BMF2Xkfo6Q5juwmD1bsB3LB416KcVrmSBWeXXaNUB8tCM5suhIQJM
         T+wBL+N6h2Mcv53K86Iy/RjTvDV9FjmEZ87UkkoBnk91LfD+M362QzoxiszBoC4/flxs
         c4Bpk5HsBsqGj1yHDHS3wDjaBYa7fiNYaFr2lGHeEZ8bYEx0RG+6YGDTSJ0Hu/7mPq6H
         LtknUFg0xZUQSb51y+PHY7sQ02msaXvED2ZlYpqK2RsBa9vzlJDvU+PBP2uHBOGO7uXp
         OKCBiafgcJ1El6F9IS1xysCtgdcbhQmNsGeZ/Km242F0JQWnEjQP+Aqc7An7atiE6zKE
         wTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cBJnq6QliWHR04PvBQSHhQk1WHTetx+2TKl93h8WOhQ=;
        b=Fa2L87xuBMFtJfTw0UUFZup/XN5V3YzELjzJ9bA2Yn7gl5XyaJycsjPWQUUPqmFCI5
         D4xj5/s41ai3xnjZxOeQwves5W8L+3NJFNIB+cctxBQYbeLJ79wQIHPCsDvCBEiPxs/G
         qwCsPWuTlkeOK63P2fIMd6WJtxzFuEAuu23Ot5K+dzocj6XkQ19rRXX3OHE2MLaUmskh
         p4gTBvp2ZBMxT+TAMQItZ9L3li1KYtpYiawDT0JeahtQ21ZAFkjW7dJmMZ4+ZKPGAj9w
         QZt75Y6UQ7WtiYK/hXyExXucY15KRuZWTf5TXSn+wpXrYW6ACwthjLdkFmcLRine9D4G
         k/Dg==
X-Gm-Message-State: AOAM533wihB9uuGs2ITBA/vRcHHsDNMeVXpKhTMlywZ4vVFt4oZvp6xP
	5YsGPuFhIYwctjd1IQLjtvs6bHHNq+q8/HyJ
X-Google-Smtp-Source: 
 ABdhPJwjxSe/LHjqPCAieEA1Hh6TN4Tr9mx5hcY6C07HFN2SlKtE8XUbCwf/mwxq2DgXYw+zDqg3Ag==
X-Received: by 2002:a05:6512:14b:: with SMTP id
 m11mr13650074lfo.410.1634338571420;
        Fri, 15 Oct 2021 15:56:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 a27sm649765lfg.296.2021.10.15.15.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyroute2: update to 0.6.5
Date: Sat, 16 Oct 2021 00:56:09 +0200
Message-Id: <20211015225609.4162418-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93350

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
index a85b0929d..83cf8b41b 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
+SRC_URI[sha256sum] = "d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c"
 
 inherit setuptools3 pypi ptest
 
-- 
2.25.1


