Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C424CCD184
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:42:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.7455.1760499777048065166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhNVSL0d;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eed7bdfeeso6580975ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760499776; x=1761104576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nN+a3wQHORmpQR3v8gN9x35jyareUg7SNVnorq79NLI=;
        b=LhNVSL0ds54ewsPTjUhC1x+W2CmYoRipg152ORIu/et8q52h85nSvpvJYA0mL+kFdN
         4wYW54dpcnqFUSbmM2Pr8ZW+oOueRWCBzH+0PAro32jFv9ILNyV2cKHeyOX6Uhui44YH
         o+y0i8b/9sqMAN3Dx9WwoRCG+uwUGJ6XPl2u6hdbQqXOQMwN/f+psUOw1BcB+LeWaADh
         jGp4dJe/wvT705hJ/1A8MFPiG93G1yS6nRB0QiHGU2DC/ybG0/q68pnRNxT5TuIqR6Yt
         4ICEfD+xOtnbEFcJYNWjkrbgwZ5X8cQirOPaqIyoslzG572SVm+H0DkTrf7qI2ar6Trq
         PYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499776; x=1761104576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN+a3wQHORmpQR3v8gN9x35jyareUg7SNVnorq79NLI=;
        b=Pr+TqeHsAlwOo01eEwkRPbqCpvADmbH6NOuRaDIG/e5/S4rtOZLQk1JS9ILStUJAz9
         xUlumaDgCp3+dN/rCwlDmkpZL+uuirUimqUVCFYrNGrI/+8Zraw6mY6/SSxRW9tEdhaT
         L2dK7lIV4KEwVYrx7fDa0ThI2fUluUx4wJ2TPmeRXDSwmkYchBVjm/aQRKdHrVNx+Opx
         B0k0n5pCb2LjbktHUQ5YlPv4O8hJt+F57szZq1Q2GkNfeuugDeEeeG+p7r0cmkelEcFr
         0vfvHPmHesrksLLzU7FTneTNgtSF1R55f6I2nS/IjTggss/bw55euA9Rq7YpAcp+Mz2D
         WO+Q==
X-Gm-Message-State: AOJu0YwZHki5Go6Inh2euAH23HMiJ4Eo167nljuPL4mATUYFzDySez7B
	TizP9YW5n6+mFQiUdn9+v1UPchAcm4GxHJa3pNZoLKUwhs2CWxYn/YI2v1C4qA==
X-Gm-Gg: ASbGncsI3C7hEXa34tZM6E4RL2Q72uFLbIEctXF2nhQNf9fvOtKQg6BqRZzYVBWpEIN
	ce2MRnZ+eAArDXSkc3Fkba08/4YxXjNCJ367Qs0CEI8lY/+Wf5QbZUgxdR4e1E//KvGvp9McXR7
	V8V5no0uVQkqMU+SSvNaYBQqvJL7k9VnMKdQTqrc7f0bcihNSUB9Dwi1FWz+IbUdQPCPRh5YsEu
	RgxEVUO9iUN81ykbD5+GuLVhOm9ThG1FP3SawvM2672btCu9QjjXYEzCtW2KJdZIotK31ASQSsL
	PUobtGpIq+Nb5+pqSFfHkjFj9xPN7B2zCdTXq6P2bzf12ILXw/828HYeWQbWdgezdGFY5hAKrnS
	FTvRya8yValbe7xJdbjfagTMmVWNGs7yILruP5iuYLKqihSkRBtuoFC0=
X-Google-Smtp-Source: AGHT+IFQXpveJYkHqiMv/ubUakBGfN51jUPlaC73tzyr1+Z3txUTZZpxMmXlkSNSNlqM1o7RjCFT6A==
X-Received: by 2002:a17:903:388d:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28ec9c27a45mr353450085ad.10.1760499776213;
        Tue, 14 Oct 2025 20:42:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a096870a3sm888627a12.33.2025.10.14.20.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:42:55 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/4] libmemcached: ignore CVE-2023-27478
Date: Wed, 15 Oct 2025 16:42:41 +1300
Message-ID: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120679

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by [2].
The commit message says that it is reverting feature added in:

$ git tag --no-contains d7a0084 | grep 1.0.18
1.0.18
$ git tag --no-contains d7a0084 | grep 1.0.7
1.0.7

This recipe is for the original memcached which is unmaintained now.
Hence the ignore instead of upgrade.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-27478
[2] https://github.com/awesomized/libmemcached/commit/48dcc61a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 607a44649189a29e6f547ce89b41ba332a45946a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/libmemcached/libmemcached_1.0.18.bb         | 2 ++
 .../recipes-support/libmemcached/libmemcached_1.0.7.bb          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
index 56778c0483..e4646d79ef 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.18.bb
@@ -8,3 +8,5 @@ SRC_URI += "\
            "
 SRC_URI[md5sum] = "b3958716b4e53ddc5992e6c49d97e819"
 SRC_URI[sha256sum] = "e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82"
+
+CVE_STATUS[CVE-2023-27478] = "fixed-version: this problem was not yet introduced in 1.0.18"
diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
index cdf8415ff7..156e4cd38d 100644
--- a/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
+++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
@@ -2,3 +2,5 @@ require libmemcached.inc
 
 SRC_URI[md5sum] = "d59a462a92d296f76bff2d9bc72b2516"
 SRC_URI[sha256sum] = "3efa86c9733eaad55d7119cb16769424e2aa6c22b3392e8f973946fce6678d81"
+
+CVE_STATUS[CVE-2023-27478] = "fixed-version: this problem was not yet introduced in 1.0.7"

