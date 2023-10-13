Return-Path: <david.pierret@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC97CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:39:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.42073.1697211585050115788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=UssWsRPQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: david.pierret@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so25597785e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697211583; x=1697816383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHaxBU3rUGGE6IQ1NH6lFszp/gW+4+O3TZvYwFdTEc4=;
        b=UssWsRPQTdC4cxyMbaC62DZCz0jioUEz0DY8UHLVOq0vgQ5ggEVdYcuMmgBLK57qAJ
         eAGd+PO5VqPsUmfyw+J69PMJ3qwbh/w5RPCQCcIYcJCZq2UBtjVbhkGVv2HlZOr0qhi+
         dKm0u41hxz08PTgXIFJhx4jDjyKiLpqGqX7dRMv8AbL4kkmVOmJErGtRInWEC9QxmdBI
         aeFhzo2coWUW1oG4WY+pcWHkuDX3P8eAABvC2hrlJDtU+0lgVx4YQZ99HSCWdFAd/XSX
         iMYxmFtfFWOahKB53ee5lNQnMnamLvHOEBGiGlzQsUJYt9MQ8UcH4JU4RIV5YyzIdd7+
         j3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211583; x=1697816383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHaxBU3rUGGE6IQ1NH6lFszp/gW+4+O3TZvYwFdTEc4=;
        b=jOT8AsVu857kJaTs0nHXS5KaEAIPEEQdKuipmNOA4KurmenJjGL8GzDtOqjzm4FOLn
         8kvUQFOd5RyEhIYGq4E0yQfDMRrukjEM8UKRS5c7Ina0FPK9Bfg7QBJkOcukeKaeXHBm
         C8TtkxGFCONzC1gwM1qHTJewXBcJvALt8dfAa3EPeJAccIUnzsPEFurTLoEGU/mdNfLa
         grLDAHkQxIU+auBD+Hv+sdv1DfSckqHiuMx9vvCzT6TzEcb54+ZYR7LAtKPi8HrkHe/m
         52+W9UKXAmf8mIH/8ytUJUiM2J72bQG3wjQGp4964zNPYaYbYCHZC7qJoRGC4VvK7ZE5
         qolg==
X-Gm-Message-State: AOJu0Yy6LlovIGP0vwDdbgb+d1PNtVENkT2z1cLLcSHlrT78ybcMKHv9
	mXNFqwS5rP0VWVq0ykOoPiouePZQY8VGh/CD9Uc=
X-Google-Smtp-Source: AGHT+IEic8g+khQJpmAjf1XLOSGfg6Leo3wSJ/UpZeBLRJl6AsFF3unNdNXTznVSxjqe5XAOT0HYAA==
X-Received: by 2002:a05:6000:80a:b0:32d:857c:d51c with SMTP id bt10-20020a056000080a00b0032d857cd51cmr8485313wrb.43.1697211582819;
        Fri, 13 Oct 2023 08:39:42 -0700 (PDT)
Received: from P-TOU-PARSEC.tailace47.ts.net (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id m8-20020adfa3c8000000b0032d7fde2d3csm8847421wrb.79.2023.10.13.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:39:42 -0700 (PDT)
From: David Pierret <david.pierret@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Tim moto-timo Orling <ticotimo@gmail.com>,
	David Pierret <david.pierret@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][PATCH] libtext: add ptest
Date: Fri, 13 Oct 2023 17:39:51 +0200
Message-Id: <20231013153951.2166008-1-david.pierret@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 15:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105478

Signed-off-by: David Pierret <david.pierret@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libtext/libtext-diff-perl/run-ptest       | 19 +++++++++++++++++++
 .../libtext/libtext-diff-perl_1.41.bb         | 11 +++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest

diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest b/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest
new file mode 100644
index 000000000..c65b6cf8e
--- /dev/null
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+for case in `find t -type f -name '*.t'`; do
+    perl $case >$case.output 2>&1
+    ret=$?
+    cat $case.output
+    if [ $ret -ne 0 ]; then
+        echo "FAIL: ${case%.t}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case%.t}"
+    else
+        echo "PASS: ${case%.t}"
+    fi
+
+    rm -f $case.output
+done
+
+
+
diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
index afdf63ede..9dfadde8e 100644
--- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
@@ -11,17 +11,24 @@ HOMEPAGE = "http://search.cpan.org/~ovid/Text-Diff/"
 LICENSE = "Artistic-1.0 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz \
+           file://run-ptest \
+          "
 SRC_URI[md5sum] = "30d56e6dd5551ca16b8e16cc7299dc21"
 SRC_URI[sha256sum] = "a67f50a48e313c1680cc662109ce5f913ea71454db355d0cf4db87ac89d2d2fa"
 
 S = "${WORKDIR}/Text-Diff-${PV}"
 
-inherit cpan
+inherit cpan ptest
+RDEPENDS:${PN}-ptest += "perl-module-test perl-module-test-more"
 
 RDEPENDS:${PN} = " libalgorithm-diff-perl \
                    perl-module-extutils-makemaker \
                    perl-module-exporter \
 "
 
+do_install_ptest () {
+    cp -r ${B}/t ${D}${PTEST_PATH}
+}
+
 BBCLASSEXTEND = "native"
-- 
2.39.2


