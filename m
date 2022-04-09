Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D2CC64E65
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.11019.1649538653594255675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lsuuMMS3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y8so6191759pfw.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t02bOdAbM05AMpvKitB129poNozAC+pLnIoaaDpDpRA=;
        b=lsuuMMS3VLeDniqG9Xe/ronCPU4+vkBKqnHbyop0JhS6GpMax5Y5e0bPTE4FiV9pfS
         fJ/WANQRgCPjdLle6XcuarLbO/8AQ+lFXXjv/uuPYZSSbYjR5qgzi0NZXDPksIvuRBX3
         +mTlxgyvgZeMXrRtjL/u2G52Y8ALOlic6JIF4Dm38iO79ZMhH83KeTAnFtjy3TudiWj/
         B2urhkEUW9gvrIXiKFGdMjUkpo6kgOOpOcelizfXYXm2FdeWyHMg/oVXAWMXyDXJQs1g
         JvXMs8moEsF1go8fpsdHdbaRIW3pRpV3ABqOFJh41Nz0QhHc+fMyTDl3SU3odAuT3TyK
         qxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t02bOdAbM05AMpvKitB129poNozAC+pLnIoaaDpDpRA=;
        b=1wQR7oTtuuEBU+kI+QETx5uFXei98YVyF3G1SF5jCur5YRXKoiM/OJ2OQSnP+ZQ0dr
         RcYF5gvs5xkzm3lcwpE2mbBftKAi+H/CFRc2OQD93d5MXqTFvzOi766Acy84neCMRFLB
         /HdVb/zy6wo+z9pk58UihvTdxoYo+Hnecj8xm9RNmDNddIxMWUEjgyQzmE2AMAVUuD0+
         M4aW7o5RJgEai1gfseyez+O3fH/d7qvqXy6qRWoJGA2lPa4IQKddAJchWktqfuU2DRwQ
         Iowvw1zB9J7NXZNRudpRu3xqsya6p0yqWapVPPEcw9Ou9EL1SoJhsdrHBI4qs7DWHqdR
         s/sw==
X-Gm-Message-State: AOAM533wMD3tcjG5PS+1G9eqKbJdas3kC+Jri6BFFaisQdCAVHZn1H9H
	3Jl0apRe7iYdb9ta3anYZjnMVVcyul+gFg==
X-Google-Smtp-Source: 
 ABdhPJy+c7dQVxBfNC/ZGQYt7kulyih8L72R3QCb43DIl9HpqscHLqWaTOKXnMmbVHdwaSPw4Ty0Yw==
X-Received: by 2002:aa7:8154:0:b0:505:68a6:600d with SMTP id
 d20-20020aa78154000000b0050568a6600dmr14254032pfn.35.1649538652822;
        Sat, 09 Apr 2022 14:10:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b001c9c3e2a177sm15521499pjk.27.2022.04.09.14.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 14:10:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Disable on ppc64
Date: Sat,  9 Apr 2022 14:10:50 -0700
Message-Id: <20220409211050.281341-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96503

It does not support 128-bit long doubles

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 08d9e91704..bdd62eadfd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -949,7 +949,7 @@ RDEPENDS:packagegroup-meta-oe-support:remove:mipsarch = "gperftools"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv64 = "gperftools uim"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv32 = "gperftools uim"
 RDEPENDS:packagegroup-meta-oe-support:remove:powerpc = "ssiapi tbb"
-RDEPENDS:packagegroup-meta-oe-support:remove:powerpc64le = "ssiapi"
+RDEPENDS:packagegroup-meta-oe-support:remove:powerpc64le = "libcereal ssiapi"
 RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl = "pcp"
 RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl:powerpc = "gsl"
 
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index b76cd2eb60..fbd0ce1aad 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -44,3 +44,6 @@ ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+#it needs to work with CXXFLAGS += " -mlong-double-64" but ppc64 only supports 128bit long double
+COMPATIBLE_HOST:powerpc64le = "null"
-- 
2.35.1


