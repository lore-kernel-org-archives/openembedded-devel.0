Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EB3C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:55:42 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.2509.1667361335608806339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KUoiXRG1;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q9so218132pfg.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljfy7w1rOYzL12m8IXoiECe2+3mG1PfYKtt3JrRmwP0=;
        b=KUoiXRG1ahXxu5K6dEhBiUzrLqZPZhxOODFqejJ698kx/qlTetaqNGmw9o5LWKmWdL
         YaTCLbPsfnHePWEflt0FpDd7e1T6fUyLqScaH45t3VRDV1QZQgW4JSnNiOiRrK5LXqCm
         hzhs8F7mfoH/e72GF+eo9x5DTLSan1WNtEIiOrgUvpVRhBobDIKKj0jAK8ytWZk+JM2X
         3650BTiDug2oyhz+Do4gTVIBNW+xsNZNikb1JPdsfnzKHgSBSduKdMjUCUnXquTrpyeQ
         h0FGtML5E6cSUstd56WyvHsuit/PyFwOhS/DdKfzHe/zPyiglUuFGfUKDsQCGSD9ssXG
         HQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljfy7w1rOYzL12m8IXoiECe2+3mG1PfYKtt3JrRmwP0=;
        b=Q6bqxOJbHkwKZQg5R0lctLaofl3Oz/GFUqp8ARgFKoEOTwdNOXxpL9vBcLQXbmbYEx
         mZImDfsZuM15dTqUvjeCiG5uoPSE5y0meOFdXQhmJtvfj0PhgxfFCGPxEC2Npiu7bGYl
         oGLGJCh4AavW188Kh+LaqAF0SauGiKVrmxpGCCCjTXQ7nZoeFxrXEtLQCM4WlEdxJ4dV
         kO8yiLI+WPjn/uc+atADpwbk4Ht78laelVA5iZqUSY2AEwY+BKxqVBAdjM0V6uuKc47o
         q0uhIiT5gAeVvZrAt1w7XQAVlGYtesb8KILMKSh8QlbIgQEgiDQelcnvxfioa7SwCgBj
         7vAg==
X-Gm-Message-State: ACrzQf2dCaimZO/j7x6a9zyfTEDcmbmqwU73xnP+3txw6ZmuZLxUhMRA
	gMDQvEJTLtX9/uJ9+LyjgjT8mwaX3VQyZA==
X-Google-Smtp-Source: AMsMyM6HrfNiGCeFiB+t/kJtkYCxREwRFbvZFDaztHKj30wh2ojmMF3uswV9YTkXKWKvQPGQSICjSA==
X-Received: by 2002:a63:5b5c:0:b0:461:8ba9:457e with SMTP id l28-20020a635b5c000000b004618ba9457emr20327582pgm.218.1667361334498;
        Tue, 01 Nov 2022 20:55:34 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id c2-20020a63da02000000b00460a5c6304dsm3514585pgh.67.2022.11.01.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:55:34 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 1/5] libcompress-raw-bzip2-perl: upgrade 2.096 -> 2.201
Date: Tue,  1 Nov 2022 20:55:24 -0700
Message-Id: <20221102035528.3967640-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99401

https://metacpan.org/dist/Compress-Raw-Bzip2/changes

License-Update: Update copyright years.

2.201 25 June 2022

* 2.201
  Sat Jun 25 08:46:32 2022 +0100
  92a318bb03b85e2dcb4991f4b958fbce6ce9913f

  * Add perl 5.36
    Sun Jun 5 13:45:55 2022 +0100
    23064d78dcd14f0898aeb64ce408914dac0805a0

* 2.103 3 April 2022

  * Silence uninitialized warnings
    https://github.com/pmqs/Compress-Raw-Bzip2/pull/5
    ff3d907325091287ac1525db384b99a968d763d7
    641a440ec6229c1d368b9ead48f4968b955c0115

* 2.101 20 February 2021

  * fix version numbers in meta files

* 2.100 7 January 2021

  * trim whitespace
    f5bb5c5d254f2a9ac6c6e67a5a4823d0f67e7ecb

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ip2-perl_2.096.bb => libcompress-raw-bzip2-perl_2.201.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.096.bb => libcompress-raw-bzip2-perl_2.201.bb} (75%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb
similarity index 75%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb
index 238c988850..e7cc6a1699 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.201.bb
@@ -5,12 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=33084b7f607ba5d38a64b22f8e332f87"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=3cca53585f3090f28fa8401bf1db9179"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4fdb7ea5071e4b774c52c37331386355"
-SRC_URI[sha256sum] = "a564e7634eca7740c5487d01effe1461e9e51b8909e69b3d8f5be98997958cbe"
+SRC_URI[sha256sum] = "6204b270806d924e124e406faf6bbc715f7bb461dfdbea722042325633be300a"
 
 DEPENDS += "bzip2"
 
-- 
2.34.1


