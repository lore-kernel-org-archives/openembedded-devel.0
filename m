Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10C3CAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 18:30:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.14838.1759602626979470831
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 11:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+UldLo0;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso576939766b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759602625; x=1760207425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJbvCCC3/S675MD/F7mEof0rnIpfaN21/wFgth05+Ug=;
        b=j+UldLo0TCHvyis0zf0z3hpkBsJ9QLv3f4k79e7/fGm+fZqYAoW8WA0yosaXbGQ0K1
         Vxp8ly4nn824gHVzd3QgltHS19Yy3JVb8c88+ReNwifeEfXH1QIXPNgh5Ri7jqANTXXp
         mSvNUYEyJxIFGCZKBWL5Y3faE58Fdb4VX7QQuspnOK8auB9jF6wOGNhDu9ntg9h66mzU
         Yfc04OapUV2IsSTxb9tTZge65SCxCl02YmrSXmmlq79Ujl4vyT4J7yDx6/fsQfLr20LC
         e4wPzYX4J2Payix6KBqLbc6GLODr1Cew73hwi2V4TvSkn3Q3jdGkCuUrZFg1l8fNgNmr
         Mlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759602625; x=1760207425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJbvCCC3/S675MD/F7mEof0rnIpfaN21/wFgth05+Ug=;
        b=SiA4BuypTUon8cGtfAGU6WKi+BvLcQSJSusqKszPG5z46SunC4FVljrgd3X4q3BUKf
         H3s2YdIqcS3C07LavzOFfiuzjpZWOl5NtiFFF8sCJXWxIGb1ANWkEAzf8r7gwK8to3vM
         q5/X9GYoajFp2jlY09hLQ8gelxYlEV0gjAG1nJ/hS3w65dYyhjzklqKH6xQuJS2nuNuR
         OkaVx+4s5L1aoQ0QyqqfAJovUN8M8oY5bziHENoYQL6EIun2jRTlFn423ObUaqJZwkap
         BhcIYUKChWLY8BAhVC1ijj2h4TB9PvB5gWToPMNrox8Q/QvKCccakGdzlLO76J4mqjou
         +sWQ==
X-Gm-Message-State: AOJu0YxumzPp1/qqkkTZJAvz0S2Q4rKUBEpzT5lHVVjAHgdiBDuwrKYg
	K0p56M7Na9+MKdsZDr3+TSh6lsx6z2fLkoi+w/KGIU4VhIbn2qOG7UC2fNtNOg==
X-Gm-Gg: ASbGncukAAPcT6xpBKc3dLVCzA6TPOTe94xCeNSOzlmpRxL6balIVp4yj3sKDMM5Ce8
	pBiyykA1ONHtRI5zOGbojz4pHqjeHGjCWyAZGokwS22wwBNKkETbD5WPm4rIfANIYV99I2XSj2C
	65Js3rRFu9YVN/ScFb7LlDjzpHQ8qvZbhowJ+o36bTR2l1NNkzyfNBpG49CokcB162iL6RGSDcS
	V05X5/hzbKDuAQu/t6F1xwviVXQcow4Ka96kqswCrKEv/qzHiFNwBATJOaem7pLj3Isx6U2g8h6
	pKdyVMxzXZuK5UXa9reb4FWSLbP2LXMJbxZzvBKL1QaJ3Fnd6u1NUtaqeoQYblRihziihQJqn7f
	BZ1BpJHNQ0ZV9o+g+R/FoORp3g6MmsUzqWpCzmZgylYm2ieaJSBhu6yA=
X-Google-Smtp-Source: AGHT+IFVOPWLC+z5VZY4WIID+BMYxlaT6y9yk1tKyXh9YUut/dgnhxaz0zC4mzsM8/dM0t4XCwOWqA==
X-Received: by 2002:a17:907:7208:b0:b1d:285c:e0ef with SMTP id a640c23a62f3a-b49c1f5356fmr924456566b.26.1759602624969;
        Sat, 04 Oct 2025 11:30:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865986505sm729449966b.23.2025.10.04.11.30.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 11:30:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] apache2: ignore CVE-2025-3891
Date: Sat,  4 Oct 2025 20:30:23 +0200
Message-ID: <20251004183023.2787339-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 18:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120234

The vulnerability was reported against mod_auth_openidc, which module
is a 3rd party one, and not part of the apache2 source distribution.

The affected module is not part of the meta-oe universe currently,
so ignore the CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index fef1f5ecec..58b324795e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -48,6 +48,7 @@ CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected
 CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
 CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
 CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2025-3891] = "cpe-incorrect: The CVE is for a 3rd party module, which is not part of the Apache source distribution"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 

