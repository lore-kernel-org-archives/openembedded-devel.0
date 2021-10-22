Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C8DC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 16:22:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.10847.1634919742538810288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 09:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfc1EY2O;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id u6so3086967ple.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 09:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOZNPDdBCsyfXXXFCDAni97YIOHz8cXqzFgrxR7I5jk=;
        b=lfc1EY2OPe/OvL69f6qUbdFTQy4o+/8Mo6FarwZTgE9RsvwG8k9wYYTtcYQY0gvv8Y
         OULF0K69PSYX5JBVQwbTeRliUDEIT4mswlo4W92gGnFfUqrv0WvGe+kPf8+si9X50e4f
         eskg8zFqURiMJzAHzRKqVhEATd7jXHRTTX1avCh/C+nJp+lHIxV7r9s/bEtGCshhmdYp
         aduMRhSbQ2RB+6KeNqMfuz/Ki+sWmgAQ5a6z6PU9JdkToKGTxJBksplxkBySreEkDo74
         T2m0eI/NQRdnT17fTMpflwJb1Bgx0S9C1yXetGSfhGTJeaH36FA7ZofoWDj80tvMJb2b
         pcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uOZNPDdBCsyfXXXFCDAni97YIOHz8cXqzFgrxR7I5jk=;
        b=1bjeVPvwr3QaHwWz/KLxJ+EhYI0k7vpmoPe3YTDrhjrnEve4AtLfXInYOEEV5sln48
         WS18icIX1i2sEPC5SY32OLu43vhsmoeBpGxFp51nD1A69vB+7oq3tGXRoBZ7SDs39noA
         Rj3neQp9zhMh1oMXgNipy4LPPSBkUbuiEDUKKsfMN4AyUwkalhoS7fR3Xp4RBciYIMIh
         N4xFM3Jv3QP18zvE428WuwH2PW5AghP5FFUbUPcItPJB9ejqOHPUgGv+3eQaZTbaYNNi
         rlMYvaYTLnbjcrpr2xnRyklv5qIPeYMVMiNgpuqsM8z7M/gk8Yp5MW4U0dhTrUktLHoz
         rWyg==
X-Gm-Message-State: AOAM532Q8Two/T7ZjSyjQHn4RvWdPDz0bTLIUi4nUcGV1AB1Y/yg5RqR
	7/WVfBEsLJrvXDtqiABcCHetPCSKgkM=
X-Google-Smtp-Source: 
 ABdhPJw1q5uocXSaS/oE55T2tuADeiIZX8lx+4UJxbnPEQq1ybhBjBPBllm04GAfqw1tfP5C/7zQdQ==
X-Received: by 2002:a17:90b:4ac6:: with SMTP id
 mh6mr992295pjb.230.1634919741725;
        Fri, 22 Oct 2021 09:22:21 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:5080:bccc:9945:c822])
        by smtp.gmail.com with ESMTPSA id
 z24sm10361391pfr.141.2021.10.22.09.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 09:22:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-webserver][master][honister][hardknott][dunfell][PATCH] Apache:
 Several CVE fixes
Date: Fri, 22 Oct 2021 09:22:19 -0700
Message-Id: <20211022162219.1839153-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 16:22:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93536

From: Armin Kuster <akuster@mvista.com>

Source: Apache.org
MR: 113457, 113453
Type: Security Fix
Disposition: Backport from apache.org 2.4.51
ChangeID: 9d7b58f49487baff99bf8f101e53217425a2b81f
Description:

Bug fix only update. LTS version
https://httpd.apache.org/security/vulnerabilities_24.html

Fixes CVEs:
CVE-2021-42013
CVE-2021-41524
CVE-2021-41773

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index e5d1879578..4b36c50d55 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
+SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


