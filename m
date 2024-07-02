Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA32C31D97
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 18:08:40 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.31329.1719943711845799352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 11:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gNdnyxjL;
 spf=pass (domain: mvista.com, ip: 209.85.219.171, mailfrom: sdoshi@mvista.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfef5980a69so5015456276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 11:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719943710; x=1720548510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0ANg9+bGciYhdVpopGLZ8VPtAUtshXNtaMRNKgNXPU=;
        b=gNdnyxjLHYlNR4U5Y2semR65vwi5j2qc2RSFk5n/F50O5nWL2M/qbemN/JZ+y/RdoE
         tltATZMfc5f3774E8iF3V9GsQyB4FYtK4V/n0GcOTY4FMLNmqu58BVknf311X2zMvP4l
         GR2hVU25TZfRE0+VB7Tqf0ouiObKsfHP9KtcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943710; x=1720548510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0ANg9+bGciYhdVpopGLZ8VPtAUtshXNtaMRNKgNXPU=;
        b=a2ZW0A35IQEOIFbupJSp60PSXCfoD588sqVg84TYKZz74m1ORQrw5zsyq7E5UtrsvR
         XHQijZevwd1oeJRX4cbCcaN/OXiUV7stqlg5TiWYTBOVVdxnH40FKVS3LvaqqhMxVCcR
         Tm9RaNMYB6Dvlflut+YhFdmENeOcX0vURui+/eFEC7QaKGcF7naUQO9531UfMnDUivSB
         ThRJrDA45gf0/1GlsFeESoW95INWOvs/Gaz1dClu2smDQOL2OGF61mVUV9bOx1EwHBvA
         FLE4BTGxX2i2a2GZfnG9kBxpsFkl7stqRWmDIYF/VNz3SDSMn0yqseufPbOpV1O1Q080
         hpyg==
X-Gm-Message-State: AOJu0YwjeajEcOV/uZHKht+GrjjX+KxDGlSsU8Y1QWBt7hANjWank8w7
	xkFvvQgwYdkD2aDcCtMWbyse27cLFh2TfzOKjrVG2Xnbx/qdopWZI5JYgK4zVEyxGf1mI7lmlG/
	d
X-Google-Smtp-Source: AGHT+IFX0y3cMlkPNCVlBu4eKp8yHjMc3/49+u2waivcbHN/1AqUqPh+Y5JTKJ0YlBPtjM8V6crZZw==
X-Received: by 2002:a05:6902:2ca:b0:e02:9b7b:8706 with SMTP id 3f1490d57ef6-e036eb76cc4mr9779300276.30.1719943710345;
        Tue, 02 Jul 2024 11:08:30 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.44.151])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353ea8e76sm1707896276.32.2024.07.02.11.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 11:08:30 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] apache2: Upgrade 2.4.59 -> 2.4.60
Date: Tue,  2 Jul 2024 23:38:18 +0530
Message-Id: <20240702180818.94810-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 18:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111215

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-36387 apache2/httpd: DoS by null pointer in websocket over HTTP/2
CVE-2024-38472 apache2/httpd: UNC SSRF on WIndows
CVE-2024-38473 apache2/httpd: Encoding problem in mod_proxy
CVE-2024-38474 apache2/httpd: Substitution encoding issue in mod_rewrite
CVE-2024-38475 apache2/httpd: Improper escaping of output in mod_rewrite
CVE-2024-38476 apache2/httpd: Apache HTTP Server may use exploitable/malicious backend application output to run local handlers via internal redirect
CVE-2024-38477 apache2/httpd: null pointer dereference in mod_proxy
CVE-2024-39573 apache2/httpd: Potential SSRF in mod_rewrite

Other Changes between 2.4.59 -> 2.4.60
======================================
https://github.com/apache/httpd/blob/2.4.60/CHANGES

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb => apache2_2.4.60.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
index b96e8b4e1..a0dc3d831 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323"
+SRC_URI[sha256sum] = "7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


