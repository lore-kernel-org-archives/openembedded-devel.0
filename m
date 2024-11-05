Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078B3D2C11E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.19645.1730817435573528706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6aM1+8b;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea7c9227bfso9156217b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817434; x=1731422234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIEa20mryLL6xwPVShbTrGxKuLKibW/YNZRHOc1M+T0=;
        b=O6aM1+8bIbBRLNJkEz/ifWC6tEEwbHAakbH6QE1sxywgMt4M/q3AVXKludX8KE2iRa
         lOr0RtJ8Te4b1yPQrI84VOiWNsQMISNCyki5W1i3hD1jYluN6AZrRMc7HW/kEnp+TaiY
         jd1DTngSESHJrNFDCFnDehpxpjVynpz1yPBUDgXpuPgXsuXZW6laCF9JBl6ENza3g0a0
         IRieT8dGsNc7aMoQKk1bS3w+TgU967k1Ugpp08sA4NE+j8OKmfsLMXJc8WKSlXykuNRT
         6GgGN+PbMKxqSkN0zsTN8htM3FqzT3MxlPsmoj9mNc5kVe/z5MmKhFFSgigJyBIBl02Y
         scLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817434; x=1731422234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIEa20mryLL6xwPVShbTrGxKuLKibW/YNZRHOc1M+T0=;
        b=LzNNUkzfyX0t/O+WJVIqYIi5aNY2XS5hsRgJXuwDD0jp6ualqd2+SWZNAhHYH/mf8Q
         CWnZM8NrkH77FVtrM3zSLT6U5PGD/htFVizgbvh/hIXSjDXdDeeZ2ld8fgRWc1hFcbDq
         XOSHWU2lyl6+xDGFUzCanbPq/WWCWb0JoRTPz4+EPnO3IjA+69OyMp+WULNb3fpx6qwt
         FCvcM3QNgP86eVlyWgBcmLjqR23p1wxc2fWQ740nAZ0BMVCQf2L1Y6e2VyyO+cfYlBHU
         T+ypPjsQ8uaCnA0+Q2pSYp8TYmbv8ij+7UWWGqs8tGCN/OZcDh8H+YUNDsZ376DeoTgq
         LPWw==
X-Gm-Message-State: AOJu0YzoZSNjE8zq6VRp+pcGlLxEf3c7vE/0mW58bsNtOcMG6V0MS+V1
	+eocZ5OQU+18aFqGdYBRPNj9Znj2SjAgG6pKbd1ZDrU5PeDS06t8uGIw2Q==
X-Google-Smtp-Source: AGHT+IGR4XxRst55NSoTVdi6R5NJkm4Ftv176UAx6tmsJsan4n8Dw8XjEReZlVzaKqLaCz1cf5KyFQ==
X-Received: by 2002:a05:690c:7446:b0:6e3:1f02:407b with SMTP id 00721157ae682-6e9d89aed6cmr355051537b3.11.1730817434585;
        Tue, 05 Nov 2024 06:37:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 76/90] wtmpdb: fix installed-vs-shipped build error
Date: Tue,  5 Nov 2024 09:35:41 -0500
Message-ID: <20241105143638.2301245-77-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113494

From: Yoann Congal <yoann.congal@smile.fr>

wtmpdb installs a PAM plugin in "${base_libdir}/security/pam_wtmpdb.so".
This path is not in default FILES.

Add this path to FILES:${PN} to fix this error:
  ERROR: wtmpdb-0.11.0-r0 do_package: QA Issue: wtmpdb: Files/directories were installed but not shipped in any package:
    /lib/security/pam_wtmpdb.so
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  wtmpdb: 1 installed and not shipped files. [installed-vs-shipped]
  ERROR: wtmpdb-0.11.0-r0 do_package: Fatal QA errors were found, failing task.
  ERROR: Logfile of failure stored in: .../poky/build-master/tmp/work/core2-64-poky-linux/wtmpdb/0.11.0/temp/log.do_package.939726
  ERROR: Task (.../poky/meta-openembedded/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb:do_package) failed with exit code '1'

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a090cd3e0ef554d7171eb84488661599d72fa3e9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index 7fb31f208b..d4a8b49e1d 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -33,3 +33,4 @@ do_install:append () {
 FILES:${PN} += " ${systemd_system_unitdir} "
 FILES:${PN} += " ${libdir} "
 FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
+FILES:${PN} += " ${base_libdir}/security/*.so "
-- 
2.43.0


