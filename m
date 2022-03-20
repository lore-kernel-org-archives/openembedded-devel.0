Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A4C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:59:03 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.21640.1647802742441643542
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fac9BAb1;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id l8so13819876pfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJnbukZqigioVos5jjv1Mwh+SPaolLFwzf4EKXqNHqc=;
        b=Fac9BAb13fs0b1yV8O8klK8gpP76pIeSXRElL35MGtZOk8ub0gNB5cgTsTdXZ+M/iu
         9wn3sDn+XmeN4BoxdqEG4mQtJSv4u2mmeqrsdjFR3lkZUoM/kuHnIVbf0wwHNH932mht
         4idWmAtStPgVbzkGpc41DfGOmoRvffvTHNkXV83BPXhix/zh9YmEzDMyyX+vssIBfzrp
         5vUsAaXJREgX45eKLbK2LH2wvzJaaJA+4k7N5BLIRQ3triDYR6gecs1NIStdMsOJ6bCn
         Uc/GjLBQV3typNZbD0Vh6fip+Zljtxb4VcD+yo8CW0X/t2eO7kpHJ99sV+pEAOyINx70
         klwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJnbukZqigioVos5jjv1Mwh+SPaolLFwzf4EKXqNHqc=;
        b=eKiKC1LSFWOkPXFcxEiD13hsOy9In/ANQ34zoUzHoTovqU8F69b0yI92v3ikGYbEGo
         +m0hv+3SsEBDQmYRqhaEnNKyBHi5k0CFo9YKWBPxYLeHuiFVYTjqkmmB1wOJb3HFhwnn
         UMGBqf+QyFlP4TgfM/BW0ah0ZVHVdzXmnKZA36oxpX/WP+nf2h5Rx2hDjAMIcALB/uD1
         Bq9PX3MyjrNGM8cnyNElwcvbmmTMh8dF2nRZcX121E+o5DfmHex5XEg6Rno2vEBIfWer
         1gozeXVaPcYohtxh8C14m7bEFUTSKblQnflqITE3Im7EhJkzyVgM35uQ60H9xsjgYQLD
         KMKA==
X-Gm-Message-State: AOAM531YNCh2k1zmBNqxHqjl3XD11CugRwBeTu9wqIBNeW9lujXfkD6v
	QeC88ma+w92Pq8TIBODRpKvqM9pthmEcJQ==
X-Google-Smtp-Source: 
 ABdhPJwK22ynYDy2J4Lb2GMegB7lYUXzh6jTh92LbnKllGXPLmMYZBRTnOl5undqGiB9MeepQopDow==
X-Received: by 2002:a05:6a00:1a11:b0:4f7:bf07:c068 with SMTP id
 g17-20020a056a001a1100b004f7bf07c068mr20238812pfv.81.1647802741671;
        Sun, 20 Mar 2022 11:59:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm13884074pjd.15.2022.03.20.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:59:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [meta-perl][PATCH 4/4] io-compress-lzma-perl,
 io-compress-perl: Rename to use debian names
Date: Sun, 20 Mar 2022 11:58:56 -0700
Message-Id: <20220320185856.3302842-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320185856.3302842-1-raj.khem@gmail.com>
References: <20220320185856.3302842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 18:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96089

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Tim "moto-timo" Orling <ticotimo@gmail.com>
---
 ...s-lzma-perl_2.096.bb => libio-compress-lzma-perl_2.096.bb} | 2 +-
 ...io-compress-perl_2.096.bb => libio-compress-perl_2.096.bb} | 0
 .../recipes-perl/packagegroups/packagegroup-meta-perl.bb      | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{io-compress-lzma-perl_2.096.bb => libio-compress-lzma-perl_2.096.bb} (95%)
 rename meta-perl/recipes-perl/libio/{io-compress-perl_2.096.bb => libio-compress-perl_2.096.bb} (100%)

diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
similarity index 95%
rename from meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
index 3b8ce8d02d..15952f17e6 100644
--- a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096
 SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
 SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
 RDEPENDS:${PN} += "compress-raw-lzma-perl"
-RDEPENDS:${PN} += "io-compress-perl"
+RDEPENDS:${PN} += "libio-compress-perl"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
similarity index 100%
rename from meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 918c21dd51..4b2f5cc029 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -14,8 +14,6 @@ RDEPENDS:packagegroup-meta-perl = "\
     compress-raw-bzip2-perl \
     compress-raw-lzma-perl \
     compress-raw-zlib-perl \
-    io-compress-perl \
-    io-compress-lzma-perl \
     libalgorithm-diff-perl \
     libauthen-sasl-perl \
     libauthen-radius-perl \
@@ -33,6 +31,8 @@ RDEPENDS:packagegroup-meta-perl = "\
     libhtml-tree-perl \
     libhtml-tagset-perl \
     libimport-into-perl \
+    libio-compress-perl \
+    libio-compress-lzma-perl \
     libio-socket-ssl-perl \
     libio-stringy-perl \
     libipc-signal-perl \
-- 
2.35.1


