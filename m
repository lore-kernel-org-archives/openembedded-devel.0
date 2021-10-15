Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDF3C43219
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 13:31:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.9358.1634304694951022854
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=zoh9c96W;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id r19so40689050lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52tRsh8irtcRlfIeB/PQNRHXRc2kJlEQzJyCyWbBuBY=;
        b=zoh9c96W9+NhOH4ypjB8Y1LXnebbL4spnwL/7/cP6IV4OYBvf0nzb4cEmgRLKKUK9M
         +U7C4Non9ncAEfWr7zAoEuaYg8C8N7PM/dCzd/TiSkpdrw218fBubGd3oNPmSKlDb2H+
         5I1P7p1qCdAOdxQYjxW0Ikq5Dlk26d0nRiQVkPtsITteW2011pphZ7vXnjKf6KMTQWdT
         xAPGrU1XYykAZmpjdeim0yO4oTuL4NY32H5JH+KIi8LsNwZajYxb4+1L1sOMHhKlu9C7
         jYRfacJ0tGX8LhDyZpJAUs2ts2izVA2bnTttI64MvGeXwGhgRSNXZqRV/Uh6Kx5tB8dp
         yDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52tRsh8irtcRlfIeB/PQNRHXRc2kJlEQzJyCyWbBuBY=;
        b=fe/oCcchQP/F9qLXapEP751ombhmYWPQV4MPbKw6Q7fRqdPGHVX2O7TJsjmTGmiZc7
         v9675sQscrcKHxEqy4LomnC+LjzJIHApzQweQEhJ1W7OmaQkc2ys9p6f9v1z8ygAVLLd
         dawKKTmLdR5BmLZatzgsaZrW6hNmjcYSkc5OPW5x37YBTSphG4Lh9rG/ULo2FgsiKTM8
         tBYMRyWb+9L2XLXyZgXxHdeNLJn2atD7PttGwnAulHVvzG2MXl7lSY7p3T438D0wjAQA
         F+e5cNir0J5ENS5PLZdKlAyfCvANbU3QaNtSHUs6sSkunglh41FoLtzkXAmBrORYpDaS
         XBlA==
X-Gm-Message-State: AOAM531ZvVtlrNEGynfhZt+bZFNpYb+eu1FZDqSqLcE4192IPPnyZvzF
	7YGnwQuoft5OcU5Tgi45cSb1TmnENfn1d3Yt
X-Google-Smtp-Source: 
 ABdhPJz1fvAFEYzWlPDPhKr5baxx6vbjTsfJQ5yxFwW7f43Sz2ZHQoMZk1X1X0StQ1u7+8sm9wM9vQ==
X-Received: by 2002:ac2:4f01:: with SMTP id k1mr11507679lfr.390.1634304692024;
        Fri, 15 Oct 2021 06:31:32 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 w18sm553806ljj.134.2021.10.15.06.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 06:31:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] fftw: update to 3.3.10
Date: Fri, 15 Oct 2021 15:31:23 +0200
Message-Id: <20211015133123.690681-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 13:31:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93325

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../fftw/{fftw_3.3.9.bb => fftw_3.3.10.bb}          | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.9.bb => fftw_3.3.10.bb} (81%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.9.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
similarity index 81%
rename from meta-oe/recipes-support/fftw/fftw_3.3.9.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index 38bf3a19c..0487c2e3a 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.9.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -1,4 +1,10 @@
-DESCRIPTION = "FFTW"
+SUMMARY = "FFTW library for computing Fourier transforms"
+DESCRIPTION = "FFTW is a C subroutine library for computing the discrete \
+Fourier transform (DFT) in one or more dimensions, of arbitrary input size, \
+and of both real and complex data (as well as of even/odd data, i.e. \
+the discrete cosine/sine transforms or DCT/DST)."
+HOMEPAGE = "https://www.fftw.org/"
+BUGTRACKER = "https://github.com/FFTW/fftw3/issues"
 SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
@@ -9,7 +15,10 @@ SRC_URI = " \
     file://install-bench.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "bf2c7ce40b04ae811af714deb512510cc2c17b9ab9d6ddcf49fe4487eea7af3d"
+SRC_URI[sha256sum] = "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
+
+UPSTREAM_CHECK_REGEX = "fftw\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_URI = "https://fftw.org/pub/fftw/"
 
 inherit autotools pkgconfig ptest
 
-- 
2.25.1


