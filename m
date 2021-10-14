Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8233C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.9573.1634218339894262638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=QkXA0aDS;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id g36so10216878lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eu6oAJExGXi3IXDa6oROBEnHiXMqMB3aUuDW7I6eQ9w=;
        b=QkXA0aDSxZg1mIO6bXlyJZsE9HY9qfRtP8AuRkbME9W7UdNemV59fSrzRgx1A5nVmW
         VLFDknBuf5vvMiWObCyi2SrRTlXEM854NcPWOefFxiNTWqQxu6peO3Hkuq6W0GyMMuOV
         gCh5hS+XOWptsqiiRG1zcRqXNofBWVIDFJKd0Fm1SSeXsfv4UF/+ENUuQnUcignCKLEA
         0+cYTRtMeazIYs+3bNFXpHAzID5p36HThz5Dm32N3YmDpUhxsGaSj1LEvtYXUYfDZ45J
         QxOapd15lEwiVkvH297ky6mb8V4fNTDojZ8bvyQTAAXrLgfJC8e9+VPraTsKRtczWGuF
         p8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Eu6oAJExGXi3IXDa6oROBEnHiXMqMB3aUuDW7I6eQ9w=;
        b=yiVMSb0OCoDMcc0ODLVIo4hxITy9A9nRgME1bpKj19roPXdx8GKwmpvUs0vcvHcX2W
         /tP1gndfBIU7bGAWwMXE5P+PZYThmZc+DkC7EjEDRRBLwrVie19LPacvT1URq5KrHFRJ
         3j+BWHbCZqLbU8Ki1zCPTYJ6ldUUTsaKlPSM1E4C/RA+UT3fzvOsD/zZJgYnuZIfLLXk
         pCHSNMn2u2P2g1ewwJnCKE47GpluEg1LgQI+HrGaf83/dfzwrkGuqE29Dsvp0AJ7KWS0
         1QbGAr6jOUxJcDYH/TLIAeQ10+VwwziWzhQhnCrve24Fy56J5XXUxRrSzIJoov4EUBhs
         SVNg==
X-Gm-Message-State: AOAM533cBB/U/j9ypkJ3ImtenFDLNZDjp236VOZA29edE3zNSALnAgCc
	8pVoWGo/tE/OVK2fzRhSm6ByD9paohYbcXQc
X-Google-Smtp-Source: 
 ABdhPJzI4BynO3AWyaGWJt8gtoyE8BXX+3q9u7yJCyjx/pY83B1pXVc0xt1Mp1j52vjI6a4E/uNPqQ==
X-Received: by 2002:a05:6512:3404:: with SMTP id
 i4mr5009790lfr.14.1634218337913;
        Thu, 14 Oct 2021 06:32:17 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 z13sm263334ljk.70.2021.10.14.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:32:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: update to 1.18
Date: Thu, 14 Oct 2021 15:32:14 +0200
Message-Id: <20211014133214.2548068-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 13:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93295

Changelog:
- Add support for Access Point FILS IP Address Assignment IE.
- Add support for P2P GO-side 4-way handshake IP allocation.
- Add support for forcing SAE group 19 if BSS requires it.
- Fix issue with handling faulty SAE duplicate commits.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.17.bb => iwd_1.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.17.bb => iwd_1.18.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
index 00d94f36e..8d58a7a84 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRC_URI[sha256sum] = "6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7"
+SRC_URI[sha256sum] = "0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


