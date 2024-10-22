Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D829CDD0CC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.21771.1729612080090516421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VnmjMlan;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e33c65d104so51655307b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612079; x=1730216879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+0yRDp+J8NJHPcFx9axMAlyKzP2uUFmy3/Q7vpcw+k=;
        b=VnmjMlanVSAmnPH5jswjQALz1ZrD84AArP/hieDraXM5cfWBdTbK6wrcz64xVc6JTH
         Mm0ZVszmRHjmYctoejrwzqwqKrvMDTYU6S114Ghs6Pu4kHSwzvwEAbX9TnPYML4opZ7a
         CdpOeDukQtwNIzdkTFNGltVfiMRSonMGpUiPDc39v/Qm6jiymtXpXYBw2zHVl78O1aDp
         JkyAMS0mCOZo7YXqCamyEsgor4c0tMIFk5sh+viLZrDZYHf1T7i6ecRJgCsUz1URTg+i
         0IfC/T1N3hoZXtyT7M5ftn12TyTkJN8u00YD6d66K+56Nx2i+Vf7QPEmDgchsZL6XPHG
         LubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612079; x=1730216879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+0yRDp+J8NJHPcFx9axMAlyKzP2uUFmy3/Q7vpcw+k=;
        b=Y8MBW+E3DG+Z6/YW9B+W6Z+3Y8MIsgaN4flDjHty9Dni6VuoihUtkbkSy1jxkr+2kh
         cKaqDjYG5PKVJFyU22Di0aQpISIBxsNSolxATDKi7g2sRdT7mMUriR4mhN6LXMZf0jGs
         Hh6WufT0jpGDbSQBJn3WU9ePQTSenA2a/qLo2i3BkuHCIz+RtmnsDpPp/ZVOuDjio1yJ
         BNCY8PlQwYgHxNVwdNk74X3MlVZqzLTdRaQ+SqRnDJ5IvVXPfDQ+aGX8jjEhHBUdoUzP
         9a0HunpTwy7hrzBBYbJOfwECnDb2AAHqK/iIFy4d0TS7AH3MSw1zesUhJb9ul6doIonI
         8CrA==
X-Gm-Message-State: AOJu0YxUTY3Wzt6AsnPNtq6OLZcBEqEOQ7jnjrakT624HzJ3nP/V9aZq
	Cxobem/hqTV4jvPos9udJpCIUnXScp2hXE8CTvu09hqWjJh9h/W2AJ1kEQ==
X-Google-Smtp-Source: AGHT+IFgVwAs9d/Hz6dDKFu9AUOXG6pFoffSPIZLei6IiWnDGKCtLJQ/vil/nC17Wh7RIDPQO1uNwA==
X-Received: by 2002:a05:690c:f15:b0:6e0:5d7:8432 with SMTP id 00721157ae682-6e5bfbe02damr133220827b3.5.1729612078726;
        Tue, 22 Oct 2024 08:47:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 07/46] libconfig-autoconf-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:25 -0400
Message-ID: <20241022154729.20331-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113098

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 5c3701f16..f4c1e5673 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -16,7 +16,6 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "eeeab8cc93eef7dd2e2c343ecdf247b7"
 SRC_URI[sha256sum] = "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f5131beec31a0a33e"
 RDEPENDS:${PN} += "libcapture-tiny-perl"
 RDEPENDS:${PN} += "perl-module-base"
-- 
2.43.0


