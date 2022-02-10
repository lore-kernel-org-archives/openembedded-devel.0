Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CC9C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 15:05:39 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11230.1644505538143531221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 07:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=f1En4tsl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id o2so11058656lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 07:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QkgUA7j5UUFaYVPre/7EgDpTDTjf/DEUb1GmsFayT4=;
        b=f1En4tsl6x12p4vc/CBwrpgfcSGQZf6Jv3tSVXFIPt8t097FqAWTV/dRP3GvbGMJoM
         Cs3chz2FwlHH5MVI1uzAO17Hln46XKycYzZVyt/02ajqpCdZrW28r/JzG4oa7qx5C+d7
         Q4YbPNJoq+tn52uK4TUDOPn+ehdePQBgCIipym+ZMqScUNpb6CPwuHz6qaDgTyLORtTX
         8QzXAboncabudNMeDU0eKQUejx1hq74gdKbPuemSCahJlBm5ebl62YKqvJolp/+GXU2O
         RLot4o0MWt0Y7PQuGKsthUL3aXXC7ysouBrmzapxWM7DJ3YyyNCBDRvY4N0I5G5nSE2Y
         jT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QkgUA7j5UUFaYVPre/7EgDpTDTjf/DEUb1GmsFayT4=;
        b=C7Sx505hEvePBOgASwbskqJ8OdC5e07esYUwgY14h665VMWMxOZjz2+ZLyvIbe9DLU
         ElCRsikUjX10xjiCTqYq4ixCgAoM4oaDgmI3Z/P64yFFtKVcDCjIDZoTluFwOdc793tM
         Bes5NeNQrGW0kADfG5rbkys/KJiN1o4yME2+sinh7mHWeJJltoCmWrhjzurBQfo6FMtL
         x4mrCmuEwVYMSakk+nrgWbkmdPYpwIrIYGLDGFoIZtT1s4gS9W75sEIbFukGmET4GUJw
         MrhIozpjpyj1MMRFWjgj/oOADVuXHiOnPhSyP1UHsOgryEBTyCRu8bGucH9+ftaFYr/8
         QRTA==
X-Gm-Message-State: AOAM531AT51awIe8Qrbj+HAKpj8qHhjZ/bUo8PR2UAEF9nFnsNwlACWp
	9CTnUk9hOh+n1nhWbAm6kuzFqoYicIIIJkGd
X-Google-Smtp-Source: 
 ABdhPJygn8e5ihPTVDmu7F2U2oxA74/F2Gs1b6xsx0w0cEG8HD1Hzp2ScG5qOfGc9Zk5x/ZmKwR3vA==
X-Received: by 2002:ac2:43ae:: with SMTP id t14mr5241484lfl.599.1644505535981;
        Thu, 10 Feb 2022 07:05:35 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 m12sm2830234lfj.54.2022.02.10.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 07:05:35 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: update to 1.24
Date: Thu, 10 Feb 2022 16:05:27 +0100
Message-Id: <20220210150527.2236832-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 15:05:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95288

ver 1.24:
	Fix issue with handshake and missing rekeying support.
	Fix issue with BSS ranking and zero signal strength.
	Fix issue with setting OWE IE length correctly.

ver 1.23:
	Fix issue with handling handshake offloading.
	Fix issue with at_console and D-Bus policy.

ver 1.22:
	Fix issue with handling periodic scanning.
	Fix issue with handling scanning completion.
	Fix issue with handling scanning for OWE auto-connect.
	Add support for additional DPP features.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.21.bb => iwd_1.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.21.bb => iwd_1.24.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.21.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.24.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.21.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.24.bb
index 834c1d897f..6ee2651afe 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.21.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.24.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "bac891df91c605271e91b73cf0015e1ba86ff784347e53fc67601366859b3851"
+SRC_URI[sha256sum] = "61b5e48380cd3a6d0529f725eb6974157f1410af165f5d266b87add0bf395224"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


