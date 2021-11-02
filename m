Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FB6C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:09:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.202.1635862164219916570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BqRvG1fx;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id u33so7614507pfg.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ypBZfSNIp2JYB8oCwzfWhqvcRH5yGR7WypJN2bH9OSo=;
        b=BqRvG1fxsZgUyQ3EkAqE7r0baXusl0ZzR735Mu5+UBY2RntBD1iAbsHSXb1bclOCyd
         KH6ULC+4R6TmZQul4YeIFrGBG4Z4w00gQG+5Y19zvkWaxIm2accUdYfQL0h5Td0Qf5bU
         Ugp9P5NHlUCmMHxWq9w1wqxuyzWLST9Gug5s99+RI7UNxZHITVZtA9FF0uFjzWse0PQB
         m/3lSPzlFqI0bAg1ojuh9m0V072Bld3agtEIEyLuPRcYsP8NMchNhR29seHXu9ZWXP1a
         kUinwjhzuoQ5+X1AP2nd36baUQz/QVA+fqY8D35khx2eZ0uRu0siCJN8iUAhr0vcH0+n
         Lu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypBZfSNIp2JYB8oCwzfWhqvcRH5yGR7WypJN2bH9OSo=;
        b=HqDnBWzVcEbM9n4LTwhvqWFtG/bfiiWtuD1xvwx+0TrmubHHyxfdjhlHbsB90seVCC
         8tLg7wkkizL/0JoxaS4gBZUUMTsmbDd/7CkYplRZ0hlZLyowM3hakWVy9rVCdcT2TXTp
         fsv3r3hGA/1uI78J/KgQPev0au+im11byMMMj2znhwHsjboEmoYDjQa08TyuUxaaRQMu
         kHE3KiX46CvgsN6BmrwIG/qnnO002eiocLx0cPUj6ogyI3ev75tdl67UoSXRZKg1I+bK
         oVxF2XdTODeBOBKZ87f2/XQZDxenQeT7YCAKAlx4f43kmYNHJITk6KHKKPzLALeo8Xeo
         n2vQ==
X-Gm-Message-State: AOAM532rG2xj9ixrnKxW/bZdZLXkIPqlSdv2VCO87hgrwTyUnHYdzTlN
	chZXLVqNDDI9FQbZL+5E2Wx5Ap1gIdA=
X-Google-Smtp-Source: 
 ABdhPJxFBWUt8Mh8LTxPlLLv+U0eVusxr34Mc1TNAfR9tzBmb7x9dudmPTQo680EUjahdLURXV+Pqg==
X-Received: by 2002:aa7:84cf:0:b0:481:e39:16ab with SMTP id
 x15-20020aa784cf000000b004810e3916abmr13663862pfn.19.1635862160719;
        Tue, 02 Nov 2021 07:09:20 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 g37sm16340029pgg.89.2021.11.02.07.09.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harknott 1/6] Apache: Several CVE fixes
Date: Tue,  2 Nov 2021 07:09:11 -0700
Message-Id: 
 <b7e32131a592520aeac6b6c00aec141818e96168.1635862049.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635862049.git.akuster808@gmail.com>
References: <cover.1635862049.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 14:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93772

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
Signed-off-by: Changqing Li <changqing.li@windriver.com>
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


