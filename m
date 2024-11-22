Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21E0E65D1F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:11:13 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.17260.1732248673111555517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNg7bOPL;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eeb31b10ceso17787597b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248672; x=1732853472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpdM9UoK3fW9WNSfIJzoGNUxsI02oETpavr6IKBr8eE=;
        b=RNg7bOPLzV3N35YKpC3NPEpBaYdIo/ofr5eAXT4VU3ujlsoPLVaY3lw0YeowkOgTa/
         Fo6Zigf4zo/D0/pb2WHe324kW8ckh9jXxG3aU82sUC+w1nnkIqq4TrUGLITw/jD8o9x9
         wxu5tHGNEXaN2FJWBYSVz4W62OuZheSDhvCgRHSEYCATJJIM/WOtGyhUoCL1GK4gbsG+
         0UG83kAHAASOm8qD+CmwcLJhE4odT3cSV6IJ3WOObyMnrxOYh0Y2OcbxJa8CO0BCn/Qa
         hOWQESeOffy6mzefZ7ZqmQmoYIJODGmICEqR9Ji0K3xIuqBp3Y5HXZNQG3Fo5BNmnA8/
         YMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248672; x=1732853472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpdM9UoK3fW9WNSfIJzoGNUxsI02oETpavr6IKBr8eE=;
        b=TusiwqI6cnAhiTCztU2kFFa1XdHz7z7PCMWu/bJV5UI3Akiv3TtixxVoZFSjAWnRje
         vsdLJPpm0uFazpeFoHhYqe7NUpoKkxGeoyaLbrvT4+RRGQHSZu5eUhU4+6TZcaOxzJb2
         Xds5ThP6KO5hwR0vx4i8Y/PXF+LtyanjlM2m1Jh6TwMsMDyRpO0HZPIveT61xCkXPFk6
         kn7DNQd2wgTBO3U9v+q6M3eBL9EeD5OX0Ghs33ms9EfIw4OVVTqjt56JnCKOP00oYERZ
         5bWqN4E8p7OxBOdfkHm17t7f9AENrfeR7JcClY2/C7bOeCPGkUOD0WtzPEpHXRxaZnp3
         84ig==
X-Gm-Message-State: AOJu0YxTOvGwmgi/v8ObjoDabQ0h9cl9n/q9FHAcCUDAGpmUHoXqVy2F
	M44wVs4WeXNx0+PuCSwZun4DT/LwYSM6y0xZ1DfdTkiCeuWAZN96mICeAKQN
X-Gm-Gg: ASbGncuVRqstX+q1xOzmJTAWgIxuN2CFENzdNWWh697f3vfhtRJpYuZ1J62fgIDRWhN
	Q/R58gA5/c8MDt94RmPF9NUBmVJwdvHobSMxUNnnZVa9KuTS4bNxFrvfn83n1OTPElP7LfB6oJs
	xwg6lWYUNfQ9yG3ukzuy1V03cDP5EKZ25dH9Vpug4K5y3c2EzDA8CyhGN0zEmyI1svnCl+NSq2D
	wD1R9EKFV8pJJmg3aBrW7qX/aODHogjXbovge6iumQ1HvyOzQ7ljOMl
X-Google-Smtp-Source: AGHT+IGg0RXQkcjltBgD9Tatt7vJxt3HToJ+kdMjR2WuPkNXqJAWU7W8ehiRFAgjOw1zhB3yRLcNHg==
X-Received: by 2002:a05:690c:46c2:b0:6db:db51:c02d with SMTP id 00721157ae682-6eee09e9a0emr23255337b3.25.1732248671682;
        Thu, 21 Nov 2024 20:11:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:11:11 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/7] libmozilla-ca-perl: Upgrade 20221114 -> 20230801
Date: Thu, 21 Nov 2024 23:10:38 -0500
Message-ID: <20241122041044.1111236-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113981

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20230801

    Update from Mozilla repository to 2023-08-01
    Added certificates:
        BJCA Global Root CA1 sha256: f3896f88fe7c0a882766a7fa6ad2749fb57a7f3e98fb769c1fa7b09c2c44d5ae
        BJCA Global Root CA2 sha256: 574df6931e278039667b720afdc1600fc27eb66dd3092979fb73856487212882
    Removed certificates:
        E-Tugra Certification Authority sha256: b0bfd52bb0d7d9bd92bf5d4dc13da255c02c542f378365ea893911f55e55f23c
        Hongkong Post Root CA 1 sha256: f9e67d336c51002ac054c632022d66dda2e7e3fff10ad061ed31d8bbb410cfb2
        Network Solutions Certificate Authority sha256: 15f0ba00a3ac7af3ac884c072b1011a077bd77c097f40164b2f8598abd83860c
        Staat der Nederlanden EV Root CA sha256: 4d2491414cfe956746ec4cefa6cf6f72e28a1329432f9d8a907ac4cb5dadc15a
        TrustCor ECA-1 sha256: 5a885db19c01d912c5759388938cafbbdf031ab2d48e91ee15589b42971d039c
        TrustCor RootCert CA-1 sha256: d40e9c86cd8fe468c1776959f49ea774fa548684b6c406f3909261f4dce2575c
        TrustCor RootCert CA-2 sha256: 0753e940378c1bd5e3836e395daea5cb839e5046f1bd0eae1951cf10fec7c965

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...lla-ca-perl_20221114.bb => libmozilla-ca-perl_20230801.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20221114.bb => libmozilla-ca-perl_20230801.bb} (79%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb
similarity index 79%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb
index c5839b9b6..906faee0d 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20221114.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20230801.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b"
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
+SRC_URI[sha256sum] = "8066a15bcbec7bcf691e756ea07c8b710e754c76a5e73ae20ac32298f30dd56a"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


