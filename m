Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.308.1597264908954229619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOR2fvb5;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id g33so1638898pgb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52O6/BsI/9f4gMu6NkaFtX1JJzNcVKlKgzdpww038IY=;
        b=fOR2fvb5qb9zHoPEw6TWipUK4rE3aGuspZdbMkezQm5+SOxSq29ZoH2FzbhB8MVxBi
         wNUyZ6rR6qtDZ2RswGFkvLZP0mA5I7vTjNFrhqsDvRihuy2+NMxi9eZjRow1o7lskdee
         sZXE55UdBj2Fysv/CFTMLPuaNnRAm+3X2NYvJusp7puNo4a7chckxScukL1PXvJjZnKo
         yDlVc8+BAXouzoxAwlXKp0QBbV9fCDs2qlHiBDB69hitVmk1Etb/4BcIdL/XE4QkUnr2
         aG+mbhBd/y0LECZK52HjGFnU4Wz2CknqO2jCZRJEKyEV0P5mdO8ctE/TZ3Az6dX+ZoGo
         7eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52O6/BsI/9f4gMu6NkaFtX1JJzNcVKlKgzdpww038IY=;
        b=IMDzdTiNjvemS/I2/t0BtjERMykrUZ2tEMKSSxmkmPLDfVMm45zBUdIJy0dKo7mMxH
         /fufgNehZxjhW6o5QvFVOhgLQGE11T5ND3w2QunirRDRFiuFauHOXBeusJW36gZRVbOv
         /Xz3vSST8Nvte/TyL9FzKdSPG0BnW8ioyk/+BOgBkHCs4U1xA4y0pDDvXypkq2jNVgr1
         c7VfCSIkW2IBCPmCJlKTKdonbsOeUuZOzNiDGqTwaPNtC28d3e9Yt9k5nVxiKy8tfrfa
         ZTnPuS8rSpZ39pPWeqGAQlt1dnaYXrzzAh+y6eQKY5UQkpC0/twj6Vy4lXcTz/0yute5
         7Utw==
X-Gm-Message-State: AOAM530DOPf2R7u/Pt+jcZpCXMLKOZRR4W4B5/JfqvkczopWb/zvbEfY
	YTwgh9jqMh9Yw6IhrTHGwjnW711oxG8=
X-Google-Smtp-Source: ABdhPJzzusG44/aKSVGL0K0g52fFWzRwBGV+giNlSBPvR+7eGhJkVVRT6paSKrEiJEmMC4PYtMJWtA==
X-Received: by 2002:a63:e018:: with SMTP id e24mr797861pgh.175.1597264907969;
        Wed, 12 Aug 2020 13:41:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 16/18] daq: Upgrade to 2.0.7
Date: Wed, 12 Aug 2020 13:41:28 -0700
Message-Id: <20200812204130.1012160-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.0.7.bb}  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.0.7.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
rename to meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index 42ffb17a1f..8e5ee66a2a 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
            file://disable-run-test-program-while-cross-compiling.patch \
            file://0001-correct-the-location-of-unistd.h.patch \
            "
-
+SRC_URI[sha256sum] = "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e"
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
 # this error from test-dependencies script:
 # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
@@ -25,9 +25,6 @@ EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${include
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
-SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
-
 inherit autotools
 
 DISABLE_STATIC = ""
-- 
2.28.0

