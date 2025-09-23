Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54AACAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:18:00 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13354.1758622672953079442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 03:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdgufTfl;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b30f8d14b9cso45206766b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758622671; x=1759227471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjAgHBB3OZoyr939AHYjWoagonZYhuu89E9BlMZ1Wo=;
        b=NdgufTflOue7SbblmpKDRTQIozdnCXRnqPdS8Lat+Qoa0VrlQ8btbtyo71jWMiWwdQ
         h7arwFFdMnauCUjLRtEDz1U8GTcuaEh4008j0vtE1H1LbrUwc0L7e2rrD/DzQmoIedBm
         wfdfco5aVUuPUVSL8+DaZWlLSwo2WrSTjW+MedXqp6024c8iLkTQoKcGPHnzBPtU6XVz
         Ycu3C8kQDoZkh+YmROWglIWNDBiMLgfcxz5w7BJpKKFhdIvBnD6A5I/IljU6mi08HjQv
         mqg8JPP5Rt06yKWraHm3Y5MEZQ6jJRxGccC3OOssgTSX0T2NLaH9nwFogMjeYNZFvmbf
         VEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622671; x=1759227471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjAgHBB3OZoyr939AHYjWoagonZYhuu89E9BlMZ1Wo=;
        b=R6Pf3ESXIK1UJNBJ8N5KZ0Wg3WpslUHA2mH8V+yhzrLA/WmRUFJLqZt5JUaMMsfii5
         x+GJzdBYZAMhYS7P7yf0BprwwDWW8jDv8qPQH4sjH1mx96XXX2vgKzYVSBhv1nlKW0/n
         OfdgqLoZaf8utxdB9P7DP1chClRqyMd0nc30cI1W1JeUgepoFp+a6YkyoSsrYVZ2VTez
         BqF7tr9QEo9akjbyf6doHCPP/SBcBVmckQpUUFYSADOq00i8plEM3o1yK8A34WCIwMef
         wsVwno7zj5k/c4kVjJ0sB4ZZNV35kZwnpT1316/RNoGEh+DXvw6wZNQ0rYLxmhDJaXRg
         5H/g==
X-Gm-Message-State: AOJu0YzkrujdbTvOZj8jqiCD+r4KyMoDKhUCDVcafeyATVKOqSfM4LLi
	Z/3ugNccv8UOsBdgYoIc8s5XsYbgtvcYZqpaRbXtZVFRDacXzUxua0S/KcDIHg==
X-Gm-Gg: ASbGncvsxNZfW4SXMYJ+P4aweh0e8NLOTWh6gXrYhR2DaivF7AUYOEkMIhqXyJmSbI0
	lO17UrV/7rXHZUQbjEFfilQB/jt7lY+QKNByLhKPbmQHnUlIEjMSlcI/abPo3L943hu+5wlKtnD
	yQ4e+YfOajIjcUM6JO91nOMR8i2/IWak35J56OJ7/00pE55gjrfRo+hFoX0yUMsJlLD982dQYr4
	xLNnqCWke4zasPoWTrJ9KAgEEneYJpSV2uOdL9AtkHthFd76aA3qG5PhJm95GrVZF0D3oJ8ZvT4
	0HwnmuLAFpl/9Kdoo0t894YKXCPIjkXUJIQPdFHg7gcsfFo9HmkMANtxs3REkHV8ot2WIsmvRb6
	FIwrjJe+CJmq71ALP8hPe
X-Google-Smtp-Source: AGHT+IFSlIEtsA2oXSW2NX8ewlhYK5cDFbR1iMDVNihAh5cJYqS9t+AFFxJURbkWvV3oImxW2BmW1g==
X-Received: by 2002:a17:907:2d2b:b0:b0c:fdb7:4df5 with SMTP id a640c23a62f3a-b302726c426mr220178266b.18.1758622670940;
        Tue, 23 Sep 2025 03:17:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b26847b9f37sm944940666b.18.2025.09.23.03.17.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 03:17:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] krb5: fix packaging with ldap PACKAGECONFIG
Date: Tue, 23 Sep 2025 12:17:49 +0200
Message-ID: <20250923101749.2832920-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119657

In case ldap PACKAGECONFIG is enabled, poackaging fails with the following error:

ERROR: krb5-1.17.2-r0 do_package: QA Issue: krb5: Files/directories were installed but not shipped in any package:
  /usr/lib/libkdb_ldap.so.1.0
  /usr/lib/libkdb_ldap.so.1

Fix it by adding the file to the krb5-kdc-ldap package (the same that
Debian also uses to ship this file).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 99ba9eaa9c..d889855649 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -163,7 +163,8 @@ FILES:${PN}-kdc = "${libdir}/krb5/plugins/kdb/db2.so \
 
 FILES:${PN}-kdc-ldap = "${libdir}/krb5/libkdb_ldap${SOLIBS} \
                         ${libdir}/krb5/plugins/kdb/kldap.so \
-                        ${sbindir}/kdb5_ldap_util"
+                        ${sbindir}/kdb5_ldap_util \
+                        ${libdir}/libkdb_ldap${SOLIBS}"
 
 FILES:${PN}-kpropd = "${sbindir}/kpropd"
 FILES:${PN}-otp = "${libdir}/krb5/plugins/preauth/otp.so"

