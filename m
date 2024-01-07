Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2065C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 18:46:03 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.21447.1704653161098395401
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 10:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3GgqIsZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783234dd689so13696885a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704653160; x=1705257960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RahjUTLgntIOdZ6S4VZCWFEyRbZzMwgSEWpFlTdrJBs=;
        b=i3GgqIsZM2TX8uz16OPoyC5P/d9n4IT6vBeRJxGhWlNJJqSth735cwmkyxOww8jOSY
         laFlpFefJVqZWfV7IbmTXqySgvZ8bcuYBsLtL3ojHY46gprN7Mq8GkDFQw8y9zrPePv+
         eTb0jLnoVD/aDNdNOfYat/c6zES8qH6q0FYbWOadTj/oFNQSRrJ50bVBcdK1NOIDh5rf
         ad0PumXAEn6rYZN+0ZPbGkdJknhDZiK0FmWIPnYCeZm8StMiAjlUsm1jw936lQnAynJF
         vAf5ABmcIFRa2f4xqUR2LTJcx6FffwyehkdINhvQ5H7SN8+fhg4U2vrS0LajmHYTMj/5
         AdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704653160; x=1705257960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RahjUTLgntIOdZ6S4VZCWFEyRbZzMwgSEWpFlTdrJBs=;
        b=D2Zm8CwrXDf8pnJtjusR+z6DPQCI8lb4oUACgnevQihm5WQAaW7T1UPjH3ie3J4eUR
         9pm1xnxliSK8HX9eEUL+J3MJn+vfHdes8iEOgTIKEDRJbtja7Gwb4YNKEA8xvhgh5urZ
         oUHiczB1Noi/Fj1lDwaRdTXiCY69fY0O+KC/2LdDpatC/sY0wD39+NHTcAa5MwJA7EWK
         WNL0uSQ49UCR3e+RIeALH+yvAMAVqvdbo4RwCmnojZUM4/cv2qYdlejsIwKB9PvKiwUt
         fguM0+MrefOOsqvLFZVHfzOKYE2FWVvM1CmAbTllKfao0TG5dB7tlhjhCwWrfZVnLs1L
         K1oA==
X-Gm-Message-State: AOJu0Yw/jccsZeUMJfYtmFhVR9zIRP/1lT1oFedZRE+M+oWQ/Q65aRTV
	ildzJIv62ij088vhJfrWvP6/RqZB36NKug==
X-Google-Smtp-Source: AGHT+IFN2fV+MfcyMfUltmwFYP1AGyWJoObvovqwyDA2AApNjtB0bsK4hU4JGj3EEpXVK0lm84LSPQ==
X-Received: by 2002:a05:620a:85e:b0:77f:289e:79d with SMTP id u30-20020a05620a085e00b0077f289e079dmr2979306qku.109.1704653159897;
        Sun, 07 Jan 2024 10:45:59 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id y62-20020a818841000000b005de7cb49a20sm2541247ywf.44.2024.01.07.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 10:45:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeffrey Pautler <jeffrey.pautler@ni.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] apache2: add vendor to product name used for CVE checking
Date: Sun,  7 Jan 2024 13:45:58 -0500
Message-Id: <20240107184558.1534409-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108076

From: Jeffrey Pautler <jeffrey.pautler@ni.com>

This recipe sets the product name used for CVE checking to
"http_server". However, the cve-check logic matches that name to all
products in the CVE database regardless of vendor. Currently, it is
matching to products from vendors other than apache. As a result,
CVE checking incorrectly reports CVEs for those vendors' products for
this package.

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51f70eaaa5973e385645f574093ee860f5648f88)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index 9ffdf3265a..3fbc975fca 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -36,7 +36,7 @@ inherit autotools update-rc.d pkgconfig systemd update-alternatives
 
 DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
-CVE_PRODUCT = "http_server"
+CVE_PRODUCT = "apache:http_server"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.34.1


