Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3639DC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:04 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5205.1636118163251769047
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ha7peWsJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id p17so8371483pgj.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uK3MsmwJvLepgi2umAQcDvGrQ+jM2hUM1i5KxNOI8ws=;
        b=ha7peWsJ8FYFrUSU8fZ27JISEeY0Q8j6pob/XamdhfL/gs/DFpmA8gOFqJnpRx5WFQ
         IHPjBZS9LQpLTDkJ3+QId7io7+LSp1lpglmqyzqY4N7f4V9kMy7EA89ZoxIfU5aTIcfs
         oO9Jf4I3QWzvKdSziCOPNpQG5B1azOhPqnBDxAnUVKlRAB8Hlzi67lf9UaQZeeGT+l9y
         YCNnYLCCTbA5MCFqJVO04Qoa4hi0zOvDdUcrma91XOmp+2N1HxpByc8Anw5OQHQeEanI
         DB+Mat/0LMYYvK6iEAmyIgSCjZ3dLhtrZnpoBJDrXs04eHhzxWhjoTBYb+vFEcJVBlS0
         +/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uK3MsmwJvLepgi2umAQcDvGrQ+jM2hUM1i5KxNOI8ws=;
        b=rAraOIOGlfeglqp1cuky2Y+jkGOd5dgDZ11tS40riGQqrjfo0eZF7cE27QwzHz9ZHl
         Br1a/yf2SBhaeoTEcdFHZDRUORucWUUPXojQXVCD6E8aSj9zE0mNdko9nCSMIOhvzz0w
         OidN98f3Hfh2PsMCVohwPlNlPeruYNgYeivqGSbckeAWHx/QGlgUDjz1+j2tbrAhzX4c
         PVYbOnQ9CMBMmRcAHjT9l3SXYojkdASxR5Hz1eF+32/iIaRRqiM1BS/WRsjlFFaJw0Wi
         2ixNo/xq+h4LlChjvBuk7mey+2bz7ByEUOM71oRtti4A56LgDI4s1tvoGil09RQ+HGrF
         BPPw==
X-Gm-Message-State: AOAM530MbUsWG3Y+GEgJcSn8nwqfn2B/Fe/xnx04E/Tm9IaFRKqe0MBm
	OcLa6XUHtlCDkRZXdA0DukSPE9+r8/w=
X-Google-Smtp-Source: 
 ABdhPJzQBAIz+K9Pql//uoYimRzzwmUtPc4puoUdxHHZiC1QViUfOd6GZvtFteVQltuC/zasDEikSA==
X-Received: by 2002:a62:1b86:0:b0:47b:d112:96d4 with SMTP id
 b128-20020a621b86000000b0047bd11296d4mr59585652pfb.52.1636118162407;
        Fri, 05 Nov 2021 06:16:02 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/10] Apache: Several CVE fixes
Date: Fri,  5 Nov 2021 06:15:48 -0700
Message-Id: 
 <98ccbca491657e2e270c27cd4bbfdeb07a528dd4.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93833

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c59ce3299e8ed52a520a95f0bc0d0996b1cc37df)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index 7e52d1db47..d6e736d31d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
+SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


