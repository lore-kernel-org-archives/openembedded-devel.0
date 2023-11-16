Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7398CC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 20:10:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.16693.1700165410132112805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 12:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ofnu09ce;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c773ac9b15so176299466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 12:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700165408; x=1700770208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MhbwiUIaiMTTyDJZcWzHapHG+WDn9vmgY282lgVUms=;
        b=Ofnu09cesWka4/oJD2M4Y1lD5ia6dj11wlb7B67sAkoDZJsFa42fXuThMknu7HhiD3
         WcgUaIXPQAl7IxEIAKGniBXq4q7vpkSf1wV9QoxRJD70XquTMpE/2Y3NVy4dh2MTUviQ
         mOc7lCmk98e4eG43H+8+eREME2uJecmLa8j6/U92H1Tqtmrn6DKLQ+ZwhhQpGHVp/MFU
         OLmU4MWThkEBPvgNJp8gf7RJH3r9cNw6a04NvwfzUEobjPGIvtWyRjAQG8hxao5vSiee
         Fh3ToKsoOWmCoeuksBCM0TxtOodMUMYLvyvWI2OFfLlRipd/mADatTMJoTZaOYByRP4g
         Viag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700165408; x=1700770208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MhbwiUIaiMTTyDJZcWzHapHG+WDn9vmgY282lgVUms=;
        b=aDSplebPfhsrKKi/fPjsj3MKHlZ7kReKzZ9tX1+CWJNyk68FR1HhZ7U/38UCMiIw8P
         IwiigZSip8LBcPb6yAK2IljJ8uGPKKuxbebMMhHrZ7PkyN4wkpOgwAVBQJJVoJLShDbR
         XItNk4QFUkXS3+42/gu4LaEI2k4Ck2OAhL5j5QLWiXM7wbtsxAm7Q8XV30Aj0cNGSNw7
         BncCh5ZekABYSGRjM5zTjdGPPzkoJFX5fxvjevRyH9CLsXQv8GFirwUJMxZlmd/+JYnd
         8OGDAsEejvJ4gXPh9ykh/k09INN7Q1wEdMpv+1EqE6mqKeFXVCMeVgZZdDkI1SHW2ofE
         w2dA==
X-Gm-Message-State: AOJu0Ywr6a6CCjzCWDaS1zJhodwsGrwNjqI78N2O1qL4/uFHc8bGz/Ly
	YlYr6vquKsj/aSEdFnzJarkm0xYHZt6gmA==
X-Google-Smtp-Source: AGHT+IG80H+dizZAN53NZS4nsTOLl0NNQzKBpVl+c9wQsSIpQ9sZcoZqHd+SZGDLIncJuz+aWA8rHA==
X-Received: by 2002:a17:906:c406:b0:9e7:d9c8:4d74 with SMTP id u6-20020a170906c40600b009e7d9c84d74mr11412266ejz.20.1700165407692;
        Thu, 16 Nov 2023 12:10:07 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id f10-20020a1709062c4a00b009e6af2efd77sm14204ejh.45.2023.11.16.12.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 12:10:05 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] mercurial: upgrade 6.1 -> 6.5
Date: Thu, 16 Nov 2023 23:08:15 +0300
Message-Id: <20231116200815.1489369-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106827

Changelog: https://wiki.mercurial-scm.org/WhatsNew

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../mercurial/{mercurial_6.1.bb => mercurial_6.5.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_6.1.bb => mercurial_6.5.bb} (87%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
similarity index 87%
rename from meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
index a415ebc1e..112df8c1e 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "86f98645e4565a9256991dcde22b77b8e7d22ca6fbb60c1f4cdbd8469a38cc1f"
+SRC_URI[sha256sum] = "a5603d0d395ebf67fe5d27abbb3bd37fcc01871ecf394c793672d2c1e68be7e7"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
@@ -31,7 +31,6 @@ do_install () {
 }
 PACKAGES =+ "${PN}-python"
 
-FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
-
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
-- 
2.25.1


