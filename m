Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE9CCCA46F
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18528.1758896374723706360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XfEgVBO5;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso6993152a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896373; x=1759501173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5R6nk7vORA3l3u9IkNJjKuDHcaaXS9zx19bCIgItEc0=;
        b=XfEgVBO5NMCfyEi3tIVvAP3GBuOefWzh50aAnMYuuuizDB/WSY3s0vY3BiBQdLnH8w
         MSSkzzxyZDCL5phgG6ub7oBFidme1ZpRBP72MROvOaHZlEQwp0XhbdbZBKTmDsYjeJmA
         IPRngXwoIfd8x36mQ21bcRsXH/ADNaoJ701cU+NhQqB4pq7MkdC4uA4971AKPJRaq3eb
         fmCrZeMFFZ7UV9uq8N404CHU0UoFkLsQk04PWhn+Q1r/CkwuPDY8PgeT5vxKbX5pl+VL
         BPkwwPSs4MIisdagythZ1yyc0VlcJHheS39bHVfSCO//f8xyeeBRMEbftMbM92fv6hOc
         9YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896373; x=1759501173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R6nk7vORA3l3u9IkNJjKuDHcaaXS9zx19bCIgItEc0=;
        b=Zqb8MQZ7w9RN7vATSSNiUixyqQq1ekLiWScd+pchgSQlnn/h1RQdseYNMVxv+x57Ul
         RFCaatYKQECd9yDr85Gc8XpbgEI9NjsjRqpcqlKC11kZR5yQAS1vvTCNqSn1lYmnbFjG
         8bxicC5z6KBQ7DY8i16T43+4vnmKMWzE5uOiIGBGo09OBA3ber83W2qqS8MXArpV2iO7
         1D/9kMyyT9WQsZAV4uRUlJDmnjO1CZCX1o2cihgHrPTNiN5OwdpYFCfCObVp0S3mcZSZ
         HblhaeqvdI4fUf6GW8ofRs7AUIgY1rT21NKT6+sZO+3e623YMWFe7OyXDTXXqh/dbjK4
         N2Yg==
X-Gm-Message-State: AOJu0YzENEqzhIrD2qPYAYvz0Uy4vFF3T2QaTGTbaVOdtNHPh+AXSDfj
	c+zlI+WO2o+T4lxfDVI5/xXIMOz2KlkeyN8Z4fSzCeQ4m2Zh/Qep3MENBqTvWg==
X-Gm-Gg: ASbGncvSnllFCe6+ga+Ja0/qiqgSR1q9Ywj+Zfp3s+Bcl3jdTNrGamdGgr9VmZhPvCJ
	QGZgAcTxaID2ELDTZeUzy2tLe572ADESFb3PKQnDcYkLLCLaPN6c2iFXPj/9Wi47GH0IRWVsrLa
	v6Y0XkZWqmC7i5O5mKfHRERtYJPxsLTHX9GXnK414xGpdd503iW+3NliaTHxCzZSOldu9a0pKK9
	bv7syu4dtO2FwBprE3ExRanginlz3onmeAUlrAcS8C93yTEC00uRNEOidPZk0h1LirV0XzZ2TbD
	ho90opEPscnrcOhUpAepDWoKU+VZVUZb9DsQZDcI7UKMgJuq4ZVm9EGFTiEwjx4evYqj02JqGOB
	6asTdIjh8X341BEDhpHpL
X-Google-Smtp-Source: AGHT+IGknLw+vb40X3WVGDDmJukXInW/o5DtTe7Setw7cVE2S5+YZnkpezDkWYykQAghLXhFevbFEg==
X-Received: by 2002:a05:6402:1ed5:b0:633:b486:18b0 with SMTP id 4fb4d7f45d1cf-634a292cdb9mr6426189a12.4.1758896372974;
        Fri, 26 Sep 2025 07:19:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 13/20] nfacct: Update SRC_URI to point to valid URL
Date: Fri, 26 Sep 2025 16:19:12 +0200
Message-ID: <20250926141919.2010846-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119922

From: Khem Raj <raj.khem@gmail.com>

Update UPSTREAM_CHECK_URI accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88b295625df710014b67cd2a6bfbf2cbff8838a2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index 20a84121ee..9b938beae3 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -3,12 +3,10 @@ HOMEPAGE = "http://netfilter.org/projects/nfacct/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-UPSTREAM_CHECK_URI = "ftp://ftp.netfilter.org/pub/nfacct/"
-
-SRC_URI = "ftp://ftp.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/nfacct"
+SRC_URI = "https://www.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
+
 DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
 
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'

